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
-- Submodules: 70
entity inc2_0CLK_5110df32 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end inc2_0CLK_5110df32;
architecture arch of inc2_0CLK_5110df32 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1468_c6_38f9]
signal BIN_OP_EQ_uxn_opcodes_h_l1468_c6_38f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1468_c6_38f9_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1468_c6_38f9_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1468_c2_869f]
signal tmp16_MUX_uxn_opcodes_h_l1468_c2_869f_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1468_c2_869f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1468_c2_869f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_869f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_869f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1468_c2_869f]
signal result_stack_value_MUX_uxn_opcodes_h_l1468_c2_869f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1468_c2_869f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1468_c2_869f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_869f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_869f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1468_c2_869f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_869f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_869f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1468_c2_869f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_869f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_869f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1468_c2_869f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_869f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_869f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1468_c2_869f]
signal t16_MUX_uxn_opcodes_h_l1468_c2_869f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1468_c2_869f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1473_c11_5a48]
signal BIN_OP_EQ_uxn_opcodes_h_l1473_c11_5a48_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1473_c11_5a48_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1473_c11_5a48_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1473_c7_afc3]
signal tmp16_MUX_uxn_opcodes_h_l1473_c7_afc3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1473_c7_afc3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1473_c7_afc3]
signal result_stack_value_MUX_uxn_opcodes_h_l1473_c7_afc3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1473_c7_afc3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_afc3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1473_c7_afc3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1473_c7_afc3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_afc3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1473_c7_afc3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_afc3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1473_c7_afc3]
signal t16_MUX_uxn_opcodes_h_l1473_c7_afc3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1476_c11_e130]
signal BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e130_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e130_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e130_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1476_c7_21fb]
signal tmp16_MUX_uxn_opcodes_h_l1476_c7_21fb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1476_c7_21fb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1476_c7_21fb]
signal result_stack_value_MUX_uxn_opcodes_h_l1476_c7_21fb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1476_c7_21fb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_21fb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1476_c7_21fb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1476_c7_21fb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_21fb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1476_c7_21fb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_21fb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1476_c7_21fb]
signal t16_MUX_uxn_opcodes_h_l1476_c7_21fb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1478_c3_cfc4]
signal CONST_SL_8_uxn_opcodes_h_l1478_c3_cfc4_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1478_c3_cfc4_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1481_c11_1e2b]
signal BIN_OP_EQ_uxn_opcodes_h_l1481_c11_1e2b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1481_c11_1e2b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1481_c11_1e2b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1481_c7_12c1]
signal tmp16_MUX_uxn_opcodes_h_l1481_c7_12c1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1481_c7_12c1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1481_c7_12c1]
signal result_stack_value_MUX_uxn_opcodes_h_l1481_c7_12c1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1481_c7_12c1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_12c1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1481_c7_12c1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1481_c7_12c1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_12c1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1481_c7_12c1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_12c1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1481_c7_12c1]
signal t16_MUX_uxn_opcodes_h_l1481_c7_12c1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1484_c11_2cae]
signal BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2cae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2cae_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2cae_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1484_c7_3531]
signal tmp16_MUX_uxn_opcodes_h_l1484_c7_3531_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1484_c7_3531_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1484_c7_3531]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_3531_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_3531_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1484_c7_3531]
signal result_stack_value_MUX_uxn_opcodes_h_l1484_c7_3531_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1484_c7_3531_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1484_c7_3531]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_3531_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_3531_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1484_c7_3531]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_3531_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_3531_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1484_c7_3531]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_3531_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_3531_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1484_c7_3531]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_3531_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_3531_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1484_c7_3531]
signal t16_MUX_uxn_opcodes_h_l1484_c7_3531_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1484_c7_3531_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1485_c3_9625]
signal BIN_OP_OR_uxn_opcodes_h_l1485_c3_9625_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1485_c3_9625_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1485_c3_9625_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1486_c11_0313]
signal BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_0313_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_0313_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_0313_return_output : unsigned(16 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1488_c32_9a11]
signal BIN_OP_AND_uxn_opcodes_h_l1488_c32_9a11_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1488_c32_9a11_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1488_c32_9a11_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1488_c32_df2a]
signal BIN_OP_GT_uxn_opcodes_h_l1488_c32_df2a_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1488_c32_df2a_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1488_c32_df2a_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1488_c32_ed47]
signal MUX_uxn_opcodes_h_l1488_c32_ed47_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1488_c32_ed47_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1488_c32_ed47_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1488_c32_ed47_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1490_c11_6061]
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_6061_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_6061_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1490_c11_6061_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1490_c7_85cd]
signal result_stack_value_MUX_uxn_opcodes_h_l1490_c7_85cd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1490_c7_85cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_85cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1490_c7_85cd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_85cd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1490_c7_85cd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_85cd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1490_c7_85cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_85cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1496_c11_7185]
signal BIN_OP_EQ_uxn_opcodes_h_l1496_c11_7185_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1496_c11_7185_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1496_c11_7185_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1496_c7_32e4]
signal result_stack_value_MUX_uxn_opcodes_h_l1496_c7_32e4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1496_c7_32e4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1496_c7_32e4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1496_c7_32e4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1496_c7_32e4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_32e4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_32e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_32e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_32e4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1496_c7_32e4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_32e4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_32e4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_32e4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_32e4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1496_c7_32e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_32e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_32e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_32e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_32e4_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1498_c34_c717]
signal CONST_SR_8_uxn_opcodes_h_l1498_c34_c717_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1498_c34_c717_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1500_c11_e4a7]
signal BIN_OP_EQ_uxn_opcodes_h_l1500_c11_e4a7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1500_c11_e4a7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1500_c11_e4a7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1500_c7_108f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_108f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_108f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_108f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_108f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1500_c7_108f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_108f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_108f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_108f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_108f_return_output : unsigned(0 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5( ref_toks_0 : opcode_result_t;
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
      base.stack_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1468_c6_38f9
BIN_OP_EQ_uxn_opcodes_h_l1468_c6_38f9 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1468_c6_38f9_left,
BIN_OP_EQ_uxn_opcodes_h_l1468_c6_38f9_right,
BIN_OP_EQ_uxn_opcodes_h_l1468_c6_38f9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1468_c2_869f
tmp16_MUX_uxn_opcodes_h_l1468_c2_869f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1468_c2_869f_cond,
tmp16_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue,
tmp16_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse,
tmp16_MUX_uxn_opcodes_h_l1468_c2_869f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_869f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_869f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_869f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_869f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1468_c2_869f
result_stack_value_MUX_uxn_opcodes_h_l1468_c2_869f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1468_c2_869f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1468_c2_869f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_869f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_869f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_869f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_869f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_869f
result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_869f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_869f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_869f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_869f
result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_869f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_869f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_869f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_869f
result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_869f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_869f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_869f_return_output);

-- t16_MUX_uxn_opcodes_h_l1468_c2_869f
t16_MUX_uxn_opcodes_h_l1468_c2_869f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1468_c2_869f_cond,
t16_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue,
t16_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse,
t16_MUX_uxn_opcodes_h_l1468_c2_869f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1473_c11_5a48
BIN_OP_EQ_uxn_opcodes_h_l1473_c11_5a48 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1473_c11_5a48_left,
BIN_OP_EQ_uxn_opcodes_h_l1473_c11_5a48_right,
BIN_OP_EQ_uxn_opcodes_h_l1473_c11_5a48_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1473_c7_afc3
tmp16_MUX_uxn_opcodes_h_l1473_c7_afc3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1473_c7_afc3_cond,
tmp16_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue,
tmp16_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse,
tmp16_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_afc3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_afc3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1473_c7_afc3
result_stack_value_MUX_uxn_opcodes_h_l1473_c7_afc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1473_c7_afc3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_afc3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_afc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_afc3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_afc3
result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_afc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_afc3
result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_afc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_afc3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_afc3
result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_afc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_afc3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output);

