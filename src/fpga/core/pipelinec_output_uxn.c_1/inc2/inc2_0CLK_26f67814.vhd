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
entity inc2_0CLK_26f67814 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end inc2_0CLK_26f67814;
architecture arch of inc2_0CLK_26f67814 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1317_c6_d6a3]
signal BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1317_c1_5dd7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1317_c1_5dd7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1317_c1_5dd7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1317_c1_5dd7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1317_c1_5dd7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1317_c2_f25a]
signal tmp16_MUX_uxn_opcodes_h_l1317_c2_f25a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1317_c2_f25a]
signal t16_MUX_uxn_opcodes_h_l1317_c2_f25a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1317_c2_f25a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1317_c2_f25a]
signal result_stack_value_MUX_uxn_opcodes_h_l1317_c2_f25a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1317_c2_f25a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1317_c2_f25a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1317_c2_f25a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1317_c2_f25a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1317_c2_f25a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1317_c2_f25a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c2_f25a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1317_c2_f25a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1317_c2_f25a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1318_c3_f2f4[uxn_opcodes_h_l1318_c3_f2f4]
signal printf_uxn_opcodes_h_l1318_c3_f2f4_uxn_opcodes_h_l1318_c3_f2f4_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1323_c11_8495]
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1323_c7_cc7d]
signal tmp16_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1323_c7_cc7d]
signal t16_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1323_c7_cc7d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1323_c7_cc7d]
signal result_stack_value_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1323_c7_cc7d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1323_c7_cc7d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1323_c7_cc7d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1323_c7_cc7d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1323_c7_cc7d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1326_c11_d38e]
signal BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1326_c7_ae84]
signal tmp16_MUX_uxn_opcodes_h_l1326_c7_ae84_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1326_c7_ae84]
signal t16_MUX_uxn_opcodes_h_l1326_c7_ae84_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1326_c7_ae84]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1326_c7_ae84]
signal result_stack_value_MUX_uxn_opcodes_h_l1326_c7_ae84_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1326_c7_ae84]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1326_c7_ae84]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1326_c7_ae84_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1326_c7_ae84]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1326_c7_ae84_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1326_c7_ae84]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1326_c7_ae84_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1326_c7_ae84]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1326_c7_ae84_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1328_c3_43b0]
signal CONST_SL_8_uxn_opcodes_h_l1328_c3_43b0_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1328_c3_43b0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1331_c11_3b92]
signal BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1331_c7_9ce9]
signal tmp16_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1331_c7_9ce9]
signal t16_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1331_c7_9ce9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1331_c7_9ce9]
signal result_stack_value_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1331_c7_9ce9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1331_c7_9ce9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1331_c7_9ce9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1331_c7_9ce9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1331_c7_9ce9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1334_c11_b7f1]
signal BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1334_c7_bb94]
signal tmp16_MUX_uxn_opcodes_h_l1334_c7_bb94_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1334_c7_bb94]
signal t16_MUX_uxn_opcodes_h_l1334_c7_bb94_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1334_c7_bb94]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1334_c7_bb94]
signal result_stack_value_MUX_uxn_opcodes_h_l1334_c7_bb94_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1334_c7_bb94]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1334_c7_bb94]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_bb94_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1334_c7_bb94]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_bb94_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1334_c7_bb94]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_bb94_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1334_c7_bb94]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1334_c7_bb94_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1335_c3_de8e]
signal BIN_OP_OR_uxn_opcodes_h_l1335_c3_de8e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1335_c3_de8e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1335_c3_de8e_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1336_c11_bce0]
signal BIN_OP_PLUS_uxn_opcodes_h_l1336_c11_bce0_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1336_c11_bce0_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1336_c11_bce0_return_output : unsigned(16 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1339_c32_7aee]
signal BIN_OP_AND_uxn_opcodes_h_l1339_c32_7aee_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1339_c32_7aee_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1339_c32_7aee_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1339_c32_bcdd]
signal BIN_OP_GT_uxn_opcodes_h_l1339_c32_bcdd_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1339_c32_bcdd_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1339_c32_bcdd_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1339_c32_1639]
signal MUX_uxn_opcodes_h_l1339_c32_1639_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1339_c32_1639_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1339_c32_1639_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1339_c32_1639_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1341_c11_5a88]
signal BIN_OP_EQ_uxn_opcodes_h_l1341_c11_5a88_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1341_c11_5a88_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1341_c11_5a88_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1341_c7_989f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_989f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_989f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1341_c7_989f]
signal result_stack_value_MUX_uxn_opcodes_h_l1341_c7_989f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1341_c7_989f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1341_c7_989f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_989f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_989f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1341_c7_989f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_989f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_989f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1341_c7_989f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_989f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_989f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1347_c11_64c8]
signal BIN_OP_EQ_uxn_opcodes_h_l1347_c11_64c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1347_c11_64c8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1347_c11_64c8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1347_c7_dfc3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1347_c7_dfc3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1347_c7_dfc3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1347_c7_dfc3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1347_c7_dfc3_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1347_c7_dfc3]
signal result_stack_value_MUX_uxn_opcodes_h_l1347_c7_dfc3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1347_c7_dfc3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1347_c7_dfc3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1347_c7_dfc3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1347_c7_dfc3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1347_c7_dfc3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1347_c7_dfc3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1347_c7_dfc3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1347_c7_dfc3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1347_c7_dfc3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1347_c7_dfc3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1347_c7_dfc3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1347_c7_dfc3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1347_c7_dfc3_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1349_c34_96b5]
signal CONST_SR_8_uxn_opcodes_h_l1349_c34_96b5_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1349_c34_96b5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1351_c11_7d93]
signal BIN_OP_EQ_uxn_opcodes_h_l1351_c11_7d93_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1351_c11_7d93_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1351_c11_7d93_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1351_c7_f278]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_f278_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_f278_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_f278_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_f278_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1351_c7_f278]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_f278_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_f278_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_f278_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_f278_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e56b( ref_toks_0 : opcode_result_t;
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
      base.stack_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3
BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3_left,
BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3_right,
BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1317_c1_5dd7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1317_c1_5dd7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1317_c1_5dd7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1317_c1_5dd7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1317_c1_5dd7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1317_c1_5dd7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1317_c2_f25a
tmp16_MUX_uxn_opcodes_h_l1317_c2_f25a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1317_c2_f25a_cond,
tmp16_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output);

