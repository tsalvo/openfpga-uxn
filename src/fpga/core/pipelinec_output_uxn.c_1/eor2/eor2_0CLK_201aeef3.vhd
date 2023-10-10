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
-- Submodules: 123
entity eor2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end eor2_0CLK_201aeef3;
architecture arch of eor2_0CLK_201aeef3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1236_c6_1442]
signal BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1236_c1_4ee3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_4ee3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_4ee3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_4ee3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_4ee3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1236_c2_9c3d]
signal n16_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1236_c2_9c3d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1236_c2_9c3d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1236_c2_9c3d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1236_c2_9c3d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1236_c2_9c3d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1236_c2_9c3d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1236_c2_9c3d]
signal result_stack_value_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1236_c2_9c3d]
signal t16_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1236_c2_9c3d]
signal tmp16_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1237_c3_ea10[uxn_opcodes_h_l1237_c3_ea10]
signal printf_uxn_opcodes_h_l1237_c3_ea10_uxn_opcodes_h_l1237_c3_ea10_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1242_c11_bc91]
signal BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1242_c7_af47]
signal n16_MUX_uxn_opcodes_h_l1242_c7_af47_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1242_c7_af47_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1242_c7_af47]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_af47_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_af47_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1242_c7_af47]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_af47_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_af47_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1242_c7_af47]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_af47_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_af47_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1242_c7_af47]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_af47_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_af47_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1242_c7_af47]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_af47_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_af47_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1242_c7_af47]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_af47_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_af47_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1242_c7_af47]
signal result_stack_value_MUX_uxn_opcodes_h_l1242_c7_af47_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1242_c7_af47_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1242_c7_af47]
signal t16_MUX_uxn_opcodes_h_l1242_c7_af47_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1242_c7_af47_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1242_c7_af47]
signal tmp16_MUX_uxn_opcodes_h_l1242_c7_af47_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1242_c7_af47_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1245_c11_14bc]
signal BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1245_c7_60c0]
signal n16_MUX_uxn_opcodes_h_l1245_c7_60c0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1245_c7_60c0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1245_c7_60c0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_60c0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1245_c7_60c0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1245_c7_60c0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_60c0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1245_c7_60c0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_60c0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1245_c7_60c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_60c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1245_c7_60c0]
signal result_stack_value_MUX_uxn_opcodes_h_l1245_c7_60c0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1245_c7_60c0]
signal t16_MUX_uxn_opcodes_h_l1245_c7_60c0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1245_c7_60c0]
signal tmp16_MUX_uxn_opcodes_h_l1245_c7_60c0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1250_c11_8518]
signal BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1250_c7_58c9]
signal n16_MUX_uxn_opcodes_h_l1250_c7_58c9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1250_c7_58c9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1250_c7_58c9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_58c9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1250_c7_58c9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1250_c7_58c9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_58c9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1250_c7_58c9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_58c9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1250_c7_58c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_58c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1250_c7_58c9]
signal result_stack_value_MUX_uxn_opcodes_h_l1250_c7_58c9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1250_c7_58c9]
signal t16_MUX_uxn_opcodes_h_l1250_c7_58c9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1250_c7_58c9]
signal tmp16_MUX_uxn_opcodes_h_l1250_c7_58c9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1253_c11_0afe]
signal BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1253_c7_4270]
signal n16_MUX_uxn_opcodes_h_l1253_c7_4270_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1253_c7_4270_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1253_c7_4270]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c7_4270_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c7_4270_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1253_c7_4270]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1253_c7_4270_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1253_c7_4270_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1253_c7_4270]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c7_4270_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c7_4270_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1253_c7_4270]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1253_c7_4270_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1253_c7_4270_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1253_c7_4270]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c7_4270_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c7_4270_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1253_c7_4270]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1253_c7_4270_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1253_c7_4270_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1253_c7_4270]
signal result_stack_value_MUX_uxn_opcodes_h_l1253_c7_4270_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1253_c7_4270_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1253_c7_4270]
signal t16_MUX_uxn_opcodes_h_l1253_c7_4270_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1253_c7_4270_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1253_c7_4270]
signal tmp16_MUX_uxn_opcodes_h_l1253_c7_4270_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1253_c7_4270_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1254_c3_0f55]
signal BIN_OP_OR_uxn_opcodes_h_l1254_c3_0f55_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1254_c3_0f55_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1254_c3_0f55_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1257_c11_937c]
signal BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1257_c7_1a8a]
signal n16_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1257_c7_1a8a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1257_c7_1a8a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1257_c7_1a8a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1257_c7_1a8a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1257_c7_1a8a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1257_c7_1a8a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1257_c7_1a8a]
signal result_stack_value_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1257_c7_1a8a]
signal tmp16_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1260_c11_8b3e]
signal BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1260_c7_74bd]
signal n16_MUX_uxn_opcodes_h_l1260_c7_74bd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1260_c7_74bd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1260_c7_74bd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_74bd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1260_c7_74bd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1260_c7_74bd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_74bd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1260_c7_74bd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_74bd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1260_c7_74bd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_74bd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1260_c7_74bd]
signal result_stack_value_MUX_uxn_opcodes_h_l1260_c7_74bd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1260_c7_74bd]
signal tmp16_MUX_uxn_opcodes_h_l1260_c7_74bd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1265_c11_cb9e]
signal BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1265_c7_b143]
signal n16_MUX_uxn_opcodes_h_l1265_c7_b143_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1265_c7_b143_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1265_c7_b143]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_b143_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_b143_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1265_c7_b143]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_b143_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_b143_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1265_c7_b143]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_b143_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_b143_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1265_c7_b143]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_b143_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_b143_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1265_c7_b143]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_b143_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_b143_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1265_c7_b143]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_b143_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_b143_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1265_c7_b143]
signal result_stack_value_MUX_uxn_opcodes_h_l1265_c7_b143_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1265_c7_b143_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1265_c7_b143]
signal tmp16_MUX_uxn_opcodes_h_l1265_c7_b143_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1265_c7_b143_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1268_c11_4639]
signal BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1268_c7_5c44]
signal n16_MUX_uxn_opcodes_h_l1268_c7_5c44_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1268_c7_5c44]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1268_c7_5c44]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1268_c7_5c44_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1268_c7_5c44]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1268_c7_5c44]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_5c44_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1268_c7_5c44]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_5c44_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1268_c7_5c44]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_5c44_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1268_c7_5c44]
signal result_stack_value_MUX_uxn_opcodes_h_l1268_c7_5c44_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output : unsigned(7 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l1268_c7_5c44]
signal tmp16_MUX_uxn_opcodes_h_l1268_c7_5c44_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1269_c3_e0b7]
signal BIN_OP_OR_uxn_opcodes_h_l1269_c3_e0b7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1269_c3_e0b7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1269_c3_e0b7_return_output : unsigned(15 downto 0);