-- t16_MUX_uxn_opcodes_h_l1473_c7_afc3
t16_MUX_uxn_opcodes_h_l1473_c7_afc3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1473_c7_afc3_cond,
t16_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue,
t16_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse,
t16_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e130
BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e130 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e130_left,
BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e130_right,
BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e130_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1476_c7_21fb
tmp16_MUX_uxn_opcodes_h_l1476_c7_21fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1476_c7_21fb_cond,
tmp16_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue,
tmp16_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse,
tmp16_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_21fb
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_21fb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1476_c7_21fb
result_stack_value_MUX_uxn_opcodes_h_l1476_c7_21fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1476_c7_21fb_cond,
result_stack_value_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_21fb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_21fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_21fb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_21fb
result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_21fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_21fb
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_21fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_21fb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_21fb
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_21fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_21fb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output);

-- t16_MUX_uxn_opcodes_h_l1476_c7_21fb
t16_MUX_uxn_opcodes_h_l1476_c7_21fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1476_c7_21fb_cond,
t16_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue,
t16_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse,
t16_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1478_c3_cfc4
CONST_SL_8_uxn_opcodes_h_l1478_c3_cfc4 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1478_c3_cfc4_x,
CONST_SL_8_uxn_opcodes_h_l1478_c3_cfc4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1481_c11_1e2b
BIN_OP_EQ_uxn_opcodes_h_l1481_c11_1e2b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1481_c11_1e2b_left,
BIN_OP_EQ_uxn_opcodes_h_l1481_c11_1e2b_right,
BIN_OP_EQ_uxn_opcodes_h_l1481_c11_1e2b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1481_c7_12c1
tmp16_MUX_uxn_opcodes_h_l1481_c7_12c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1481_c7_12c1_cond,
tmp16_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue,
tmp16_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse,
tmp16_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_12c1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_12c1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1481_c7_12c1
result_stack_value_MUX_uxn_opcodes_h_l1481_c7_12c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1481_c7_12c1_cond,
result_stack_value_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_12c1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_12c1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_12c1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_12c1
result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_12c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_12c1
result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_12c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_12c1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_12c1
result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_12c1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_12c1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output);