-- t16_MUX_uxn_opcodes_h_l1317_c2_f25a
t16_MUX_uxn_opcodes_h_l1317_c2_f25a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1317_c2_f25a_cond,
t16_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue,
t16_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse,
t16_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c2_f25a
result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c2_f25a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1317_c2_f25a
result_stack_value_MUX_uxn_opcodes_h_l1317_c2_f25a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1317_c2_f25a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1317_c2_f25a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1317_c2_f25a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1317_c2_f25a
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c2_f25a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c2_f25a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1317_c2_f25a
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c2_f25a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c2_f25a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c2_f25a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c2_f25a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c2_f25a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1317_c2_f25a
result_is_stack_read_MUX_uxn_opcodes_h_l1317_c2_f25a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1317_c2_f25a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output);

-- printf_uxn_opcodes_h_l1318_c3_f2f4_uxn_opcodes_h_l1318_c3_f2f4
printf_uxn_opcodes_h_l1318_c3_f2f4_uxn_opcodes_h_l1318_c3_f2f4 : entity work.printf_uxn_opcodes_h_l1318_c3_f2f4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1318_c3_f2f4_uxn_opcodes_h_l1318_c3_f2f4_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495
BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495_left,
BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495_right,
BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1323_c7_cc7d
tmp16_MUX_uxn_opcodes_h_l1323_c7_cc7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond,
tmp16_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output);

-- t16_MUX_uxn_opcodes_h_l1323_c7_cc7d
t16_MUX_uxn_opcodes_h_l1323_c7_cc7d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond,
t16_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue,
t16_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse,
t16_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d
result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1323_c7_cc7d
result_stack_value_MUX_uxn_opcodes_h_l1323_c7_cc7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_cc7d
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_cc7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_cc7d
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_cc7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_cc7d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_cc7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1323_c7_cc7d
result_is_stack_read_MUX_uxn_opcodes_h_l1323_c7_cc7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e
BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e_left,
BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e_right,
BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1326_c7_ae84
tmp16_MUX_uxn_opcodes_h_l1326_c7_ae84 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1326_c7_ae84_cond,
tmp16_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue,
tmp16_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse,
tmp16_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output);

