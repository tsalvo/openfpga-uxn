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
-- BIN_OP_EQ[uxn_opcodes_h_l724_c6_f693]
signal BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l724_c1_c4c9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_c4c9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_c4c9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_c4c9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_c4c9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l724_c2_0216]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_0216_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_0216_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_0216_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_0216_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l724_c2_0216]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_0216_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_0216_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_0216_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_0216_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l724_c2_0216]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_0216_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_0216_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_0216_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_0216_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l724_c2_0216]
signal result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_0216_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_0216_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_0216_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_0216_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l724_c2_0216]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_0216_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_0216_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_0216_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_0216_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l724_c2_0216]
signal result_pc_MUX_uxn_opcodes_h_l724_c2_0216_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l724_c2_0216_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l724_c2_0216_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l724_c2_0216_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l724_c2_0216]
signal n8_MUX_uxn_opcodes_h_l724_c2_0216_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l724_c2_0216_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l724_c2_0216_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l724_c2_0216_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l724_c2_0216]
signal t16_MUX_uxn_opcodes_h_l724_c2_0216_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l724_c2_0216_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l724_c2_0216_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l724_c2_0216_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l725_c3_c89f[uxn_opcodes_h_l725_c3_c89f]
signal printf_uxn_opcodes_h_l725_c3_c89f_uxn_opcodes_h_l725_c3_c89f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l729_c11_b8ad]
signal BIN_OP_EQ_uxn_opcodes_h_l729_c11_b8ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l729_c11_b8ad_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l729_c11_b8ad_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l729_c7_915b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_915b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_915b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_915b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_915b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l729_c7_915b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_915b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_915b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_915b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_915b_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l729_c7_915b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_915b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_915b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_915b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_915b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l729_c7_915b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_915b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_915b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_915b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_915b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l729_c7_915b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_915b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_915b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_915b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_915b_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l729_c7_915b]
signal result_pc_MUX_uxn_opcodes_h_l729_c7_915b_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l729_c7_915b_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l729_c7_915b_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l729_c7_915b_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l729_c7_915b]
signal n8_MUX_uxn_opcodes_h_l729_c7_915b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l729_c7_915b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l729_c7_915b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l729_c7_915b_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l729_c7_915b]
signal t16_MUX_uxn_opcodes_h_l729_c7_915b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l729_c7_915b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l729_c7_915b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l729_c7_915b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l732_c11_bd06]
signal BIN_OP_EQ_uxn_opcodes_h_l732_c11_bd06_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l732_c11_bd06_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l732_c11_bd06_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l732_c7_73bc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_73bc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_73bc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l732_c7_73bc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_73bc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_73bc_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l732_c7_73bc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_73bc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_73bc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l732_c7_73bc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_73bc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_73bc_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l732_c7_73bc]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_73bc_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_73bc_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l732_c7_73bc]
signal result_pc_MUX_uxn_opcodes_h_l732_c7_73bc_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l732_c7_73bc_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l732_c7_73bc]
signal n8_MUX_uxn_opcodes_h_l732_c7_73bc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l732_c7_73bc_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l732_c7_73bc]
signal t16_MUX_uxn_opcodes_h_l732_c7_73bc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l732_c7_73bc_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l734_c3_b3da]
signal CONST_SL_8_uxn_opcodes_h_l734_c3_b3da_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l734_c3_b3da_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l737_c11_ef33]
signal BIN_OP_EQ_uxn_opcodes_h_l737_c11_ef33_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l737_c11_ef33_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l737_c11_ef33_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l737_c7_7fca]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7fca_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7fca_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l737_c7_7fca]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7fca_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7fca_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l737_c7_7fca]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7fca_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7fca_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l737_c7_7fca]
signal result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7fca_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7fca_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l737_c7_7fca]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7fca_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7fca_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l737_c7_7fca]
signal result_pc_MUX_uxn_opcodes_h_l737_c7_7fca_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l737_c7_7fca_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l737_c7_7fca]
signal n8_MUX_uxn_opcodes_h_l737_c7_7fca_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l737_c7_7fca_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l737_c7_7fca]
signal t16_MUX_uxn_opcodes_h_l737_c7_7fca_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l737_c7_7fca_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l740_c11_1999]
signal BIN_OP_EQ_uxn_opcodes_h_l740_c11_1999_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l740_c11_1999_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l740_c11_1999_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l740_c7_50ee]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_50ee_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_50ee_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l740_c7_50ee]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_50ee_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_50ee_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l740_c7_50ee]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_50ee_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_50ee_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l740_c7_50ee]
signal result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_50ee_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_50ee_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l740_c7_50ee]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_50ee_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_50ee_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l740_c7_50ee]
signal result_pc_MUX_uxn_opcodes_h_l740_c7_50ee_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l740_c7_50ee_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l740_c7_50ee]
signal n8_MUX_uxn_opcodes_h_l740_c7_50ee_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l740_c7_50ee_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l740_c7_50ee]
signal t16_MUX_uxn_opcodes_h_l740_c7_50ee_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l740_c7_50ee_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l741_c3_b804]
signal BIN_OP_OR_uxn_opcodes_h_l741_c3_b804_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l741_c3_b804_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l741_c3_b804_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l744_c11_1429]
signal BIN_OP_EQ_uxn_opcodes_h_l744_c11_1429_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l744_c11_1429_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l744_c11_1429_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l744_c7_2978]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2978_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2978_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2978_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2978_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l744_c7_2978]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2978_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2978_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2978_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2978_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l744_c7_2978]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2978_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2978_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2978_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2978_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l744_c7_2978]
signal result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2978_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2978_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2978_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2978_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l744_c7_2978]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2978_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2978_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2978_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2978_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l744_c7_2978]
signal result_pc_MUX_uxn_opcodes_h_l744_c7_2978_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l744_c7_2978_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l744_c7_2978_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l744_c7_2978_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l744_c7_2978]
signal n8_MUX_uxn_opcodes_h_l744_c7_2978_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l744_c7_2978_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l744_c7_2978_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l744_c7_2978_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l747_c11_0b87]
signal BIN_OP_EQ_uxn_opcodes_h_l747_c11_0b87_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l747_c11_0b87_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l747_c11_0b87_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l747_c7_d599]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_d599_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_d599_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_d599_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_d599_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l747_c7_d599]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_d599_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_d599_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_d599_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_d599_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l747_c7_d599]
signal result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_d599_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_d599_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_d599_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_d599_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l747_c7_d599]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_d599_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_d599_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_d599_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_d599_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l747_c7_d599]
signal result_pc_MUX_uxn_opcodes_h_l747_c7_d599_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l747_c7_d599_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l747_c7_d599_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l747_c7_d599_return_output : unsigned(15 downto 0);

