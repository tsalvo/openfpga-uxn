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
-- BIN_OP_EQ[uxn_opcodes_h_l1534_c6_ee7f]
signal BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1534_c1_f637]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1534_c1_f637_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1534_c1_f637_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1534_c1_f637_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1534_c1_f637_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1534_c2_d076]
signal t16_MUX_uxn_opcodes_h_l1534_c2_d076_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1534_c2_d076_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1534_c2_d076]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1534_c2_d076_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1534_c2_d076_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1534_c2_d076]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c2_d076_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c2_d076_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1534_c2_d076]
signal result_stack_value_MUX_uxn_opcodes_h_l1534_c2_d076_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1534_c2_d076_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1534_c2_d076]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1534_c2_d076_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1534_c2_d076_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1534_c2_d076]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1534_c2_d076_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1534_c2_d076_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1534_c2_d076]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1534_c2_d076_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1534_c2_d076_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1534_c2_d076]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c2_d076_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c2_d076_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1534_c2_d076]
signal tmp16_MUX_uxn_opcodes_h_l1534_c2_d076_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1534_c2_d076_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1535_c3_2d36[uxn_opcodes_h_l1535_c3_2d36]
signal printf_uxn_opcodes_h_l1535_c3_2d36_uxn_opcodes_h_l1535_c3_2d36_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1540_c11_9bcf]
signal BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1540_c7_b681]
signal t16_MUX_uxn_opcodes_h_l1540_c7_b681_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1540_c7_b681_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1540_c7_b681]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_b681_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_b681_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1540_c7_b681]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_b681_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_b681_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1540_c7_b681]
signal result_stack_value_MUX_uxn_opcodes_h_l1540_c7_b681_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1540_c7_b681_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1540_c7_b681]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_b681_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_b681_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1540_c7_b681]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_b681_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_b681_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1540_c7_b681]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_b681_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_b681_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1540_c7_b681]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_b681_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_b681_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1540_c7_b681]
signal tmp16_MUX_uxn_opcodes_h_l1540_c7_b681_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1540_c7_b681_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1543_c11_b8ad]
signal BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1543_c7_0de5]
signal t16_MUX_uxn_opcodes_h_l1543_c7_0de5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1543_c7_0de5]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1543_c7_0de5_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1543_c7_0de5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1543_c7_0de5]
signal result_stack_value_MUX_uxn_opcodes_h_l1543_c7_0de5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1543_c7_0de5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1543_c7_0de5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_0de5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1543_c7_0de5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_0de5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1543_c7_0de5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_0de5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1543_c7_0de5]
signal tmp16_MUX_uxn_opcodes_h_l1543_c7_0de5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1545_c3_c9eb]
signal CONST_SL_8_uxn_opcodes_h_l1545_c3_c9eb_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1545_c3_c9eb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1548_c11_2002]
signal BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1548_c7_2418]
signal t16_MUX_uxn_opcodes_h_l1548_c7_2418_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1548_c7_2418_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1548_c7_2418]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_2418_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_2418_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1548_c7_2418]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_2418_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_2418_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1548_c7_2418]
signal result_stack_value_MUX_uxn_opcodes_h_l1548_c7_2418_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1548_c7_2418_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1548_c7_2418]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_2418_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_2418_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1548_c7_2418]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_2418_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_2418_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1548_c7_2418]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_2418_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_2418_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1548_c7_2418]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_2418_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_2418_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1548_c7_2418]
signal tmp16_MUX_uxn_opcodes_h_l1548_c7_2418_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1548_c7_2418_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1551_c11_8b79]
signal BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1551_c7_ca37]
signal t16_MUX_uxn_opcodes_h_l1551_c7_ca37_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1551_c7_ca37]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1551_c7_ca37_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1551_c7_ca37]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1551_c7_ca37]
signal result_stack_value_MUX_uxn_opcodes_h_l1551_c7_ca37_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1551_c7_ca37]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1551_c7_ca37]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1551_c7_ca37_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1551_c7_ca37]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_ca37_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1551_c7_ca37]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_ca37_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1551_c7_ca37]
signal tmp16_MUX_uxn_opcodes_h_l1551_c7_ca37_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1552_c3_be49]
signal BIN_OP_OR_uxn_opcodes_h_l1552_c3_be49_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1552_c3_be49_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1552_c3_be49_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1553_c11_a0ea]
signal BIN_OP_PLUS_uxn_opcodes_h_l1553_c11_a0ea_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1553_c11_a0ea_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1553_c11_a0ea_return_output : unsigned(16 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1556_c32_cf58]
signal BIN_OP_AND_uxn_opcodes_h_l1556_c32_cf58_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1556_c32_cf58_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1556_c32_cf58_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1556_c32_3046]
signal BIN_OP_GT_uxn_opcodes_h_l1556_c32_3046_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1556_c32_3046_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1556_c32_3046_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1556_c32_34f0]
signal MUX_uxn_opcodes_h_l1556_c32_34f0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1556_c32_34f0_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1556_c32_34f0_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1556_c32_34f0_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1558_c11_1ca3]
signal BIN_OP_EQ_uxn_opcodes_h_l1558_c11_1ca3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1558_c11_1ca3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1558_c11_1ca3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1558_c7_fd40]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c7_fd40_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1558_c7_fd40]
signal result_stack_value_MUX_uxn_opcodes_h_l1558_c7_fd40_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1558_c7_fd40]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1558_c7_fd40_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1558_c7_fd40]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1558_c7_fd40_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1558_c7_fd40]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c7_fd40_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1564_c11_2493]
signal BIN_OP_EQ_uxn_opcodes_h_l1564_c11_2493_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1564_c11_2493_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1564_c11_2493_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1564_c7_4b59]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4b59_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4b59_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4b59_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4b59_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1564_c7_4b59]
signal result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4b59_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4b59_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4b59_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4b59_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1564_c7_4b59]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4b59_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4b59_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4b59_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4b59_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1564_c7_4b59]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4b59_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4b59_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4b59_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4b59_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1566_c34_490c]
signal CONST_SR_8_uxn_opcodes_h_l1566_c34_490c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1566_c34_490c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1568_c11_5e05]
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_5e05_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_5e05_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1568_c11_5e05_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1568_c7_8948]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8948_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8948_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8948_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8948_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1568_c7_8948]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8948_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8948_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8948_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8948_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f
BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f_left,
BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f_right,
BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1534_c1_f637
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1534_c1_f637 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1534_c1_f637_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1534_c1_f637_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1534_c1_f637_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1534_c1_f637_return_output);

