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
-- Submodules: 71
entity nip2_0CLK_50a1b8d0 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end nip2_0CLK_50a1b8d0;
architecture arch of nip2_0CLK_50a1b8d0 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2527_c6_e26e]
signal BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2527_c1_3006]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2527_c1_3006_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2527_c1_3006_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2527_c1_3006_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2527_c1_3006_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2527_c2_41a0]
signal t16_MUX_uxn_opcodes_h_l2527_c2_41a0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2527_c2_41a0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2527_c2_41a0]
signal result_stack_value_MUX_uxn_opcodes_h_l2527_c2_41a0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2527_c2_41a0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2527_c2_41a0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2527_c2_41a0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2527_c2_41a0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c2_41a0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2527_c2_41a0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2527_c2_41a0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2527_c2_41a0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2527_c2_41a0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2528_c3_5fd5[uxn_opcodes_h_l2528_c3_5fd5]
signal printf_uxn_opcodes_h_l2528_c3_5fd5_uxn_opcodes_h_l2528_c3_5fd5_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2533_c11_aca0]
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_aca0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_aca0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_aca0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2533_c7_ce3d]
signal t16_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2533_c7_ce3d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2533_c7_ce3d]
signal result_stack_value_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2533_c7_ce3d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2533_c7_ce3d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2533_c7_ce3d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2533_c7_ce3d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2533_c7_ce3d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2536_c11_24a5]
signal BIN_OP_EQ_uxn_opcodes_h_l2536_c11_24a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2536_c11_24a5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2536_c11_24a5_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2536_c7_026d]
signal t16_MUX_uxn_opcodes_h_l2536_c7_026d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2536_c7_026d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2536_c7_026d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2536_c7_026d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2536_c7_026d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2536_c7_026d]
signal result_stack_value_MUX_uxn_opcodes_h_l2536_c7_026d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2536_c7_026d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2536_c7_026d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2536_c7_026d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2536_c7_026d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2536_c7_026d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2536_c7_026d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2536_c7_026d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2536_c7_026d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2536_c7_026d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2536_c7_026d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2536_c7_026d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2536_c7_026d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2536_c7_026d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2536_c7_026d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2536_c7_026d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2536_c7_026d_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2538_c3_1e22]
signal CONST_SL_8_uxn_opcodes_h_l2538_c3_1e22_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2538_c3_1e22_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2541_c11_32a1]
signal BIN_OP_EQ_uxn_opcodes_h_l2541_c11_32a1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2541_c11_32a1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2541_c11_32a1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2541_c7_8c87]
signal t16_MUX_uxn_opcodes_h_l2541_c7_8c87_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2541_c7_8c87]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2541_c7_8c87]
signal result_stack_value_MUX_uxn_opcodes_h_l2541_c7_8c87_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2541_c7_8c87]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_8c87_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2541_c7_8c87]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2541_c7_8c87]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_8c87_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2541_c7_8c87]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_8c87_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2541_c7_8c87]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_8c87_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2544_c11_35d3]
signal BIN_OP_EQ_uxn_opcodes_h_l2544_c11_35d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2544_c11_35d3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2544_c11_35d3_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2544_c7_aafc]
signal t16_MUX_uxn_opcodes_h_l2544_c7_aafc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2544_c7_aafc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2544_c7_aafc]
signal result_stack_value_MUX_uxn_opcodes_h_l2544_c7_aafc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2544_c7_aafc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_aafc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2544_c7_aafc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2544_c7_aafc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_aafc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2544_c7_aafc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_aafc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2544_c7_aafc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_aafc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2545_c3_127c]
signal BIN_OP_OR_uxn_opcodes_h_l2545_c3_127c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2545_c3_127c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2545_c3_127c_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2548_c32_0711]
signal BIN_OP_AND_uxn_opcodes_h_l2548_c32_0711_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2548_c32_0711_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2548_c32_0711_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2548_c32_fff4]
signal BIN_OP_GT_uxn_opcodes_h_l2548_c32_fff4_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2548_c32_fff4_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2548_c32_fff4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2548_c32_4a1e]
signal MUX_uxn_opcodes_h_l2548_c32_4a1e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2548_c32_4a1e_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2548_c32_4a1e_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2548_c32_4a1e_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2550_c11_2aab]
signal BIN_OP_EQ_uxn_opcodes_h_l2550_c11_2aab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2550_c11_2aab_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2550_c11_2aab_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2550_c7_6342]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_6342_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_6342_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2550_c7_6342]
signal result_stack_value_MUX_uxn_opcodes_h_l2550_c7_6342_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2550_c7_6342_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2550_c7_6342]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_6342_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_6342_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2550_c7_6342]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_6342_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_6342_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2550_c7_6342]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_6342_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_6342_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2556_c11_21c2]
signal BIN_OP_EQ_uxn_opcodes_h_l2556_c11_21c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2556_c11_21c2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2556_c11_21c2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2556_c7_8607]
signal result_stack_value_MUX_uxn_opcodes_h_l2556_c7_8607_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2556_c7_8607_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2556_c7_8607_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2556_c7_8607_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2556_c7_8607]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8607_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8607_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8607_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8607_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2556_c7_8607]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8607_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8607_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8607_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8607_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2556_c7_8607]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8607_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8607_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8607_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8607_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2558_c34_4305]
signal CONST_SR_8_uxn_opcodes_h_l2558_c34_4305_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2558_c34_4305_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2560_c11_12c9]
signal BIN_OP_EQ_uxn_opcodes_h_l2560_c11_12c9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2560_c11_12c9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2560_c11_12c9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2560_c7_ac02]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_ac02_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_ac02_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_ac02_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_ac02_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2560_c7_ac02]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_ac02_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_ac02_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_ac02_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_ac02_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_287e( ref_toks_0 : opcode_result_t;
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
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e
BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e_left,
BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e_right,
BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2527_c1_3006
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2527_c1_3006 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2527_c1_3006_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2527_c1_3006_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2527_c1_3006_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2527_c1_3006_return_output);