-- t16_MUX_uxn_opcodes_h_l1326_c7_ae84
t16_MUX_uxn_opcodes_h_l1326_c7_ae84 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1326_c7_ae84_cond,
t16_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue,
t16_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse,
t16_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1326_c7_ae84
result_is_sp_shift_MUX_uxn_opcodes_h_l1326_c7_ae84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1326_c7_ae84
result_stack_value_MUX_uxn_opcodes_h_l1326_c7_ae84 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1326_c7_ae84_cond,
result_stack_value_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1326_c7_ae84
result_sp_relative_shift_MUX_uxn_opcodes_h_l1326_c7_ae84 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1326_c7_ae84
result_is_stack_write_MUX_uxn_opcodes_h_l1326_c7_ae84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1326_c7_ae84_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1326_c7_ae84
result_is_opc_done_MUX_uxn_opcodes_h_l1326_c7_ae84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1326_c7_ae84_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1326_c7_ae84
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1326_c7_ae84 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1326_c7_ae84_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1326_c7_ae84
result_is_stack_read_MUX_uxn_opcodes_h_l1326_c7_ae84 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1326_c7_ae84_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1328_c3_43b0
CONST_SL_8_uxn_opcodes_h_l1328_c3_43b0 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1328_c3_43b0_x,
CONST_SL_8_uxn_opcodes_h_l1328_c3_43b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92
BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92_left,
BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92_right,
BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1331_c7_9ce9
tmp16_MUX_uxn_opcodes_h_l1331_c7_9ce9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond,
tmp16_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue,
tmp16_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse,
tmp16_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output);

-- t16_MUX_uxn_opcodes_h_l1331_c7_9ce9
t16_MUX_uxn_opcodes_h_l1331_c7_9ce9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond,
t16_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue,
t16_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse,
t16_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9
result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1331_c7_9ce9
result_stack_value_MUX_uxn_opcodes_h_l1331_c7_9ce9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond,
result_stack_value_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_9ce9
result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_9ce9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_9ce9
result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_9ce9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_9ce9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_9ce9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1331_c7_9ce9
result_is_stack_read_MUX_uxn_opcodes_h_l1331_c7_9ce9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1
BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1_left,
BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1_right,
BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1334_c7_bb94
tmp16_MUX_uxn_opcodes_h_l1334_c7_bb94 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1334_c7_bb94_cond,
tmp16_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue,
tmp16_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse,
tmp16_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output);

-- t16_MUX_uxn_opcodes_h_l1334_c7_bb94
t16_MUX_uxn_opcodes_h_l1334_c7_bb94 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1334_c7_bb94_cond,
t16_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue,
t16_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse,
t16_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_bb94
result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_bb94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1334_c7_bb94
result_stack_value_MUX_uxn_opcodes_h_l1334_c7_bb94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1334_c7_bb94_cond,
result_stack_value_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_bb94
result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_bb94 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_bb94
result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_bb94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_bb94_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_bb94
result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_bb94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_bb94_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_bb94
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_bb94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_bb94_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1334_c7_bb94
result_is_stack_read_MUX_uxn_opcodes_h_l1334_c7_bb94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1334_c7_bb94_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1335_c3_de8e
BIN_OP_OR_uxn_opcodes_h_l1335_c3_de8e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1335_c3_de8e_left,
BIN_OP_OR_uxn_opcodes_h_l1335_c3_de8e_right,
BIN_OP_OR_uxn_opcodes_h_l1335_c3_de8e_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1336_c11_bce0
BIN_OP_PLUS_uxn_opcodes_h_l1336_c11_bce0 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1336_c11_bce0_left,
BIN_OP_PLUS_uxn_opcodes_h_l1336_c11_bce0_right,
BIN_OP_PLUS_uxn_opcodes_h_l1336_c11_bce0_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1339_c32_7aee
BIN_OP_AND_uxn_opcodes_h_l1339_c32_7aee : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1339_c32_7aee_left,
BIN_OP_AND_uxn_opcodes_h_l1339_c32_7aee_right,
BIN_OP_AND_uxn_opcodes_h_l1339_c32_7aee_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1339_c32_bcdd
BIN_OP_GT_uxn_opcodes_h_l1339_c32_bcdd : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1339_c32_bcdd_left,
BIN_OP_GT_uxn_opcodes_h_l1339_c32_bcdd_right,
BIN_OP_GT_uxn_opcodes_h_l1339_c32_bcdd_return_output);