-- n8_MUX[uxn_opcodes_h_l747_c7_d599]
signal n8_MUX_uxn_opcodes_h_l747_c7_d599_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l747_c7_d599_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l747_c7_d599_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l747_c7_d599_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l750_c32_7097]
signal BIN_OP_AND_uxn_opcodes_h_l750_c32_7097_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l750_c32_7097_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l750_c32_7097_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l750_c32_2e94]
signal BIN_OP_GT_uxn_opcodes_h_l750_c32_2e94_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l750_c32_2e94_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l750_c32_2e94_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l750_c32_452e]
signal MUX_uxn_opcodes_h_l750_c32_452e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l750_c32_452e_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l750_c32_452e_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l750_c32_452e_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l751_c26_1b75]
signal BIN_OP_EQ_uxn_opcodes_h_l751_c26_1b75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l751_c26_1b75_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l751_c26_1b75_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l751_c26_238c]
signal MUX_uxn_opcodes_h_l751_c26_238c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l751_c26_238c_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l751_c26_238c_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l751_c26_238c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l752_c15_c98a]
signal BIN_OP_EQ_uxn_opcodes_h_l752_c15_c98a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l752_c15_c98a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l752_c15_c98a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l752_c15_562a]
signal MUX_uxn_opcodes_h_l752_c15_562a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l752_c15_562a_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l752_c15_562a_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l752_c15_562a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l754_c11_b2ed]
signal BIN_OP_EQ_uxn_opcodes_h_l754_c11_b2ed_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l754_c11_b2ed_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l754_c11_b2ed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l754_c7_5a68]
signal result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5a68_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5a68_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5a68_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5a68_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l754_c7_5a68]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5a68_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5a68_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5a68_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5a68_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l754_c7_5a68]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5a68_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5a68_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5a68_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5a68_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_af99( ref_toks_0 : opcode_result_t;
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
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_pc_updated := ref_toks_5;
      base.pc := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693
BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693_left,
BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693_right,
BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_c4c9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_c4c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_c4c9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_c4c9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_c4c9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_c4c9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_0216
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_0216 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_0216_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_0216_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_0216_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_0216_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_0216
result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_0216 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_0216_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_0216_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_0216_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_0216_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_0216
result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_0216 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_0216_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_0216_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_0216_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_0216_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_0216
result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_0216 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_0216_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_0216_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_0216_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_0216_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_0216
result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_0216 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_0216_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_0216_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_0216_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_0216_return_output);

-- result_pc_MUX_uxn_opcodes_h_l724_c2_0216
result_pc_MUX_uxn_opcodes_h_l724_c2_0216 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l724_c2_0216_cond,
result_pc_MUX_uxn_opcodes_h_l724_c2_0216_iftrue,
result_pc_MUX_uxn_opcodes_h_l724_c2_0216_iffalse,
result_pc_MUX_uxn_opcodes_h_l724_c2_0216_return_output);

-- n8_MUX_uxn_opcodes_h_l724_c2_0216
n8_MUX_uxn_opcodes_h_l724_c2_0216 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l724_c2_0216_cond,
n8_MUX_uxn_opcodes_h_l724_c2_0216_iftrue,
n8_MUX_uxn_opcodes_h_l724_c2_0216_iffalse,
n8_MUX_uxn_opcodes_h_l724_c2_0216_return_output);

-- t16_MUX_uxn_opcodes_h_l724_c2_0216
t16_MUX_uxn_opcodes_h_l724_c2_0216 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l724_c2_0216_cond,
t16_MUX_uxn_opcodes_h_l724_c2_0216_iftrue,
t16_MUX_uxn_opcodes_h_l724_c2_0216_iffalse,
t16_MUX_uxn_opcodes_h_l724_c2_0216_return_output);

-- printf_uxn_opcodes_h_l725_c3_c89f_uxn_opcodes_h_l725_c3_c89f
printf_uxn_opcodes_h_l725_c3_c89f_uxn_opcodes_h_l725_c3_c89f : entity work.printf_uxn_opcodes_h_l725_c3_c89f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l725_c3_c89f_uxn_opcodes_h_l725_c3_c89f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l729_c11_b8ad
BIN_OP_EQ_uxn_opcodes_h_l729_c11_b8ad : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l729_c11_b8ad_left,
BIN_OP_EQ_uxn_opcodes_h_l729_c11_b8ad_right,
BIN_OP_EQ_uxn_opcodes_h_l729_c11_b8ad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_915b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_915b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_915b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_915b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_915b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_915b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_915b
result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_915b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_915b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_915b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_915b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_915b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_915b
result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_915b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_915b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_915b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_915b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_915b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_915b
result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_915b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_915b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_915b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_915b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_915b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_915b
result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_915b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_915b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_915b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_915b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_915b_return_output);

-- result_pc_MUX_uxn_opcodes_h_l729_c7_915b
result_pc_MUX_uxn_opcodes_h_l729_c7_915b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l729_c7_915b_cond,
result_pc_MUX_uxn_opcodes_h_l729_c7_915b_iftrue,
result_pc_MUX_uxn_opcodes_h_l729_c7_915b_iffalse,
result_pc_MUX_uxn_opcodes_h_l729_c7_915b_return_output);

-- n8_MUX_uxn_opcodes_h_l729_c7_915b
n8_MUX_uxn_opcodes_h_l729_c7_915b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l729_c7_915b_cond,
n8_MUX_uxn_opcodes_h_l729_c7_915b_iftrue,
n8_MUX_uxn_opcodes_h_l729_c7_915b_iffalse,
n8_MUX_uxn_opcodes_h_l729_c7_915b_return_output);

-- t16_MUX_uxn_opcodes_h_l729_c7_915b
t16_MUX_uxn_opcodes_h_l729_c7_915b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l729_c7_915b_cond,
t16_MUX_uxn_opcodes_h_l729_c7_915b_iftrue,
t16_MUX_uxn_opcodes_h_l729_c7_915b_iffalse,
t16_MUX_uxn_opcodes_h_l729_c7_915b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l732_c11_bd06
BIN_OP_EQ_uxn_opcodes_h_l732_c11_bd06 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l732_c11_bd06_left,
BIN_OP_EQ_uxn_opcodes_h_l732_c11_bd06_right,
BIN_OP_EQ_uxn_opcodes_h_l732_c11_bd06_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_73bc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_73bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_73bc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_73bc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_73bc
result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_73bc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_73bc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_73bc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_73bc
result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_73bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_73bc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_73bc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_73bc
result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_73bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_73bc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_73bc_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_73bc
result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_73bc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_73bc_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_73bc_return_output);

-- result_pc_MUX_uxn_opcodes_h_l732_c7_73bc
result_pc_MUX_uxn_opcodes_h_l732_c7_73bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l732_c7_73bc_cond,
result_pc_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue,
result_pc_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse,
result_pc_MUX_uxn_opcodes_h_l732_c7_73bc_return_output);

-- n8_MUX_uxn_opcodes_h_l732_c7_73bc
n8_MUX_uxn_opcodes_h_l732_c7_73bc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l732_c7_73bc_cond,
n8_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue,
n8_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse,
n8_MUX_uxn_opcodes_h_l732_c7_73bc_return_output);

-- t16_MUX_uxn_opcodes_h_l732_c7_73bc
t16_MUX_uxn_opcodes_h_l732_c7_73bc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l732_c7_73bc_cond,
t16_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue,
t16_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse,
t16_MUX_uxn_opcodes_h_l732_c7_73bc_return_output);

-- CONST_SL_8_uxn_opcodes_h_l734_c3_b3da
CONST_SL_8_uxn_opcodes_h_l734_c3_b3da : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l734_c3_b3da_x,
CONST_SL_8_uxn_opcodes_h_l734_c3_b3da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l737_c11_ef33
BIN_OP_EQ_uxn_opcodes_h_l737_c11_ef33 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l737_c11_ef33_left,
BIN_OP_EQ_uxn_opcodes_h_l737_c11_ef33_right,
BIN_OP_EQ_uxn_opcodes_h_l737_c11_ef33_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7fca
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7fca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7fca_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7fca_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7fca
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7fca : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7fca_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7fca_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7fca
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7fca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7fca_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7fca_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7fca
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7fca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7fca_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7fca_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7fca
result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7fca : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7fca_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7fca_return_output);