-- t16_MUX_uxn_opcodes_h_l2527_c2_41a0
t16_MUX_uxn_opcodes_h_l2527_c2_41a0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2527_c2_41a0_cond,
t16_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue,
t16_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse,
t16_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c2_41a0
result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c2_41a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2527_c2_41a0
result_stack_value_MUX_uxn_opcodes_h_l2527_c2_41a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2527_c2_41a0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2527_c2_41a0
result_is_stack_write_MUX_uxn_opcodes_h_l2527_c2_41a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2527_c2_41a0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c2_41a0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c2_41a0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c2_41a0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c2_41a0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c2_41a0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2527_c2_41a0
result_is_opc_done_MUX_uxn_opcodes_h_l2527_c2_41a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2527_c2_41a0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2527_c2_41a0
result_is_stack_read_MUX_uxn_opcodes_h_l2527_c2_41a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2527_c2_41a0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output);

-- printf_uxn_opcodes_h_l2528_c3_5fd5_uxn_opcodes_h_l2528_c3_5fd5
printf_uxn_opcodes_h_l2528_c3_5fd5_uxn_opcodes_h_l2528_c3_5fd5 : entity work.printf_uxn_opcodes_h_l2528_c3_5fd5_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2528_c3_5fd5_uxn_opcodes_h_l2528_c3_5fd5_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2533_c11_aca0
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_aca0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_aca0_left,
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_aca0_right,
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_aca0_return_output);

-- t16_MUX_uxn_opcodes_h_l2533_c7_ce3d
t16_MUX_uxn_opcodes_h_l2533_c7_ce3d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond,
t16_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue,
t16_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse,
t16_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d
result_is_sp_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2533_c7_ce3d
result_stack_value_MUX_uxn_opcodes_h_l2533_c7_ce3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_ce3d
result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_ce3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_ce3d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_ce3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_ce3d
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_ce3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2533_c7_ce3d
result_is_stack_read_MUX_uxn_opcodes_h_l2533_c7_ce3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2536_c11_24a5
BIN_OP_EQ_uxn_opcodes_h_l2536_c11_24a5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2536_c11_24a5_left,
BIN_OP_EQ_uxn_opcodes_h_l2536_c11_24a5_right,
BIN_OP_EQ_uxn_opcodes_h_l2536_c11_24a5_return_output);