-- t16_MUX_uxn_opcodes_h_l1481_c7_12c1
t16_MUX_uxn_opcodes_h_l1481_c7_12c1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1481_c7_12c1_cond,
t16_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue,
t16_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse,
t16_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2cae
BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2cae : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2cae_left,
BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2cae_right,
BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2cae_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1484_c7_3531
tmp16_MUX_uxn_opcodes_h_l1484_c7_3531 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1484_c7_3531_cond,
tmp16_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue,
tmp16_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse,
tmp16_MUX_uxn_opcodes_h_l1484_c7_3531_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_3531
result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_3531 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_3531_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_3531_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1484_c7_3531
result_stack_value_MUX_uxn_opcodes_h_l1484_c7_3531 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1484_c7_3531_cond,
result_stack_value_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1484_c7_3531_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_3531
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_3531 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_3531_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_3531_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_3531
result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_3531 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_3531_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_3531_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_3531
result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_3531 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_3531_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_3531_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_3531
result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_3531 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_3531_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_3531_return_output);

-- t16_MUX_uxn_opcodes_h_l1484_c7_3531
t16_MUX_uxn_opcodes_h_l1484_c7_3531 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1484_c7_3531_cond,
t16_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue,
t16_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse,
t16_MUX_uxn_opcodes_h_l1484_c7_3531_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1485_c3_9625
BIN_OP_OR_uxn_opcodes_h_l1485_c3_9625 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1485_c3_9625_left,
BIN_OP_OR_uxn_opcodes_h_l1485_c3_9625_right,
BIN_OP_OR_uxn_opcodes_h_l1485_c3_9625_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_0313
BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_0313 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_0313_left,
BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_0313_right,
BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_0313_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1488_c32_9a11
BIN_OP_AND_uxn_opcodes_h_l1488_c32_9a11 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1488_c32_9a11_left,
BIN_OP_AND_uxn_opcodes_h_l1488_c32_9a11_right,
BIN_OP_AND_uxn_opcodes_h_l1488_c32_9a11_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1488_c32_df2a
BIN_OP_GT_uxn_opcodes_h_l1488_c32_df2a : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1488_c32_df2a_left,
BIN_OP_GT_uxn_opcodes_h_l1488_c32_df2a_right,
BIN_OP_GT_uxn_opcodes_h_l1488_c32_df2a_return_output);