-- BIN_OP_XOR[uxn_opcodes_h_l1270_c11_45c5]
signal BIN_OP_XOR_uxn_opcodes_h_l1270_c11_45c5_left : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1270_c11_45c5_right : unsigned(15 downto 0);
signal BIN_OP_XOR_uxn_opcodes_h_l1270_c11_45c5_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1273_c32_2459]
signal BIN_OP_AND_uxn_opcodes_h_l1273_c32_2459_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1273_c32_2459_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1273_c32_2459_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1273_c32_4841]
signal BIN_OP_GT_uxn_opcodes_h_l1273_c32_4841_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1273_c32_4841_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1273_c32_4841_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1273_c32_493f]
signal MUX_uxn_opcodes_h_l1273_c32_493f_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1273_c32_493f_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1273_c32_493f_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1273_c32_493f_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1275_c11_c088]
signal BIN_OP_EQ_uxn_opcodes_h_l1275_c11_c088_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1275_c11_c088_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1275_c11_c088_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1275_c7_eff9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_eff9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1275_c7_eff9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_eff9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1275_c7_eff9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_eff9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1275_c7_eff9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_eff9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1275_c7_eff9]
signal result_stack_value_MUX_uxn_opcodes_h_l1275_c7_eff9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1281_c11_15c5]
signal BIN_OP_EQ_uxn_opcodes_h_l1281_c11_15c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1281_c11_15c5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1281_c11_15c5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1281_c7_def9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_def9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_def9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_def9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_def9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1281_c7_def9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_def9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_def9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_def9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_def9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1281_c7_def9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_def9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_def9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_def9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_def9_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1281_c7_def9]
signal result_stack_value_MUX_uxn_opcodes_h_l1281_c7_def9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1281_c7_def9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1281_c7_def9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1281_c7_def9_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1283_c34_49f8]
signal CONST_SR_8_uxn_opcodes_h_l1283_c34_49f8_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1283_c34_49f8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1285_c11_89fb]
signal BIN_OP_EQ_uxn_opcodes_h_l1285_c11_89fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1285_c11_89fb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1285_c11_89fb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1285_c7_f8f2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f8f2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f8f2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f8f2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f8f2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1285_c7_f8f2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f8f2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f8f2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f8f2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f8f2_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1247_l1262_DUPLICATE_117d
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1247_l1262_DUPLICATE_117d_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1247_l1262_DUPLICATE_117d_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_1ade( ref_toks_0 : opcode_result_t;
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
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442
BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_left,
BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_right,
BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_4ee3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_4ee3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_4ee3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_4ee3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_4ee3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_4ee3_return_output);

-- n16_MUX_uxn_opcodes_h_l1236_c2_9c3d
n16_MUX_uxn_opcodes_h_l1236_c2_9c3d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond,
n16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue,
n16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse,
n16_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d
result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_9c3d
result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_9c3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_9c3d
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_9c3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_9c3d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_9c3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_9c3d
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_9c3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1236_c2_9c3d
result_stack_value_MUX_uxn_opcodes_h_l1236_c2_9c3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output);

-- t16_MUX_uxn_opcodes_h_l1236_c2_9c3d
t16_MUX_uxn_opcodes_h_l1236_c2_9c3d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond,
t16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue,
t16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse,
t16_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1236_c2_9c3d
tmp16_MUX_uxn_opcodes_h_l1236_c2_9c3d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond,
tmp16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue,
tmp16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse,
tmp16_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output);

-- printf_uxn_opcodes_h_l1237_c3_ea10_uxn_opcodes_h_l1237_c3_ea10
printf_uxn_opcodes_h_l1237_c3_ea10_uxn_opcodes_h_l1237_c3_ea10 : entity work.printf_uxn_opcodes_h_l1237_c3_ea10_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1237_c3_ea10_uxn_opcodes_h_l1237_c3_ea10_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91
BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91_left,
BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91_right,
BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91_return_output);

-- n16_MUX_uxn_opcodes_h_l1242_c7_af47
n16_MUX_uxn_opcodes_h_l1242_c7_af47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1242_c7_af47_cond,
n16_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue,
n16_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse,
n16_MUX_uxn_opcodes_h_l1242_c7_af47_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_af47
result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_af47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_af47_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_af47_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_af47
result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_af47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_af47_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_af47_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_af47
result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_af47 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_af47_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_af47_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_af47
result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_af47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_af47_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_af47_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_af47
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_af47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_af47_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_af47_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_af47
result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_af47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_af47_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_af47_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1242_c7_af47
result_stack_value_MUX_uxn_opcodes_h_l1242_c7_af47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1242_c7_af47_cond,
result_stack_value_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1242_c7_af47_return_output);

-- t16_MUX_uxn_opcodes_h_l1242_c7_af47
t16_MUX_uxn_opcodes_h_l1242_c7_af47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1242_c7_af47_cond,
t16_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue,
t16_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse,
t16_MUX_uxn_opcodes_h_l1242_c7_af47_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1242_c7_af47
tmp16_MUX_uxn_opcodes_h_l1242_c7_af47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1242_c7_af47_cond,
tmp16_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue,
tmp16_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse,
tmp16_MUX_uxn_opcodes_h_l1242_c7_af47_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc_left,
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc_right,
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc_return_output);

-- n16_MUX_uxn_opcodes_h_l1245_c7_60c0
n16_MUX_uxn_opcodes_h_l1245_c7_60c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1245_c7_60c0_cond,
n16_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue,
n16_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse,
n16_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_60c0
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_60c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_60c0
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_60c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_60c0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_60c0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_60c0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_60c0
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_60c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_60c0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_60c0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_60c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_60c0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_60c0
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_60c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_60c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1245_c7_60c0
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_60c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_60c0_cond,
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output);

-- t16_MUX_uxn_opcodes_h_l1245_c7_60c0
t16_MUX_uxn_opcodes_h_l1245_c7_60c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1245_c7_60c0_cond,
t16_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue,
t16_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse,
t16_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1245_c7_60c0
tmp16_MUX_uxn_opcodes_h_l1245_c7_60c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1245_c7_60c0_cond,
tmp16_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue,
tmp16_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse,
tmp16_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518
BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518_left,
BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518_right,
BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518_return_output);

-- n16_MUX_uxn_opcodes_h_l1250_c7_58c9
n16_MUX_uxn_opcodes_h_l1250_c7_58c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1250_c7_58c9_cond,
n16_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue,
n16_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse,
n16_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_58c9
result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_58c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_58c9
result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_58c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_58c9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_58c9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_58c9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_58c9
result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_58c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_58c9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_58c9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_58c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_58c9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_58c9
result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_58c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_58c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1250_c7_58c9
result_stack_value_MUX_uxn_opcodes_h_l1250_c7_58c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1250_c7_58c9_cond,
result_stack_value_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output);