-- t16_MUX_uxn_opcodes_h_l2536_c7_026d
t16_MUX_uxn_opcodes_h_l2536_c7_026d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2536_c7_026d_cond,
t16_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue,
t16_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse,
t16_MUX_uxn_opcodes_h_l2536_c7_026d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2536_c7_026d
result_is_sp_shift_MUX_uxn_opcodes_h_l2536_c7_026d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2536_c7_026d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2536_c7_026d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2536_c7_026d
result_stack_value_MUX_uxn_opcodes_h_l2536_c7_026d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2536_c7_026d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2536_c7_026d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2536_c7_026d
result_is_stack_write_MUX_uxn_opcodes_h_l2536_c7_026d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2536_c7_026d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2536_c7_026d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2536_c7_026d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2536_c7_026d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2536_c7_026d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2536_c7_026d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2536_c7_026d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2536_c7_026d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2536_c7_026d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2536_c7_026d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2536_c7_026d
result_is_opc_done_MUX_uxn_opcodes_h_l2536_c7_026d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2536_c7_026d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2536_c7_026d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2536_c7_026d
result_is_stack_read_MUX_uxn_opcodes_h_l2536_c7_026d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2536_c7_026d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2536_c7_026d_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2538_c3_1e22
CONST_SL_8_uxn_opcodes_h_l2538_c3_1e22 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2538_c3_1e22_x,
CONST_SL_8_uxn_opcodes_h_l2538_c3_1e22_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2541_c11_32a1
BIN_OP_EQ_uxn_opcodes_h_l2541_c11_32a1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2541_c11_32a1_left,
BIN_OP_EQ_uxn_opcodes_h_l2541_c11_32a1_right,
BIN_OP_EQ_uxn_opcodes_h_l2541_c11_32a1_return_output);

-- t16_MUX_uxn_opcodes_h_l2541_c7_8c87
t16_MUX_uxn_opcodes_h_l2541_c7_8c87 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2541_c7_8c87_cond,
t16_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue,
t16_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse,
t16_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_8c87
result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_8c87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2541_c7_8c87
result_stack_value_MUX_uxn_opcodes_h_l2541_c7_8c87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2541_c7_8c87_cond,
result_stack_value_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_8c87
result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_8c87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_8c87_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_8c87
result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_8c87 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_8c87
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_8c87 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_8c87_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_8c87
result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_8c87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_8c87_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_8c87
result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_8c87 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_8c87_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2544_c11_35d3
BIN_OP_EQ_uxn_opcodes_h_l2544_c11_35d3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2544_c11_35d3_left,
BIN_OP_EQ_uxn_opcodes_h_l2544_c11_35d3_right,
BIN_OP_EQ_uxn_opcodes_h_l2544_c11_35d3_return_output);

-- t16_MUX_uxn_opcodes_h_l2544_c7_aafc
t16_MUX_uxn_opcodes_h_l2544_c7_aafc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2544_c7_aafc_cond,
t16_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue,
t16_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse,
t16_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_aafc
result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_aafc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2544_c7_aafc
result_stack_value_MUX_uxn_opcodes_h_l2544_c7_aafc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2544_c7_aafc_cond,
result_stack_value_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_aafc
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_aafc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_aafc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_aafc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_aafc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_aafc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_aafc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_aafc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_aafc
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_aafc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_aafc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_aafc
result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_aafc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_aafc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2545_c3_127c
BIN_OP_OR_uxn_opcodes_h_l2545_c3_127c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2545_c3_127c_left,
BIN_OP_OR_uxn_opcodes_h_l2545_c3_127c_right,
BIN_OP_OR_uxn_opcodes_h_l2545_c3_127c_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2548_c32_0711
BIN_OP_AND_uxn_opcodes_h_l2548_c32_0711 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2548_c32_0711_left,
BIN_OP_AND_uxn_opcodes_h_l2548_c32_0711_right,
BIN_OP_AND_uxn_opcodes_h_l2548_c32_0711_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2548_c32_fff4
BIN_OP_GT_uxn_opcodes_h_l2548_c32_fff4 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2548_c32_fff4_left,
BIN_OP_GT_uxn_opcodes_h_l2548_c32_fff4_right,
BIN_OP_GT_uxn_opcodes_h_l2548_c32_fff4_return_output);