-- t16_MUX_uxn_opcodes_h_l1534_c2_d076
t16_MUX_uxn_opcodes_h_l1534_c2_d076 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1534_c2_d076_cond,
t16_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue,
t16_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse,
t16_MUX_uxn_opcodes_h_l1534_c2_d076_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1534_c2_d076
result_is_stack_read_MUX_uxn_opcodes_h_l1534_c2_d076 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1534_c2_d076_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1534_c2_d076_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c2_d076
result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c2_d076 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c2_d076_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c2_d076_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1534_c2_d076
result_stack_value_MUX_uxn_opcodes_h_l1534_c2_d076 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1534_c2_d076_cond,
result_stack_value_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1534_c2_d076_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1534_c2_d076
result_is_sp_shift_MUX_uxn_opcodes_h_l1534_c2_d076 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1534_c2_d076_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1534_c2_d076_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1534_c2_d076
result_is_stack_write_MUX_uxn_opcodes_h_l1534_c2_d076 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1534_c2_d076_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1534_c2_d076_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1534_c2_d076
result_is_opc_done_MUX_uxn_opcodes_h_l1534_c2_d076 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1534_c2_d076_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1534_c2_d076_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c2_d076
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c2_d076 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c2_d076_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c2_d076_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1534_c2_d076
tmp16_MUX_uxn_opcodes_h_l1534_c2_d076 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1534_c2_d076_cond,
tmp16_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue,
tmp16_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse,
tmp16_MUX_uxn_opcodes_h_l1534_c2_d076_return_output);

-- printf_uxn_opcodes_h_l1535_c3_2d36_uxn_opcodes_h_l1535_c3_2d36
printf_uxn_opcodes_h_l1535_c3_2d36_uxn_opcodes_h_l1535_c3_2d36 : entity work.printf_uxn_opcodes_h_l1535_c3_2d36_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1535_c3_2d36_uxn_opcodes_h_l1535_c3_2d36_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf
BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf_left,
BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf_right,
BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf_return_output);

-- t16_MUX_uxn_opcodes_h_l1540_c7_b681
t16_MUX_uxn_opcodes_h_l1540_c7_b681 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1540_c7_b681_cond,
t16_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue,
t16_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse,
t16_MUX_uxn_opcodes_h_l1540_c7_b681_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_b681
result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_b681 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_b681_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_b681_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_b681
result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_b681 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_b681_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_b681_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1540_c7_b681
result_stack_value_MUX_uxn_opcodes_h_l1540_c7_b681 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1540_c7_b681_cond,
result_stack_value_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1540_c7_b681_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_b681
result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_b681 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_b681_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_b681_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_b681
result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_b681 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_b681_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_b681_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_b681
result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_b681 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_b681_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_b681_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_b681
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_b681 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_b681_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_b681_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1540_c7_b681
tmp16_MUX_uxn_opcodes_h_l1540_c7_b681 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1540_c7_b681_cond,
tmp16_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue,
tmp16_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse,
tmp16_MUX_uxn_opcodes_h_l1540_c7_b681_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad
BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad_left,
BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad_right,
BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad_return_output);