-- MUX_uxn_opcodes_h_l1488_c32_ed47
MUX_uxn_opcodes_h_l1488_c32_ed47 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1488_c32_ed47_cond,
MUX_uxn_opcodes_h_l1488_c32_ed47_iftrue,
MUX_uxn_opcodes_h_l1488_c32_ed47_iffalse,
MUX_uxn_opcodes_h_l1488_c32_ed47_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1490_c11_6061
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_6061 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_6061_left,
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_6061_right,
BIN_OP_EQ_uxn_opcodes_h_l1490_c11_6061_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1490_c7_85cd
result_stack_value_MUX_uxn_opcodes_h_l1490_c7_85cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1490_c7_85cd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_85cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_85cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_85cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_85cd
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_85cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_85cd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_85cd
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_85cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_85cd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_85cd
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_85cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_85cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1496_c11_7185
BIN_OP_EQ_uxn_opcodes_h_l1496_c11_7185 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1496_c11_7185_left,
BIN_OP_EQ_uxn_opcodes_h_l1496_c11_7185_right,
BIN_OP_EQ_uxn_opcodes_h_l1496_c11_7185_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1496_c7_32e4
result_stack_value_MUX_uxn_opcodes_h_l1496_c7_32e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1496_c7_32e4_cond,
result_stack_value_MUX_uxn_opcodes_h_l1496_c7_32e4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1496_c7_32e4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1496_c7_32e4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_32e4
result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_32e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_32e4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_32e4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_32e4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_32e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_32e4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_32e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_32e4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_32e4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_32e4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_32e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_32e4
result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_32e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_32e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_32e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_32e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_32e4_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1498_c34_c717
CONST_SR_8_uxn_opcodes_h_l1498_c34_c717 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1498_c34_c717_x,
CONST_SR_8_uxn_opcodes_h_l1498_c34_c717_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1500_c11_e4a7
BIN_OP_EQ_uxn_opcodes_h_l1500_c11_e4a7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1500_c11_e4a7_left,
BIN_OP_EQ_uxn_opcodes_h_l1500_c11_e4a7_right,
BIN_OP_EQ_uxn_opcodes_h_l1500_c11_e4a7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_108f
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_108f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_108f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_108f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_108f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_108f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_108f
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_108f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_108f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_108f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_108f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_108f_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1468_c6_38f9_return_output,
 tmp16_MUX_uxn_opcodes_h_l1468_c2_869f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_869f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1468_c2_869f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_869f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_869f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_869f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_869f_return_output,
 t16_MUX_uxn_opcodes_h_l1468_c2_869f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1473_c11_5a48_return_output,
 tmp16_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output,
 t16_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e130_return_output,
 tmp16_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output,
 t16_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output,
 CONST_SL_8_uxn_opcodes_h_l1478_c3_cfc4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1481_c11_1e2b_return_output,
 tmp16_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output,
 t16_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2cae_return_output,
 tmp16_MUX_uxn_opcodes_h_l1484_c7_3531_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_3531_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1484_c7_3531_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_3531_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_3531_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_3531_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_3531_return_output,
 t16_MUX_uxn_opcodes_h_l1484_c7_3531_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1485_c3_9625_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_0313_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1488_c32_9a11_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1488_c32_df2a_return_output,
 MUX_uxn_opcodes_h_l1488_c32_ed47_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1490_c11_6061_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1496_c11_7185_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1496_c7_32e4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_32e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_32e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_32e4_return_output,
 CONST_SR_8_uxn_opcodes_h_l1498_c34_c717_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1500_c11_e4a7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_108f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_108f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_38f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_38f9_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_38f9_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1468_c2_869f_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1468_c2_869f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_869f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_869f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c2_869f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c2_869f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1470_c3_8bd4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_869f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_869f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_869f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_869f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_869f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_869f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_869f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_869f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1468_c2_869f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1468_c2_869f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_5a48_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_5a48_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_5a48_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1473_c7_afc3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1473_c7_afc3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1474_c3_0457 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_afc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_afc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_afc3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1473_c7_afc3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e130_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e130_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e130_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1476_c7_21fb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c7_21fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1479_c3_fefa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_21fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_21fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_21fb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1476_c7_21fb_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1478_c3_cfc4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1478_c3_cfc4_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_1e2b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_1e2b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_1e2b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1484_c7_3531_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1481_c7_12c1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_3531_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c7_3531_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1481_c7_12c1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1482_c3_c66f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_3531_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_12c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_3531_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_3531_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_12c1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_3531_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_12c1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1484_c7_3531_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1481_c7_12c1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2cae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2cae_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2cae_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1486_c3_6f2a : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1484_c7_3531_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_3531_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c7_3531_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_3531_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_3531_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_3531_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_3531_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1484_c7_3531_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1485_c3_9625_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1485_c3_9625_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1485_c3_9625_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_0313_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_0313_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_0313_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1488_c32_ed47_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1488_c32_ed47_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1488_c32_ed47_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1488_c32_9a11_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1488_c32_9a11_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1488_c32_9a11_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1488_c32_df2a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1488_c32_df2a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1488_c32_df2a_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1488_c32_ed47_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_6061_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_6061_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_6061_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1496_c7_32e4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_85cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1493_c3_44f2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_32e4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_85cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_85cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_32e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_85cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_32e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_85cd_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1494_c24_18b4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_7185_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_7185_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_7185_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1496_c7_32e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1496_c7_32e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1496_c7_32e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_32e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_32e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_108f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_32e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_32e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1497_c3_9bff : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_32e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_32e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_32e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_32e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_108f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_32e4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1498_c34_c717_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1498_c34_c717_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1498_c24_287a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_e4a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_e4a7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_e4a7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_108f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_108f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_108f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_108f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_108f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_108f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1468_l1476_l1473_l1484_l1481_DUPLICATE_fc3a_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1468_l1476_l1473_l1484_l1496_l1481_DUPLICATE_e07e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1468_l1476_l1490_l1473_l1481_DUPLICATE_9750_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1468_l1476_l1473_l1484_l1500_l1496_l1481_DUPLICATE_99cf_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1476_l1473_l1484_l1500_l1496_l1481_DUPLICATE_5aa3_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1477_l1485_DUPLICATE_9e43_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1484_l1496_DUPLICATE_074a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1505_l1464_DUPLICATE_b8b0_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_e4a7_right := to_unsigned(7, 3);
     VAR_MUX_uxn_opcodes_h_l1488_c32_ed47_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1482_c3_c66f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1482_c3_c66f;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_1e2b_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_7185_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1497_c3_9bff := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_32e4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1497_c3_9bff;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_5a48_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1488_c32_9a11_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_108f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1474_c3_0457 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1474_c3_0457;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1493_c3_44f2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1493_c3_44f2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1470_c3_8bd4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1470_c3_8bd4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_6061_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e130_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2cae_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1488_c32_ed47_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_38f9_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_0313_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1479_c3_fefa := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1479_c3_fefa;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_108f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1488_c32_df2a_right := to_unsigned(0, 1);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l1488_c32_9a11_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_38f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_5a48_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e130_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_1e2b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2cae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_6061_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_7185_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_e4a7_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1485_c3_9625_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1498_c34_c717_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l1498_c34_c717] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1498_c34_c717_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1498_c34_c717_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1498_c34_c717_return_output := CONST_SR_8_uxn_opcodes_h_l1498_c34_c717_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1468_l1476_l1473_l1484_l1500_l1496_l1481_DUPLICATE_99cf LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1468_l1476_l1473_l1484_l1500_l1496_l1481_DUPLICATE_99cf_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1473_c11_5a48] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1473_c11_5a48_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_5a48_left;
     BIN_OP_EQ_uxn_opcodes_h_l1473_c11_5a48_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_5a48_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_5a48_return_output := BIN_OP_EQ_uxn_opcodes_h_l1473_c11_5a48_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1468_c6_38f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1468_c6_38f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_38f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1468_c6_38f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_38f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_38f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1468_c6_38f9_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1488_c32_9a11] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1488_c32_9a11_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1488_c32_9a11_left;
     BIN_OP_AND_uxn_opcodes_h_l1488_c32_9a11_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1488_c32_9a11_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1488_c32_9a11_return_output := BIN_OP_AND_uxn_opcodes_h_l1488_c32_9a11_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1477_l1485_DUPLICATE_9e43 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1477_l1485_DUPLICATE_9e43_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1490_c11_6061] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1490_c11_6061_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_6061_left;
     BIN_OP_EQ_uxn_opcodes_h_l1490_c11_6061_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_6061_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_6061_return_output := BIN_OP_EQ_uxn_opcodes_h_l1490_c11_6061_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1494_c24_18b4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1494_c24_18b4_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1484_l1496_DUPLICATE_074a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1484_l1496_DUPLICATE_074a_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1468_l1476_l1490_l1473_l1481_DUPLICATE_9750 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1468_l1476_l1490_l1473_l1481_DUPLICATE_9750_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1496_c11_7185] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1496_c11_7185_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_7185_left;
     BIN_OP_EQ_uxn_opcodes_h_l1496_c11_7185_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_7185_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_7185_return_output := BIN_OP_EQ_uxn_opcodes_h_l1496_c11_7185_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1476_l1473_l1484_l1500_l1496_l1481_DUPLICATE_5aa3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1476_l1473_l1484_l1500_l1496_l1481_DUPLICATE_5aa3_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1484_c11_2cae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2cae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2cae_left;
     BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2cae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2cae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2cae_return_output := BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2cae_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1468_l1476_l1473_l1484_l1496_l1481_DUPLICATE_e07e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1468_l1476_l1473_l1484_l1496_l1481_DUPLICATE_e07e_return_output := result.stack_value;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1468_l1476_l1473_l1484_l1481_DUPLICATE_fc3a LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1468_l1476_l1473_l1484_l1481_DUPLICATE_fc3a_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1476_c11_e130] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e130_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e130_left;
     BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e130_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e130_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e130_return_output := BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e130_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1500_c11_e4a7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1500_c11_e4a7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_e4a7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1500_c11_e4a7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_e4a7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_e4a7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1500_c11_e4a7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1481_c11_1e2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1481_c11_1e2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_1e2b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1481_c11_1e2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_1e2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_1e2b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1481_c11_1e2b_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1488_c32_df2a_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1488_c32_9a11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_869f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_38f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_869f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_38f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_869f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_38f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_869f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_38f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_869f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_38f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c2_869f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_38f9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1468_c2_869f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_38f9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1468_c2_869f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1468_c6_38f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_afc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_5a48_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_5a48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_afc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_5a48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_5a48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_afc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_5a48_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1473_c7_afc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_5a48_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1473_c7_afc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_5a48_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1473_c7_afc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1473_c11_5a48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_21fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e130_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e130_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_21fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e130_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e130_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_21fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e130_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c7_21fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e130_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1476_c7_21fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e130_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1476_c7_21fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1476_c11_e130_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_12c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_1e2b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_1e2b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_12c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_1e2b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_1e2b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_12c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_1e2b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1481_c7_12c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_1e2b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1481_c7_12c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_1e2b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1481_c7_12c1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1481_c11_1e2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_3531_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2cae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_3531_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2cae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_3531_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2cae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_3531_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2cae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_3531_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2cae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c7_3531_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2cae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1484_c7_3531_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2cae_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1484_c7_3531_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1484_c11_2cae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_85cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_6061_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_85cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_6061_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_85cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_6061_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_85cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_6061_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_85cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1490_c11_6061_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_32e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_7185_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_32e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_7185_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_32e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_7185_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1496_c7_32e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1496_c11_7185_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_108f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_e4a7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_108f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1500_c11_e4a7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1485_c3_9625_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1477_l1485_DUPLICATE_9e43_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1478_c3_cfc4_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1477_l1485_DUPLICATE_9e43_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1494_c24_18b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1468_l1476_l1473_l1484_l1481_DUPLICATE_fc3a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1468_l1476_l1473_l1484_l1481_DUPLICATE_fc3a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1468_l1476_l1473_l1484_l1481_DUPLICATE_fc3a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1468_l1476_l1473_l1484_l1481_DUPLICATE_fc3a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1468_l1476_l1473_l1484_l1481_DUPLICATE_fc3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1476_l1473_l1484_l1500_l1496_l1481_DUPLICATE_5aa3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1476_l1473_l1484_l1500_l1496_l1481_DUPLICATE_5aa3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1476_l1473_l1484_l1500_l1496_l1481_DUPLICATE_5aa3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1476_l1473_l1484_l1500_l1496_l1481_DUPLICATE_5aa3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1476_l1473_l1484_l1500_l1496_l1481_DUPLICATE_5aa3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_32e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1476_l1473_l1484_l1500_l1496_l1481_DUPLICATE_5aa3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_108f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1490_l1476_l1473_l1484_l1500_l1496_l1481_DUPLICATE_5aa3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1468_l1476_l1490_l1473_l1481_DUPLICATE_9750_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1468_l1476_l1490_l1473_l1481_DUPLICATE_9750_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1468_l1476_l1490_l1473_l1481_DUPLICATE_9750_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1468_l1476_l1490_l1473_l1481_DUPLICATE_9750_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1468_l1476_l1490_l1473_l1481_DUPLICATE_9750_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1468_l1476_l1473_l1484_l1500_l1496_l1481_DUPLICATE_99cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1468_l1476_l1473_l1484_l1500_l1496_l1481_DUPLICATE_99cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1468_l1476_l1473_l1484_l1500_l1496_l1481_DUPLICATE_99cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1468_l1476_l1473_l1484_l1500_l1496_l1481_DUPLICATE_99cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1468_l1476_l1473_l1484_l1500_l1496_l1481_DUPLICATE_99cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_32e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1468_l1476_l1473_l1484_l1500_l1496_l1481_DUPLICATE_99cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_108f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1468_l1476_l1473_l1484_l1500_l1496_l1481_DUPLICATE_99cf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1484_l1496_DUPLICATE_074a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_32e4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1484_l1496_DUPLICATE_074a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1468_l1476_l1473_l1484_l1496_l1481_DUPLICATE_e07e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1468_l1476_l1473_l1484_l1496_l1481_DUPLICATE_e07e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1468_l1476_l1473_l1484_l1496_l1481_DUPLICATE_e07e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1468_l1476_l1473_l1484_l1496_l1481_DUPLICATE_e07e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1468_l1476_l1473_l1484_l1496_l1481_DUPLICATE_e07e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1496_c7_32e4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1468_l1476_l1473_l1484_l1496_l1481_DUPLICATE_e07e_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1498_c24_287a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1498_c24_287a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1498_c34_c717_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1500_c7_108f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_108f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_108f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_108f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_108f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_108f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_108f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_108f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_108f_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1488_c32_df2a] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1488_c32_df2a_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1488_c32_df2a_left;
     BIN_OP_GT_uxn_opcodes_h_l1488_c32_df2a_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1488_c32_df2a_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1488_c32_df2a_return_output := BIN_OP_GT_uxn_opcodes_h_l1488_c32_df2a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1496_c7_32e4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_32e4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_32e4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_32e4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_32e4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_32e4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_32e4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_32e4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_32e4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1500_c7_108f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_108f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_108f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_108f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_108f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_108f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_108f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_108f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_108f_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1478_c3_cfc4] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1478_c3_cfc4_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1478_c3_cfc4_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1478_c3_cfc4_return_output := CONST_SL_8_uxn_opcodes_h_l1478_c3_cfc4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1485_c3_9625] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1485_c3_9625_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1485_c3_9625_left;
     BIN_OP_OR_uxn_opcodes_h_l1485_c3_9625_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1485_c3_9625_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1485_c3_9625_return_output := BIN_OP_OR_uxn_opcodes_h_l1485_c3_9625_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1490_c7_85cd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_85cd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_85cd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1488_c32_ed47_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1488_c32_df2a_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_0313_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1485_c3_9625_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1485_c3_9625_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1496_c7_32e4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1498_c24_287a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1478_c3_cfc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_32e4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1500_c7_108f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_32e4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1500_c7_108f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1496_c7_32e4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1496_c7_32e4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_32e4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_32e4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_32e4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_32e4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_32e4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_32e4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_32e4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_32e4_return_output;

     -- t16_MUX[uxn_opcodes_h_l1484_c7_3531] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1484_c7_3531_cond <= VAR_t16_MUX_uxn_opcodes_h_l1484_c7_3531_cond;
     t16_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue;
     t16_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1484_c7_3531_return_output := t16_MUX_uxn_opcodes_h_l1484_c7_3531_return_output;

     -- MUX[uxn_opcodes_h_l1488_c32_ed47] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1488_c32_ed47_cond <= VAR_MUX_uxn_opcodes_h_l1488_c32_ed47_cond;
     MUX_uxn_opcodes_h_l1488_c32_ed47_iftrue <= VAR_MUX_uxn_opcodes_h_l1488_c32_ed47_iftrue;
     MUX_uxn_opcodes_h_l1488_c32_ed47_iffalse <= VAR_MUX_uxn_opcodes_h_l1488_c32_ed47_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1488_c32_ed47_return_output := MUX_uxn_opcodes_h_l1488_c32_ed47_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1486_c11_0313] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_0313_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_0313_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_0313_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_0313_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_0313_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_0313_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1496_c7_32e4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1496_c7_32e4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1496_c7_32e4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1496_c7_32e4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1496_c7_32e4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1496_c7_32e4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1496_c7_32e4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1496_c7_32e4_return_output := result_stack_value_MUX_uxn_opcodes_h_l1496_c7_32e4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1496_c7_32e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_32e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_32e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_32e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_32e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_32e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_32e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_32e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_32e4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1484_c7_3531] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_3531_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_3531_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_3531_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_3531_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1490_c7_85cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_85cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_85cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1486_c3_6f2a := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1486_c11_0313_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue := VAR_MUX_uxn_opcodes_h_l1488_c32_ed47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1496_c7_32e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1484_c7_3531_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1496_c7_32e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1496_c7_32e4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1484_c7_3531_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue := VAR_tmp16_uxn_opcodes_h_l1486_c3_6f2a;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1490_c7_85cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_85cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_85cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1490_c7_85cd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_85cd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_85cd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1481_c7_12c1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1484_c7_3531] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1484_c7_3531_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1484_c7_3531_cond;
     tmp16_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1484_c7_3531_return_output := tmp16_MUX_uxn_opcodes_h_l1484_c7_3531_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1484_c7_3531] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_3531_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_3531_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_3531_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_3531_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1484_c7_3531] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_3531_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_3531_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_3531_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_3531_return_output;

     -- t16_MUX[uxn_opcodes_h_l1481_c7_12c1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1481_c7_12c1_cond <= VAR_t16_MUX_uxn_opcodes_h_l1481_c7_12c1_cond;
     t16_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue;
     t16_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output := t16_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1490_c7_85cd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1490_c7_85cd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_85cd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_85cd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_85cd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1484_c7_3531_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1484_c7_3531_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1490_c7_85cd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1484_c7_3531_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1476_c7_21fb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1481_c7_12c1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_12c1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_12c1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1484_c7_3531] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1484_c7_3531_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c7_3531_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c7_3531_return_output := result_stack_value_MUX_uxn_opcodes_h_l1484_c7_3531_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1484_c7_3531] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_3531_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_3531_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_3531_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_3531_return_output;

     -- t16_MUX[uxn_opcodes_h_l1476_c7_21fb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1476_c7_21fb_cond <= VAR_t16_MUX_uxn_opcodes_h_l1476_c7_21fb_cond;
     t16_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue;
     t16_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output := t16_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1481_c7_12c1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1481_c7_12c1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1481_c7_12c1_cond;
     tmp16_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output := tmp16_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1481_c7_12c1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1484_c7_3531] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_3531_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_3531_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_3531_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_3531_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_3531_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_3531_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1484_c7_3531_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1484_c7_3531_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1484_c7_3531_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1476_c7_21fb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1481_c7_12c1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1481_c7_12c1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1481_c7_12c1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output := result_stack_value_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1481_c7_12c1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_12c1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_12c1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1473_c7_afc3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1473_c7_afc3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1473_c7_afc3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1473_c7_afc3_cond;
     t16_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue;
     t16_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output := t16_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1481_c7_12c1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_12c1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_12c1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_12c1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_12c1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1476_c7_21fb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1476_c7_21fb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1476_c7_21fb_cond;
     tmp16_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output := tmp16_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1476_c7_21fb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_21fb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_21fb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1481_c7_12c1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1473_c7_afc3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_afc3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_afc3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1468_c2_869f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1468_c2_869f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1468_c2_869f_cond;
     t16_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue;
     t16_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1468_c2_869f_return_output := t16_MUX_uxn_opcodes_h_l1468_c2_869f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1468_c2_869f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_869f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_869f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_869f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_869f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1476_c7_21fb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_21fb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_21fb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1473_c7_afc3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1476_c7_21fb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_21fb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_21fb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1473_c7_afc3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1473_c7_afc3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1473_c7_afc3_cond;
     tmp16_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output := tmp16_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1476_c7_21fb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1476_c7_21fb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c7_21fb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c7_21fb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c7_21fb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output := result_stack_value_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1476_c7_21fb_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1468_c2_869f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1468_c2_869f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_869f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_869f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_869f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_869f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1473_c7_afc3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_afc3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_afc3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1468_c2_869f] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1468_c2_869f_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1468_c2_869f_cond;
     tmp16_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1468_c2_869f_return_output := tmp16_MUX_uxn_opcodes_h_l1468_c2_869f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1468_c2_869f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_869f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_869f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_869f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_869f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1473_c7_afc3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_afc3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_afc3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1473_c7_afc3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1473_c7_afc3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1473_c7_afc3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1473_c7_afc3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1473_c7_afc3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1473_c7_afc3_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1468_c2_869f_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1468_c2_869f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1468_c2_869f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c2_869f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c2_869f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1468_c2_869f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1468_c2_869f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_869f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_869f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_869f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_869f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1468_c2_869f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_869f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_869f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_869f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_869f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_869f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_869f_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1505_l1464_DUPLICATE_b8b0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1505_l1464_DUPLICATE_b8b0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1468_c2_869f_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1468_c2_869f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1468_c2_869f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1468_c2_869f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1468_c2_869f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1468_c2_869f_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1505_l1464_DUPLICATE_b8b0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l1505_l1464_DUPLICATE_b8b0_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