-- t16_MUX_uxn_opcodes_h_l1250_c7_58c9
t16_MUX_uxn_opcodes_h_l1250_c7_58c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1250_c7_58c9_cond,
t16_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue,
t16_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse,
t16_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1250_c7_58c9
tmp16_MUX_uxn_opcodes_h_l1250_c7_58c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1250_c7_58c9_cond,
tmp16_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue,
tmp16_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse,
tmp16_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe
BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe_left,
BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe_right,
BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe_return_output);

-- n16_MUX_uxn_opcodes_h_l1253_c7_4270
n16_MUX_uxn_opcodes_h_l1253_c7_4270 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1253_c7_4270_cond,
n16_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue,
n16_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse,
n16_MUX_uxn_opcodes_h_l1253_c7_4270_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c7_4270
result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c7_4270 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c7_4270_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c7_4270_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1253_c7_4270
result_is_stack_read_MUX_uxn_opcodes_h_l1253_c7_4270 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1253_c7_4270_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1253_c7_4270_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c7_4270
result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c7_4270 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c7_4270_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c7_4270_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1253_c7_4270
result_is_stack_write_MUX_uxn_opcodes_h_l1253_c7_4270 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1253_c7_4270_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1253_c7_4270_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c7_4270
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c7_4270 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c7_4270_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c7_4270_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1253_c7_4270
result_is_opc_done_MUX_uxn_opcodes_h_l1253_c7_4270 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1253_c7_4270_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1253_c7_4270_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1253_c7_4270
result_stack_value_MUX_uxn_opcodes_h_l1253_c7_4270 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1253_c7_4270_cond,
result_stack_value_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1253_c7_4270_return_output);

-- t16_MUX_uxn_opcodes_h_l1253_c7_4270
t16_MUX_uxn_opcodes_h_l1253_c7_4270 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1253_c7_4270_cond,
t16_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue,
t16_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse,
t16_MUX_uxn_opcodes_h_l1253_c7_4270_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1253_c7_4270
tmp16_MUX_uxn_opcodes_h_l1253_c7_4270 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1253_c7_4270_cond,
tmp16_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue,
tmp16_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse,
tmp16_MUX_uxn_opcodes_h_l1253_c7_4270_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1254_c3_0f55
BIN_OP_OR_uxn_opcodes_h_l1254_c3_0f55 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1254_c3_0f55_left,
BIN_OP_OR_uxn_opcodes_h_l1254_c3_0f55_right,
BIN_OP_OR_uxn_opcodes_h_l1254_c3_0f55_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c
BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c_left,
BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c_right,
BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c_return_output);

-- n16_MUX_uxn_opcodes_h_l1257_c7_1a8a
n16_MUX_uxn_opcodes_h_l1257_c7_1a8a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond,
n16_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue,
n16_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse,
n16_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a
result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_1a8a
result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_1a8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_1a8a
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_1a8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_1a8a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_1a8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_1a8a
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_1a8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1257_c7_1a8a
result_stack_value_MUX_uxn_opcodes_h_l1257_c7_1a8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1257_c7_1a8a
tmp16_MUX_uxn_opcodes_h_l1257_c7_1a8a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond,
tmp16_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue,
tmp16_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse,
tmp16_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e
BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e_left,
BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e_right,
BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e_return_output);

-- n16_MUX_uxn_opcodes_h_l1260_c7_74bd
n16_MUX_uxn_opcodes_h_l1260_c7_74bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1260_c7_74bd_cond,
n16_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue,
n16_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse,
n16_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_74bd
result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_74bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_74bd
result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_74bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_74bd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_74bd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_74bd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_74bd
result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_74bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_74bd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_74bd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_74bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_74bd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_74bd
result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_74bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_74bd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1260_c7_74bd
result_stack_value_MUX_uxn_opcodes_h_l1260_c7_74bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1260_c7_74bd_cond,
result_stack_value_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1260_c7_74bd
tmp16_MUX_uxn_opcodes_h_l1260_c7_74bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1260_c7_74bd_cond,
tmp16_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue,
tmp16_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse,
tmp16_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e
BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e_left,
BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e_right,
BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e_return_output);

-- n16_MUX_uxn_opcodes_h_l1265_c7_b143
n16_MUX_uxn_opcodes_h_l1265_c7_b143 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1265_c7_b143_cond,
n16_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue,
n16_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse,
n16_MUX_uxn_opcodes_h_l1265_c7_b143_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_b143
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_b143 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_b143_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_b143_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_b143
result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_b143 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_b143_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_b143_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_b143
result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_b143 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_b143_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_b143_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_b143
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_b143 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_b143_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_b143_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_b143
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_b143 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_b143_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_b143_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_b143
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_b143 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_b143_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_b143_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1265_c7_b143
result_stack_value_MUX_uxn_opcodes_h_l1265_c7_b143 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1265_c7_b143_cond,
result_stack_value_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1265_c7_b143_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1265_c7_b143
tmp16_MUX_uxn_opcodes_h_l1265_c7_b143 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1265_c7_b143_cond,
tmp16_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue,
tmp16_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse,
tmp16_MUX_uxn_opcodes_h_l1265_c7_b143_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639
BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639_left,
BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639_right,
BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639_return_output);

-- n16_MUX_uxn_opcodes_h_l1268_c7_5c44
n16_MUX_uxn_opcodes_h_l1268_c7_5c44 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1268_c7_5c44_cond,
n16_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue,
n16_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse,
n16_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_5c44
result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_5c44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1268_c7_5c44
result_is_stack_read_MUX_uxn_opcodes_h_l1268_c7_5c44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1268_c7_5c44_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_5c44
result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_5c44 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_5c44
result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_5c44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_5c44_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_5c44
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_5c44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_5c44_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_5c44
result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_5c44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_5c44_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1268_c7_5c44
result_stack_value_MUX_uxn_opcodes_h_l1268_c7_5c44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1268_c7_5c44_cond,
result_stack_value_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output);

-- tmp16_MUX_uxn_opcodes_h_l1268_c7_5c44
tmp16_MUX_uxn_opcodes_h_l1268_c7_5c44 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l1268_c7_5c44_cond,
tmp16_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue,
tmp16_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse,
tmp16_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1269_c3_e0b7
BIN_OP_OR_uxn_opcodes_h_l1269_c3_e0b7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1269_c3_e0b7_left,
BIN_OP_OR_uxn_opcodes_h_l1269_c3_e0b7_right,
BIN_OP_OR_uxn_opcodes_h_l1269_c3_e0b7_return_output);