-- t16_MUX_uxn_opcodes_h_l1543_c7_0de5
t16_MUX_uxn_opcodes_h_l1543_c7_0de5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1543_c7_0de5_cond,
t16_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue,
t16_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse,
t16_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1543_c7_0de5
result_is_stack_read_MUX_uxn_opcodes_h_l1543_c7_0de5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1543_c7_0de5_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_0de5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_0de5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1543_c7_0de5
result_stack_value_MUX_uxn_opcodes_h_l1543_c7_0de5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1543_c7_0de5_cond,
result_stack_value_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_0de5
result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_0de5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_0de5
result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_0de5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_0de5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_0de5
result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_0de5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_0de5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_0de5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_0de5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_0de5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1543_c7_0de5
tmp16_MUX_uxn_opcodes_h_l1543_c7_0de5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1543_c7_0de5_cond,
tmp16_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue,
tmp16_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse,
tmp16_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1545_c3_c9eb
CONST_SL_8_uxn_opcodes_h_l1545_c3_c9eb : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1545_c3_c9eb_x,
CONST_SL_8_uxn_opcodes_h_l1545_c3_c9eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002
BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002_left,
BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002_right,
BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002_return_output);

-- t16_MUX_uxn_opcodes_h_l1548_c7_2418
t16_MUX_uxn_opcodes_h_l1548_c7_2418 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1548_c7_2418_cond,
t16_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue,
t16_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse,
t16_MUX_uxn_opcodes_h_l1548_c7_2418_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_2418
result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_2418 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_2418_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_2418_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_2418
result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_2418 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_2418_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_2418_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1548_c7_2418
result_stack_value_MUX_uxn_opcodes_h_l1548_c7_2418 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1548_c7_2418_cond,
result_stack_value_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1548_c7_2418_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_2418
result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_2418 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_2418_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_2418_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_2418
result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_2418 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_2418_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_2418_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_2418
result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_2418 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_2418_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_2418_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_2418
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_2418 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_2418_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_2418_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1548_c7_2418
tmp16_MUX_uxn_opcodes_h_l1548_c7_2418 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1548_c7_2418_cond,
tmp16_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue,
tmp16_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse,
tmp16_MUX_uxn_opcodes_h_l1548_c7_2418_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79
BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79_left,
BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79_right,
BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79_return_output);

-- t16_MUX_uxn_opcodes_h_l1551_c7_ca37
t16_MUX_uxn_opcodes_h_l1551_c7_ca37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1551_c7_ca37_cond,
t16_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue,
t16_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse,
t16_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1551_c7_ca37
result_is_stack_read_MUX_uxn_opcodes_h_l1551_c7_ca37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1551_c7_ca37_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_ca37
result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_ca37 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1551_c7_ca37
result_stack_value_MUX_uxn_opcodes_h_l1551_c7_ca37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1551_c7_ca37_cond,
result_stack_value_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1551_c7_ca37
result_is_sp_shift_MUX_uxn_opcodes_h_l1551_c7_ca37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1551_c7_ca37
result_is_stack_write_MUX_uxn_opcodes_h_l1551_c7_ca37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1551_c7_ca37_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_ca37
result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_ca37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_ca37_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_ca37
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_ca37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_ca37_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1551_c7_ca37
tmp16_MUX_uxn_opcodes_h_l1551_c7_ca37 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1551_c7_ca37_cond,
tmp16_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue,
tmp16_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse,
tmp16_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1552_c3_be49
BIN_OP_OR_uxn_opcodes_h_l1552_c3_be49 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1552_c3_be49_left,
BIN_OP_OR_uxn_opcodes_h_l1552_c3_be49_right,
BIN_OP_OR_uxn_opcodes_h_l1552_c3_be49_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1553_c11_a0ea
BIN_OP_PLUS_uxn_opcodes_h_l1553_c11_a0ea : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1553_c11_a0ea_left,
BIN_OP_PLUS_uxn_opcodes_h_l1553_c11_a0ea_right,
BIN_OP_PLUS_uxn_opcodes_h_l1553_c11_a0ea_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1556_c32_cf58
BIN_OP_AND_uxn_opcodes_h_l1556_c32_cf58 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1556_c32_cf58_left,
BIN_OP_AND_uxn_opcodes_h_l1556_c32_cf58_right,
BIN_OP_AND_uxn_opcodes_h_l1556_c32_cf58_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1556_c32_3046
BIN_OP_GT_uxn_opcodes_h_l1556_c32_3046 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1556_c32_3046_left,
BIN_OP_GT_uxn_opcodes_h_l1556_c32_3046_right,
BIN_OP_GT_uxn_opcodes_h_l1556_c32_3046_return_output);