-- MUX_uxn_opcodes_h_l2548_c32_4a1e
MUX_uxn_opcodes_h_l2548_c32_4a1e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2548_c32_4a1e_cond,
MUX_uxn_opcodes_h_l2548_c32_4a1e_iftrue,
MUX_uxn_opcodes_h_l2548_c32_4a1e_iffalse,
MUX_uxn_opcodes_h_l2548_c32_4a1e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2550_c11_2aab
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_2aab : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_2aab_left,
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_2aab_right,
BIN_OP_EQ_uxn_opcodes_h_l2550_c11_2aab_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_6342
result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_6342 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_6342_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_6342_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2550_c7_6342
result_stack_value_MUX_uxn_opcodes_h_l2550_c7_6342 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2550_c7_6342_cond,
result_stack_value_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2550_c7_6342_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_6342
result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_6342 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_6342_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_6342_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_6342
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_6342 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_6342_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_6342_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_6342
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_6342 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_6342_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_6342_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2556_c11_21c2
BIN_OP_EQ_uxn_opcodes_h_l2556_c11_21c2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2556_c11_21c2_left,
BIN_OP_EQ_uxn_opcodes_h_l2556_c11_21c2_right,
BIN_OP_EQ_uxn_opcodes_h_l2556_c11_21c2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2556_c7_8607
result_stack_value_MUX_uxn_opcodes_h_l2556_c7_8607 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2556_c7_8607_cond,
result_stack_value_MUX_uxn_opcodes_h_l2556_c7_8607_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2556_c7_8607_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2556_c7_8607_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8607
result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8607 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8607_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8607_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8607_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8607_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8607
result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8607 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8607_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8607_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8607_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8607_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8607
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8607 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8607_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8607_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8607_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8607_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2558_c34_4305
CONST_SR_8_uxn_opcodes_h_l2558_c34_4305 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2558_c34_4305_x,
CONST_SR_8_uxn_opcodes_h_l2558_c34_4305_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2560_c11_12c9
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_12c9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_12c9_left,
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_12c9_right,
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_12c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_ac02
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_ac02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_ac02_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_ac02_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_ac02_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_ac02_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_ac02
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_ac02 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_ac02_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_ac02_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_ac02_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_ac02_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2527_c1_3006_return_output,
 t16_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2533_c11_aca0_return_output,
 t16_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2536_c11_24a5_return_output,
 t16_MUX_uxn_opcodes_h_l2536_c7_026d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2536_c7_026d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2536_c7_026d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2536_c7_026d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2536_c7_026d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2536_c7_026d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2536_c7_026d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2536_c7_026d_return_output,
 CONST_SL_8_uxn_opcodes_h_l2538_c3_1e22_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2541_c11_32a1_return_output,
 t16_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2544_c11_35d3_return_output,
 t16_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2545_c3_127c_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2548_c32_0711_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2548_c32_fff4_return_output,
 MUX_uxn_opcodes_h_l2548_c32_4a1e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2550_c11_2aab_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_6342_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2550_c7_6342_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_6342_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_6342_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_6342_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2556_c11_21c2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2556_c7_8607_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8607_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8607_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8607_return_output,
 CONST_SR_8_uxn_opcodes_h_l2558_c34_4305_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2560_c11_12c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_ac02_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_ac02_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2527_c1_3006_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2527_c1_3006_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2527_c1_3006_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2527_c1_3006_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2527_c2_41a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2527_c2_41a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c2_41a0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_aff4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c2_41a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c2_41a0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2527_c2_41a0_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2528_c3_5fd5_uxn_opcodes_h_l2528_c3_5fd5_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_aca0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_aca0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_aca0_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2536_c7_026d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2536_c7_026d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2536_c7_026d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2536_c7_026d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2536_c7_026d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2534_c3_66b1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2536_c7_026d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2536_c7_026d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2536_c7_026d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2536_c11_24a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2536_c11_24a5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2536_c11_24a5_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2536_c7_026d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2536_c7_026d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2536_c7_026d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2536_c7_026d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2536_c7_026d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2539_c3_469a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2536_c7_026d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2536_c7_026d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2536_c7_026d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2538_c3_1e22_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2538_c3_1e22_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_32a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_32a1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_32a1_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2541_c7_8c87_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2541_c7_8c87_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_8c87_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2542_c3_ab18 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_8c87_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_8c87_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_8c87_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_35d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_35d3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_35d3_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2544_c7_aafc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_6342_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_6342_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_aafc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_6342_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_aafc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_6342_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_aafc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_6342_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_aafc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_aafc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2545_c3_127c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2545_c3_127c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2545_c3_127c_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2548_c32_4a1e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2548_c32_4a1e_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2548_c32_4a1e_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2548_c32_0711_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2548_c32_0711_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2548_c32_0711_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2548_c32_fff4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2548_c32_fff4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2548_c32_fff4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2548_c32_4a1e_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_2aab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_2aab_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_2aab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_6342_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2556_c7_8607_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_6342_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8607_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_6342_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2553_c3_390e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8607_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_6342_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8607_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_6342_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2554_c24_9e4d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_21c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_21c2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_21c2_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2556_c7_8607_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2556_c7_8607_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2556_c7_8607_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8607_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8607_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_ac02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8607_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8607_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8607_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_ac02_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8607_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8607_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2557_c3_116c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8607_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8607_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2558_c34_4305_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2558_c34_4305_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2558_c24_435d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_12c9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_12c9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_12c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_ac02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_ac02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_ac02_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_ac02_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_ac02_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_ac02_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2527_l2550_DUPLICATE_8ab7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2527_l2556_l2544_DUPLICATE_b1a9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2560_l2527_l2556_l2544_DUPLICATE_d7de_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2527_l2544_DUPLICATE_71e2_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2560_l2556_l2550_l2544_DUPLICATE_41f5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2541_l2533_l2544_l2536_DUPLICATE_0a7e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2545_l2537_DUPLICATE_b986_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2556_l2544_DUPLICATE_9b39_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2565_l2523_DUPLICATE_bc12_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2557_c3_116c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8607_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2557_c3_116c;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2534_c3_66b1 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2534_c3_66b1;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2548_c32_0711_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l2548_c32_4a1e_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2542_c3_ab18 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2542_c3_ab18;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_32a1_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_ac02_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2536_c11_24a5_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_12c9_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_35d3_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_aca0_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2548_c32_fff4_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2553_c3_390e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2553_c3_390e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2527_c1_3006_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2539_c3_469a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2539_c3_469a;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_ac02_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_21c2_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_aff4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_aff4;
     VAR_MUX_uxn_opcodes_h_l2548_c32_4a1e_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_2aab_right := to_unsigned(5, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2527_c1_3006_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2548_c32_0711_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_aca0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2536_c11_24a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_32a1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_35d3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_2aab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_21c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_12c9_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2545_c3_127c_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2558_c34_4305_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2533_c11_aca0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2533_c11_aca0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_aca0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2533_c11_aca0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_aca0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_aca0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2533_c11_aca0_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2554_c24_9e4d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2554_c24_9e4d_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2527_l2544_DUPLICATE_71e2 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2527_l2544_DUPLICATE_71e2_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2541_l2533_l2544_l2536_DUPLICATE_0a7e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2541_l2533_l2544_l2536_DUPLICATE_0a7e_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2560_l2527_l2556_l2544_DUPLICATE_d7de LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2560_l2527_l2556_l2544_DUPLICATE_d7de_return_output := result.is_stack_write;

     -- BIN_OP_AND[uxn_opcodes_h_l2548_c32_0711] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2548_c32_0711_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2548_c32_0711_left;
     BIN_OP_AND_uxn_opcodes_h_l2548_c32_0711_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2548_c32_0711_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2548_c32_0711_return_output := BIN_OP_AND_uxn_opcodes_h_l2548_c32_0711_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2550_c11_2aab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2550_c11_2aab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_2aab_left;
     BIN_OP_EQ_uxn_opcodes_h_l2550_c11_2aab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_2aab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_2aab_return_output := BIN_OP_EQ_uxn_opcodes_h_l2550_c11_2aab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2541_c11_32a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2541_c11_32a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_32a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2541_c11_32a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_32a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_32a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2541_c11_32a1_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2545_l2537_DUPLICATE_b986 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2545_l2537_DUPLICATE_b986_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2527_l2550_DUPLICATE_8ab7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2527_l2550_DUPLICATE_8ab7_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2536_c11_24a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2536_c11_24a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2536_c11_24a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2536_c11_24a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2536_c11_24a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2536_c11_24a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2536_c11_24a5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2544_c11_35d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2544_c11_35d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_35d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2544_c11_35d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_35d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_35d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2544_c11_35d3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2527_c6_e26e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2560_l2556_l2550_l2544_DUPLICATE_41f5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2560_l2556_l2550_l2544_DUPLICATE_41f5_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2556_c11_21c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2556_c11_21c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_21c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2556_c11_21c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_21c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_21c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2556_c11_21c2_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2556_l2544_DUPLICATE_9b39 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2556_l2544_DUPLICATE_9b39_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l2558_c34_4305] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2558_c34_4305_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2558_c34_4305_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2558_c34_4305_return_output := CONST_SR_8_uxn_opcodes_h_l2558_c34_4305_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2560_c11_12c9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2560_c11_12c9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_12c9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2560_c11_12c9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_12c9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_12c9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2560_c11_12c9_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2527_l2556_l2544_DUPLICATE_b1a9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2527_l2556_l2544_DUPLICATE_b1a9_return_output := result.stack_value;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2548_c32_fff4_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2548_c32_0711_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2527_c1_3006_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c2_41a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2527_c2_41a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c2_41a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c2_41a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2527_c2_41a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2527_c2_41a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2527_c6_e26e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_aca0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_aca0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_aca0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_aca0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_aca0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_aca0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_aca0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_aca0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2536_c7_026d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2536_c11_24a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2536_c7_026d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2536_c11_24a5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2536_c7_026d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2536_c11_24a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2536_c7_026d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2536_c11_24a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2536_c7_026d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2536_c11_24a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2536_c7_026d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2536_c11_24a5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2536_c7_026d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2536_c11_24a5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2536_c7_026d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2536_c11_24a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_8c87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_32a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_32a1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_8c87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_32a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_8c87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_32a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_32a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_8c87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_32a1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2541_c7_8c87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_32a1_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2541_c7_8c87_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2541_c11_32a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_aafc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_35d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_35d3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_aafc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_35d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_aafc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_35d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_35d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_aafc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_35d3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_aafc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_35d3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2544_c7_aafc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2544_c11_35d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_6342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_2aab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_6342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_2aab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_6342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_2aab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_6342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_2aab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_6342_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2550_c11_2aab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8607_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_21c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8607_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_21c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8607_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_21c2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2556_c7_8607_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2556_c11_21c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_ac02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_12c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_ac02_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_12c9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2545_c3_127c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2545_l2537_DUPLICATE_b986_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2538_c3_1e22_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2545_l2537_DUPLICATE_b986_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2554_c24_9e4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2527_l2544_DUPLICATE_71e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2527_l2544_DUPLICATE_71e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2527_l2544_DUPLICATE_71e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2527_l2544_DUPLICATE_71e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2527_l2544_DUPLICATE_71e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2560_l2556_l2550_l2544_DUPLICATE_41f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2560_l2556_l2550_l2544_DUPLICATE_41f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2560_l2556_l2550_l2544_DUPLICATE_41f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2560_l2556_l2550_l2544_DUPLICATE_41f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2560_l2556_l2550_l2544_DUPLICATE_41f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8607_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2560_l2556_l2550_l2544_DUPLICATE_41f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_ac02_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2560_l2556_l2550_l2544_DUPLICATE_41f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2527_l2550_DUPLICATE_8ab7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2527_l2550_DUPLICATE_8ab7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2527_l2550_DUPLICATE_8ab7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2527_l2550_DUPLICATE_8ab7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2527_l2550_DUPLICATE_8ab7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2541_l2533_l2544_l2536_DUPLICATE_0a7e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2541_l2533_l2544_l2536_DUPLICATE_0a7e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2541_l2533_l2544_l2536_DUPLICATE_0a7e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2541_l2533_l2544_l2536_DUPLICATE_0a7e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2560_l2527_l2556_l2544_DUPLICATE_d7de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2560_l2527_l2556_l2544_DUPLICATE_d7de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2560_l2527_l2556_l2544_DUPLICATE_d7de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2560_l2527_l2556_l2544_DUPLICATE_d7de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2560_l2527_l2556_l2544_DUPLICATE_d7de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8607_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2560_l2527_l2556_l2544_DUPLICATE_d7de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_ac02_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2560_l2527_l2556_l2544_DUPLICATE_d7de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2556_l2544_DUPLICATE_9b39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8607_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2556_l2544_DUPLICATE_9b39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2527_l2556_l2544_DUPLICATE_b1a9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2527_l2556_l2544_DUPLICATE_b1a9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2527_l2556_l2544_DUPLICATE_b1a9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2527_l2556_l2544_DUPLICATE_b1a9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2527_l2556_l2544_DUPLICATE_b1a9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2556_c7_8607_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2541_l2536_l2533_l2527_l2556_l2544_DUPLICATE_b1a9_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2550_c7_6342] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_6342_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_6342_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_6342_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_6342_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2545_c3_127c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2545_c3_127c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2545_c3_127c_left;
     BIN_OP_OR_uxn_opcodes_h_l2545_c3_127c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2545_c3_127c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2545_c3_127c_return_output := BIN_OP_OR_uxn_opcodes_h_l2545_c3_127c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2560_c7_ac02] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_ac02_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_ac02_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_ac02_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_ac02_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_ac02_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_ac02_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_ac02_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_ac02_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2560_c7_ac02] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_ac02_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_ac02_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_ac02_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_ac02_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_ac02_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_ac02_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_ac02_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_ac02_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2548_c32_fff4] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2548_c32_fff4_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2548_c32_fff4_left;
     BIN_OP_GT_uxn_opcodes_h_l2548_c32_fff4_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2548_c32_fff4_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2548_c32_fff4_return_output := BIN_OP_GT_uxn_opcodes_h_l2548_c32_fff4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2556_c7_8607] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8607_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8607_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8607_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8607_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8607_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8607_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8607_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8607_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2538_c3_1e22] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2538_c3_1e22_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2538_c3_1e22_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2538_c3_1e22_return_output := CONST_SL_8_uxn_opcodes_h_l2538_c3_1e22_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2558_c24_435d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2558_c24_435d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2558_c34_4305_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2527_c1_3006] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2527_c1_3006_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2527_c1_3006_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2527_c1_3006_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2527_c1_3006_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2527_c1_3006_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2527_c1_3006_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2527_c1_3006_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2527_c1_3006_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2544_c7_aafc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_aafc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_aafc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2548_c32_4a1e_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2548_c32_fff4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2545_c3_127c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2556_c7_8607_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2558_c24_435d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2538_c3_1e22_return_output;
     VAR_printf_uxn_opcodes_h_l2528_c3_5fd5_uxn_opcodes_h_l2528_c3_5fd5_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2527_c1_3006_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8607_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_ac02_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2550_c7_6342_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8607_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_ac02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2556_c7_8607_return_output;
     -- t16_MUX[uxn_opcodes_h_l2544_c7_aafc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2544_c7_aafc_cond <= VAR_t16_MUX_uxn_opcodes_h_l2544_c7_aafc_cond;
     t16_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue;
     t16_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output := t16_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output;

     -- MUX[uxn_opcodes_h_l2548_c32_4a1e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2548_c32_4a1e_cond <= VAR_MUX_uxn_opcodes_h_l2548_c32_4a1e_cond;
     MUX_uxn_opcodes_h_l2548_c32_4a1e_iftrue <= VAR_MUX_uxn_opcodes_h_l2548_c32_4a1e_iftrue;
     MUX_uxn_opcodes_h_l2548_c32_4a1e_iffalse <= VAR_MUX_uxn_opcodes_h_l2548_c32_4a1e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2548_c32_4a1e_return_output := MUX_uxn_opcodes_h_l2548_c32_4a1e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2556_c7_8607] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8607_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8607_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8607_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8607_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8607_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8607_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8607_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8607_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2544_c7_aafc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2556_c7_8607] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8607_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8607_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8607_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8607_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8607_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8607_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8607_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8607_return_output;

     -- printf_uxn_opcodes_h_l2528_c3_5fd5[uxn_opcodes_h_l2528_c3_5fd5] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2528_c3_5fd5_uxn_opcodes_h_l2528_c3_5fd5_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2528_c3_5fd5_uxn_opcodes_h_l2528_c3_5fd5_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l2556_c7_8607] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2556_c7_8607_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2556_c7_8607_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2556_c7_8607_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2556_c7_8607_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2556_c7_8607_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2556_c7_8607_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2556_c7_8607_return_output := result_stack_value_MUX_uxn_opcodes_h_l2556_c7_8607_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2541_c7_8c87] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_8c87_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_8c87_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2550_c7_6342] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_6342_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_6342_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_6342_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_6342_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue := VAR_MUX_uxn_opcodes_h_l2548_c32_4a1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2556_c7_8607_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2556_c7_8607_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2550_c7_6342_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2556_c7_8607_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2544_c7_aafc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_aafc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_aafc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2550_c7_6342] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_6342_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_6342_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_6342_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_6342_return_output;

     -- t16_MUX[uxn_opcodes_h_l2541_c7_8c87] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2541_c7_8c87_cond <= VAR_t16_MUX_uxn_opcodes_h_l2541_c7_8c87_cond;
     t16_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue;
     t16_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output := t16_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2550_c7_6342] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2550_c7_6342_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_6342_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_6342_return_output := result_stack_value_MUX_uxn_opcodes_h_l2550_c7_6342_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2550_c7_6342] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_6342_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_6342_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_6342_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_6342_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_6342_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_6342_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2544_c7_aafc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2541_c7_8c87] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2536_c7_026d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2536_c7_026d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2536_c7_026d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2536_c7_026d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2536_c7_026d_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2550_c7_6342_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2536_c7_026d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2550_c7_6342_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2550_c7_6342_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2541_c7_8c87] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output;

     -- t16_MUX[uxn_opcodes_h_l2536_c7_026d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2536_c7_026d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2536_c7_026d_cond;
     t16_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue;
     t16_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2536_c7_026d_return_output := t16_MUX_uxn_opcodes_h_l2536_c7_026d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2544_c7_aafc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_aafc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_aafc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2541_c7_8c87] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_8c87_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_8c87_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2544_c7_aafc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_aafc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_aafc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2544_c7_aafc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2544_c7_aafc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_aafc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_aafc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_aafc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output := result_stack_value_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2536_c7_026d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2536_c7_026d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2536_c7_026d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2536_c7_026d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2536_c7_026d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2533_c7_ce3d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2536_c7_026d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2544_c7_aafc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2536_c7_026d_return_output;
     -- t16_MUX[uxn_opcodes_h_l2533_c7_ce3d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond;
     t16_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue;
     t16_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output := t16_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2541_c7_8c87] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2541_c7_8c87_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2541_c7_8c87_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output := result_stack_value_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2536_c7_026d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2536_c7_026d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2536_c7_026d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2536_c7_026d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2536_c7_026d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2541_c7_8c87] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_8c87_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_8c87_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2541_c7_8c87] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_8c87_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_8c87_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_8c87_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_8c87_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2527_c2_41a0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2527_c2_41a0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2527_c2_41a0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2533_c7_ce3d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2536_c7_026d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2536_c7_026d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2536_c7_026d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2536_c7_026d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2536_c7_026d_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2536_c7_026d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2536_c7_026d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2541_c7_8c87_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output;
     -- t16_MUX[uxn_opcodes_h_l2527_c2_41a0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2527_c2_41a0_cond <= VAR_t16_MUX_uxn_opcodes_h_l2527_c2_41a0_cond;
     t16_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue;
     t16_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output := t16_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2533_c7_ce3d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2533_c7_ce3d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2536_c7_026d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2536_c7_026d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2536_c7_026d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2536_c7_026d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2536_c7_026d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2536_c7_026d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2536_c7_026d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2536_c7_026d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2536_c7_026d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2536_c7_026d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2536_c7_026d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2536_c7_026d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2536_c7_026d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2536_c7_026d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2536_c7_026d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2536_c7_026d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2536_c7_026d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2527_c2_41a0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2536_c7_026d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2536_c7_026d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2536_c7_026d_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2533_c7_ce3d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2527_c2_41a0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2533_c7_ce3d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2527_c2_41a0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c2_41a0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c2_41a0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2533_c7_ce3d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_ce3d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_ce3d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_ce3d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2533_c7_ce3d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2527_c2_41a0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2527_c2_41a0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c2_41a0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2527_c2_41a0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2527_c2_41a0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c2_41a0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2527_c2_41a0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2527_c2_41a0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2527_c2_41a0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2527_c2_41a0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2527_c2_41a0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2565_l2523_DUPLICATE_bc12 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2565_l2523_DUPLICATE_bc12_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2527_c2_41a0_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2565_l2523_DUPLICATE_bc12_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l2565_l2523_DUPLICATE_bc12_return_output;
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
