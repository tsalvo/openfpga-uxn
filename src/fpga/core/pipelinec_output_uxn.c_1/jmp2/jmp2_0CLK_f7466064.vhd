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
-- BIN_OP_EQ[uxn_opcodes_h_l593_c6_967a]
signal BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l593_c1_052f]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_052f_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_052f_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_052f_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_052f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l593_c2_1e36]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_1e36_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_1e36_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l593_c2_1e36]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_1e36_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_1e36_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l593_c2_1e36]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_1e36_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_1e36_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l593_c2_1e36]
signal result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_1e36_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_1e36_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l593_c2_1e36]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_1e36_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_1e36_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l593_c2_1e36]
signal result_pc_MUX_uxn_opcodes_h_l593_c2_1e36_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l593_c2_1e36_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l593_c2_1e36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_1e36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_1e36_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l593_c2_1e36]
signal t16_MUX_uxn_opcodes_h_l593_c2_1e36_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l593_c2_1e36_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l594_c3_fccc[uxn_opcodes_h_l594_c3_fccc]
signal printf_uxn_opcodes_h_l594_c3_fccc_uxn_opcodes_h_l594_c3_fccc_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l599_c11_4164]
signal BIN_OP_EQ_uxn_opcodes_h_l599_c11_4164_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l599_c11_4164_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l599_c11_4164_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l599_c7_7c84]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_7c84_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_7c84_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l599_c7_7c84]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_7c84_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_7c84_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l599_c7_7c84]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_7c84_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_7c84_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l599_c7_7c84]
signal result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_7c84_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_7c84_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l599_c7_7c84]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_7c84_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_7c84_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l599_c7_7c84]
signal result_pc_MUX_uxn_opcodes_h_l599_c7_7c84_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l599_c7_7c84_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l599_c7_7c84]
signal result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_7c84_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_7c84_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l599_c7_7c84]
signal t16_MUX_uxn_opcodes_h_l599_c7_7c84_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l599_c7_7c84_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l602_c11_e8fb]
signal BIN_OP_EQ_uxn_opcodes_h_l602_c11_e8fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l602_c11_e8fb_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l602_c11_e8fb_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l602_c7_d244]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_d244_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_d244_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_d244_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_d244_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l602_c7_d244]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_d244_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_d244_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_d244_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_d244_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l602_c7_d244]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_d244_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_d244_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_d244_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_d244_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l602_c7_d244]
signal result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_d244_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_d244_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_d244_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_d244_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l602_c7_d244]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_d244_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_d244_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_d244_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_d244_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l602_c7_d244]
signal result_pc_MUX_uxn_opcodes_h_l602_c7_d244_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l602_c7_d244_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l602_c7_d244_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l602_c7_d244_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l602_c7_d244]
signal result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_d244_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_d244_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_d244_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_d244_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l602_c7_d244]
signal t16_MUX_uxn_opcodes_h_l602_c7_d244_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l602_c7_d244_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l602_c7_d244_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l602_c7_d244_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l604_c3_70e4]
signal CONST_SL_8_uxn_opcodes_h_l604_c3_70e4_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l604_c3_70e4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l607_c11_733d]
signal BIN_OP_EQ_uxn_opcodes_h_l607_c11_733d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l607_c11_733d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l607_c11_733d_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l607_c7_22eb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_22eb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_22eb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l607_c7_22eb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_22eb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_22eb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l607_c7_22eb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_22eb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_22eb_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l607_c7_22eb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_22eb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_22eb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l607_c7_22eb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_22eb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_22eb_return_output : signed(7 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l607_c7_22eb]
signal result_pc_MUX_uxn_opcodes_h_l607_c7_22eb_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l607_c7_22eb_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l607_c7_22eb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_22eb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_22eb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l607_c7_22eb]
signal t16_MUX_uxn_opcodes_h_l607_c7_22eb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l607_c7_22eb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l610_c11_4bca]
signal BIN_OP_EQ_uxn_opcodes_h_l610_c11_4bca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l610_c11_4bca_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l610_c11_4bca_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l610_c7_b7b5]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_b7b5_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l610_c7_b7b5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l610_c7_b7b5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l610_c7_b7b5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_b7b5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l610_c7_b7b5]
signal result_pc_MUX_uxn_opcodes_h_l610_c7_b7b5_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l610_c7_b7b5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_b7b5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l610_c7_b7b5]
signal t16_MUX_uxn_opcodes_h_l610_c7_b7b5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l611_c3_56db]
signal BIN_OP_OR_uxn_opcodes_h_l611_c3_56db_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l611_c3_56db_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l611_c3_56db_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l614_c32_4a05]
signal BIN_OP_AND_uxn_opcodes_h_l614_c32_4a05_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l614_c32_4a05_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l614_c32_4a05_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l614_c32_8205]
signal BIN_OP_GT_uxn_opcodes_h_l614_c32_8205_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l614_c32_8205_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l614_c32_8205_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l614_c32_1c0e]
signal MUX_uxn_opcodes_h_l614_c32_1c0e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l614_c32_1c0e_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l614_c32_1c0e_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l614_c32_1c0e_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l616_c11_d9a3]
signal BIN_OP_EQ_uxn_opcodes_h_l616_c11_d9a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l616_c11_d9a3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l616_c11_d9a3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l616_c7_ba4f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_ba4f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_ba4f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_ba4f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_ba4f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l616_c7_ba4f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_ba4f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_ba4f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_ba4f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_ba4f_return_output : unsigned(0 downto 0);