-- MUX_uxn_opcodes_h_l1556_c32_34f0
MUX_uxn_opcodes_h_l1556_c32_34f0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1556_c32_34f0_cond,
MUX_uxn_opcodes_h_l1556_c32_34f0_iftrue,
MUX_uxn_opcodes_h_l1556_c32_34f0_iffalse,
MUX_uxn_opcodes_h_l1556_c32_34f0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1558_c11_1ca3
BIN_OP_EQ_uxn_opcodes_h_l1558_c11_1ca3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1558_c11_1ca3_left,
BIN_OP_EQ_uxn_opcodes_h_l1558_c11_1ca3_right,
BIN_OP_EQ_uxn_opcodes_h_l1558_c11_1ca3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c7_fd40
result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c7_fd40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c7_fd40_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1558_c7_fd40
result_stack_value_MUX_uxn_opcodes_h_l1558_c7_fd40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1558_c7_fd40_cond,
result_stack_value_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1558_c7_fd40
result_is_stack_write_MUX_uxn_opcodes_h_l1558_c7_fd40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1558_c7_fd40_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1558_c7_fd40
result_is_opc_done_MUX_uxn_opcodes_h_l1558_c7_fd40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1558_c7_fd40_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c7_fd40
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c7_fd40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c7_fd40_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1564_c11_2493
BIN_OP_EQ_uxn_opcodes_h_l1564_c11_2493 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1564_c11_2493_left,
BIN_OP_EQ_uxn_opcodes_h_l1564_c11_2493_right,
BIN_OP_EQ_uxn_opcodes_h_l1564_c11_2493_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4b59
result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4b59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4b59_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4b59_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4b59_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4b59_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4b59
result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4b59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4b59_cond,
result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4b59_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4b59_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4b59_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4b59
result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4b59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4b59_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4b59_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4b59_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4b59_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4b59
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4b59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4b59_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4b59_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4b59_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4b59_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1566_c34_490c
CONST_SR_8_uxn_opcodes_h_l1566_c34_490c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1566_c34_490c_x,
CONST_SR_8_uxn_opcodes_h_l1566_c34_490c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1568_c11_5e05
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_5e05 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_5e05_left,
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_5e05_right,
BIN_OP_EQ_uxn_opcodes_h_l1568_c11_5e05_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8948
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8948 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8948_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8948_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8948_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8948_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8948
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8948 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8948_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8948_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8948_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8948_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1534_c1_f637_return_output,
 t16_MUX_uxn_opcodes_h_l1534_c2_d076_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1534_c2_d076_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c2_d076_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1534_c2_d076_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1534_c2_d076_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1534_c2_d076_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1534_c2_d076_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c2_d076_return_output,
 tmp16_MUX_uxn_opcodes_h_l1534_c2_d076_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf_return_output,
 t16_MUX_uxn_opcodes_h_l1540_c7_b681_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_b681_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_b681_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1540_c7_b681_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_b681_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_b681_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_b681_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_b681_return_output,
 tmp16_MUX_uxn_opcodes_h_l1540_c7_b681_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad_return_output,
 t16_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output,
 tmp16_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output,
 CONST_SL_8_uxn_opcodes_h_l1545_c3_c9eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002_return_output,
 t16_MUX_uxn_opcodes_h_l1548_c7_2418_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_2418_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_2418_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1548_c7_2418_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_2418_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_2418_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_2418_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_2418_return_output,
 tmp16_MUX_uxn_opcodes_h_l1548_c7_2418_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79_return_output,
 t16_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output,
 tmp16_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1552_c3_be49_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1553_c11_a0ea_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1556_c32_cf58_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1556_c32_3046_return_output,
 MUX_uxn_opcodes_h_l1556_c32_34f0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1558_c11_1ca3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1564_c11_2493_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4b59_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4b59_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4b59_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4b59_return_output,
 CONST_SR_8_uxn_opcodes_h_l1566_c34_490c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1568_c11_5e05_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8948_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8948_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1534_c1_f637_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1534_c1_f637_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1534_c1_f637_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1534_c1_f637_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1540_c7_b681_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1534_c2_d076_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1534_c2_d076_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_b681_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1534_c2_d076_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1534_c2_d076_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_b681_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c2_d076_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c2_d076_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1540_c7_b681_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1534_c2_d076_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1534_c2_d076_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_b681_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1534_c2_d076_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1534_c2_d076_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_b681_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1534_c2_d076_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1534_c2_d076_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_b681_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c2_d076_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c2_d076_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1537_c3_a11a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_b681_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c2_d076_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c2_d076_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1540_c7_b681_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1534_c2_d076_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1534_c2_d076_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1535_c3_2d36_uxn_opcodes_h_l1535_c3_2d36_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1540_c7_b681_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_b681_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_b681_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1540_c7_b681_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_b681_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_b681_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_b681_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1541_c3_2758 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_b681_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1540_c7_b681_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1548_c7_2418_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1543_c7_0de5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_2418_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1543_c7_0de5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_2418_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1548_c7_2418_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1543_c7_0de5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_2418_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_2418_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_0de5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_2418_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_0de5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1546_c3_5f9e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_2418_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_0de5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1548_c7_2418_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1543_c7_0de5_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1545_c3_c9eb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1545_c3_c9eb_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1548_c7_2418_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_2418_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_2418_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1548_c7_2418_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_2418_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_2418_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_2418_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1549_c3_7509 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_2418_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1548_c7_2418_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1551_c7_ca37_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1551_c7_ca37_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1551_c7_ca37_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1551_c7_ca37_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_ca37_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_ca37_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l1553_c3_6cdb : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1551_c7_ca37_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1552_c3_be49_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1552_c3_be49_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1552_c3_be49_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1553_c11_a0ea_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1553_c11_a0ea_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1553_c11_a0ea_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1556_c32_34f0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1556_c32_34f0_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1556_c32_34f0_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1556_c32_cf58_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1556_c32_cf58_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1556_c32_cf58_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1556_c32_3046_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1556_c32_3046_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1556_c32_3046_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1556_c32_34f0_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c11_1ca3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c11_1ca3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c11_1ca3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c7_fd40_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4b59_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1558_c7_fd40_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4b59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c7_fd40_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4b59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c7_fd40_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1561_c3_8ea1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4b59_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c7_fd40_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1562_c24_d291_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_2493_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_2493_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_2493_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4b59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4b59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8948_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4b59_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4b59_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4b59_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4b59_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4b59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4b59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8948_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4b59_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4b59_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1565_c3_41dc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4b59_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4b59_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1566_c34_490c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1566_c34_490c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1566_c24_4014_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_5e05_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_5e05_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_5e05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8948_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8948_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8948_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8948_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8948_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8948_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1543_l1540_l1534_l1551_l1548_DUPLICATE_9a53_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1543_l1540_l1534_l1564_l1551_l1548_DUPLICATE_06e4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1543_l1540_l1534_l1558_l1548_DUPLICATE_7910_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1543_l1540_l1568_l1534_l1564_l1551_l1548_DUPLICATE_b24e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1540_l1551_l1543_l1548_DUPLICATE_b6ac_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1543_l1540_l1568_l1564_l1558_l1551_l1548_DUPLICATE_ca74_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1544_l1552_DUPLICATE_cbbe_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1551_l1564_DUPLICATE_f13a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1573_l1530_DUPLICATE_5e3b_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8948_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1549_c3_7509 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1549_c3_7509;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1537_c3_a11a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1537_c3_a11a;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1556_c32_34f0_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_2493_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1565_c3_41dc := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4b59_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1565_c3_41dc;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1534_c1_f637_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_5e05_right := to_unsigned(7, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1546_c3_5f9e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1546_c3_5f9e;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1553_c11_a0ea_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1561_c3_8ea1 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1561_c3_8ea1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8948_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1556_c32_cf58_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c11_1ca3_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1541_c3_2758 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1541_c3_2758;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad_right := to_unsigned(2, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1556_c32_3046_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1556_c32_34f0_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1534_c1_f637_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1556_c32_cf58_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c11_1ca3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_2493_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_5e05_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1552_c3_be49_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1566_c34_490c_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1568_c11_5e05] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1568_c11_5e05_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_5e05_left;
     BIN_OP_EQ_uxn_opcodes_h_l1568_c11_5e05_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_5e05_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_5e05_return_output := BIN_OP_EQ_uxn_opcodes_h_l1568_c11_5e05_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1534_c6_ee7f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1566_c34_490c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1566_c34_490c_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1566_c34_490c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1566_c34_490c_return_output := CONST_SR_8_uxn_opcodes_h_l1566_c34_490c_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1543_l1540_l1534_l1551_l1548_DUPLICATE_9a53 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1543_l1540_l1534_l1551_l1548_DUPLICATE_9a53_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1543_c11_b8ad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad_left;
     BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad_return_output := BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1551_c11_8b79] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79_left;
     BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79_return_output := BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1543_l1540_l1534_l1564_l1551_l1548_DUPLICATE_06e4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1543_l1540_l1534_l1564_l1551_l1548_DUPLICATE_06e4_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1540_c11_9bcf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1564_c11_2493] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1564_c11_2493_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_2493_left;
     BIN_OP_EQ_uxn_opcodes_h_l1564_c11_2493_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_2493_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_2493_return_output := BIN_OP_EQ_uxn_opcodes_h_l1564_c11_2493_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1543_l1540_l1568_l1564_l1558_l1551_l1548_DUPLICATE_ca74 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1543_l1540_l1568_l1564_l1558_l1551_l1548_DUPLICATE_ca74_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l1556_c32_cf58] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1556_c32_cf58_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1556_c32_cf58_left;
     BIN_OP_AND_uxn_opcodes_h_l1556_c32_cf58_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1556_c32_cf58_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1556_c32_cf58_return_output := BIN_OP_AND_uxn_opcodes_h_l1556_c32_cf58_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1551_l1564_DUPLICATE_f13a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1551_l1564_DUPLICATE_f13a_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1544_l1552_DUPLICATE_cbbe LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1544_l1552_DUPLICATE_cbbe_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1543_l1540_l1568_l1534_l1564_l1551_l1548_DUPLICATE_b24e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1543_l1540_l1568_l1534_l1564_l1551_l1548_DUPLICATE_b24e_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1540_l1551_l1543_l1548_DUPLICATE_b6ac LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1540_l1551_l1543_l1548_DUPLICATE_b6ac_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1558_c11_1ca3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1558_c11_1ca3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c11_1ca3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1558_c11_1ca3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c11_1ca3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c11_1ca3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1558_c11_1ca3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1548_c11_2002] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002_left;
     BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002_return_output := BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1562_c24_d291] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1562_c24_d291_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1543_l1540_l1534_l1558_l1548_DUPLICATE_7910 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1543_l1540_l1534_l1558_l1548_DUPLICATE_7910_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1556_c32_3046_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1556_c32_cf58_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1534_c1_f637_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c2_d076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1534_c2_d076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1534_c2_d076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1534_c2_d076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c2_d076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c2_d076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1534_c2_d076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1534_c2_d076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1534_c2_d076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1534_c6_ee7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_b681_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_b681_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_b681_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_b681_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_b681_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_b681_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1540_c7_b681_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1540_c7_b681_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1540_c7_b681_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1540_c11_9bcf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_0de5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1543_c7_0de5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_0de5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_0de5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1543_c7_0de5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1543_c7_0de5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1543_c7_0de5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1543_c11_b8ad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_2418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_2418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_2418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_2418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_2418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_2418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1548_c7_2418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1548_c7_2418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1548_c7_2418_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1548_c11_2002_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_ca37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1551_c7_ca37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1551_c7_ca37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_ca37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1551_c7_ca37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1551_c7_ca37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1551_c7_ca37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_8b79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c7_fd40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c11_1ca3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c7_fd40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c11_1ca3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c7_fd40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c11_1ca3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c7_fd40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c11_1ca3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1558_c7_fd40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1558_c11_1ca3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4b59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_2493_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4b59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_2493_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4b59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_2493_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4b59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1564_c11_2493_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8948_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_5e05_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8948_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1568_c11_5e05_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1552_c3_be49_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1544_l1552_DUPLICATE_cbbe_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1545_c3_c9eb_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1544_l1552_DUPLICATE_cbbe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1562_c24_d291_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1543_l1540_l1534_l1551_l1548_DUPLICATE_9a53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1543_l1540_l1534_l1551_l1548_DUPLICATE_9a53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1543_l1540_l1534_l1551_l1548_DUPLICATE_9a53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1543_l1540_l1534_l1551_l1548_DUPLICATE_9a53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1543_l1540_l1534_l1551_l1548_DUPLICATE_9a53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1543_l1540_l1568_l1564_l1558_l1551_l1548_DUPLICATE_ca74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1543_l1540_l1568_l1564_l1558_l1551_l1548_DUPLICATE_ca74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1543_l1540_l1568_l1564_l1558_l1551_l1548_DUPLICATE_ca74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1543_l1540_l1568_l1564_l1558_l1551_l1548_DUPLICATE_ca74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1543_l1540_l1568_l1564_l1558_l1551_l1548_DUPLICATE_ca74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4b59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1543_l1540_l1568_l1564_l1558_l1551_l1548_DUPLICATE_ca74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8948_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1543_l1540_l1568_l1564_l1558_l1551_l1548_DUPLICATE_ca74_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1543_l1540_l1534_l1558_l1548_DUPLICATE_7910_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1543_l1540_l1534_l1558_l1548_DUPLICATE_7910_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1543_l1540_l1534_l1558_l1548_DUPLICATE_7910_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1543_l1540_l1534_l1558_l1548_DUPLICATE_7910_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1543_l1540_l1534_l1558_l1548_DUPLICATE_7910_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1540_l1551_l1543_l1548_DUPLICATE_b6ac_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1540_l1551_l1543_l1548_DUPLICATE_b6ac_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1540_l1551_l1543_l1548_DUPLICATE_b6ac_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1540_l1551_l1543_l1548_DUPLICATE_b6ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1543_l1540_l1568_l1534_l1564_l1551_l1548_DUPLICATE_b24e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1543_l1540_l1568_l1534_l1564_l1551_l1548_DUPLICATE_b24e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1543_l1540_l1568_l1534_l1564_l1551_l1548_DUPLICATE_b24e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1543_l1540_l1568_l1534_l1564_l1551_l1548_DUPLICATE_b24e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1543_l1540_l1568_l1534_l1564_l1551_l1548_DUPLICATE_b24e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4b59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1543_l1540_l1568_l1534_l1564_l1551_l1548_DUPLICATE_b24e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8948_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1543_l1540_l1568_l1534_l1564_l1551_l1548_DUPLICATE_b24e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1551_l1564_DUPLICATE_f13a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4b59_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1551_l1564_DUPLICATE_f13a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1543_l1540_l1534_l1564_l1551_l1548_DUPLICATE_06e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1543_l1540_l1534_l1564_l1551_l1548_DUPLICATE_06e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1543_l1540_l1534_l1564_l1551_l1548_DUPLICATE_06e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1543_l1540_l1534_l1564_l1551_l1548_DUPLICATE_06e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1543_l1540_l1534_l1564_l1551_l1548_DUPLICATE_06e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4b59_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1543_l1540_l1534_l1564_l1551_l1548_DUPLICATE_06e4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1568_c7_8948] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8948_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8948_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8948_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8948_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8948_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8948_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8948_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8948_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1534_c1_f637] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1534_c1_f637_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1534_c1_f637_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1534_c1_f637_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1534_c1_f637_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1534_c1_f637_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1534_c1_f637_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1534_c1_f637_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1534_c1_f637_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1556_c32_3046] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1556_c32_3046_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1556_c32_3046_left;
     BIN_OP_GT_uxn_opcodes_h_l1556_c32_3046_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1556_c32_3046_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1556_c32_3046_return_output := BIN_OP_GT_uxn_opcodes_h_l1556_c32_3046_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1566_c24_4014] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1566_c24_4014_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1566_c34_490c_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1564_c7_4b59] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4b59_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4b59_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4b59_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4b59_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4b59_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4b59_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4b59_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4b59_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1568_c7_8948] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8948_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8948_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8948_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8948_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8948_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8948_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8948_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8948_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1558_c7_fd40] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c7_fd40_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c7_fd40_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1545_c3_c9eb] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1545_c3_c9eb_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1545_c3_c9eb_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1545_c3_c9eb_return_output := CONST_SL_8_uxn_opcodes_h_l1545_c3_c9eb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1551_c7_ca37] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1551_c7_ca37_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1551_c7_ca37_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1552_c3_be49] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1552_c3_be49_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1552_c3_be49_left;
     BIN_OP_OR_uxn_opcodes_h_l1552_c3_be49_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1552_c3_be49_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1552_c3_be49_return_output := BIN_OP_OR_uxn_opcodes_h_l1552_c3_be49_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1556_c32_34f0_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1556_c32_3046_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1553_c11_a0ea_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1552_c3_be49_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1552_c3_be49_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4b59_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1566_c24_4014_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1545_c3_c9eb_return_output;
     VAR_printf_uxn_opcodes_h_l1535_c3_2d36_uxn_opcodes_h_l1535_c3_2d36_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1534_c1_f637_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4b59_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1568_c7_8948_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4b59_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1568_c7_8948_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1564_c7_4b59_return_output;
     -- t16_MUX[uxn_opcodes_h_l1551_c7_ca37] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1551_c7_ca37_cond <= VAR_t16_MUX_uxn_opcodes_h_l1551_c7_ca37_cond;
     t16_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue;
     t16_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output := t16_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1553_c11_a0ea] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1553_c11_a0ea_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1553_c11_a0ea_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1553_c11_a0ea_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1553_c11_a0ea_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1553_c11_a0ea_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1553_c11_a0ea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1564_c7_4b59] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4b59_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4b59_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4b59_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4b59_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4b59_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4b59_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4b59_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4b59_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1558_c7_fd40] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c7_fd40_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c7_fd40_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1548_c7_2418] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_2418_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_2418_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_2418_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_2418_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1564_c7_4b59] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4b59_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4b59_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4b59_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4b59_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4b59_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4b59_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4b59_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4b59_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1564_c7_4b59] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4b59_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4b59_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4b59_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4b59_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4b59_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4b59_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4b59_return_output := result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4b59_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1551_c7_ca37] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output;

     -- printf_uxn_opcodes_h_l1535_c3_2d36[uxn_opcodes_h_l1535_c3_2d36] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1535_c3_2d36_uxn_opcodes_h_l1535_c3_2d36_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1535_c3_2d36_uxn_opcodes_h_l1535_c3_2d36_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l1556_c32_34f0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1556_c32_34f0_cond <= VAR_MUX_uxn_opcodes_h_l1556_c32_34f0_cond;
     MUX_uxn_opcodes_h_l1556_c32_34f0_iftrue <= VAR_MUX_uxn_opcodes_h_l1556_c32_34f0_iftrue;
     MUX_uxn_opcodes_h_l1556_c32_34f0_iffalse <= VAR_MUX_uxn_opcodes_h_l1556_c32_34f0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1556_c32_34f0_return_output := MUX_uxn_opcodes_h_l1556_c32_34f0_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l1553_c3_6cdb := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1553_c11_a0ea_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue := VAR_MUX_uxn_opcodes_h_l1556_c32_34f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1564_c7_4b59_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1548_c7_2418_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1564_c7_4b59_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1564_c7_4b59_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue := VAR_tmp16_uxn_opcodes_h_l1553_c3_6cdb;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1551_c7_ca37] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1548_c7_2418] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_2418_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_2418_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_2418_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_2418_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1558_c7_fd40] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1558_c7_fd40_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1558_c7_fd40_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output := result_stack_value_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1551_c7_ca37] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1551_c7_ca37_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1551_c7_ca37_cond;
     tmp16_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output := tmp16_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1558_c7_fd40] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1558_c7_fd40_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c7_fd40_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1543_c7_0de5] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1543_c7_0de5_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1543_c7_0de5_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1558_c7_fd40] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1558_c7_fd40_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c7_fd40_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c7_fd40_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c7_fd40_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1551_c7_ca37] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_ca37_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_ca37_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output;

     -- t16_MUX[uxn_opcodes_h_l1548_c7_2418] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1548_c7_2418_cond <= VAR_t16_MUX_uxn_opcodes_h_l1548_c7_2418_cond;
     t16_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue;
     t16_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1548_c7_2418_return_output := t16_MUX_uxn_opcodes_h_l1548_c7_2418_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1548_c7_2418_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1558_c7_fd40_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1548_c7_2418_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1551_c7_ca37] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1551_c7_ca37_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1551_c7_ca37_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output := result_stack_value_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1551_c7_ca37] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_ca37_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_ca37_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output;

     -- t16_MUX[uxn_opcodes_h_l1543_c7_0de5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1543_c7_0de5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1543_c7_0de5_cond;
     t16_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue;
     t16_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output := t16_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1540_c7_b681] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_b681_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_b681_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_b681_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_b681_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1548_c7_2418] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_2418_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_2418_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_2418_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_2418_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1548_c7_2418] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_2418_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_2418_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_2418_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_2418_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1551_c7_ca37] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1551_c7_ca37_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1551_c7_ca37_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1551_c7_ca37_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1551_c7_ca37_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1543_c7_0de5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1548_c7_2418] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1548_c7_2418_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1548_c7_2418_cond;
     tmp16_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1548_c7_2418_return_output := tmp16_MUX_uxn_opcodes_h_l1548_c7_2418_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1540_c7_b681_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1548_c7_2418_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1548_c7_2418_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1551_c7_ca37_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1548_c7_2418_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1540_c7_b681] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_b681_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_b681_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_b681_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_b681_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1548_c7_2418] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_2418_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_2418_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_2418_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_2418_return_output;

     -- t16_MUX[uxn_opcodes_h_l1540_c7_b681] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1540_c7_b681_cond <= VAR_t16_MUX_uxn_opcodes_h_l1540_c7_b681_cond;
     t16_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue;
     t16_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1540_c7_b681_return_output := t16_MUX_uxn_opcodes_h_l1540_c7_b681_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1543_c7_0de5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1548_c7_2418] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_2418_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_2418_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_2418_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_2418_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1548_c7_2418] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1548_c7_2418_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1548_c7_2418_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1548_c7_2418_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1548_c7_2418_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1548_c7_2418_return_output := result_stack_value_MUX_uxn_opcodes_h_l1548_c7_2418_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1543_c7_0de5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1543_c7_0de5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1543_c7_0de5_cond;
     tmp16_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output := tmp16_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1543_c7_0de5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_0de5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_0de5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1534_c2_d076] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1534_c2_d076_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1534_c2_d076_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1534_c2_d076_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1534_c2_d076_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1548_c7_2418_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1540_c7_b681_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1548_c7_2418_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1548_c7_2418_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1540_c7_b681_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1540_c7_b681] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1540_c7_b681_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1540_c7_b681_cond;
     tmp16_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1540_c7_b681_return_output := tmp16_MUX_uxn_opcodes_h_l1540_c7_b681_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1543_c7_0de5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_0de5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_0de5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1534_c2_d076] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1534_c2_d076_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1534_c2_d076_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1534_c2_d076_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1534_c2_d076_return_output;

     -- t16_MUX[uxn_opcodes_h_l1534_c2_d076] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1534_c2_d076_cond <= VAR_t16_MUX_uxn_opcodes_h_l1534_c2_d076_cond;
     t16_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue;
     t16_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1534_c2_d076_return_output := t16_MUX_uxn_opcodes_h_l1534_c2_d076_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1540_c7_b681] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_b681_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_b681_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_b681_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_b681_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1543_c7_0de5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_0de5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_0de5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1540_c7_b681] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_b681_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_b681_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_b681_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_b681_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1543_c7_0de5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1543_c7_0de5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1543_c7_0de5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1543_c7_0de5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1543_c7_0de5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output := result_stack_value_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1540_c7_b681_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1540_c7_b681_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1543_c7_0de5_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1534_c2_d076_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1540_c7_b681_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1540_c7_b681] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_b681_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_b681_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_b681_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_b681_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1540_c7_b681] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_b681_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_b681_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_b681_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_b681_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1534_c2_d076] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c2_d076_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c2_d076_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c2_d076_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c2_d076_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1534_c2_d076] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c2_d076_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c2_d076_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c2_d076_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c2_d076_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1540_c7_b681] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1540_c7_b681_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1540_c7_b681_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1540_c7_b681_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1540_c7_b681_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1540_c7_b681_return_output := result_stack_value_MUX_uxn_opcodes_h_l1540_c7_b681_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1534_c2_d076] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1534_c2_d076_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1534_c2_d076_cond;
     tmp16_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1534_c2_d076_return_output := tmp16_MUX_uxn_opcodes_h_l1534_c2_d076_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1540_c7_b681_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1540_c7_b681_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1540_c7_b681_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1534_c2_d076_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1534_c2_d076] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1534_c2_d076_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1534_c2_d076_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1534_c2_d076_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1534_c2_d076_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1534_c2_d076] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1534_c2_d076_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c2_d076_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c2_d076_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1534_c2_d076_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1534_c2_d076] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1534_c2_d076_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1534_c2_d076_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1534_c2_d076_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1534_c2_d076_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1534_c2_d076_return_output := result_stack_value_MUX_uxn_opcodes_h_l1534_c2_d076_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1573_l1530_DUPLICATE_5e3b LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1573_l1530_DUPLICATE_5e3b_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1534_c2_d076_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1534_c2_d076_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1534_c2_d076_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1534_c2_d076_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1534_c2_d076_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1534_c2_d076_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1534_c2_d076_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1573_l1530_DUPLICATE_5e3b_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l1573_l1530_DUPLICATE_5e3b_return_output;
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