-- result_pc_MUX_uxn_opcodes_h_l737_c7_7fca
result_pc_MUX_uxn_opcodes_h_l737_c7_7fca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l737_c7_7fca_cond,
result_pc_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue,
result_pc_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse,
result_pc_MUX_uxn_opcodes_h_l737_c7_7fca_return_output);

-- n8_MUX_uxn_opcodes_h_l737_c7_7fca
n8_MUX_uxn_opcodes_h_l737_c7_7fca : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l737_c7_7fca_cond,
n8_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue,
n8_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse,
n8_MUX_uxn_opcodes_h_l737_c7_7fca_return_output);

-- t16_MUX_uxn_opcodes_h_l737_c7_7fca
t16_MUX_uxn_opcodes_h_l737_c7_7fca : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l737_c7_7fca_cond,
t16_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue,
t16_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse,
t16_MUX_uxn_opcodes_h_l737_c7_7fca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l740_c11_1999
BIN_OP_EQ_uxn_opcodes_h_l740_c11_1999 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l740_c11_1999_left,
BIN_OP_EQ_uxn_opcodes_h_l740_c11_1999_right,
BIN_OP_EQ_uxn_opcodes_h_l740_c11_1999_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_50ee
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_50ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_50ee_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_50ee_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_50ee
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_50ee : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_50ee_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_50ee_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_50ee
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_50ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_50ee_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_50ee_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_50ee
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_50ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_50ee_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_50ee_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_50ee
result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_50ee : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_50ee_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_50ee_return_output);

-- result_pc_MUX_uxn_opcodes_h_l740_c7_50ee
result_pc_MUX_uxn_opcodes_h_l740_c7_50ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l740_c7_50ee_cond,
result_pc_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue,
result_pc_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse,
result_pc_MUX_uxn_opcodes_h_l740_c7_50ee_return_output);

-- n8_MUX_uxn_opcodes_h_l740_c7_50ee
n8_MUX_uxn_opcodes_h_l740_c7_50ee : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l740_c7_50ee_cond,
n8_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue,
n8_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse,
n8_MUX_uxn_opcodes_h_l740_c7_50ee_return_output);

-- t16_MUX_uxn_opcodes_h_l740_c7_50ee
t16_MUX_uxn_opcodes_h_l740_c7_50ee : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l740_c7_50ee_cond,
t16_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue,
t16_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse,
t16_MUX_uxn_opcodes_h_l740_c7_50ee_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l741_c3_b804
BIN_OP_OR_uxn_opcodes_h_l741_c3_b804 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l741_c3_b804_left,
BIN_OP_OR_uxn_opcodes_h_l741_c3_b804_right,
BIN_OP_OR_uxn_opcodes_h_l741_c3_b804_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l744_c11_1429
BIN_OP_EQ_uxn_opcodes_h_l744_c11_1429 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l744_c11_1429_left,
BIN_OP_EQ_uxn_opcodes_h_l744_c11_1429_right,
BIN_OP_EQ_uxn_opcodes_h_l744_c11_1429_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2978
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2978 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2978_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2978_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2978_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2978_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2978
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2978 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2978_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2978_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2978_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2978_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2978
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2978 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2978_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2978_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2978_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2978_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2978
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2978 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2978_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2978_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2978_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2978_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2978
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2978 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2978_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2978_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2978_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2978_return_output);

-- result_pc_MUX_uxn_opcodes_h_l744_c7_2978
result_pc_MUX_uxn_opcodes_h_l744_c7_2978 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l744_c7_2978_cond,
result_pc_MUX_uxn_opcodes_h_l744_c7_2978_iftrue,
result_pc_MUX_uxn_opcodes_h_l744_c7_2978_iffalse,
result_pc_MUX_uxn_opcodes_h_l744_c7_2978_return_output);

-- n8_MUX_uxn_opcodes_h_l744_c7_2978
n8_MUX_uxn_opcodes_h_l744_c7_2978 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l744_c7_2978_cond,
n8_MUX_uxn_opcodes_h_l744_c7_2978_iftrue,
n8_MUX_uxn_opcodes_h_l744_c7_2978_iffalse,
n8_MUX_uxn_opcodes_h_l744_c7_2978_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l747_c11_0b87
BIN_OP_EQ_uxn_opcodes_h_l747_c11_0b87 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l747_c11_0b87_left,
BIN_OP_EQ_uxn_opcodes_h_l747_c11_0b87_right,
BIN_OP_EQ_uxn_opcodes_h_l747_c11_0b87_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_d599
result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_d599 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_d599_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_d599_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_d599_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_d599_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_d599
result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_d599 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_d599_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_d599_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_d599_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_d599_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_d599
result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_d599 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_d599_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_d599_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_d599_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_d599_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_d599
result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_d599 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_d599_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_d599_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_d599_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_d599_return_output);

-- result_pc_MUX_uxn_opcodes_h_l747_c7_d599
result_pc_MUX_uxn_opcodes_h_l747_c7_d599 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l747_c7_d599_cond,
result_pc_MUX_uxn_opcodes_h_l747_c7_d599_iftrue,
result_pc_MUX_uxn_opcodes_h_l747_c7_d599_iffalse,
result_pc_MUX_uxn_opcodes_h_l747_c7_d599_return_output);

-- n8_MUX_uxn_opcodes_h_l747_c7_d599
n8_MUX_uxn_opcodes_h_l747_c7_d599 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l747_c7_d599_cond,
n8_MUX_uxn_opcodes_h_l747_c7_d599_iftrue,
n8_MUX_uxn_opcodes_h_l747_c7_d599_iffalse,
n8_MUX_uxn_opcodes_h_l747_c7_d599_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l750_c32_7097
BIN_OP_AND_uxn_opcodes_h_l750_c32_7097 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l750_c32_7097_left,
BIN_OP_AND_uxn_opcodes_h_l750_c32_7097_right,
BIN_OP_AND_uxn_opcodes_h_l750_c32_7097_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l750_c32_2e94
BIN_OP_GT_uxn_opcodes_h_l750_c32_2e94 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l750_c32_2e94_left,
BIN_OP_GT_uxn_opcodes_h_l750_c32_2e94_right,
BIN_OP_GT_uxn_opcodes_h_l750_c32_2e94_return_output);

-- MUX_uxn_opcodes_h_l750_c32_452e
MUX_uxn_opcodes_h_l750_c32_452e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l750_c32_452e_cond,
MUX_uxn_opcodes_h_l750_c32_452e_iftrue,
MUX_uxn_opcodes_h_l750_c32_452e_iffalse,
MUX_uxn_opcodes_h_l750_c32_452e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l751_c26_1b75
BIN_OP_EQ_uxn_opcodes_h_l751_c26_1b75 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l751_c26_1b75_left,
BIN_OP_EQ_uxn_opcodes_h_l751_c26_1b75_right,
BIN_OP_EQ_uxn_opcodes_h_l751_c26_1b75_return_output);