-- BIN_OP_XOR_uxn_opcodes_h_l1270_c11_45c5
BIN_OP_XOR_uxn_opcodes_h_l1270_c11_45c5 : entity work.BIN_OP_XOR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_XOR_uxn_opcodes_h_l1270_c11_45c5_left,
BIN_OP_XOR_uxn_opcodes_h_l1270_c11_45c5_right,
BIN_OP_XOR_uxn_opcodes_h_l1270_c11_45c5_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1273_c32_2459
BIN_OP_AND_uxn_opcodes_h_l1273_c32_2459 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1273_c32_2459_left,
BIN_OP_AND_uxn_opcodes_h_l1273_c32_2459_right,
BIN_OP_AND_uxn_opcodes_h_l1273_c32_2459_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1273_c32_4841
BIN_OP_GT_uxn_opcodes_h_l1273_c32_4841 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1273_c32_4841_left,
BIN_OP_GT_uxn_opcodes_h_l1273_c32_4841_right,
BIN_OP_GT_uxn_opcodes_h_l1273_c32_4841_return_output);

-- MUX_uxn_opcodes_h_l1273_c32_493f
MUX_uxn_opcodes_h_l1273_c32_493f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1273_c32_493f_cond,
MUX_uxn_opcodes_h_l1273_c32_493f_iftrue,
MUX_uxn_opcodes_h_l1273_c32_493f_iffalse,
MUX_uxn_opcodes_h_l1273_c32_493f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1275_c11_c088
BIN_OP_EQ_uxn_opcodes_h_l1275_c11_c088 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1275_c11_c088_left,
BIN_OP_EQ_uxn_opcodes_h_l1275_c11_c088_right,
BIN_OP_EQ_uxn_opcodes_h_l1275_c11_c088_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_eff9
result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_eff9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_eff9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_eff9
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_eff9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_eff9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_eff9
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_eff9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_eff9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_eff9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_eff9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_eff9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1275_c7_eff9
result_stack_value_MUX_uxn_opcodes_h_l1275_c7_eff9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1275_c7_eff9_cond,
result_stack_value_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1281_c11_15c5
BIN_OP_EQ_uxn_opcodes_h_l1281_c11_15c5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1281_c11_15c5_left,
BIN_OP_EQ_uxn_opcodes_h_l1281_c11_15c5_right,
BIN_OP_EQ_uxn_opcodes_h_l1281_c11_15c5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_def9
result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_def9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_def9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_def9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_def9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_def9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_def9
result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_def9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_def9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_def9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_def9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_def9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_def9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_def9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_def9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_def9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_def9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_def9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1281_c7_def9
result_stack_value_MUX_uxn_opcodes_h_l1281_c7_def9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1281_c7_def9_cond,
result_stack_value_MUX_uxn_opcodes_h_l1281_c7_def9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1281_c7_def9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1281_c7_def9_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1283_c34_49f8
CONST_SR_8_uxn_opcodes_h_l1283_c34_49f8 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1283_c34_49f8_x,
CONST_SR_8_uxn_opcodes_h_l1283_c34_49f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1285_c11_89fb
BIN_OP_EQ_uxn_opcodes_h_l1285_c11_89fb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1285_c11_89fb_left,
BIN_OP_EQ_uxn_opcodes_h_l1285_c11_89fb_right,
BIN_OP_EQ_uxn_opcodes_h_l1285_c11_89fb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f8f2
result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f8f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f8f2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f8f2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f8f2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f8f2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f8f2
result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f8f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f8f2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f8f2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f8f2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f8f2_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1247_l1262_DUPLICATE_117d
CONST_SL_8_uint16_t_uxn_opcodes_h_l1247_l1262_DUPLICATE_117d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1247_l1262_DUPLICATE_117d_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1247_l1262_DUPLICATE_117d_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_4ee3_return_output,
 n16_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output,
 t16_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output,
 tmp16_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91_return_output,
 n16_MUX_uxn_opcodes_h_l1242_c7_af47_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_af47_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_af47_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_af47_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_af47_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_af47_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_af47_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1242_c7_af47_return_output,
 t16_MUX_uxn_opcodes_h_l1242_c7_af47_return_output,
 tmp16_MUX_uxn_opcodes_h_l1242_c7_af47_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc_return_output,
 n16_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output,
 t16_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output,
 tmp16_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518_return_output,
 n16_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output,
 t16_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output,
 tmp16_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe_return_output,
 n16_MUX_uxn_opcodes_h_l1253_c7_4270_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c7_4270_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1253_c7_4270_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c7_4270_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1253_c7_4270_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c7_4270_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1253_c7_4270_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1253_c7_4270_return_output,
 t16_MUX_uxn_opcodes_h_l1253_c7_4270_return_output,
 tmp16_MUX_uxn_opcodes_h_l1253_c7_4270_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1254_c3_0f55_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c_return_output,
 n16_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output,
 tmp16_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e_return_output,
 n16_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output,
 tmp16_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e_return_output,
 n16_MUX_uxn_opcodes_h_l1265_c7_b143_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_b143_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_b143_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_b143_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_b143_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_b143_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_b143_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1265_c7_b143_return_output,
 tmp16_MUX_uxn_opcodes_h_l1265_c7_b143_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639_return_output,
 n16_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output,
 tmp16_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1269_c3_e0b7_return_output,
 BIN_OP_XOR_uxn_opcodes_h_l1270_c11_45c5_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1273_c32_2459_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1273_c32_4841_return_output,
 MUX_uxn_opcodes_h_l1273_c32_493f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1275_c11_c088_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1281_c11_15c5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_def9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_def9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_def9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1281_c7_def9_return_output,
 CONST_SR_8_uxn_opcodes_h_l1283_c34_49f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1285_c11_89fb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f8f2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f8f2_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1247_l1262_DUPLICATE_117d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_4ee3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_4ee3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_4ee3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_4ee3_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1242_c7_af47_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_af47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_af47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_af47_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_af47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1239_c3_5e03 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_af47_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_af47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_af47_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1242_c7_af47_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1242_c7_af47_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1237_c3_ea10_uxn_opcodes_h_l1237_c3_ea10_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1242_c7_af47_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_af47_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_af47_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_af47_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_af47_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1243_c3_2bb9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_af47_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_af47_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_af47_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1242_c7_af47_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1242_c7_af47_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1245_c7_60c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_60c0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_60c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1248_c3_bc4b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_60c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_60c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_60c0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1245_c7_60c0_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1245_c7_60c0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1253_c7_4270_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1250_c7_58c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c7_4270_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1253_c7_4270_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_58c9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c7_4270_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c7_4270_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_58c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1251_c3_0834 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c7_4270_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_58c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c7_4270_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_58c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c7_4270_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1250_c7_58c9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1253_c7_4270_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1250_c7_58c9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1253_c7_4270_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1250_c7_58c9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1253_c7_4270_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c7_4270_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1253_c7_4270_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c7_4270_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c7_4270_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1255_c3_c40a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c7_4270_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c7_4270_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c7_4270_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1253_c7_4270_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1253_c7_4270_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1254_c3_0f55_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1254_c3_0f55_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1254_c3_0f55_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1258_c3_d803 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1265_c7_b143_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1260_c7_74bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_b143_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_b143_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_74bd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_b143_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_b143_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_74bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1263_c3_a47b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_b143_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_74bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_b143_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_74bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_b143_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1260_c7_74bd_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1265_c7_b143_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1260_c7_74bd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1265_c7_b143_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_b143_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_b143_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_b143_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_b143_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1266_c3_d329 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_b143_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_b143_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_b143_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1265_c7_b143_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1268_c7_5c44_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1268_c7_5c44_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_5c44_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_5c44_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_5c44_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_5c44_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l1268_c7_5c44_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1269_c3_e0b7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1269_c3_e0b7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1269_c3_e0b7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1270_c11_45c5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1270_c11_45c5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_XOR_uxn_opcodes_h_l1270_c11_45c5_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1273_c32_493f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1273_c32_493f_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1273_c32_493f_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1273_c32_2459_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1273_c32_2459_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1273_c32_2459_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1273_c32_4841_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1273_c32_4841_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1273_c32_4841_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1273_c32_493f_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_c088_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_c088_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_c088_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_eff9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_def9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_eff9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_def9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_eff9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1278_c3_3afe : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_def9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_eff9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_def9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1275_c7_eff9_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1279_c24_bc92_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_15c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_15c5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_15c5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_def9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_def9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f8f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_def9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_def9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_def9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f8f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_def9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_def9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1282_c3_c5fd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_def9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_def9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_def9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_def9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_def9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1283_c34_49f8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1283_c34_49f8_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1283_c24_f089_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_89fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_89fb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_89fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f8f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f8f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f8f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f8f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f8f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f8f2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1275_l1245_l1242_l1265_l1236_l1260_DUPLICATE_835d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_64c5_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1257_l1285_l1253_l1281_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_56a6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1257_l1253_l1281_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_b684_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1245_l1268_l1242_l1265_l1260_DUPLICATE_8068_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1257_l1285_l1253_l1281_l1250_l1275_l1245_l1268_l1242_l1265_l1260_DUPLICATE_74e6_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1261_l1254_l1246_l1269_DUPLICATE_626a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1247_l1262_DUPLICATE_117d_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1247_l1262_DUPLICATE_117d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1268_l1281_DUPLICATE_8471_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1290_l1232_DUPLICATE_2ab5_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1273_c32_2459_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1278_c3_3afe := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1278_c3_3afe;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f8f2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_89fb_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1243_c3_2bb9 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1243_c3_2bb9;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1282_c3_c5fd := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_def9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1282_c3_c5fd;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_4ee3_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1273_c32_493f_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1258_c3_d803 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1258_c3_d803;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1239_c3_5e03 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1239_c3_5e03;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1263_c3_a47b := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1263_c3_a47b;
     VAR_MUX_uxn_opcodes_h_l1273_c32_493f_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_15c5_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1248_c3_bc4b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1248_c3_bc4b;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1266_c3_d329 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1266_c3_d329;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f8f2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1255_c3_c40a := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1255_c3_c40a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1251_c3_0834 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1251_c3_0834;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_c088_right := to_unsigned(9, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1273_c32_4841_right := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_4ee3_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1273_c32_2459_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1269_c3_e0b7_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_c088_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_15c5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_89fb_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1254_c3_0f55_left := t16;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1270_c11_45c5_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l1283_c34_49f8_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1275_l1245_l1242_l1265_l1236_l1260_DUPLICATE_835d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1275_l1245_l1242_l1265_l1236_l1260_DUPLICATE_835d_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1268_c11_4639] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639_left;
     BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639_return_output := BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_64c5 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_64c5_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1253_c11_0afe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1275_c11_c088] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1275_c11_c088_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_c088_left;
     BIN_OP_EQ_uxn_opcodes_h_l1275_c11_c088_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_c088_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_c088_return_output := BIN_OP_EQ_uxn_opcodes_h_l1275_c11_c088_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1283_c34_49f8] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1283_c34_49f8_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1283_c34_49f8_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1283_c34_49f8_return_output := CONST_SR_8_uxn_opcodes_h_l1283_c34_49f8_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1273_c32_2459] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1273_c32_2459_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1273_c32_2459_left;
     BIN_OP_AND_uxn_opcodes_h_l1273_c32_2459_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1273_c32_2459_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1273_c32_2459_return_output := BIN_OP_AND_uxn_opcodes_h_l1273_c32_2459_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1265_c11_cb9e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1257_l1253_l1281_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_b684 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1257_l1253_l1281_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_b684_return_output := result.stack_value;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1279_c24_bc92] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1279_c24_bc92_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1257_c11_937c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1285_c11_89fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1285_c11_89fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_89fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1285_c11_89fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_89fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_89fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1285_c11_89fb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1245_c11_14bc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1236_c6_1442] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_left;
     BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_return_output := BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1281_c11_15c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1281_c11_15c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_15c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1281_c11_15c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_15c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_15c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1281_c11_15c5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1257_l1285_l1253_l1281_l1250_l1275_l1245_l1268_l1242_l1265_l1260_DUPLICATE_74e6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1257_l1285_l1253_l1281_l1250_l1275_l1245_l1268_l1242_l1265_l1260_DUPLICATE_74e6_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1260_c11_8b3e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1257_l1285_l1253_l1281_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_56a6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1257_l1285_l1253_l1281_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_56a6_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1268_l1281_DUPLICATE_8471 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1268_l1281_DUPLICATE_8471_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1245_l1268_l1242_l1265_l1260_DUPLICATE_8068 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1245_l1268_l1242_l1265_l1260_DUPLICATE_8068_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1242_c11_bc91] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91_left;
     BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91_return_output := BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1250_c11_8518] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518_left;
     BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518_return_output := BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1261_l1254_l1246_l1269_DUPLICATE_626a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1261_l1254_l1246_l1269_DUPLICATE_626a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1273_c32_4841_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1273_c32_2459_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_4ee3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c6_1442_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1242_c7_af47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_af47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_af47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_af47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_af47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_af47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_af47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_af47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1242_c7_af47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1242_c7_af47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1242_c11_bc91_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1245_c7_60c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_60c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_60c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_60c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_60c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_60c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1245_c7_60c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1245_c7_60c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_14bc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1250_c7_58c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_58c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_58c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_58c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_58c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1250_c7_58c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1250_c7_58c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1250_c7_58c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1250_c11_8518_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1253_c7_4270_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c7_4270_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c7_4270_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1253_c7_4270_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c7_4270_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c7_4270_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c7_4270_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c7_4270_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1253_c7_4270_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1253_c7_4270_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1253_c11_0afe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1257_c11_937c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1260_c7_74bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_74bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_74bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_74bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_74bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1260_c7_74bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1260_c7_74bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1260_c11_8b3e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1265_c7_b143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_b143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_b143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_b143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_b143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_b143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_b143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_b143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1265_c7_b143_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1265_c11_cb9e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1268_c7_5c44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_5c44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1268_c7_5c44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_5c44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_5c44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_5c44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1268_c7_5c44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1268_c11_4639_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_eff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_c088_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_eff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_c088_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_eff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_c088_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_eff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_c088_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1275_c7_eff9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_c088_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_def9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_15c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_def9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_15c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_def9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_15c5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_def9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1281_c11_15c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f8f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_89fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f8f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_89fb_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1254_c3_0f55_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1261_l1254_l1246_l1269_DUPLICATE_626a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1269_c3_e0b7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1261_l1254_l1246_l1269_DUPLICATE_626a_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1247_l1262_DUPLICATE_117d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1261_l1254_l1246_l1269_DUPLICATE_626a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1279_c24_bc92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_64c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_64c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_64c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_64c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_64c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_64c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_64c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_64c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_64c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1257_l1285_l1253_l1281_l1250_l1275_l1245_l1268_l1242_l1265_l1260_DUPLICATE_74e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1257_l1285_l1253_l1281_l1250_l1275_l1245_l1268_l1242_l1265_l1260_DUPLICATE_74e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1257_l1285_l1253_l1281_l1250_l1275_l1245_l1268_l1242_l1265_l1260_DUPLICATE_74e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1257_l1285_l1253_l1281_l1250_l1275_l1245_l1268_l1242_l1265_l1260_DUPLICATE_74e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1257_l1285_l1253_l1281_l1250_l1275_l1245_l1268_l1242_l1265_l1260_DUPLICATE_74e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1257_l1285_l1253_l1281_l1250_l1275_l1245_l1268_l1242_l1265_l1260_DUPLICATE_74e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1257_l1285_l1253_l1281_l1250_l1275_l1245_l1268_l1242_l1265_l1260_DUPLICATE_74e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1257_l1285_l1253_l1281_l1250_l1275_l1245_l1268_l1242_l1265_l1260_DUPLICATE_74e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1257_l1285_l1253_l1281_l1250_l1275_l1245_l1268_l1242_l1265_l1260_DUPLICATE_74e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_def9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1257_l1285_l1253_l1281_l1250_l1275_l1245_l1268_l1242_l1265_l1260_DUPLICATE_74e6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f8f2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1257_l1285_l1253_l1281_l1250_l1275_l1245_l1268_l1242_l1265_l1260_DUPLICATE_74e6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1275_l1245_l1242_l1265_l1236_l1260_DUPLICATE_835d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1275_l1245_l1242_l1265_l1236_l1260_DUPLICATE_835d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1275_l1245_l1242_l1265_l1236_l1260_DUPLICATE_835d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1275_l1245_l1242_l1265_l1236_l1260_DUPLICATE_835d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1275_l1245_l1242_l1265_l1236_l1260_DUPLICATE_835d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1275_l1245_l1242_l1265_l1236_l1260_DUPLICATE_835d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1275_l1245_l1242_l1265_l1236_l1260_DUPLICATE_835d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1275_l1245_l1242_l1265_l1236_l1260_DUPLICATE_835d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1275_l1245_l1242_l1265_l1236_l1260_DUPLICATE_835d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1245_l1268_l1242_l1265_l1260_DUPLICATE_8068_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1245_l1268_l1242_l1265_l1260_DUPLICATE_8068_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1245_l1268_l1242_l1265_l1260_DUPLICATE_8068_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1245_l1268_l1242_l1265_l1260_DUPLICATE_8068_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1245_l1268_l1242_l1265_l1260_DUPLICATE_8068_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1245_l1268_l1242_l1265_l1260_DUPLICATE_8068_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1245_l1268_l1242_l1265_l1260_DUPLICATE_8068_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1257_l1253_l1250_l1245_l1268_l1242_l1265_l1260_DUPLICATE_8068_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1257_l1285_l1253_l1281_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_56a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1257_l1285_l1253_l1281_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_56a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1257_l1285_l1253_l1281_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_56a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1257_l1285_l1253_l1281_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_56a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1257_l1285_l1253_l1281_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_56a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1257_l1285_l1253_l1281_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_56a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1257_l1285_l1253_l1281_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_56a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1257_l1285_l1253_l1281_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_56a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1257_l1285_l1253_l1281_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_56a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_def9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1257_l1285_l1253_l1281_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_56a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f8f2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1257_l1285_l1253_l1281_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_56a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1268_l1281_DUPLICATE_8471_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_def9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1268_l1281_DUPLICATE_8471_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1257_l1253_l1281_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_b684_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1257_l1253_l1281_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_b684_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1257_l1253_l1281_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_b684_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1257_l1253_l1281_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_b684_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1257_l1253_l1281_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_b684_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1257_l1253_l1281_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_b684_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1257_l1253_l1281_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_b684_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1257_l1253_l1281_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_b684_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1257_l1253_l1281_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_b684_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_def9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1257_l1253_l1281_l1250_l1245_l1268_l1242_l1265_l1236_l1260_DUPLICATE_b684_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1281_c7_def9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_def9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_def9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_def9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_def9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_def9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_def9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_def9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_def9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1269_c3_e0b7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1269_c3_e0b7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1269_c3_e0b7_left;
     BIN_OP_OR_uxn_opcodes_h_l1269_c3_e0b7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1269_c3_e0b7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1269_c3_e0b7_return_output := BIN_OP_OR_uxn_opcodes_h_l1269_c3_e0b7_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1268_c7_5c44] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1268_c7_5c44_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1268_c7_5c44_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1285_c7_f8f2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f8f2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f8f2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f8f2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f8f2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f8f2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f8f2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f8f2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f8f2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1283_c24_f089] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1283_c24_f089_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1283_c34_49f8_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1247_l1262_DUPLICATE_117d LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1247_l1262_DUPLICATE_117d_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1247_l1262_DUPLICATE_117d_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1247_l1262_DUPLICATE_117d_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1247_l1262_DUPLICATE_117d_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1273_c32_4841] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1273_c32_4841_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1273_c32_4841_left;
     BIN_OP_GT_uxn_opcodes_h_l1273_c32_4841_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1273_c32_4841_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1273_c32_4841_return_output := BIN_OP_GT_uxn_opcodes_h_l1273_c32_4841_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1285_c7_f8f2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f8f2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f8f2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f8f2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f8f2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f8f2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f8f2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f8f2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f8f2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1275_c7_eff9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_eff9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_eff9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1236_c1_4ee3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_4ee3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_4ee3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_4ee3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_4ee3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_4ee3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_4ee3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_4ee3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_4ee3_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1254_c3_0f55] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1254_c3_0f55_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1254_c3_0f55_left;
     BIN_OP_OR_uxn_opcodes_h_l1254_c3_0f55_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1254_c3_0f55_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1254_c3_0f55_return_output := BIN_OP_OR_uxn_opcodes_h_l1254_c3_0f55_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1273_c32_493f_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1273_c32_4841_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1254_c3_0f55_return_output;
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1270_c11_45c5_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1269_c3_e0b7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1269_c3_e0b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_def9_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1283_c24_f089_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1247_l1262_DUPLICATE_117d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1247_l1262_DUPLICATE_117d_return_output;
     VAR_printf_uxn_opcodes_h_l1237_c3_ea10_uxn_opcodes_h_l1237_c3_ea10_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1236_c1_4ee3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_def9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_f8f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_def9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_f8f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1281_c7_def9_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1265_c7_b143] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_b143_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_b143_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_b143_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_b143_return_output;

     -- n16_MUX[uxn_opcodes_h_l1268_c7_5c44] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1268_c7_5c44_cond <= VAR_n16_MUX_uxn_opcodes_h_l1268_c7_5c44_cond;
     n16_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue;
     n16_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output := n16_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output;

     -- printf_uxn_opcodes_h_l1237_c3_ea10[uxn_opcodes_h_l1237_c3_ea10] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1237_c3_ea10_uxn_opcodes_h_l1237_c3_ea10_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1237_c3_ea10_uxn_opcodes_h_l1237_c3_ea10_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1268_c7_5c44] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1281_c7_def9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_def9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_def9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_def9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_def9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_def9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_def9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_def9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_def9_return_output;

     -- MUX[uxn_opcodes_h_l1273_c32_493f] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1273_c32_493f_cond <= VAR_MUX_uxn_opcodes_h_l1273_c32_493f_cond;
     MUX_uxn_opcodes_h_l1273_c32_493f_iftrue <= VAR_MUX_uxn_opcodes_h_l1273_c32_493f_iftrue;
     MUX_uxn_opcodes_h_l1273_c32_493f_iffalse <= VAR_MUX_uxn_opcodes_h_l1273_c32_493f_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1273_c32_493f_return_output := MUX_uxn_opcodes_h_l1273_c32_493f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1281_c7_def9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1281_c7_def9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_def9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1281_c7_def9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_def9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1281_c7_def9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_def9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_def9_return_output := result_stack_value_MUX_uxn_opcodes_h_l1281_c7_def9_return_output;

     -- t16_MUX[uxn_opcodes_h_l1253_c7_4270] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1253_c7_4270_cond <= VAR_t16_MUX_uxn_opcodes_h_l1253_c7_4270_cond;
     t16_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue;
     t16_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1253_c7_4270_return_output := t16_MUX_uxn_opcodes_h_l1253_c7_4270_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1275_c7_eff9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_eff9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_eff9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1281_c7_def9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_def9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_def9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_def9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_def9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_def9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_def9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_def9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_def9_return_output;

     -- BIN_OP_XOR[uxn_opcodes_h_l1270_c11_45c5] LATENCY=0
     -- Inputs
     BIN_OP_XOR_uxn_opcodes_h_l1270_c11_45c5_left <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1270_c11_45c5_left;
     BIN_OP_XOR_uxn_opcodes_h_l1270_c11_45c5_right <= VAR_BIN_OP_XOR_uxn_opcodes_h_l1270_c11_45c5_right;
     -- Outputs
     VAR_BIN_OP_XOR_uxn_opcodes_h_l1270_c11_45c5_return_output := BIN_OP_XOR_uxn_opcodes_h_l1270_c11_45c5_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue := VAR_BIN_OP_XOR_uxn_opcodes_h_l1270_c11_45c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue := VAR_MUX_uxn_opcodes_h_l1273_c32_493f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1281_c7_def9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1265_c7_b143_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1281_c7_def9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1281_c7_def9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1253_c7_4270_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1275_c7_eff9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1275_c7_eff9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1275_c7_eff9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output := result_stack_value_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1260_c7_74bd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_74bd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_74bd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1275_c7_eff9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_eff9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_eff9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1268_c7_5c44] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_5c44_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_5c44_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output;

     -- n16_MUX[uxn_opcodes_h_l1265_c7_b143] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1265_c7_b143_cond <= VAR_n16_MUX_uxn_opcodes_h_l1265_c7_b143_cond;
     n16_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue;
     n16_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1265_c7_b143_return_output := n16_MUX_uxn_opcodes_h_l1265_c7_b143_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1275_c7_eff9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_eff9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_eff9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_eff9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_eff9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1265_c7_b143] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_b143_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_b143_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_b143_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_b143_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1268_c7_5c44] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output;

     -- t16_MUX[uxn_opcodes_h_l1250_c7_58c9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1250_c7_58c9_cond <= VAR_t16_MUX_uxn_opcodes_h_l1250_c7_58c9_cond;
     t16_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue;
     t16_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output := t16_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1268_c7_5c44] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1268_c7_5c44_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1268_c7_5c44_cond;
     tmp16_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output := tmp16_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1265_c7_b143_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1265_c7_b143_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1275_c7_eff9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output;
     -- t16_MUX[uxn_opcodes_h_l1245_c7_60c0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1245_c7_60c0_cond <= VAR_t16_MUX_uxn_opcodes_h_l1245_c7_60c0_cond;
     t16_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue;
     t16_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output := t16_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1260_c7_74bd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1260_c7_74bd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1260_c7_74bd_cond;
     n16_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue;
     n16_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output := n16_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1257_c7_1a8a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1265_c7_b143] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_b143_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_b143_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_b143_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_b143_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1268_c7_5c44] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_5c44_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_5c44_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1268_c7_5c44] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1268_c7_5c44_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_5c44_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output := result_stack_value_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1265_c7_b143] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1265_c7_b143_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1265_c7_b143_cond;
     tmp16_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1265_c7_b143_return_output := tmp16_MUX_uxn_opcodes_h_l1265_c7_b143_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1265_c7_b143] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_b143_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_b143_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_b143_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_b143_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1260_c7_74bd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1268_c7_5c44] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_5c44_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_5c44_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_5c44_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_5c44_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1265_c7_b143_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1265_c7_b143_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1268_c7_5c44_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1265_c7_b143_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1265_c7_b143] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_b143_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_b143_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_b143_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_b143_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1265_c7_b143] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1265_c7_b143_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_b143_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_b143_return_output := result_stack_value_MUX_uxn_opcodes_h_l1265_c7_b143_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1260_c7_74bd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1260_c7_74bd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1260_c7_74bd_cond;
     tmp16_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output := tmp16_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1253_c7_4270] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1253_c7_4270_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1253_c7_4270_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1253_c7_4270_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1253_c7_4270_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1265_c7_b143] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_b143_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_b143_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_b143_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_b143_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_b143_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_b143_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1260_c7_74bd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_74bd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_74bd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output;

     -- n16_MUX[uxn_opcodes_h_l1257_c7_1a8a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond;
     n16_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue;
     n16_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output := n16_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1242_c7_af47] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1242_c7_af47_cond <= VAR_t16_MUX_uxn_opcodes_h_l1242_c7_af47_cond;
     t16_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue;
     t16_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1242_c7_af47_return_output := t16_MUX_uxn_opcodes_h_l1242_c7_af47_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1260_c7_74bd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1257_c7_1a8a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1265_c7_b143_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1253_c7_4270_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1265_c7_b143_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1265_c7_b143_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1242_c7_af47_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output;
     -- t16_MUX[uxn_opcodes_h_l1236_c2_9c3d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond;
     t16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue;
     t16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output := t16_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1260_c7_74bd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_74bd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_74bd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1253_c7_4270] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c7_4270_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c7_4270_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c7_4270_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c7_4270_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1250_c7_58c9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_58c9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_58c9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1257_c7_1a8a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output;

     -- n16_MUX[uxn_opcodes_h_l1253_c7_4270] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1253_c7_4270_cond <= VAR_n16_MUX_uxn_opcodes_h_l1253_c7_4270_cond;
     n16_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue;
     n16_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1253_c7_4270_return_output := n16_MUX_uxn_opcodes_h_l1253_c7_4270_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1257_c7_1a8a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1260_c7_74bd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_74bd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_74bd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1257_c7_1a8a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond;
     tmp16_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output := tmp16_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1260_c7_74bd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1260_c7_74bd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1260_c7_74bd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1260_c7_74bd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1260_c7_74bd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output := result_stack_value_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1253_c7_4270_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1253_c7_4270_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1260_c7_74bd_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output;
     -- n16_MUX[uxn_opcodes_h_l1250_c7_58c9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1250_c7_58c9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1250_c7_58c9_cond;
     n16_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue;
     n16_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output := n16_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1250_c7_58c9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1257_c7_1a8a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1245_c7_60c0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_60c0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_60c0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1253_c7_4270] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c7_4270_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c7_4270_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c7_4270_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c7_4270_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1253_c7_4270] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c7_4270_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c7_4270_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c7_4270_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c7_4270_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1257_c7_1a8a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1257_c7_1a8a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_1a8a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_1a8a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_1a8a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1253_c7_4270] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1253_c7_4270_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1253_c7_4270_cond;
     tmp16_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1253_c7_4270_return_output := tmp16_MUX_uxn_opcodes_h_l1253_c7_4270_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1253_c7_4270_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1253_c7_4270_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1257_c7_1a8a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1253_c7_4270_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1250_c7_58c9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1250_c7_58c9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1250_c7_58c9_cond;
     tmp16_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output := tmp16_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1245_c7_60c0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1250_c7_58c9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_58c9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_58c9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1253_c7_4270] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1253_c7_4270_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c7_4270_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c7_4270_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1253_c7_4270_return_output;

     -- n16_MUX[uxn_opcodes_h_l1245_c7_60c0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1245_c7_60c0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1245_c7_60c0_cond;
     n16_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue;
     n16_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output := n16_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1250_c7_58c9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1253_c7_4270] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1253_c7_4270_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c7_4270_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c7_4270_return_output := result_stack_value_MUX_uxn_opcodes_h_l1253_c7_4270_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1253_c7_4270] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1253_c7_4270_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c7_4270_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c7_4270_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c7_4270_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c7_4270_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1253_c7_4270_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1242_c7_af47] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_af47_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_af47_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_af47_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_af47_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1253_c7_4270_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1242_c7_af47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1253_c7_4270_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1253_c7_4270_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1245_c7_60c0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_60c0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_60c0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1245_c7_60c0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1242_c7_af47] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1242_c7_af47_cond <= VAR_n16_MUX_uxn_opcodes_h_l1242_c7_af47_cond;
     n16_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue;
     n16_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1242_c7_af47_return_output := n16_MUX_uxn_opcodes_h_l1242_c7_af47_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1242_c7_af47] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_af47_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_af47_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_af47_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_af47_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1250_c7_58c9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_58c9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_58c9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1236_c2_9c3d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1245_c7_60c0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1245_c7_60c0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1245_c7_60c0_cond;
     tmp16_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output := tmp16_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1250_c7_58c9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1250_c7_58c9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1250_c7_58c9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output := result_stack_value_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1250_c7_58c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_58c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_58c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_58c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_58c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1242_c7_af47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1242_c7_af47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1250_c7_58c9_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l1242_c7_af47] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1242_c7_af47_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1242_c7_af47_cond;
     tmp16_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1242_c7_af47_return_output := tmp16_MUX_uxn_opcodes_h_l1242_c7_af47_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1245_c7_60c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_60c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_60c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1245_c7_60c0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_60c0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_60c0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1245_c7_60c0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1245_c7_60c0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_60c0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_60c0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_60c0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output := result_stack_value_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1236_c2_9c3d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1236_c2_9c3d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond;
     n16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue;
     n16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output := n16_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1242_c7_af47] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_af47_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_af47_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_af47_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_af47_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1242_c7_af47] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_af47_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_af47_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_af47_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_af47_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1242_c7_af47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1242_c7_af47_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1245_c7_60c0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l1242_c7_af47_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1236_c2_9c3d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1242_c7_af47] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1242_c7_af47_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_af47_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_af47_return_output := result_stack_value_MUX_uxn_opcodes_h_l1242_c7_af47_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l1236_c2_9c3d] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond;
     tmp16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue;
     tmp16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output := tmp16_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1236_c2_9c3d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1242_c7_af47] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_af47_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_af47_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_af47_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_af47_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1242_c7_af47] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_af47_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_af47_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_af47_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_af47_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_af47_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_af47_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1242_c7_af47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1242_c7_af47_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1242_c7_af47_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1236_c2_9c3d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1236_c2_9c3d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1236_c2_9c3d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_9c3d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_9c3d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_9c3d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1290_l1232_DUPLICATE_2ab5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1290_l1232_DUPLICATE_2ab5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1236_c2_9c3d_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1290_l1232_DUPLICATE_2ab5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1290_l1232_DUPLICATE_2ab5_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