-- result_pc_MUX[uxn_opcodes_h_l616_c7_ba4f]
signal result_pc_MUX_uxn_opcodes_h_l616_c7_ba4f_cond : unsigned(0 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l616_c7_ba4f_iftrue : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l616_c7_ba4f_iffalse : unsigned(15 downto 0);
signal result_pc_MUX_uxn_opcodes_h_l616_c7_ba4f_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l616_c7_ba4f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_ba4f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_ba4f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_ba4f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_ba4f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l621_c11_5239]
signal BIN_OP_EQ_uxn_opcodes_h_l621_c11_5239_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l621_c11_5239_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l621_c11_5239_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l621_c7_2393]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_2393_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_2393_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_2393_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_2393_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l621_c7_2393]
signal result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_2393_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_2393_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_2393_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_2393_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_babf( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.pc := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a
BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a_left,
BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a_right,
BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_052f
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_052f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_052f_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_052f_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_052f_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_052f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_1e36
result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_1e36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_1e36_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_1e36_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_1e36
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_1e36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_1e36_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_1e36_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_1e36
result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_1e36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_1e36_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_1e36_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_1e36
result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_1e36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_1e36_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_1e36_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_1e36
result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_1e36 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_1e36_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_1e36_return_output);

-- result_pc_MUX_uxn_opcodes_h_l593_c2_1e36
result_pc_MUX_uxn_opcodes_h_l593_c2_1e36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l593_c2_1e36_cond,
result_pc_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue,
result_pc_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse,
result_pc_MUX_uxn_opcodes_h_l593_c2_1e36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_1e36
result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_1e36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_1e36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_1e36_return_output);

-- t16_MUX_uxn_opcodes_h_l593_c2_1e36
t16_MUX_uxn_opcodes_h_l593_c2_1e36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l593_c2_1e36_cond,
t16_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue,
t16_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse,
t16_MUX_uxn_opcodes_h_l593_c2_1e36_return_output);

-- printf_uxn_opcodes_h_l594_c3_fccc_uxn_opcodes_h_l594_c3_fccc
printf_uxn_opcodes_h_l594_c3_fccc_uxn_opcodes_h_l594_c3_fccc : entity work.printf_uxn_opcodes_h_l594_c3_fccc_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l594_c3_fccc_uxn_opcodes_h_l594_c3_fccc_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l599_c11_4164
BIN_OP_EQ_uxn_opcodes_h_l599_c11_4164 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l599_c11_4164_left,
BIN_OP_EQ_uxn_opcodes_h_l599_c11_4164_right,
BIN_OP_EQ_uxn_opcodes_h_l599_c11_4164_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_7c84
result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_7c84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_7c84_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_7c84_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_7c84
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_7c84 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_7c84_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_7c84_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_7c84
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_7c84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_7c84_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_7c84_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_7c84
result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_7c84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_7c84_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_7c84_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_7c84
result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_7c84 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_7c84_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_7c84_return_output);

-- result_pc_MUX_uxn_opcodes_h_l599_c7_7c84
result_pc_MUX_uxn_opcodes_h_l599_c7_7c84 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l599_c7_7c84_cond,
result_pc_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue,
result_pc_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse,
result_pc_MUX_uxn_opcodes_h_l599_c7_7c84_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_7c84
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_7c84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_7c84_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_7c84_return_output);

-- t16_MUX_uxn_opcodes_h_l599_c7_7c84
t16_MUX_uxn_opcodes_h_l599_c7_7c84 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l599_c7_7c84_cond,
t16_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue,
t16_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse,
t16_MUX_uxn_opcodes_h_l599_c7_7c84_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l602_c11_e8fb
BIN_OP_EQ_uxn_opcodes_h_l602_c11_e8fb : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l602_c11_e8fb_left,
BIN_OP_EQ_uxn_opcodes_h_l602_c11_e8fb_right,
BIN_OP_EQ_uxn_opcodes_h_l602_c11_e8fb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_d244
result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_d244 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_d244_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_d244_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_d244_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_d244_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_d244
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_d244 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_d244_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_d244_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_d244_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_d244_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_d244
result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_d244 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_d244_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_d244_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_d244_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_d244_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_d244
result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_d244 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_d244_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_d244_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_d244_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_d244_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_d244
result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_d244 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_d244_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_d244_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_d244_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_d244_return_output);

-- result_pc_MUX_uxn_opcodes_h_l602_c7_d244
result_pc_MUX_uxn_opcodes_h_l602_c7_d244 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l602_c7_d244_cond,
result_pc_MUX_uxn_opcodes_h_l602_c7_d244_iftrue,
result_pc_MUX_uxn_opcodes_h_l602_c7_d244_iffalse,
result_pc_MUX_uxn_opcodes_h_l602_c7_d244_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_d244
result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_d244 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_d244_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_d244_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_d244_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_d244_return_output);