-- MUX_uxn_opcodes_h_l751_c26_238c
MUX_uxn_opcodes_h_l751_c26_238c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l751_c26_238c_cond,
MUX_uxn_opcodes_h_l751_c26_238c_iftrue,
MUX_uxn_opcodes_h_l751_c26_238c_iffalse,
MUX_uxn_opcodes_h_l751_c26_238c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l752_c15_c98a
BIN_OP_EQ_uxn_opcodes_h_l752_c15_c98a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l752_c15_c98a_left,
BIN_OP_EQ_uxn_opcodes_h_l752_c15_c98a_right,
BIN_OP_EQ_uxn_opcodes_h_l752_c15_c98a_return_output);

-- MUX_uxn_opcodes_h_l752_c15_562a
MUX_uxn_opcodes_h_l752_c15_562a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l752_c15_562a_cond,
MUX_uxn_opcodes_h_l752_c15_562a_iftrue,
MUX_uxn_opcodes_h_l752_c15_562a_iffalse,
MUX_uxn_opcodes_h_l752_c15_562a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l754_c11_b2ed
BIN_OP_EQ_uxn_opcodes_h_l754_c11_b2ed : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l754_c11_b2ed_left,
BIN_OP_EQ_uxn_opcodes_h_l754_c11_b2ed_right,
BIN_OP_EQ_uxn_opcodes_h_l754_c11_b2ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5a68
result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5a68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5a68_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5a68_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5a68_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5a68_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5a68
result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5a68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5a68_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5a68_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5a68_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5a68_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5a68
result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5a68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5a68_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5a68_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5a68_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5a68_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_c4c9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_0216_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_0216_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_0216_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_0216_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_0216_return_output,
 result_pc_MUX_uxn_opcodes_h_l724_c2_0216_return_output,
 n8_MUX_uxn_opcodes_h_l724_c2_0216_return_output,
 t16_MUX_uxn_opcodes_h_l724_c2_0216_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l729_c11_b8ad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_915b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_915b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_915b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_915b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_915b_return_output,
 result_pc_MUX_uxn_opcodes_h_l729_c7_915b_return_output,
 n8_MUX_uxn_opcodes_h_l729_c7_915b_return_output,
 t16_MUX_uxn_opcodes_h_l729_c7_915b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l732_c11_bd06_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_73bc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_73bc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_73bc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_73bc_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_73bc_return_output,
 result_pc_MUX_uxn_opcodes_h_l732_c7_73bc_return_output,
 n8_MUX_uxn_opcodes_h_l732_c7_73bc_return_output,
 t16_MUX_uxn_opcodes_h_l732_c7_73bc_return_output,
 CONST_SL_8_uxn_opcodes_h_l734_c3_b3da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l737_c11_ef33_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7fca_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7fca_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7fca_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7fca_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7fca_return_output,
 result_pc_MUX_uxn_opcodes_h_l737_c7_7fca_return_output,
 n8_MUX_uxn_opcodes_h_l737_c7_7fca_return_output,
 t16_MUX_uxn_opcodes_h_l737_c7_7fca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l740_c11_1999_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_50ee_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_50ee_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_50ee_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_50ee_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_50ee_return_output,
 result_pc_MUX_uxn_opcodes_h_l740_c7_50ee_return_output,
 n8_MUX_uxn_opcodes_h_l740_c7_50ee_return_output,
 t16_MUX_uxn_opcodes_h_l740_c7_50ee_return_output,
 BIN_OP_OR_uxn_opcodes_h_l741_c3_b804_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l744_c11_1429_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2978_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2978_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2978_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2978_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2978_return_output,
 result_pc_MUX_uxn_opcodes_h_l744_c7_2978_return_output,
 n8_MUX_uxn_opcodes_h_l744_c7_2978_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l747_c11_0b87_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_d599_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_d599_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_d599_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_d599_return_output,
 result_pc_MUX_uxn_opcodes_h_l747_c7_d599_return_output,
 n8_MUX_uxn_opcodes_h_l747_c7_d599_return_output,
 BIN_OP_AND_uxn_opcodes_h_l750_c32_7097_return_output,
 BIN_OP_GT_uxn_opcodes_h_l750_c32_2e94_return_output,
 MUX_uxn_opcodes_h_l750_c32_452e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l751_c26_1b75_return_output,
 MUX_uxn_opcodes_h_l751_c26_238c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l752_c15_c98a_return_output,
 MUX_uxn_opcodes_h_l752_c15_562a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l754_c11_b2ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5a68_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5a68_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5a68_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_c4c9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_c4c9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_c4c9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_c4c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_0216_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l726_c3_bb62 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_0216_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_915b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_0216_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_0216_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_0216_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_0216_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_915b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_0216_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_0216_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_0216_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_0216_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_915b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_0216_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_0216_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_0216_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_0216_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_915b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_0216_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_0216_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_0216_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_0216_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_915b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_0216_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_0216_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l724_c2_0216_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l724_c2_0216_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l729_c7_915b_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l724_c2_0216_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l724_c2_0216_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l724_c2_0216_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l724_c2_0216_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l729_c7_915b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l724_c2_0216_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l724_c2_0216_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l724_c2_0216_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l724_c2_0216_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l729_c7_915b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l724_c2_0216_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l724_c2_0216_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l725_c3_c89f_uxn_opcodes_h_l725_c3_c89f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_b8ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_b8ad_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_b8ad_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_915b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l730_c3_3f63 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_915b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_73bc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_915b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_915b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_915b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_73bc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_915b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_915b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_915b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_73bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_915b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_915b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_915b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_73bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_915b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_915b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_915b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_73bc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_915b_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l729_c7_915b_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l729_c7_915b_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l732_c7_73bc_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l729_c7_915b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l729_c7_915b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l729_c7_915b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l732_c7_73bc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l729_c7_915b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l729_c7_915b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l729_c7_915b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l732_c7_73bc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l729_c7_915b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_bd06_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_bd06_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_bd06_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l735_c3_027a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7fca_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_73bc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7fca_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_73bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7fca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_73bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7fca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_73bc_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7fca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_73bc_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l737_c7_7fca_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l732_c7_73bc_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l737_c7_7fca_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l732_c7_73bc_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l737_c7_7fca_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l732_c7_73bc_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l734_c3_b3da_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l734_c3_b3da_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_ef33_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_ef33_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_ef33_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l738_c3_a490 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_50ee_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7fca_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_50ee_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7fca_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_50ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7fca_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_50ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7fca_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_50ee_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7fca_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l740_c7_50ee_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l737_c7_7fca_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l740_c7_50ee_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l737_c7_7fca_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l740_c7_50ee_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l737_c7_7fca_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_1999_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_1999_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_1999_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l742_c3_6481 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2978_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_50ee_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2978_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_50ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2978_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_50ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2978_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_50ee_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2978_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_50ee_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_2978_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l740_c7_50ee_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l744_c7_2978_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l740_c7_50ee_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l740_c7_50ee_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_b804_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_b804_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_b804_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_1429_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_1429_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_1429_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2978_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l745_c3_4e1c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2978_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l744_c7_2978_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2978_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2978_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2978_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_d599_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2978_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2978_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2978_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_d599_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2978_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2978_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2978_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_d599_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2978_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2978_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2978_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_d599_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2978_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_2978_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_2978_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l747_c7_d599_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_2978_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l744_c7_2978_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l744_c7_2978_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l747_c7_d599_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l744_c7_2978_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l747_c11_0b87_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l747_c11_0b87_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l747_c11_0b87_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_d599_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_d599_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_d599_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_d599_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_d599_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5a68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_d599_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_d599_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_d599_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5a68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_d599_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_d599_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_d599_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5a68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_d599_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l747_c7_d599_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l747_c7_d599_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l747_c7_d599_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l747_c7_d599_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l747_c7_d599_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l747_c7_d599_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l750_c32_452e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l750_c32_452e_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l750_c32_452e_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l750_c32_7097_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l750_c32_7097_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l750_c32_7097_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l750_c32_2e94_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l750_c32_2e94_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l750_c32_2e94_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l750_c32_452e_return_output : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l751_c26_238c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l751_c26_238c_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l751_c26_238c_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c26_1b75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c26_1b75_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c26_1b75_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l751_c26_238c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l752_c15_562a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l752_c15_562a_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l752_c15_562a_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c15_c98a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c15_c98a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c15_c98a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l752_c15_562a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c11_b2ed_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c11_b2ed_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c11_b2ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5a68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5a68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5a68_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5a68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5a68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5a68_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5a68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5a68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5a68_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l740_l737_l747_l732_l724_l729_DUPLICATE_abcf_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l740_l754_l737_l732_l724_l729_DUPLICATE_8bec_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l740_l754_l737_l732_l724_l729_DUPLICATE_8a0b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l744_l740_l737_l747_l732_l724_l729_DUPLICATE_50bc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l740_l754_l737_l747_l732_l729_DUPLICATE_1041_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l733_l741_DUPLICATE_5ae3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_af99_uxn_opcodes_h_l719_l760_DUPLICATE_7105_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l730_c3_3f63 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_915b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l730_c3_3f63;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l745_c3_4e1c := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2978_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l745_c3_4e1c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c15_c98a_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l750_c32_7097_right := to_unsigned(128, 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l750_c32_2e94_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_1429_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_b8ad_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5a68_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5a68_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_1999_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l738_c3_a490 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l738_c3_a490;
     VAR_MUX_uxn_opcodes_h_l752_c15_562a_iftrue := resize(to_unsigned(0, 1), 16);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l750_c32_452e_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5a68_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l735_c3_027a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l735_c3_027a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c11_b2ed_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c26_1b75_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l751_c26_238c_iffalse := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_bd06_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l750_c32_452e_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l726_c3_bb62 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_0216_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l726_c3_bb62;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l747_c11_0b87_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l751_c26_238c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l742_c3_6481 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l742_c3_6481;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_d599_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_0216_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_c4c9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_ef33_right := to_unsigned(3, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_c4c9_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l750_c32_7097_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l724_c2_0216_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l729_c7_915b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l744_c7_2978_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l747_c7_d599_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_b8ad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_bd06_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_ef33_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_1999_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_1429_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l747_c11_0b87_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c11_b2ed_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c26_1b75_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c15_c98a_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l747_c7_d599_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_b804_left := t16;
     VAR_MUX_uxn_opcodes_h_l752_c15_562a_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l724_c2_0216_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l729_c7_915b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l747_c11_0b87] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l747_c11_0b87_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l747_c11_0b87_left;
     BIN_OP_EQ_uxn_opcodes_h_l747_c11_0b87_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l747_c11_0b87_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l747_c11_0b87_return_output := BIN_OP_EQ_uxn_opcodes_h_l747_c11_0b87_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l732_c11_bd06] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l732_c11_bd06_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_bd06_left;
     BIN_OP_EQ_uxn_opcodes_h_l732_c11_bd06_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_bd06_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_bd06_return_output := BIN_OP_EQ_uxn_opcodes_h_l732_c11_bd06_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l740_l754_l737_l747_l732_l729_DUPLICATE_1041 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l740_l754_l737_l747_l732_l729_DUPLICATE_1041_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l744_c11_1429] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l744_c11_1429_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_1429_left;
     BIN_OP_EQ_uxn_opcodes_h_l744_c11_1429_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_1429_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_1429_return_output := BIN_OP_EQ_uxn_opcodes_h_l744_c11_1429_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l744_c7_2978] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l744_c7_2978_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l740_l737_l747_l732_l724_l729_DUPLICATE_abcf LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l740_l737_l747_l732_l724_l729_DUPLICATE_abcf_return_output := result.sp_relative_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l750_c32_7097] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l750_c32_7097_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l750_c32_7097_left;
     BIN_OP_AND_uxn_opcodes_h_l750_c32_7097_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l750_c32_7097_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l750_c32_7097_return_output := BIN_OP_AND_uxn_opcodes_h_l750_c32_7097_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l729_c11_b8ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l729_c11_b8ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_b8ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l729_c11_b8ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_b8ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_b8ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l729_c11_b8ad_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l744_l740_l737_l747_l732_l724_l729_DUPLICATE_50bc LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l744_l740_l737_l747_l732_l724_l729_DUPLICATE_50bc_return_output := result.pc;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l740_l754_l737_l732_l724_l729_DUPLICATE_8bec LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l740_l754_l737_l732_l724_l729_DUPLICATE_8bec_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l740_c11_1999] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l740_c11_1999_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_1999_left;
     BIN_OP_EQ_uxn_opcodes_h_l740_c11_1999_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_1999_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_1999_return_output := BIN_OP_EQ_uxn_opcodes_h_l740_c11_1999_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l752_c15_c98a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l752_c15_c98a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c15_c98a_left;
     BIN_OP_EQ_uxn_opcodes_h_l752_c15_c98a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c15_c98a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c15_c98a_return_output := BIN_OP_EQ_uxn_opcodes_h_l752_c15_c98a_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l733_l741_DUPLICATE_5ae3 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l733_l741_DUPLICATE_5ae3_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l740_l754_l737_l732_l724_l729_DUPLICATE_8a0b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l740_l754_l737_l732_l724_l729_DUPLICATE_8a0b_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l737_c11_ef33] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l737_c11_ef33_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_ef33_left;
     BIN_OP_EQ_uxn_opcodes_h_l737_c11_ef33_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_ef33_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_ef33_return_output := BIN_OP_EQ_uxn_opcodes_h_l737_c11_ef33_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l724_c6_f693] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693_left;
     BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693_return_output := BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l754_c11_b2ed] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l754_c11_b2ed_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c11_b2ed_left;
     BIN_OP_EQ_uxn_opcodes_h_l754_c11_b2ed_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c11_b2ed_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c11_b2ed_return_output := BIN_OP_EQ_uxn_opcodes_h_l754_c11_b2ed_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l751_c26_1b75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l751_c26_1b75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c26_1b75_left;
     BIN_OP_EQ_uxn_opcodes_h_l751_c26_1b75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c26_1b75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c26_1b75_return_output := BIN_OP_EQ_uxn_opcodes_h_l751_c26_1b75_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l750_c32_2e94_left := VAR_BIN_OP_AND_uxn_opcodes_h_l750_c32_7097_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_c4c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l724_c2_0216_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_0216_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_0216_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_0216_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l724_c2_0216_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_0216_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_0216_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l724_c2_0216_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l724_c6_f693_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l729_c7_915b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_b8ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_915b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_b8ad_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_915b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_b8ad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_915b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_b8ad_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l729_c7_915b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_b8ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_915b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_b8ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_915b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_b8ad_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l729_c7_915b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_b8ad_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l732_c7_73bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_bd06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_73bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_bd06_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_73bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_bd06_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_73bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_bd06_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l732_c7_73bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_bd06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_73bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_bd06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_73bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_bd06_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l732_c7_73bc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l732_c11_bd06_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l737_c7_7fca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_ef33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7fca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_ef33_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7fca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_ef33_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7fca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_ef33_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l737_c7_7fca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_ef33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7fca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_ef33_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7fca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_ef33_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l737_c7_7fca_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_ef33_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l740_c7_50ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_1999_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_50ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_1999_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_50ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_1999_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_50ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_1999_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l740_c7_50ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_1999_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_50ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_1999_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_50ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_1999_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l740_c7_50ee_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l740_c11_1999_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l744_c7_2978_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_1429_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2978_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_1429_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2978_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_1429_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2978_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_1429_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_2978_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_1429_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2978_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_1429_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2978_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_1429_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l747_c7_d599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l747_c11_0b87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_d599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l747_c11_0b87_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_d599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l747_c11_0b87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_d599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l747_c11_0b87_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l747_c7_d599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l747_c11_0b87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_d599_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l747_c11_0b87_return_output;
     VAR_MUX_uxn_opcodes_h_l751_c26_238c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c26_1b75_return_output;
     VAR_MUX_uxn_opcodes_h_l752_c15_562a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l752_c15_c98a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5a68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c11_b2ed_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5a68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c11_b2ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5a68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l754_c11_b2ed_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_b804_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l733_l741_DUPLICATE_5ae3_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l734_c3_b3da_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l733_l741_DUPLICATE_5ae3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_0216_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l740_l737_l747_l732_l724_l729_DUPLICATE_abcf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_915b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l740_l737_l747_l732_l724_l729_DUPLICATE_abcf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l740_l737_l747_l732_l724_l729_DUPLICATE_abcf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l740_l737_l747_l732_l724_l729_DUPLICATE_abcf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l740_l737_l747_l732_l724_l729_DUPLICATE_abcf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2978_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l740_l737_l747_l732_l724_l729_DUPLICATE_abcf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_d599_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l744_l740_l737_l747_l732_l724_l729_DUPLICATE_abcf_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l724_c2_0216_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l744_l740_l737_l747_l732_l724_l729_DUPLICATE_50bc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l729_c7_915b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l744_l740_l737_l747_l732_l724_l729_DUPLICATE_50bc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l744_l740_l737_l747_l732_l724_l729_DUPLICATE_50bc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l744_l740_l737_l747_l732_l724_l729_DUPLICATE_50bc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l744_l740_l737_l747_l732_l724_l729_DUPLICATE_50bc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_2978_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l744_l740_l737_l747_l732_l724_l729_DUPLICATE_50bc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l747_c7_d599_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l744_l740_l737_l747_l732_l724_l729_DUPLICATE_50bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_915b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l740_l754_l737_l747_l732_l729_DUPLICATE_1041_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l740_l754_l737_l747_l732_l729_DUPLICATE_1041_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l740_l754_l737_l747_l732_l729_DUPLICATE_1041_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l740_l754_l737_l747_l732_l729_DUPLICATE_1041_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2978_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l740_l754_l737_l747_l732_l729_DUPLICATE_1041_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_d599_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l740_l754_l737_l747_l732_l729_DUPLICATE_1041_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5a68_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l744_l740_l754_l737_l747_l732_l729_DUPLICATE_1041_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_0216_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l740_l754_l737_l732_l724_l729_DUPLICATE_8a0b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_915b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l740_l754_l737_l732_l724_l729_DUPLICATE_8a0b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l740_l754_l737_l732_l724_l729_DUPLICATE_8a0b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l740_l754_l737_l732_l724_l729_DUPLICATE_8a0b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l740_l754_l737_l732_l724_l729_DUPLICATE_8a0b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2978_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l740_l754_l737_l732_l724_l729_DUPLICATE_8a0b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5a68_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l744_l740_l754_l737_l732_l724_l729_DUPLICATE_8a0b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_0216_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l740_l754_l737_l732_l724_l729_DUPLICATE_8bec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_915b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l740_l754_l737_l732_l724_l729_DUPLICATE_8bec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l740_l754_l737_l732_l724_l729_DUPLICATE_8bec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l740_l754_l737_l732_l724_l729_DUPLICATE_8bec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l740_l754_l737_l732_l724_l729_DUPLICATE_8bec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2978_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l740_l754_l737_l732_l724_l729_DUPLICATE_8bec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5a68_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l744_l740_l754_l737_l732_l724_l729_DUPLICATE_8bec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2978_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l744_c7_2978_return_output;
     -- MUX[uxn_opcodes_h_l752_c15_562a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l752_c15_562a_cond <= VAR_MUX_uxn_opcodes_h_l752_c15_562a_cond;
     MUX_uxn_opcodes_h_l752_c15_562a_iftrue <= VAR_MUX_uxn_opcodes_h_l752_c15_562a_iftrue;
     MUX_uxn_opcodes_h_l752_c15_562a_iffalse <= VAR_MUX_uxn_opcodes_h_l752_c15_562a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l752_c15_562a_return_output := MUX_uxn_opcodes_h_l752_c15_562a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l750_c32_2e94] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l750_c32_2e94_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l750_c32_2e94_left;
     BIN_OP_GT_uxn_opcodes_h_l750_c32_2e94_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l750_c32_2e94_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l750_c32_2e94_return_output := BIN_OP_GT_uxn_opcodes_h_l750_c32_2e94_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l754_c7_5a68] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5a68_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5a68_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5a68_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5a68_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5a68_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5a68_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5a68_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5a68_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l754_c7_5a68] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5a68_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5a68_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5a68_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5a68_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5a68_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5a68_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5a68_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5a68_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l724_c1_c4c9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_c4c9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_c4c9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_c4c9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_c4c9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_c4c9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_c4c9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_c4c9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_c4c9_return_output;

     -- n8_MUX[uxn_opcodes_h_l747_c7_d599] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l747_c7_d599_cond <= VAR_n8_MUX_uxn_opcodes_h_l747_c7_d599_cond;
     n8_MUX_uxn_opcodes_h_l747_c7_d599_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l747_c7_d599_iftrue;
     n8_MUX_uxn_opcodes_h_l747_c7_d599_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l747_c7_d599_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l747_c7_d599_return_output := n8_MUX_uxn_opcodes_h_l747_c7_d599_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l734_c3_b3da] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l734_c3_b3da_x <= VAR_CONST_SL_8_uxn_opcodes_h_l734_c3_b3da_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l734_c3_b3da_return_output := CONST_SL_8_uxn_opcodes_h_l734_c3_b3da_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l754_c7_5a68] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5a68_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5a68_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5a68_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5a68_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5a68_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5a68_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5a68_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5a68_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l744_c7_2978] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2978_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2978_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2978_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2978_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2978_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2978_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2978_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2978_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l741_c3_b804] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l741_c3_b804_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_b804_left;
     BIN_OP_OR_uxn_opcodes_h_l741_c3_b804_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_b804_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_b804_return_output := BIN_OP_OR_uxn_opcodes_h_l741_c3_b804_return_output;

     -- MUX[uxn_opcodes_h_l751_c26_238c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l751_c26_238c_cond <= VAR_MUX_uxn_opcodes_h_l751_c26_238c_cond;
     MUX_uxn_opcodes_h_l751_c26_238c_iftrue <= VAR_MUX_uxn_opcodes_h_l751_c26_238c_iftrue;
     MUX_uxn_opcodes_h_l751_c26_238c_iffalse <= VAR_MUX_uxn_opcodes_h_l751_c26_238c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l751_c26_238c_return_output := MUX_uxn_opcodes_h_l751_c26_238c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l750_c32_452e_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l750_c32_2e94_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l741_c3_b804_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l734_c3_b3da_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_d599_iftrue := VAR_MUX_uxn_opcodes_h_l751_c26_238c_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l747_c7_d599_iftrue := VAR_MUX_uxn_opcodes_h_l752_c15_562a_return_output;
     VAR_printf_uxn_opcodes_h_l725_c3_c89f_uxn_opcodes_h_l725_c3_c89f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l724_c1_c4c9_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l744_c7_2978_iffalse := VAR_n8_MUX_uxn_opcodes_h_l747_c7_d599_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_d599_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l754_c7_5a68_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_d599_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l754_c7_5a68_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_d599_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l754_c7_5a68_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l744_c7_2978_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l740_c7_50ee] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_50ee_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_50ee_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_50ee_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_50ee_return_output;

     -- n8_MUX[uxn_opcodes_h_l744_c7_2978] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l744_c7_2978_cond <= VAR_n8_MUX_uxn_opcodes_h_l744_c7_2978_cond;
     n8_MUX_uxn_opcodes_h_l744_c7_2978_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l744_c7_2978_iftrue;
     n8_MUX_uxn_opcodes_h_l744_c7_2978_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l744_c7_2978_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l744_c7_2978_return_output := n8_MUX_uxn_opcodes_h_l744_c7_2978_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l747_c7_d599] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_d599_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_d599_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_d599_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_d599_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_d599_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_d599_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_d599_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_d599_return_output;

     -- MUX[uxn_opcodes_h_l750_c32_452e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l750_c32_452e_cond <= VAR_MUX_uxn_opcodes_h_l750_c32_452e_cond;
     MUX_uxn_opcodes_h_l750_c32_452e_iftrue <= VAR_MUX_uxn_opcodes_h_l750_c32_452e_iftrue;
     MUX_uxn_opcodes_h_l750_c32_452e_iffalse <= VAR_MUX_uxn_opcodes_h_l750_c32_452e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l750_c32_452e_return_output := MUX_uxn_opcodes_h_l750_c32_452e_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l747_c7_d599] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_d599_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_d599_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_d599_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_d599_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_d599_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_d599_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_d599_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_d599_return_output;

     -- printf_uxn_opcodes_h_l725_c3_c89f[uxn_opcodes_h_l725_c3_c89f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l725_c3_c89f_uxn_opcodes_h_l725_c3_c89f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l725_c3_c89f_uxn_opcodes_h_l725_c3_c89f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l740_c7_50ee] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l740_c7_50ee_cond <= VAR_t16_MUX_uxn_opcodes_h_l740_c7_50ee_cond;
     t16_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue;
     t16_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l740_c7_50ee_return_output := t16_MUX_uxn_opcodes_h_l740_c7_50ee_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l747_c7_d599] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l747_c7_d599_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l747_c7_d599_cond;
     result_pc_MUX_uxn_opcodes_h_l747_c7_d599_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l747_c7_d599_iftrue;
     result_pc_MUX_uxn_opcodes_h_l747_c7_d599_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l747_c7_d599_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l747_c7_d599_return_output := result_pc_MUX_uxn_opcodes_h_l747_c7_d599_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l747_c7_d599] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_d599_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_d599_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_d599_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_d599_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_d599_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_d599_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_d599_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_d599_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_d599_iftrue := VAR_MUX_uxn_opcodes_h_l750_c32_452e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse := VAR_n8_MUX_uxn_opcodes_h_l744_c7_2978_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2978_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l747_c7_d599_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2978_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l747_c7_d599_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2978_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l747_c7_d599_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_2978_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l747_c7_d599_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l740_c7_50ee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse := VAR_t16_MUX_uxn_opcodes_h_l740_c7_50ee_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l744_c7_2978] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2978_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2978_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2978_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2978_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2978_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2978_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2978_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2978_return_output;

     -- t16_MUX[uxn_opcodes_h_l737_c7_7fca] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l737_c7_7fca_cond <= VAR_t16_MUX_uxn_opcodes_h_l737_c7_7fca_cond;
     t16_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue;
     t16_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l737_c7_7fca_return_output := t16_MUX_uxn_opcodes_h_l737_c7_7fca_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l747_c7_d599] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_d599_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_d599_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_d599_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_d599_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_d599_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_d599_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_d599_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_d599_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l744_c7_2978] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2978_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2978_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2978_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2978_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2978_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2978_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2978_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2978_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l744_c7_2978] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l744_c7_2978_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_2978_cond;
     result_pc_MUX_uxn_opcodes_h_l744_c7_2978_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_2978_iftrue;
     result_pc_MUX_uxn_opcodes_h_l744_c7_2978_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_2978_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_2978_return_output := result_pc_MUX_uxn_opcodes_h_l744_c7_2978_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l744_c7_2978] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2978_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2978_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2978_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2978_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2978_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2978_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2978_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2978_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l737_c7_7fca] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7fca_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7fca_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7fca_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7fca_return_output;

     -- n8_MUX[uxn_opcodes_h_l740_c7_50ee] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l740_c7_50ee_cond <= VAR_n8_MUX_uxn_opcodes_h_l740_c7_50ee_cond;
     n8_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue;
     n8_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l740_c7_50ee_return_output := n8_MUX_uxn_opcodes_h_l740_c7_50ee_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse := VAR_n8_MUX_uxn_opcodes_h_l740_c7_50ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_2978_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_2978_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_2978_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l744_c7_2978_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2978_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l747_c7_d599_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7fca_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l737_c7_7fca_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l740_c7_50ee] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_50ee_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_50ee_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_50ee_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_50ee_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l740_c7_50ee] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_50ee_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_50ee_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_50ee_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_50ee_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l732_c7_73bc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_73bc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_73bc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_73bc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_73bc_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l740_c7_50ee] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_50ee_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_50ee_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_50ee_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_50ee_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l744_c7_2978] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2978_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2978_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2978_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2978_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2978_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2978_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2978_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2978_return_output;

     -- n8_MUX[uxn_opcodes_h_l737_c7_7fca] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l737_c7_7fca_cond <= VAR_n8_MUX_uxn_opcodes_h_l737_c7_7fca_cond;
     n8_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue;
     n8_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l737_c7_7fca_return_output := n8_MUX_uxn_opcodes_h_l737_c7_7fca_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l740_c7_50ee] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l740_c7_50ee_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l740_c7_50ee_cond;
     result_pc_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue;
     result_pc_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l740_c7_50ee_return_output := result_pc_MUX_uxn_opcodes_h_l740_c7_50ee_return_output;

     -- t16_MUX[uxn_opcodes_h_l732_c7_73bc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l732_c7_73bc_cond <= VAR_t16_MUX_uxn_opcodes_h_l732_c7_73bc_cond;
     t16_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue;
     t16_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l732_c7_73bc_return_output := t16_MUX_uxn_opcodes_h_l732_c7_73bc_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse := VAR_n8_MUX_uxn_opcodes_h_l737_c7_7fca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l740_c7_50ee_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l740_c7_50ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l740_c7_50ee_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l740_c7_50ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_2978_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_915b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l732_c7_73bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l729_c7_915b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l732_c7_73bc_return_output;
     -- t16_MUX[uxn_opcodes_h_l729_c7_915b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l729_c7_915b_cond <= VAR_t16_MUX_uxn_opcodes_h_l729_c7_915b_cond;
     t16_MUX_uxn_opcodes_h_l729_c7_915b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l729_c7_915b_iftrue;
     t16_MUX_uxn_opcodes_h_l729_c7_915b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l729_c7_915b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l729_c7_915b_return_output := t16_MUX_uxn_opcodes_h_l729_c7_915b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l737_c7_7fca] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7fca_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7fca_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7fca_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7fca_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l740_c7_50ee] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_50ee_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_50ee_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_50ee_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_50ee_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_50ee_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_50ee_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l737_c7_7fca] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7fca_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7fca_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7fca_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7fca_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l737_c7_7fca] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l737_c7_7fca_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l737_c7_7fca_cond;
     result_pc_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue;
     result_pc_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l737_c7_7fca_return_output := result_pc_MUX_uxn_opcodes_h_l737_c7_7fca_return_output;

     -- n8_MUX[uxn_opcodes_h_l732_c7_73bc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l732_c7_73bc_cond <= VAR_n8_MUX_uxn_opcodes_h_l732_c7_73bc_cond;
     n8_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue;
     n8_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l732_c7_73bc_return_output := n8_MUX_uxn_opcodes_h_l732_c7_73bc_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l737_c7_7fca] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7fca_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7fca_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7fca_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7fca_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l729_c7_915b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_915b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_915b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_915b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_915b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_915b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_915b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_915b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_915b_return_output;

     -- Submodule level 6
     VAR_n8_MUX_uxn_opcodes_h_l729_c7_915b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l732_c7_73bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7fca_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7fca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7fca_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l737_c7_7fca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l740_c7_50ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_0216_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_915b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l724_c2_0216_iffalse := VAR_t16_MUX_uxn_opcodes_h_l729_c7_915b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l724_c2_0216] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_0216_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_0216_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_0216_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_0216_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_0216_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_0216_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_0216_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_0216_return_output;

     -- n8_MUX[uxn_opcodes_h_l729_c7_915b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l729_c7_915b_cond <= VAR_n8_MUX_uxn_opcodes_h_l729_c7_915b_cond;
     n8_MUX_uxn_opcodes_h_l729_c7_915b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l729_c7_915b_iftrue;
     n8_MUX_uxn_opcodes_h_l729_c7_915b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l729_c7_915b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l729_c7_915b_return_output := n8_MUX_uxn_opcodes_h_l729_c7_915b_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l732_c7_73bc] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l732_c7_73bc_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l732_c7_73bc_cond;
     result_pc_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue;
     result_pc_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l732_c7_73bc_return_output := result_pc_MUX_uxn_opcodes_h_l732_c7_73bc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l732_c7_73bc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_73bc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_73bc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_73bc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_73bc_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l732_c7_73bc] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_73bc_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_73bc_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_73bc_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_73bc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l732_c7_73bc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_73bc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_73bc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_73bc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_73bc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l737_c7_7fca] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7fca_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7fca_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7fca_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7fca_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7fca_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7fca_return_output;

     -- t16_MUX[uxn_opcodes_h_l724_c2_0216] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l724_c2_0216_cond <= VAR_t16_MUX_uxn_opcodes_h_l724_c2_0216_cond;
     t16_MUX_uxn_opcodes_h_l724_c2_0216_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l724_c2_0216_iftrue;
     t16_MUX_uxn_opcodes_h_l724_c2_0216_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l724_c2_0216_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l724_c2_0216_return_output := t16_MUX_uxn_opcodes_h_l724_c2_0216_return_output;

     -- Submodule level 7
     VAR_n8_MUX_uxn_opcodes_h_l724_c2_0216_iffalse := VAR_n8_MUX_uxn_opcodes_h_l729_c7_915b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_915b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l732_c7_73bc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_915b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l732_c7_73bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_915b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l732_c7_73bc_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l729_c7_915b_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l732_c7_73bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7fca_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l724_c2_0216_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l732_c7_73bc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_73bc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_73bc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_73bc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_73bc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_73bc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_73bc_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l729_c7_915b] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l729_c7_915b_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l729_c7_915b_cond;
     result_pc_MUX_uxn_opcodes_h_l729_c7_915b_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l729_c7_915b_iftrue;
     result_pc_MUX_uxn_opcodes_h_l729_c7_915b_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l729_c7_915b_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l729_c7_915b_return_output := result_pc_MUX_uxn_opcodes_h_l729_c7_915b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l729_c7_915b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_915b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_915b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_915b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_915b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_915b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_915b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_915b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_915b_return_output;

     -- n8_MUX[uxn_opcodes_h_l724_c2_0216] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l724_c2_0216_cond <= VAR_n8_MUX_uxn_opcodes_h_l724_c2_0216_cond;
     n8_MUX_uxn_opcodes_h_l724_c2_0216_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l724_c2_0216_iftrue;
     n8_MUX_uxn_opcodes_h_l724_c2_0216_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l724_c2_0216_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l724_c2_0216_return_output := n8_MUX_uxn_opcodes_h_l724_c2_0216_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l729_c7_915b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_915b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_915b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_915b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_915b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_915b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_915b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_915b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_915b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l729_c7_915b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_915b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_915b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_915b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_915b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_915b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_915b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_915b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_915b_return_output;

     -- Submodule level 8
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l724_c2_0216_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_0216_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_915b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_0216_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_915b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_0216_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_915b_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l724_c2_0216_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l729_c7_915b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_915b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l732_c7_73bc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l724_c2_0216] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_0216_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_0216_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_0216_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_0216_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_0216_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_0216_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_0216_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_0216_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l724_c2_0216] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_0216_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_0216_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_0216_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_0216_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_0216_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_0216_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_0216_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_0216_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l724_c2_0216] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_0216_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_0216_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_0216_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_0216_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_0216_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_0216_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_0216_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_0216_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l729_c7_915b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_915b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_915b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_915b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_915b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_915b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_915b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_915b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_915b_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l724_c2_0216] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l724_c2_0216_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l724_c2_0216_cond;
     result_pc_MUX_uxn_opcodes_h_l724_c2_0216_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l724_c2_0216_iftrue;
     result_pc_MUX_uxn_opcodes_h_l724_c2_0216_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l724_c2_0216_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l724_c2_0216_return_output := result_pc_MUX_uxn_opcodes_h_l724_c2_0216_return_output;

     -- Submodule level 9
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_0216_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_915b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l724_c2_0216] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_0216_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_0216_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_0216_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_0216_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_0216_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_0216_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_0216_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_0216_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_af99_uxn_opcodes_h_l719_l760_DUPLICATE_7105 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_af99_uxn_opcodes_h_l719_l760_DUPLICATE_7105_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_af99(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l724_c2_0216_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l724_c2_0216_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l724_c2_0216_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l724_c2_0216_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l724_c2_0216_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l724_c2_0216_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_af99_uxn_opcodes_h_l719_l760_DUPLICATE_7105_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_af99_uxn_opcodes_h_l719_l760_DUPLICATE_7105_return_output;
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