-- MUX_uxn_opcodes_h_l1339_c32_1639
MUX_uxn_opcodes_h_l1339_c32_1639 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1339_c32_1639_cond,
MUX_uxn_opcodes_h_l1339_c32_1639_iftrue,
MUX_uxn_opcodes_h_l1339_c32_1639_iffalse,
MUX_uxn_opcodes_h_l1339_c32_1639_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1341_c11_5a88
BIN_OP_EQ_uxn_opcodes_h_l1341_c11_5a88 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1341_c11_5a88_left,
BIN_OP_EQ_uxn_opcodes_h_l1341_c11_5a88_right,
BIN_OP_EQ_uxn_opcodes_h_l1341_c11_5a88_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_989f
result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_989f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_989f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_989f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1341_c7_989f
result_stack_value_MUX_uxn_opcodes_h_l1341_c7_989f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1341_c7_989f_cond,
result_stack_value_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1341_c7_989f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_989f
result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_989f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_989f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_989f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_989f
result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_989f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_989f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_989f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_989f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_989f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_989f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_989f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1347_c11_64c8
BIN_OP_EQ_uxn_opcodes_h_l1347_c11_64c8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1347_c11_64c8_left,
BIN_OP_EQ_uxn_opcodes_h_l1347_c11_64c8_right,
BIN_OP_EQ_uxn_opcodes_h_l1347_c11_64c8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1347_c7_dfc3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1347_c7_dfc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1347_c7_dfc3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1347_c7_dfc3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1347_c7_dfc3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1347_c7_dfc3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1347_c7_dfc3
result_stack_value_MUX_uxn_opcodes_h_l1347_c7_dfc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1347_c7_dfc3_cond,
result_stack_value_MUX_uxn_opcodes_h_l1347_c7_dfc3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1347_c7_dfc3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1347_c7_dfc3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1347_c7_dfc3
result_is_opc_done_MUX_uxn_opcodes_h_l1347_c7_dfc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1347_c7_dfc3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1347_c7_dfc3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1347_c7_dfc3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1347_c7_dfc3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1347_c7_dfc3
result_is_stack_write_MUX_uxn_opcodes_h_l1347_c7_dfc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1347_c7_dfc3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1347_c7_dfc3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1347_c7_dfc3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1347_c7_dfc3_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1349_c34_96b5
CONST_SR_8_uxn_opcodes_h_l1349_c34_96b5 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1349_c34_96b5_x,
CONST_SR_8_uxn_opcodes_h_l1349_c34_96b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1351_c11_7d93
BIN_OP_EQ_uxn_opcodes_h_l1351_c11_7d93 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1351_c11_7d93_left,
BIN_OP_EQ_uxn_opcodes_h_l1351_c11_7d93_right,
BIN_OP_EQ_uxn_opcodes_h_l1351_c11_7d93_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_f278
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_f278 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_f278_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_f278_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_f278_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_f278_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_f278
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_f278 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_f278_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_f278_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_f278_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_f278_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1317_c1_5dd7_return_output,
 tmp16_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output,
 t16_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495_return_output,
 tmp16_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output,
 t16_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e_return_output,
 tmp16_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output,
 t16_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output,
 CONST_SL_8_uxn_opcodes_h_l1328_c3_43b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92_return_output,
 tmp16_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output,
 t16_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1_return_output,
 tmp16_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output,
 t16_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1335_c3_de8e_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1336_c11_bce0_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1339_c32_7aee_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1339_c32_bcdd_return_output,
 MUX_uxn_opcodes_h_l1339_c32_1639_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1341_c11_5a88_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_989f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1341_c7_989f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_989f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_989f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_989f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1347_c11_64c8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1347_c7_dfc3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1347_c7_dfc3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1347_c7_dfc3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1347_c7_dfc3_return_output,
 CONST_SR_8_uxn_opcodes_h_l1349_c34_96b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1351_c11_7d93_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_f278_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_f278_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1317_c1_5dd7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1317_c1_5dd7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1317_c1_5dd7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1317_c1_5dd7_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1317_c2_f25a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1317_c2_f25a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c2_f25a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c2_f25a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c2_f25a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1320_c3_73dc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c2_f25a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1317_c2_f25a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1318_c3_f2f4_uxn_opcodes_h_l1318_c3_f2f4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1324_c3_2c0b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1326_c7_ae84_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1326_c7_ae84_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1326_c7_ae84_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1326_c7_ae84_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1326_c7_ae84_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1329_c3_467e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1326_c7_ae84_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1326_c7_ae84_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1328_c3_43b0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1328_c3_43b0_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1332_c3_4dda : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1336_c3_41ed : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1334_c7_bb94_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1334_c7_bb94_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_989f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c7_989f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1334_c7_bb94_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_989f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_bb94_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_989f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_bb94_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_989f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_bb94_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1334_c7_bb94_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1335_c3_de8e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1335_c3_de8e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1335_c3_de8e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1336_c11_bce0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1336_c11_bce0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1336_c11_bce0_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1339_c32_1639_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1339_c32_1639_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1339_c32_1639_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1339_c32_7aee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1339_c32_7aee_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1339_c32_7aee_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1339_c32_bcdd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1339_c32_bcdd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1339_c32_bcdd_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1339_c32_1639_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_5a88_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_5a88_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_5a88_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_989f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1347_c7_dfc3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c7_989f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1347_c7_dfc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_989f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1347_c7_dfc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_989f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1344_c3_a6bb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1347_c7_dfc3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_989f_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1345_c24_e91a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1347_c11_64c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1347_c11_64c8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1347_c11_64c8_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1347_c7_dfc3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1348_c3_bf68 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1347_c7_dfc3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1347_c7_dfc3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1347_c7_dfc3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1347_c7_dfc3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1347_c7_dfc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1347_c7_dfc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1347_c7_dfc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_f278_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1347_c7_dfc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1347_c7_dfc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1347_c7_dfc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_f278_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1347_c7_dfc3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1349_c34_96b5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1349_c34_96b5_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1349_c24_0d4e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_7d93_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_7d93_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_7d93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_f278_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_f278_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_f278_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_f278_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_f278_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_f278_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1326_l1323_l1317_l1341_l1331_DUPLICATE_dad0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1326_l1323_l1317_l1347_l1334_l1331_DUPLICATE_fa62_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1326_l1323_l1317_l1334_l1331_DUPLICATE_bce4_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1326_l1323_l1351_l1317_l1347_l1334_l1331_DUPLICATE_351a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1326_l1323_l1351_l1347_l1341_l1334_l1331_DUPLICATE_0d54_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1326_l1331_l1323_l1334_DUPLICATE_5093_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1335_l1327_DUPLICATE_d6dd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1347_l1334_DUPLICATE_c9bc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1356_l1313_DUPLICATE_c09c_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_5a88_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1320_c3_73dc := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1320_c3_73dc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1329_c3_467e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1329_c3_467e;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1339_c32_7aee_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_7d93_right := to_unsigned(7, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_f278_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1347_c11_64c8_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1344_c3_a6bb := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1344_c3_a6bb;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1332_c3_4dda := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1332_c3_4dda;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1336_c11_bce0_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1348_c3_bf68 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1347_c7_dfc3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1348_c3_bf68;
     VAR_MUX_uxn_opcodes_h_l1339_c32_1639_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_GT_uxn_opcodes_h_l1339_c32_bcdd_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_f278_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1317_c1_5dd7_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1339_c32_1639_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1324_c3_2c0b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1324_c3_2c0b;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1317_c1_5dd7_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1339_c32_7aee_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_5a88_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1347_c11_64c8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_7d93_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1335_c3_de8e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1349_c34_96b5_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1341_c11_5a88] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1341_c11_5a88_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_5a88_left;
     BIN_OP_EQ_uxn_opcodes_h_l1341_c11_5a88_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_5a88_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_5a88_return_output := BIN_OP_EQ_uxn_opcodes_h_l1341_c11_5a88_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1326_l1323_l1351_l1317_l1347_l1334_l1331_DUPLICATE_351a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1326_l1323_l1351_l1317_l1347_l1334_l1331_DUPLICATE_351a_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1326_l1331_l1323_l1334_DUPLICATE_5093 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1326_l1331_l1323_l1334_DUPLICATE_5093_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1326_c11_d38e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1345_c24_e91a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1345_c24_e91a_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1347_c11_64c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1347_c11_64c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1347_c11_64c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1347_c11_64c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1347_c11_64c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1347_c11_64c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1347_c11_64c8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1351_c11_7d93] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1351_c11_7d93_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_7d93_left;
     BIN_OP_EQ_uxn_opcodes_h_l1351_c11_7d93_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_7d93_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_7d93_return_output := BIN_OP_EQ_uxn_opcodes_h_l1351_c11_7d93_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1331_c11_3b92] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92_left;
     BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92_return_output := BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1326_l1323_l1317_l1341_l1331_DUPLICATE_dad0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1326_l1323_l1317_l1341_l1331_DUPLICATE_dad0_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1335_l1327_DUPLICATE_d6dd LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1335_l1327_DUPLICATE_d6dd_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1334_c11_b7f1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1347_l1334_DUPLICATE_c9bc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1347_l1334_DUPLICATE_c9bc_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1317_c6_d6a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1326_l1323_l1317_l1334_l1331_DUPLICATE_bce4 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1326_l1323_l1317_l1334_l1331_DUPLICATE_bce4_return_output := result.sp_relative_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l1339_c32_7aee] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1339_c32_7aee_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1339_c32_7aee_left;
     BIN_OP_AND_uxn_opcodes_h_l1339_c32_7aee_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1339_c32_7aee_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1339_c32_7aee_return_output := BIN_OP_AND_uxn_opcodes_h_l1339_c32_7aee_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1326_l1323_l1317_l1347_l1334_l1331_DUPLICATE_fa62 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1326_l1323_l1317_l1347_l1334_l1331_DUPLICATE_fa62_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1326_l1323_l1351_l1347_l1341_l1334_l1331_DUPLICATE_0d54 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1326_l1323_l1351_l1347_l1341_l1334_l1331_DUPLICATE_0d54_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1323_c11_8495] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495_left;
     BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495_return_output := BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1349_c34_96b5] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1349_c34_96b5_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1349_c34_96b5_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1349_c34_96b5_return_output := CONST_SR_8_uxn_opcodes_h_l1349_c34_96b5_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1339_c32_bcdd_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1339_c32_7aee_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1317_c1_5dd7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c2_f25a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1317_c2_f25a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c2_f25a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c2_f25a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c2_f25a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1317_c2_f25a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1317_c2_f25a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1317_c6_d6a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1323_c11_8495_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1326_c7_ae84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1326_c7_ae84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1326_c7_ae84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1326_c7_ae84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1326_c7_ae84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1326_c7_ae84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1326_c7_ae84_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1326_c11_d38e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1331_c11_3b92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_bb94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1334_c7_bb94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_bb94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_bb94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1334_c7_bb94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1334_c7_bb94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1334_c7_bb94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1334_c11_b7f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_989f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_5a88_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_989f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_5a88_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_989f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_5a88_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_989f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_5a88_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c7_989f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1341_c11_5a88_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1347_c7_dfc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1347_c11_64c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1347_c7_dfc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1347_c11_64c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1347_c7_dfc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1347_c11_64c8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1347_c7_dfc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1347_c11_64c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_f278_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_7d93_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_f278_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1351_c11_7d93_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1335_c3_de8e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1335_l1327_DUPLICATE_d6dd_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1328_c3_43b0_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1335_l1327_DUPLICATE_d6dd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1345_c24_e91a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1326_l1323_l1317_l1334_l1331_DUPLICATE_bce4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1326_l1323_l1317_l1334_l1331_DUPLICATE_bce4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1326_l1323_l1317_l1334_l1331_DUPLICATE_bce4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1326_l1323_l1317_l1334_l1331_DUPLICATE_bce4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1326_l1323_l1317_l1334_l1331_DUPLICATE_bce4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1326_l1323_l1351_l1347_l1341_l1334_l1331_DUPLICATE_0d54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1326_l1323_l1351_l1347_l1341_l1334_l1331_DUPLICATE_0d54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1326_l1323_l1351_l1347_l1341_l1334_l1331_DUPLICATE_0d54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1326_l1323_l1351_l1347_l1341_l1334_l1331_DUPLICATE_0d54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1326_l1323_l1351_l1347_l1341_l1334_l1331_DUPLICATE_0d54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1347_c7_dfc3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1326_l1323_l1351_l1347_l1341_l1334_l1331_DUPLICATE_0d54_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_f278_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1326_l1323_l1351_l1347_l1341_l1334_l1331_DUPLICATE_0d54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1326_l1323_l1317_l1341_l1331_DUPLICATE_dad0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1326_l1323_l1317_l1341_l1331_DUPLICATE_dad0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1326_l1323_l1317_l1341_l1331_DUPLICATE_dad0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1326_l1323_l1317_l1341_l1331_DUPLICATE_dad0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1326_l1323_l1317_l1341_l1331_DUPLICATE_dad0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1326_l1331_l1323_l1334_DUPLICATE_5093_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1326_l1331_l1323_l1334_DUPLICATE_5093_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1326_l1331_l1323_l1334_DUPLICATE_5093_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1326_l1331_l1323_l1334_DUPLICATE_5093_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1326_l1323_l1351_l1317_l1347_l1334_l1331_DUPLICATE_351a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1326_l1323_l1351_l1317_l1347_l1334_l1331_DUPLICATE_351a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1326_l1323_l1351_l1317_l1347_l1334_l1331_DUPLICATE_351a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1326_l1323_l1351_l1317_l1347_l1334_l1331_DUPLICATE_351a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1326_l1323_l1351_l1317_l1347_l1334_l1331_DUPLICATE_351a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1347_c7_dfc3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1326_l1323_l1351_l1317_l1347_l1334_l1331_DUPLICATE_351a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_f278_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1326_l1323_l1351_l1317_l1347_l1334_l1331_DUPLICATE_351a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1347_l1334_DUPLICATE_c9bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1347_c7_dfc3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1347_l1334_DUPLICATE_c9bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1326_l1323_l1317_l1347_l1334_l1331_DUPLICATE_fa62_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1326_l1323_l1317_l1347_l1334_l1331_DUPLICATE_fa62_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1326_l1323_l1317_l1347_l1334_l1331_DUPLICATE_fa62_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1326_l1323_l1317_l1347_l1334_l1331_DUPLICATE_fa62_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1326_l1323_l1317_l1347_l1334_l1331_DUPLICATE_fa62_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1347_c7_dfc3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1326_l1323_l1317_l1347_l1334_l1331_DUPLICATE_fa62_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1351_c7_f278] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_f278_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_f278_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_f278_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_f278_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_f278_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_f278_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_f278_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_f278_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1339_c32_bcdd] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1339_c32_bcdd_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1339_c32_bcdd_left;
     BIN_OP_GT_uxn_opcodes_h_l1339_c32_bcdd_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1339_c32_bcdd_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1339_c32_bcdd_return_output := BIN_OP_GT_uxn_opcodes_h_l1339_c32_bcdd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1317_c1_5dd7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1317_c1_5dd7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1317_c1_5dd7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1317_c1_5dd7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1317_c1_5dd7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1317_c1_5dd7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1317_c1_5dd7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1317_c1_5dd7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1317_c1_5dd7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1334_c7_bb94] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1334_c7_bb94_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1334_c7_bb94_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1349_c24_0d4e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1349_c24_0d4e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1349_c34_96b5_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1351_c7_f278] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_f278_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_f278_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_f278_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_f278_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_f278_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_f278_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_f278_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_f278_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1335_c3_de8e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1335_c3_de8e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1335_c3_de8e_left;
     BIN_OP_OR_uxn_opcodes_h_l1335_c3_de8e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1335_c3_de8e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1335_c3_de8e_return_output := BIN_OP_OR_uxn_opcodes_h_l1335_c3_de8e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1341_c7_989f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_989f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_989f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_989f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_989f_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1328_c3_43b0] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1328_c3_43b0_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1328_c3_43b0_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1328_c3_43b0_return_output := CONST_SL_8_uxn_opcodes_h_l1328_c3_43b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1347_c7_dfc3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1347_c7_dfc3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1347_c7_dfc3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1347_c7_dfc3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1347_c7_dfc3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1347_c7_dfc3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1347_c7_dfc3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1347_c7_dfc3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1347_c7_dfc3_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1339_c32_1639_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1339_c32_bcdd_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1336_c11_bce0_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1335_c3_de8e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1335_c3_de8e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1347_c7_dfc3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1349_c24_0d4e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1328_c3_43b0_return_output;
     VAR_printf_uxn_opcodes_h_l1318_c3_f2f4_uxn_opcodes_h_l1318_c3_f2f4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1317_c1_5dd7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1347_c7_dfc3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1351_c7_f278_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1341_c7_989f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1347_c7_dfc3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1351_c7_f278_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1347_c7_dfc3_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1347_c7_dfc3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1347_c7_dfc3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1347_c7_dfc3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1347_c7_dfc3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1347_c7_dfc3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1347_c7_dfc3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1347_c7_dfc3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1347_c7_dfc3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1347_c7_dfc3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1334_c7_bb94] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1334_c7_bb94_cond <= VAR_t16_MUX_uxn_opcodes_h_l1334_c7_bb94_cond;
     t16_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue;
     t16_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output := t16_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output;

     -- MUX[uxn_opcodes_h_l1339_c32_1639] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1339_c32_1639_cond <= VAR_MUX_uxn_opcodes_h_l1339_c32_1639_cond;
     MUX_uxn_opcodes_h_l1339_c32_1639_iftrue <= VAR_MUX_uxn_opcodes_h_l1339_c32_1639_iftrue;
     MUX_uxn_opcodes_h_l1339_c32_1639_iffalse <= VAR_MUX_uxn_opcodes_h_l1339_c32_1639_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1339_c32_1639_return_output := MUX_uxn_opcodes_h_l1339_c32_1639_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1334_c7_bb94] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1347_c7_dfc3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1347_c7_dfc3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1347_c7_dfc3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1347_c7_dfc3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1347_c7_dfc3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1347_c7_dfc3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1347_c7_dfc3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1347_c7_dfc3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1347_c7_dfc3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1347_c7_dfc3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1347_c7_dfc3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1347_c7_dfc3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1347_c7_dfc3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1347_c7_dfc3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1347_c7_dfc3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1347_c7_dfc3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1347_c7_dfc3_return_output := result_stack_value_MUX_uxn_opcodes_h_l1347_c7_dfc3_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1331_c7_9ce9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1336_c11_bce0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1336_c11_bce0_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1336_c11_bce0_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1336_c11_bce0_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1336_c11_bce0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1336_c11_bce0_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1336_c11_bce0_return_output;

     -- printf_uxn_opcodes_h_l1318_c3_f2f4[uxn_opcodes_h_l1318_c3_f2f4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1318_c3_f2f4_uxn_opcodes_h_l1318_c3_f2f4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1318_c3_f2f4_uxn_opcodes_h_l1318_c3_f2f4_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1341_c7_989f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_989f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_989f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_989f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_989f_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1336_c3_41ed := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1336_c11_bce0_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue := VAR_MUX_uxn_opcodes_h_l1339_c32_1639_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1347_c7_dfc3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1347_c7_dfc3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1341_c7_989f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1347_c7_dfc3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue := VAR_tmp16_uxn_opcodes_h_l1336_c3_41ed;
     -- tmp16_MUX[uxn_opcodes_h_l1334_c7_bb94] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1334_c7_bb94_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1334_c7_bb94_cond;
     tmp16_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output := tmp16_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1334_c7_bb94] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_bb94_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_bb94_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1341_c7_989f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1341_c7_989f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c7_989f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c7_989f_return_output := result_stack_value_MUX_uxn_opcodes_h_l1341_c7_989f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1341_c7_989f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_989f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_989f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_989f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_989f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1326_c7_ae84] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1326_c7_ae84_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1326_c7_ae84_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1341_c7_989f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_989f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_989f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_989f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_989f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_989f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_989f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1334_c7_bb94] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output;

     -- t16_MUX[uxn_opcodes_h_l1331_c7_9ce9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond <= VAR_t16_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond;
     t16_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue;
     t16_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output := t16_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1331_c7_9ce9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1341_c7_989f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1341_c7_989f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1341_c7_989f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1331_c7_9ce9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond;
     tmp16_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output := tmp16_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1334_c7_bb94] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_bb94_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_bb94_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1323_c7_cc7d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1334_c7_bb94] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1334_c7_bb94_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1334_c7_bb94_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output := result_stack_value_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1331_c7_9ce9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1326_c7_ae84] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output;

     -- t16_MUX[uxn_opcodes_h_l1326_c7_ae84] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1326_c7_ae84_cond <= VAR_t16_MUX_uxn_opcodes_h_l1326_c7_ae84_cond;
     t16_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue;
     t16_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output := t16_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1334_c7_bb94] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_bb94_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_bb94_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_bb94_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_bb94_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1331_c7_9ce9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1334_c7_bb94_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1331_c7_9ce9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1326_c7_ae84] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1331_c7_9ce9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1323_c7_cc7d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1326_c7_ae84] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1326_c7_ae84_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1326_c7_ae84_cond;
     tmp16_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output := tmp16_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1331_c7_9ce9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1331_c7_9ce9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1331_c7_9ce9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1331_c7_9ce9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output := result_stack_value_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output;

     -- t16_MUX[uxn_opcodes_h_l1323_c7_cc7d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond;
     t16_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue;
     t16_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output := t16_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1317_c2_f25a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1317_c2_f25a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1317_c2_f25a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1326_c7_ae84] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1326_c7_ae84_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1326_c7_ae84_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1331_c7_9ce9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1326_c7_ae84] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1326_c7_ae84_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1326_c7_ae84_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1326_c7_ae84] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1326_c7_ae84_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1326_c7_ae84_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1326_c7_ae84] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1326_c7_ae84_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1326_c7_ae84_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1326_c7_ae84_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1326_c7_ae84_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output := result_stack_value_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1323_c7_cc7d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond;
     tmp16_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output := tmp16_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1323_c7_cc7d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1323_c7_cc7d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1317_c2_f25a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1317_c2_f25a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1317_c2_f25a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1317_c2_f25a_cond;
     t16_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue;
     t16_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output := t16_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1326_c7_ae84_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1323_c7_cc7d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1323_c7_cc7d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1317_c2_f25a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1317_c2_f25a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1317_c2_f25a_cond;
     tmp16_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output := tmp16_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1323_c7_cc7d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_cc7d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_cc7d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_cc7d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1317_c2_f25a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1317_c2_f25a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c2_f25a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c2_f25a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1323_c7_cc7d_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1317_c2_f25a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1317_c2_f25a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c2_f25a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1317_c2_f25a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1317_c2_f25a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c2_f25a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1317_c2_f25a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1317_c2_f25a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c2_f25a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c2_f25a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c2_f25a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1356_l1313_DUPLICATE_c09c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1356_l1313_DUPLICATE_c09c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1317_c2_f25a_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1356_l1313_DUPLICATE_c09c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l1356_l1313_DUPLICATE_c09c_return_output;
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