-- t16_MUX_uxn_opcodes_h_l602_c7_d244
t16_MUX_uxn_opcodes_h_l602_c7_d244 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l602_c7_d244_cond,
t16_MUX_uxn_opcodes_h_l602_c7_d244_iftrue,
t16_MUX_uxn_opcodes_h_l602_c7_d244_iffalse,
t16_MUX_uxn_opcodes_h_l602_c7_d244_return_output);

-- CONST_SL_8_uxn_opcodes_h_l604_c3_70e4
CONST_SL_8_uxn_opcodes_h_l604_c3_70e4 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l604_c3_70e4_x,
CONST_SL_8_uxn_opcodes_h_l604_c3_70e4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l607_c11_733d
BIN_OP_EQ_uxn_opcodes_h_l607_c11_733d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l607_c11_733d_left,
BIN_OP_EQ_uxn_opcodes_h_l607_c11_733d_right,
BIN_OP_EQ_uxn_opcodes_h_l607_c11_733d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_22eb
result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_22eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_22eb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_22eb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_22eb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_22eb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_22eb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_22eb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_22eb
result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_22eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_22eb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_22eb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_22eb
result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_22eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_22eb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_22eb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_22eb
result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_22eb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_22eb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_22eb_return_output);

-- result_pc_MUX_uxn_opcodes_h_l607_c7_22eb
result_pc_MUX_uxn_opcodes_h_l607_c7_22eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l607_c7_22eb_cond,
result_pc_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue,
result_pc_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse,
result_pc_MUX_uxn_opcodes_h_l607_c7_22eb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_22eb
result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_22eb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_22eb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_22eb_return_output);

-- t16_MUX_uxn_opcodes_h_l607_c7_22eb
t16_MUX_uxn_opcodes_h_l607_c7_22eb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l607_c7_22eb_cond,
t16_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue,
t16_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse,
t16_MUX_uxn_opcodes_h_l607_c7_22eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l610_c11_4bca
BIN_OP_EQ_uxn_opcodes_h_l610_c11_4bca : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l610_c11_4bca_left,
BIN_OP_EQ_uxn_opcodes_h_l610_c11_4bca_right,
BIN_OP_EQ_uxn_opcodes_h_l610_c11_4bca_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_b7b5
result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_b7b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_b7b5_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_b7b5
result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_b7b5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_b7b5
result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_b7b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_b7b5
result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_b7b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_b7b5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output);

-- result_pc_MUX_uxn_opcodes_h_l610_c7_b7b5
result_pc_MUX_uxn_opcodes_h_l610_c7_b7b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l610_c7_b7b5_cond,
result_pc_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue,
result_pc_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse,
result_pc_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_b7b5
result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_b7b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_b7b5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output);

-- t16_MUX_uxn_opcodes_h_l610_c7_b7b5
t16_MUX_uxn_opcodes_h_l610_c7_b7b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l610_c7_b7b5_cond,
t16_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue,
t16_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse,
t16_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l611_c3_56db
BIN_OP_OR_uxn_opcodes_h_l611_c3_56db : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l611_c3_56db_left,
BIN_OP_OR_uxn_opcodes_h_l611_c3_56db_right,
BIN_OP_OR_uxn_opcodes_h_l611_c3_56db_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l614_c32_4a05
BIN_OP_AND_uxn_opcodes_h_l614_c32_4a05 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l614_c32_4a05_left,
BIN_OP_AND_uxn_opcodes_h_l614_c32_4a05_right,
BIN_OP_AND_uxn_opcodes_h_l614_c32_4a05_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l614_c32_8205
BIN_OP_GT_uxn_opcodes_h_l614_c32_8205 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l614_c32_8205_left,
BIN_OP_GT_uxn_opcodes_h_l614_c32_8205_right,
BIN_OP_GT_uxn_opcodes_h_l614_c32_8205_return_output);

-- MUX_uxn_opcodes_h_l614_c32_1c0e
MUX_uxn_opcodes_h_l614_c32_1c0e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l614_c32_1c0e_cond,
MUX_uxn_opcodes_h_l614_c32_1c0e_iftrue,
MUX_uxn_opcodes_h_l614_c32_1c0e_iffalse,
MUX_uxn_opcodes_h_l614_c32_1c0e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l616_c11_d9a3
BIN_OP_EQ_uxn_opcodes_h_l616_c11_d9a3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l616_c11_d9a3_left,
BIN_OP_EQ_uxn_opcodes_h_l616_c11_d9a3_right,
BIN_OP_EQ_uxn_opcodes_h_l616_c11_d9a3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_ba4f
result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_ba4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_ba4f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_ba4f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_ba4f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_ba4f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_ba4f
result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_ba4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_ba4f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_ba4f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_ba4f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_ba4f_return_output);

-- result_pc_MUX_uxn_opcodes_h_l616_c7_ba4f
result_pc_MUX_uxn_opcodes_h_l616_c7_ba4f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_pc_MUX_uxn_opcodes_h_l616_c7_ba4f_cond,
result_pc_MUX_uxn_opcodes_h_l616_c7_ba4f_iftrue,
result_pc_MUX_uxn_opcodes_h_l616_c7_ba4f_iffalse,
result_pc_MUX_uxn_opcodes_h_l616_c7_ba4f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_ba4f
result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_ba4f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_ba4f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_ba4f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_ba4f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_ba4f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l621_c11_5239
BIN_OP_EQ_uxn_opcodes_h_l621_c11_5239 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l621_c11_5239_left,
BIN_OP_EQ_uxn_opcodes_h_l621_c11_5239_right,
BIN_OP_EQ_uxn_opcodes_h_l621_c11_5239_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_2393
result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_2393 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_2393_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_2393_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_2393_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_2393_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_2393
result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_2393 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_2393_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_2393_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_2393_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_2393_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_052f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_1e36_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_1e36_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_1e36_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_1e36_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_1e36_return_output,
 result_pc_MUX_uxn_opcodes_h_l593_c2_1e36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_1e36_return_output,
 t16_MUX_uxn_opcodes_h_l593_c2_1e36_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l599_c11_4164_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_7c84_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_7c84_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_7c84_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_7c84_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_7c84_return_output,
 result_pc_MUX_uxn_opcodes_h_l599_c7_7c84_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_7c84_return_output,
 t16_MUX_uxn_opcodes_h_l599_c7_7c84_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l602_c11_e8fb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_d244_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_d244_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_d244_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_d244_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_d244_return_output,
 result_pc_MUX_uxn_opcodes_h_l602_c7_d244_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_d244_return_output,
 t16_MUX_uxn_opcodes_h_l602_c7_d244_return_output,
 CONST_SL_8_uxn_opcodes_h_l604_c3_70e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l607_c11_733d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_22eb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_22eb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_22eb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_22eb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_22eb_return_output,
 result_pc_MUX_uxn_opcodes_h_l607_c7_22eb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_22eb_return_output,
 t16_MUX_uxn_opcodes_h_l607_c7_22eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l610_c11_4bca_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output,
 result_pc_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output,
 t16_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l611_c3_56db_return_output,
 BIN_OP_AND_uxn_opcodes_h_l614_c32_4a05_return_output,
 BIN_OP_GT_uxn_opcodes_h_l614_c32_8205_return_output,
 MUX_uxn_opcodes_h_l614_c32_1c0e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l616_c11_d9a3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_ba4f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_ba4f_return_output,
 result_pc_MUX_uxn_opcodes_h_l616_c7_ba4f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_ba4f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l621_c11_5239_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_2393_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_2393_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_052f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_052f_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_052f_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_052f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_7c84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_1e36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_1e36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l596_c3_bece : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_7c84_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_1e36_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_1e36_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_7c84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_1e36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_1e36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_7c84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_1e36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_1e36_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_7c84_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_1e36_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_1e36_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l599_c7_7c84_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l593_c2_1e36_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l593_c2_1e36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_7c84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_1e36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_1e36_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l599_c7_7c84_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l593_c2_1e36_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l593_c2_1e36_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l594_c3_fccc_uxn_opcodes_h_l594_c3_fccc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_4164_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_4164_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_4164_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_d244_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_7c84_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l600_c3_1a43 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_d244_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_7c84_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_d244_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_7c84_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_d244_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_7c84_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_d244_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_7c84_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l602_c7_d244_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l599_c7_7c84_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_d244_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_7c84_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l602_c7_d244_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l599_c7_7c84_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_e8fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_e8fb_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_e8fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_d244_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_d244_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_22eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_d244_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_d244_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l605_c3_a18b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_d244_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_22eb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_d244_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_d244_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_d244_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_22eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_d244_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_d244_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_d244_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_22eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_d244_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_d244_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_d244_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_22eb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_d244_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l602_c7_d244_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l602_c7_d244_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l607_c7_22eb_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l602_c7_d244_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_d244_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_d244_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_22eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_d244_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l602_c7_d244_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l602_c7_d244_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l607_c7_22eb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l602_c7_d244_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l604_c3_70e4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l604_c3_70e4_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_733d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_733d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_733d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_22eb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l608_c3_a3df : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l607_c7_22eb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_22eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_22eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_22eb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_22eb_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l607_c7_22eb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_22eb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l607_c7_22eb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_4bca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_4bca_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_4bca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_ba4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_b7b5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_ba4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_b7b5_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l616_c7_ba4f_return_output : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l610_c7_b7b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_ba4f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_b7b5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l610_c7_b7b5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l611_c3_56db_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l611_c3_56db_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l611_c3_56db_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l614_c32_1c0e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l614_c32_1c0e_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l614_c32_1c0e_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l614_c32_4a05_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l614_c32_4a05_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l614_c32_4a05_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l614_c32_8205_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l614_c32_8205_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l614_c32_8205_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l614_c32_1c0e_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_d9a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_d9a3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_d9a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_ba4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_ba4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_ba4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_ba4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_ba4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_2393_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_ba4f_cond : unsigned(0 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l616_c7_ba4f_iftrue : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l616_c7_ba4f_iffalse : unsigned(15 downto 0);
 variable VAR_result_pc_MUX_uxn_opcodes_h_l616_c7_ba4f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_ba4f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_ba4f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_2393_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_ba4f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_5239_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_5239_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_5239_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_2393_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_2393_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_2393_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_2393_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_2393_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_2393_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l607_l610_l593_l621_l599_l602_DUPLICATE_ad4e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l607_l593_l616_l599_l602_DUPLICATE_bccc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l607_l610_l593_l599_l602_DUPLICATE_052d_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l607_l610_l593_l616_l599_l602_DUPLICATE_9749_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l610_l607_l602_l599_DUPLICATE_9d00_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l607_l610_l616_l621_l599_l602_DUPLICATE_3668_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l603_l611_DUPLICATE_e4ae_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_babf_uxn_opcodes_h_l626_l589_DUPLICATE_d904_return_output : opcode_result_t;
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
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l600_c3_1a43 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l600_c3_1a43;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_4164_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_e8fb_right := to_unsigned(2, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l614_c32_4a05_right := to_unsigned(128, 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l614_c32_8205_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_052f_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l596_c3_bece := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l596_c3_bece;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l605_c3_a18b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_d244_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l605_c3_a18b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a_right := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_2393_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l614_c32_1c0e_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_ba4f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_d9a3_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_5239_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l608_c3_a3df := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l608_c3_a3df;
     VAR_MUX_uxn_opcodes_h_l614_c32_1c0e_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_4bca_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_733d_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_ba4f_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_2393_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_052f_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l614_c32_4a05_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_4164_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_e8fb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_733d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_4bca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_d9a3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_5239_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l611_c3_56db_left := t16;
     VAR_result_pc_MUX_uxn_opcodes_h_l616_c7_ba4f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse := t16;
     -- CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l607_l610_l593_l616_l599_l602_DUPLICATE_9749 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l607_l610_l593_l616_l599_l602_DUPLICATE_9749_return_output := result.pc;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l607_l610_l593_l599_l602_DUPLICATE_052d LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l607_l610_l593_l599_l602_DUPLICATE_052d_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l603_l611_DUPLICATE_e4ae LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l603_l611_DUPLICATE_e4ae_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_AND[uxn_opcodes_h_l614_c32_4a05] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l614_c32_4a05_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l614_c32_4a05_left;
     BIN_OP_AND_uxn_opcodes_h_l614_c32_4a05_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l614_c32_4a05_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l614_c32_4a05_return_output := BIN_OP_AND_uxn_opcodes_h_l614_c32_4a05_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l616_c11_d9a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l616_c11_d9a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_d9a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l616_c11_d9a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_d9a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_d9a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l616_c11_d9a3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l610_l607_l602_l599_DUPLICATE_9d00 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l610_l607_l602_l599_DUPLICATE_9d00_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l602_c11_e8fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l602_c11_e8fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_e8fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l602_c11_e8fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_e8fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_e8fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l602_c11_e8fb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l593_c6_967a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a_left;
     BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a_return_output := BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l607_l593_l616_l599_l602_DUPLICATE_bccc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l607_l593_l616_l599_l602_DUPLICATE_bccc_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l607_l610_l593_l621_l599_l602_DUPLICATE_ad4e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l607_l610_l593_l621_l599_l602_DUPLICATE_ad4e_return_output := result.is_pc_updated;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l607_c7_22eb] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l607_c7_22eb_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l621_c11_5239] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l621_c11_5239_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_5239_left;
     BIN_OP_EQ_uxn_opcodes_h_l621_c11_5239_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_5239_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_5239_return_output := BIN_OP_EQ_uxn_opcodes_h_l621_c11_5239_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l599_c11_4164] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l599_c11_4164_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_4164_left;
     BIN_OP_EQ_uxn_opcodes_h_l599_c11_4164_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_4164_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_4164_return_output := BIN_OP_EQ_uxn_opcodes_h_l599_c11_4164_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l607_c11_733d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l607_c11_733d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_733d_left;
     BIN_OP_EQ_uxn_opcodes_h_l607_c11_733d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_733d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_733d_return_output := BIN_OP_EQ_uxn_opcodes_h_l607_c11_733d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l607_l610_l616_l621_l599_l602_DUPLICATE_3668 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l607_l610_l616_l621_l599_l602_DUPLICATE_3668_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l610_c11_4bca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l610_c11_4bca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_4bca_left;
     BIN_OP_EQ_uxn_opcodes_h_l610_c11_4bca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_4bca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_4bca_return_output := BIN_OP_EQ_uxn_opcodes_h_l610_c11_4bca_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l614_c32_8205_left := VAR_BIN_OP_AND_uxn_opcodes_h_l614_c32_4a05_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_052f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_1e36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_1e36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_1e36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_1e36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l593_c2_1e36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_1e36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_1e36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l593_c2_1e36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l593_c6_967a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_7c84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_4164_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_7c84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_4164_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_7c84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_4164_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_7c84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_4164_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l599_c7_7c84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_4164_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_7c84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_4164_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_7c84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_4164_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l599_c7_7c84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l599_c11_4164_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_d244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_e8fb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_d244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_e8fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_d244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_e8fb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_d244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_e8fb_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l602_c7_d244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_e8fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_d244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_e8fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_d244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_e8fb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l602_c7_d244_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l602_c11_e8fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_22eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_733d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_22eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_733d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_22eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_733d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_22eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_733d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l607_c7_22eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_733d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_22eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_733d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_22eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_733d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l607_c7_22eb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l607_c11_733d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_b7b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_4bca_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_b7b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_4bca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_4bca_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_b7b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_4bca_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l610_c7_b7b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_4bca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_4bca_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l610_c7_b7b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l610_c11_4bca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_ba4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_d9a3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_ba4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_d9a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_ba4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_d9a3_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l616_c7_ba4f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l616_c11_d9a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_2393_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_5239_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_2393_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l621_c11_5239_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l611_c3_56db_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l603_l611_DUPLICATE_e4ae_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l604_c3_70e4_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l603_l611_DUPLICATE_e4ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l607_l610_l593_l599_l602_DUPLICATE_052d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l607_l610_l593_l599_l602_DUPLICATE_052d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_d244_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l607_l610_l593_l599_l602_DUPLICATE_052d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l607_l610_l593_l599_l602_DUPLICATE_052d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l607_l610_l593_l599_l602_DUPLICATE_052d_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l607_l610_l593_l616_l599_l602_DUPLICATE_9749_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l607_l610_l593_l616_l599_l602_DUPLICATE_9749_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l602_c7_d244_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l607_l610_l593_l616_l599_l602_DUPLICATE_9749_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l607_l610_l593_l616_l599_l602_DUPLICATE_9749_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l607_l610_l593_l616_l599_l602_DUPLICATE_9749_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l616_c7_ba4f_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_pc_d41d_uxn_opcodes_h_l607_l610_l593_l616_l599_l602_DUPLICATE_9749_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l607_l610_l616_l621_l599_l602_DUPLICATE_3668_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_d244_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l607_l610_l616_l621_l599_l602_DUPLICATE_3668_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l607_l610_l616_l621_l599_l602_DUPLICATE_3668_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l607_l610_l616_l621_l599_l602_DUPLICATE_3668_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_ba4f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l607_l610_l616_l621_l599_l602_DUPLICATE_3668_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_2393_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l607_l610_l616_l621_l599_l602_DUPLICATE_3668_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l607_l610_l593_l621_l599_l602_DUPLICATE_ad4e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l607_l610_l593_l621_l599_l602_DUPLICATE_ad4e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_d244_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l607_l610_l593_l621_l599_l602_DUPLICATE_ad4e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l607_l610_l593_l621_l599_l602_DUPLICATE_ad4e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l607_l610_l593_l621_l599_l602_DUPLICATE_ad4e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_2393_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l607_l610_l593_l621_l599_l602_DUPLICATE_ad4e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l607_l593_l616_l599_l602_DUPLICATE_bccc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l607_l593_l616_l599_l602_DUPLICATE_bccc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_d244_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l607_l593_l616_l599_l602_DUPLICATE_bccc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l607_l593_l616_l599_l602_DUPLICATE_bccc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_ba4f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l607_l593_l616_l599_l602_DUPLICATE_bccc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l610_l607_l602_l599_DUPLICATE_9d00_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_d244_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l610_l607_l602_l599_DUPLICATE_9d00_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l610_l607_l602_l599_DUPLICATE_9d00_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l610_l607_l602_l599_DUPLICATE_9d00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l607_c7_22eb_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l593_c1_052f] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_052f_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_052f_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_052f_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_052f_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_052f_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_052f_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_052f_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_052f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l607_c7_22eb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_22eb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_22eb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_22eb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_22eb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l616_c7_ba4f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_ba4f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_ba4f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_ba4f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_ba4f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_ba4f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_ba4f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_ba4f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_ba4f_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l604_c3_70e4] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l604_c3_70e4_x <= VAR_CONST_SL_8_uxn_opcodes_h_l604_c3_70e4_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l604_c3_70e4_return_output := CONST_SL_8_uxn_opcodes_h_l604_c3_70e4_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l616_c7_ba4f] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l616_c7_ba4f_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l616_c7_ba4f_cond;
     result_pc_MUX_uxn_opcodes_h_l616_c7_ba4f_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l616_c7_ba4f_iftrue;
     result_pc_MUX_uxn_opcodes_h_l616_c7_ba4f_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l616_c7_ba4f_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l616_c7_ba4f_return_output := result_pc_MUX_uxn_opcodes_h_l616_c7_ba4f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l621_c7_2393] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_2393_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_2393_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_2393_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_2393_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_2393_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_2393_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_2393_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_2393_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l611_c3_56db] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l611_c3_56db_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l611_c3_56db_left;
     BIN_OP_OR_uxn_opcodes_h_l611_c3_56db_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l611_c3_56db_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l611_c3_56db_return_output := BIN_OP_OR_uxn_opcodes_h_l611_c3_56db_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l614_c32_8205] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l614_c32_8205_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l614_c32_8205_left;
     BIN_OP_GT_uxn_opcodes_h_l614_c32_8205_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l614_c32_8205_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l614_c32_8205_return_output := BIN_OP_GT_uxn_opcodes_h_l614_c32_8205_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l610_c7_b7b5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_b7b5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_b7b5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l621_c7_2393] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_2393_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_2393_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_2393_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_2393_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_2393_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_2393_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_2393_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_2393_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l614_c32_1c0e_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l614_c32_8205_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l611_c3_56db_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l602_c7_d244_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l604_c3_70e4_return_output;
     VAR_printf_uxn_opcodes_h_l594_c3_fccc_uxn_opcodes_h_l594_c3_fccc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l593_c1_052f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_ba4f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l621_c7_2393_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_ba4f_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l621_c7_2393_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l616_c7_ba4f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l616_c7_ba4f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_d244_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l607_c7_22eb_return_output;
     -- printf_uxn_opcodes_h_l594_c3_fccc[uxn_opcodes_h_l594_c3_fccc] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l594_c3_fccc_uxn_opcodes_h_l594_c3_fccc_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l594_c3_fccc_uxn_opcodes_h_l594_c3_fccc_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l607_c7_22eb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_22eb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_22eb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_22eb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_22eb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l602_c7_d244] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_d244_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_d244_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_d244_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_d244_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_d244_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_d244_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_d244_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_d244_return_output;

     -- MUX[uxn_opcodes_h_l614_c32_1c0e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l614_c32_1c0e_cond <= VAR_MUX_uxn_opcodes_h_l614_c32_1c0e_cond;
     MUX_uxn_opcodes_h_l614_c32_1c0e_iftrue <= VAR_MUX_uxn_opcodes_h_l614_c32_1c0e_iftrue;
     MUX_uxn_opcodes_h_l614_c32_1c0e_iffalse <= VAR_MUX_uxn_opcodes_h_l614_c32_1c0e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l614_c32_1c0e_return_output := MUX_uxn_opcodes_h_l614_c32_1c0e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l610_c7_b7b5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l616_c7_ba4f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_ba4f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_ba4f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_ba4f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_ba4f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_ba4f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_ba4f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_ba4f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_ba4f_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l610_c7_b7b5] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l610_c7_b7b5_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l610_c7_b7b5_cond;
     result_pc_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue;
     result_pc_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output := result_pc_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output;

     -- t16_MUX[uxn_opcodes_h_l610_c7_b7b5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l610_c7_b7b5_cond <= VAR_t16_MUX_uxn_opcodes_h_l610_c7_b7b5_cond;
     t16_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue;
     t16_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output := t16_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l616_c7_ba4f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_ba4f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_ba4f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_ba4f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_ba4f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_ba4f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_ba4f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_ba4f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_ba4f_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue := VAR_MUX_uxn_opcodes_h_l614_c32_1c0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l616_c7_ba4f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l616_c7_ba4f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_d244_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l607_c7_22eb_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l602_c7_d244_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l599_c7_7c84] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_7c84_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_7c84_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_7c84_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_7c84_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l607_c7_22eb] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l607_c7_22eb_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l607_c7_22eb_cond;
     result_pc_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue;
     result_pc_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l607_c7_22eb_return_output := result_pc_MUX_uxn_opcodes_h_l607_c7_22eb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l602_c7_d244] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_d244_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_d244_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_d244_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_d244_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_d244_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_d244_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_d244_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_d244_return_output;

     -- t16_MUX[uxn_opcodes_h_l607_c7_22eb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l607_c7_22eb_cond <= VAR_t16_MUX_uxn_opcodes_h_l607_c7_22eb_cond;
     t16_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue;
     t16_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l607_c7_22eb_return_output := t16_MUX_uxn_opcodes_h_l607_c7_22eb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l610_c7_b7b5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l610_c7_b7b5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_b7b5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_b7b5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l610_c7_b7b5] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_b7b5_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_b7b5_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_b7b5_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_b7b5_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l607_c7_22eb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_22eb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_22eb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_22eb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_22eb_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_d244_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l607_c7_22eb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l602_c7_d244_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l602_c7_d244_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l607_c7_22eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l610_c7_b7b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l599_c7_7c84_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l602_c7_d244_iffalse := VAR_t16_MUX_uxn_opcodes_h_l607_c7_22eb_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l607_c7_22eb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_22eb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_22eb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_22eb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_22eb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l593_c2_1e36] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_1e36_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_1e36_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_1e36_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_1e36_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l599_c7_7c84] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_7c84_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_7c84_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_7c84_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_7c84_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l607_c7_22eb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_22eb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_22eb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_22eb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_22eb_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l602_c7_d244] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l602_c7_d244_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l602_c7_d244_cond;
     result_pc_MUX_uxn_opcodes_h_l602_c7_d244_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l602_c7_d244_iftrue;
     result_pc_MUX_uxn_opcodes_h_l602_c7_d244_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l602_c7_d244_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l602_c7_d244_return_output := result_pc_MUX_uxn_opcodes_h_l602_c7_d244_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l607_c7_22eb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_22eb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_22eb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_22eb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_22eb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_22eb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_22eb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l602_c7_d244] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_d244_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_d244_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_d244_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_d244_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_d244_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_d244_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_d244_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_d244_return_output;

     -- t16_MUX[uxn_opcodes_h_l602_c7_d244] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l602_c7_d244_cond <= VAR_t16_MUX_uxn_opcodes_h_l602_c7_d244_cond;
     t16_MUX_uxn_opcodes_h_l602_c7_d244_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l602_c7_d244_iftrue;
     t16_MUX_uxn_opcodes_h_l602_c7_d244_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l602_c7_d244_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l602_c7_d244_return_output := t16_MUX_uxn_opcodes_h_l602_c7_d244_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_d244_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l607_c7_22eb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_d244_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l607_c7_22eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l602_c7_d244_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l599_c7_7c84_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l602_c7_d244_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_d244_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l607_c7_22eb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse := VAR_t16_MUX_uxn_opcodes_h_l602_c7_d244_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l602_c7_d244] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_d244_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_d244_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_d244_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_d244_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_d244_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_d244_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_d244_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_d244_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l602_c7_d244] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_d244_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_d244_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_d244_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_d244_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_d244_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_d244_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_d244_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_d244_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l599_c7_7c84] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l599_c7_7c84_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l599_c7_7c84_cond;
     result_pc_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue;
     result_pc_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l599_c7_7c84_return_output := result_pc_MUX_uxn_opcodes_h_l599_c7_7c84_return_output;

     -- t16_MUX[uxn_opcodes_h_l599_c7_7c84] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l599_c7_7c84_cond <= VAR_t16_MUX_uxn_opcodes_h_l599_c7_7c84_cond;
     t16_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue;
     t16_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l599_c7_7c84_return_output := t16_MUX_uxn_opcodes_h_l599_c7_7c84_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l599_c7_7c84] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_7c84_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_7c84_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_7c84_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_7c84_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l593_c2_1e36] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_1e36_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_1e36_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_1e36_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_1e36_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l602_c7_d244] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_d244_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_d244_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_d244_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_d244_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_d244_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_d244_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_d244_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_d244_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l602_c7_d244_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l602_c7_d244_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l599_c7_7c84_return_output;
     VAR_result_pc_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse := VAR_result_pc_MUX_uxn_opcodes_h_l599_c7_7c84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l602_c7_d244_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse := VAR_t16_MUX_uxn_opcodes_h_l599_c7_7c84_return_output;
     -- t16_MUX[uxn_opcodes_h_l593_c2_1e36] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l593_c2_1e36_cond <= VAR_t16_MUX_uxn_opcodes_h_l593_c2_1e36_cond;
     t16_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue;
     t16_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l593_c2_1e36_return_output := t16_MUX_uxn_opcodes_h_l593_c2_1e36_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l599_c7_7c84] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_7c84_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_7c84_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_7c84_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_7c84_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l593_c2_1e36] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_1e36_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_1e36_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_1e36_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_1e36_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l599_c7_7c84] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_7c84_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_7c84_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_7c84_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_7c84_return_output;

     -- result_pc_MUX[uxn_opcodes_h_l593_c2_1e36] LATENCY=0
     -- Inputs
     result_pc_MUX_uxn_opcodes_h_l593_c2_1e36_cond <= VAR_result_pc_MUX_uxn_opcodes_h_l593_c2_1e36_cond;
     result_pc_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue <= VAR_result_pc_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue;
     result_pc_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse <= VAR_result_pc_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse;
     -- Outputs
     VAR_result_pc_MUX_uxn_opcodes_h_l593_c2_1e36_return_output := result_pc_MUX_uxn_opcodes_h_l593_c2_1e36_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l599_c7_7c84] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_7c84_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_7c84_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_7c84_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_7c84_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_7c84_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_7c84_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l599_c7_7c84_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l599_c7_7c84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l599_c7_7c84_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l593_c2_1e36_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l593_c2_1e36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_1e36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_1e36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_1e36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_1e36_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l593_c2_1e36] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_1e36_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_1e36_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_1e36_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_1e36_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l593_c2_1e36] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_1e36_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_1e36_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_1e36_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_1e36_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_1e36_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_1e36_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_babf_uxn_opcodes_h_l626_l589_DUPLICATE_d904 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_babf_uxn_opcodes_h_l626_l589_DUPLICATE_d904_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_babf(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l593_c2_1e36_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l593_c2_1e36_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l593_c2_1e36_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l593_c2_1e36_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l593_c2_1e36_return_output,
     VAR_result_pc_MUX_uxn_opcodes_h_l593_c2_1e36_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l593_c2_1e36_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_babf_uxn_opcodes_h_l626_l589_DUPLICATE_d904_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_babf_uxn_opcodes_h_l626_l589_DUPLICATE_d904_return_output;
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
