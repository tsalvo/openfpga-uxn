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
-- Submodules: 64
entity ora_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora_0CLK_fd2391e7;
architecture arch of ora_0CLK_fd2391e7 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1095_c6_ba39]
signal BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1095_c1_2320]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1095_c1_2320_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1095_c1_2320_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1095_c1_2320_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1095_c1_2320_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1095_c2_3a0b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1095_c2_3a0b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1095_c2_3a0b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1095_c2_3a0b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1095_c2_3a0b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1095_c2_3a0b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1095_c2_3a0b]
signal result_stack_value_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1095_c2_3a0b]
signal t8_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1095_c2_3a0b]
signal n8_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1096_c3_9f90[uxn_opcodes_h_l1096_c3_9f90]
signal printf_uxn_opcodes_h_l1096_c3_9f90_uxn_opcodes_h_l1096_c3_9f90_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1101_c11_3d1b]
signal BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1101_c7_e196]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_e196_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_e196_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1101_c7_e196]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_e196_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_e196_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1101_c7_e196]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_e196_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_e196_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1101_c7_e196]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_e196_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_e196_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1101_c7_e196]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_e196_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_e196_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1101_c7_e196]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_e196_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_e196_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1101_c7_e196]
signal result_stack_value_MUX_uxn_opcodes_h_l1101_c7_e196_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1101_c7_e196_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1101_c7_e196]
signal t8_MUX_uxn_opcodes_h_l1101_c7_e196_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1101_c7_e196_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1101_c7_e196]
signal n8_MUX_uxn_opcodes_h_l1101_c7_e196_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1101_c7_e196_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1104_c11_2dfe]
signal BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1104_c7_b133]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_b133_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_b133_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1104_c7_b133]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_b133_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_b133_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1104_c7_b133]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_b133_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_b133_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1104_c7_b133]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_b133_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_b133_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1104_c7_b133]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_b133_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_b133_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1104_c7_b133]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_b133_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_b133_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1104_c7_b133]
signal result_stack_value_MUX_uxn_opcodes_h_l1104_c7_b133_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1104_c7_b133_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1104_c7_b133]
signal t8_MUX_uxn_opcodes_h_l1104_c7_b133_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1104_c7_b133_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1104_c7_b133]
signal n8_MUX_uxn_opcodes_h_l1104_c7_b133_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1104_c7_b133_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1108_c11_4cc3]
signal BIN_OP_EQ_uxn_opcodes_h_l1108_c11_4cc3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1108_c11_4cc3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1108_c11_4cc3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1108_c7_cd38]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1108_c7_cd38]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_cd38_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1108_c7_cd38]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1108_c7_cd38]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_cd38_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1108_c7_cd38]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_cd38_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1108_c7_cd38]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_cd38_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1108_c7_cd38]
signal result_stack_value_MUX_uxn_opcodes_h_l1108_c7_cd38_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1108_c7_cd38]
signal n8_MUX_uxn_opcodes_h_l1108_c7_cd38_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1111_c11_bab4]
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c11_bab4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c11_bab4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1111_c11_bab4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1111_c7_bc16]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1111_c7_bc16]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_bc16_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1111_c7_bc16]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1111_c7_bc16]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_bc16_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1111_c7_bc16]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_bc16_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1111_c7_bc16]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_bc16_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1111_c7_bc16]
signal result_stack_value_MUX_uxn_opcodes_h_l1111_c7_bc16_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1111_c7_bc16]
signal n8_MUX_uxn_opcodes_h_l1111_c7_bc16_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1115_c32_2ef1]
signal BIN_OP_AND_uxn_opcodes_h_l1115_c32_2ef1_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1115_c32_2ef1_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1115_c32_2ef1_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1115_c32_99ea]
signal BIN_OP_GT_uxn_opcodes_h_l1115_c32_99ea_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1115_c32_99ea_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1115_c32_99ea_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1115_c32_ed95]
signal MUX_uxn_opcodes_h_l1115_c32_ed95_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1115_c32_ed95_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1115_c32_ed95_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1115_c32_ed95_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1117_c11_9bfc]
signal BIN_OP_EQ_uxn_opcodes_h_l1117_c11_9bfc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1117_c11_9bfc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1117_c11_9bfc_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1117_c7_1adf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1adf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1117_c7_1adf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1adf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1117_c7_1adf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1adf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1117_c7_1adf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1adf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1117_c7_1adf]
signal result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1adf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1121_c24_aa51]
signal BIN_OP_OR_uxn_opcodes_h_l1121_c24_aa51_left : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1121_c24_aa51_right : unsigned(7 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1121_c24_aa51_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1123_c11_071a]
signal BIN_OP_EQ_uxn_opcodes_h_l1123_c11_071a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1123_c11_071a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1123_c11_071a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1123_c7_adf7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_adf7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_adf7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_adf7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_adf7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1123_c7_adf7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_adf7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_adf7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_adf7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_adf7_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39
BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39_left,
BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39_right,
BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1095_c1_2320
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1095_c1_2320 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1095_c1_2320_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1095_c1_2320_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1095_c1_2320_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1095_c1_2320_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b
result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1095_c2_3a0b
result_is_stack_read_MUX_uxn_opcodes_h_l1095_c2_3a0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1095_c2_3a0b
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c2_3a0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c2_3a0b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c2_3a0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1095_c2_3a0b
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c2_3a0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1095_c2_3a0b
result_stack_value_MUX_uxn_opcodes_h_l1095_c2_3a0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond,
result_stack_value_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output);

-- t8_MUX_uxn_opcodes_h_l1095_c2_3a0b
t8_MUX_uxn_opcodes_h_l1095_c2_3a0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond,
t8_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue,
t8_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse,
t8_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output);

-- n8_MUX_uxn_opcodes_h_l1095_c2_3a0b
n8_MUX_uxn_opcodes_h_l1095_c2_3a0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond,
n8_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue,
n8_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse,
n8_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output);

-- printf_uxn_opcodes_h_l1096_c3_9f90_uxn_opcodes_h_l1096_c3_9f90
printf_uxn_opcodes_h_l1096_c3_9f90_uxn_opcodes_h_l1096_c3_9f90 : entity work.printf_uxn_opcodes_h_l1096_c3_9f90_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1096_c3_9f90_uxn_opcodes_h_l1096_c3_9f90_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b_left,
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b_right,
BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_e196
result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_e196 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_e196_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_e196_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_e196
result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_e196 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_e196_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_e196_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_e196
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_e196 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_e196_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_e196_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_e196
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_e196 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_e196_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_e196_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_e196
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_e196 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_e196_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_e196_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_e196
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_e196 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_e196_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_e196_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1101_c7_e196
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_e196 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_e196_cond,
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1101_c7_e196_return_output);

-- t8_MUX_uxn_opcodes_h_l1101_c7_e196
t8_MUX_uxn_opcodes_h_l1101_c7_e196 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1101_c7_e196_cond,
t8_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue,
t8_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse,
t8_MUX_uxn_opcodes_h_l1101_c7_e196_return_output);

-- n8_MUX_uxn_opcodes_h_l1101_c7_e196
n8_MUX_uxn_opcodes_h_l1101_c7_e196 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1101_c7_e196_cond,
n8_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue,
n8_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse,
n8_MUX_uxn_opcodes_h_l1101_c7_e196_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe
BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe_left,
BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe_right,
BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_b133
result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_b133 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_b133_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_b133_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_b133
result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_b133 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_b133_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_b133_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_b133
result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_b133 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_b133_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_b133_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_b133
result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_b133 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_b133_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_b133_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_b133
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_b133 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_b133_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_b133_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_b133
result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_b133 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_b133_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_b133_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1104_c7_b133
result_stack_value_MUX_uxn_opcodes_h_l1104_c7_b133 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1104_c7_b133_cond,
result_stack_value_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1104_c7_b133_return_output);

-- t8_MUX_uxn_opcodes_h_l1104_c7_b133
t8_MUX_uxn_opcodes_h_l1104_c7_b133 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1104_c7_b133_cond,
t8_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue,
t8_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse,
t8_MUX_uxn_opcodes_h_l1104_c7_b133_return_output);

-- n8_MUX_uxn_opcodes_h_l1104_c7_b133
n8_MUX_uxn_opcodes_h_l1104_c7_b133 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1104_c7_b133_cond,
n8_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue,
n8_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse,
n8_MUX_uxn_opcodes_h_l1104_c7_b133_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1108_c11_4cc3
BIN_OP_EQ_uxn_opcodes_h_l1108_c11_4cc3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1108_c11_4cc3_left,
BIN_OP_EQ_uxn_opcodes_h_l1108_c11_4cc3_right,
BIN_OP_EQ_uxn_opcodes_h_l1108_c11_4cc3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_cd38
result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_cd38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_cd38
result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_cd38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_cd38_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_cd38
result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_cd38 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_cd38
result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_cd38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_cd38_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_cd38
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_cd38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_cd38_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_cd38
result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_cd38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_cd38_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1108_c7_cd38
result_stack_value_MUX_uxn_opcodes_h_l1108_c7_cd38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1108_c7_cd38_cond,
result_stack_value_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output);

-- n8_MUX_uxn_opcodes_h_l1108_c7_cd38
n8_MUX_uxn_opcodes_h_l1108_c7_cd38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1108_c7_cd38_cond,
n8_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue,
n8_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse,
n8_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1111_c11_bab4
BIN_OP_EQ_uxn_opcodes_h_l1111_c11_bab4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1111_c11_bab4_left,
BIN_OP_EQ_uxn_opcodes_h_l1111_c11_bab4_right,
BIN_OP_EQ_uxn_opcodes_h_l1111_c11_bab4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_bc16
result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_bc16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_bc16
result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_bc16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_bc16_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_bc16
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_bc16 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_bc16
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_bc16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_bc16_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_bc16
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_bc16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_bc16_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_bc16
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_bc16 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_bc16_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1111_c7_bc16
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_bc16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_bc16_cond,
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output);

-- n8_MUX_uxn_opcodes_h_l1111_c7_bc16
n8_MUX_uxn_opcodes_h_l1111_c7_bc16 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1111_c7_bc16_cond,
n8_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue,
n8_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse,
n8_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1115_c32_2ef1
BIN_OP_AND_uxn_opcodes_h_l1115_c32_2ef1 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1115_c32_2ef1_left,
BIN_OP_AND_uxn_opcodes_h_l1115_c32_2ef1_right,
BIN_OP_AND_uxn_opcodes_h_l1115_c32_2ef1_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1115_c32_99ea
BIN_OP_GT_uxn_opcodes_h_l1115_c32_99ea : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1115_c32_99ea_left,
BIN_OP_GT_uxn_opcodes_h_l1115_c32_99ea_right,
BIN_OP_GT_uxn_opcodes_h_l1115_c32_99ea_return_output);

-- MUX_uxn_opcodes_h_l1115_c32_ed95
MUX_uxn_opcodes_h_l1115_c32_ed95 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1115_c32_ed95_cond,
MUX_uxn_opcodes_h_l1115_c32_ed95_iftrue,
MUX_uxn_opcodes_h_l1115_c32_ed95_iffalse,
MUX_uxn_opcodes_h_l1115_c32_ed95_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1117_c11_9bfc
BIN_OP_EQ_uxn_opcodes_h_l1117_c11_9bfc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1117_c11_9bfc_left,
BIN_OP_EQ_uxn_opcodes_h_l1117_c11_9bfc_right,
BIN_OP_EQ_uxn_opcodes_h_l1117_c11_9bfc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1adf
result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1adf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1adf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1adf
result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1adf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1adf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1adf
result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1adf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1adf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1adf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1adf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1adf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1adf
result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1adf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1adf_cond,
result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1121_c24_aa51
BIN_OP_OR_uxn_opcodes_h_l1121_c24_aa51 : entity work.BIN_OP_OR_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1121_c24_aa51_left,
BIN_OP_OR_uxn_opcodes_h_l1121_c24_aa51_right,
BIN_OP_OR_uxn_opcodes_h_l1121_c24_aa51_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1123_c11_071a
BIN_OP_EQ_uxn_opcodes_h_l1123_c11_071a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1123_c11_071a_left,
BIN_OP_EQ_uxn_opcodes_h_l1123_c11_071a_right,
BIN_OP_EQ_uxn_opcodes_h_l1123_c11_071a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_adf7
result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_adf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_adf7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_adf7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_adf7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_adf7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_adf7
result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_adf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_adf7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_adf7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_adf7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_adf7_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1095_c1_2320_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output,
 t8_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output,
 n8_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_e196_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_e196_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_e196_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_e196_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_e196_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_e196_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1101_c7_e196_return_output,
 t8_MUX_uxn_opcodes_h_l1101_c7_e196_return_output,
 n8_MUX_uxn_opcodes_h_l1101_c7_e196_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_b133_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_b133_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_b133_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_b133_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_b133_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_b133_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1104_c7_b133_return_output,
 t8_MUX_uxn_opcodes_h_l1104_c7_b133_return_output,
 n8_MUX_uxn_opcodes_h_l1104_c7_b133_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1108_c11_4cc3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output,
 n8_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1111_c11_bab4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output,
 n8_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1115_c32_2ef1_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1115_c32_99ea_return_output,
 MUX_uxn_opcodes_h_l1115_c32_ed95_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1117_c11_9bfc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1121_c24_aa51_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1123_c11_071a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_adf7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_adf7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1095_c1_2320_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1095_c1_2320_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1095_c1_2320_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1095_c1_2320_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_e196_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_e196_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_e196_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_e196_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1098_c3_387d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_e196_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_e196_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_e196_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1101_c7_e196_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1101_c7_e196_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1096_c3_9f90_uxn_opcodes_h_l1096_c3_9f90_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_b133_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_e196_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_b133_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_e196_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_b133_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_e196_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_b133_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_e196_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1102_c3_c44b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_b133_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_e196_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_b133_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_e196_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1104_c7_b133_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_e196_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1104_c7_b133_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1101_c7_e196_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1104_c7_b133_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1101_c7_e196_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_b133_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_b133_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_b133_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_b133_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1106_c3_2a95 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_b133_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_b133_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1104_c7_b133_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1104_c7_b133_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1104_c7_b133_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_4cc3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_4cc3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_4cc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_cd38_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_cd38_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1109_c3_2ee5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_cd38_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_cd38_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_cd38_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1108_c7_cd38_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_bab4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_bab4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_bab4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_bc16_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_bc16_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_bc16_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_bc16_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_bc16_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1111_c7_bc16_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1115_c32_ed95_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1115_c32_ed95_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1115_c32_ed95_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1115_c32_2ef1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1115_c32_2ef1_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1115_c32_2ef1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1115_c32_99ea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1115_c32_99ea_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1115_c32_99ea_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1115_c32_ed95_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_9bfc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_9bfc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_9bfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1adf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_adf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1adf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_adf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1adf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1120_c3_43f6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1adf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1adf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1121_c24_aa51_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1121_c24_aa51_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1121_c24_aa51_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_071a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_071a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_071a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_adf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_adf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_adf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_adf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_adf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_adf7_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1117_l1101_l1108_l1104_l1095_DUPLICATE_7e29_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1101_l1108_l1104_l1095_l1111_DUPLICATE_f2bf_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1101_l1108_l1104_l1095_l1111_l1123_DUPLICATE_c6d2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1101_l1108_l1104_l1095_l1111_DUPLICATE_932d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1108_l1101_l1111_l1104_DUPLICATE_6b27_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1101_l1108_l1104_l1111_l1123_DUPLICATE_8b73_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1117_l1111_DUPLICATE_4a57_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1091_l1128_DUPLICATE_7ff1_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_071a_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1120_c3_43f6 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1120_c3_43f6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1109_c3_2ee5 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1109_c3_2ee5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_bab4_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_adf7_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_adf7_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1115_c32_ed95_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1115_c32_99ea_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1102_c3_c44b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1102_c3_c44b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_4cc3_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1095_c1_2320_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_9bfc_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1106_c3_2a95 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1106_c3_2a95;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1098_c3_387d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1098_c3_387d;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1115_c32_ed95_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1115_c32_2ef1_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1095_c1_2320_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1115_c32_2ef1_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1121_c24_aa51_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_4cc3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_bab4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_9bfc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_071a_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1121_c24_aa51_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse := t8;
     -- BIN_OP_OR[uxn_opcodes_h_l1121_c24_aa51] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1121_c24_aa51_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1121_c24_aa51_left;
     BIN_OP_OR_uxn_opcodes_h_l1121_c24_aa51_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1121_c24_aa51_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1121_c24_aa51_return_output := BIN_OP_OR_uxn_opcodes_h_l1121_c24_aa51_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1117_l1101_l1108_l1104_l1095_DUPLICATE_7e29 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1117_l1101_l1108_l1104_l1095_DUPLICATE_7e29_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1101_l1108_l1104_l1095_l1111_DUPLICATE_932d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1101_l1108_l1104_l1095_l1111_DUPLICATE_932d_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1108_l1101_l1111_l1104_DUPLICATE_6b27 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1108_l1101_l1111_l1104_DUPLICATE_6b27_return_output := result.is_stack_read;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1101_l1108_l1104_l1095_l1111_DUPLICATE_f2bf LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1101_l1108_l1104_l1095_l1111_DUPLICATE_f2bf_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1101_l1108_l1104_l1095_l1111_l1123_DUPLICATE_c6d2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1101_l1108_l1104_l1095_l1111_l1123_DUPLICATE_c6d2_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1104_c11_2dfe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe_left;
     BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe_return_output := BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1095_c6_ba39] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39_left;
     BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39_return_output := BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1111_c11_bab4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1111_c11_bab4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_bab4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1111_c11_bab4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_bab4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_bab4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1111_c11_bab4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1123_c11_071a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1123_c11_071a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_071a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1123_c11_071a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_071a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_071a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1123_c11_071a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1117_c11_9bfc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1117_c11_9bfc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_9bfc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1117_c11_9bfc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_9bfc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_9bfc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1117_c11_9bfc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1101_l1108_l1104_l1111_l1123_DUPLICATE_8b73 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1101_l1108_l1104_l1111_l1123_DUPLICATE_8b73_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1108_c11_4cc3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1108_c11_4cc3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_4cc3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1108_c11_4cc3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_4cc3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_4cc3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1108_c11_4cc3_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1115_c32_2ef1] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1115_c32_2ef1_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1115_c32_2ef1_left;
     BIN_OP_AND_uxn_opcodes_h_l1115_c32_2ef1_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1115_c32_2ef1_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1115_c32_2ef1_return_output := BIN_OP_AND_uxn_opcodes_h_l1115_c32_2ef1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1101_c11_3d1b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1117_l1111_DUPLICATE_4a57 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1117_l1111_DUPLICATE_4a57_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1115_c32_99ea_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1115_c32_2ef1_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1095_c1_2320_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1095_c6_ba39_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1101_c7_e196_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_e196_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_e196_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_e196_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_e196_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_e196_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_e196_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_e196_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1101_c7_e196_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1101_c11_3d1b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1104_c7_b133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_b133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_b133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_b133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_b133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_b133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_b133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1104_c7_b133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1104_c7_b133_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1104_c11_2dfe_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1108_c7_cd38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_4cc3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_cd38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_4cc3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_4cc3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_cd38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_4cc3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_cd38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_4cc3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_4cc3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_cd38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_4cc3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_cd38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1108_c11_4cc3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1111_c7_bc16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_bab4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_bc16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_bab4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_bab4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_bc16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_bab4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_bc16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_bab4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_bab4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_bc16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_bab4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_bc16_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1111_c11_bab4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1adf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_9bfc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1adf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_9bfc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1adf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_9bfc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1adf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_9bfc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1adf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1117_c11_9bfc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_adf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_071a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_adf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1123_c11_071a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1121_c24_aa51_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1101_l1108_l1104_l1095_l1111_DUPLICATE_f2bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1101_l1108_l1104_l1095_l1111_DUPLICATE_f2bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1101_l1108_l1104_l1095_l1111_DUPLICATE_f2bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1101_l1108_l1104_l1095_l1111_DUPLICATE_f2bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1101_l1108_l1104_l1095_l1111_DUPLICATE_f2bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1101_l1108_l1104_l1111_l1123_DUPLICATE_8b73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1101_l1108_l1104_l1111_l1123_DUPLICATE_8b73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1101_l1108_l1104_l1111_l1123_DUPLICATE_8b73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1101_l1108_l1104_l1111_l1123_DUPLICATE_8b73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1101_l1108_l1104_l1111_l1123_DUPLICATE_8b73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_adf7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1117_l1101_l1108_l1104_l1111_l1123_DUPLICATE_8b73_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1117_l1101_l1108_l1104_l1095_DUPLICATE_7e29_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1117_l1101_l1108_l1104_l1095_DUPLICATE_7e29_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1117_l1101_l1108_l1104_l1095_DUPLICATE_7e29_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1117_l1101_l1108_l1104_l1095_DUPLICATE_7e29_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1117_l1101_l1108_l1104_l1095_DUPLICATE_7e29_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1108_l1101_l1111_l1104_DUPLICATE_6b27_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1108_l1101_l1111_l1104_DUPLICATE_6b27_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1108_l1101_l1111_l1104_DUPLICATE_6b27_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1108_l1101_l1111_l1104_DUPLICATE_6b27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1101_l1108_l1104_l1095_l1111_l1123_DUPLICATE_c6d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1101_l1108_l1104_l1095_l1111_l1123_DUPLICATE_c6d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1101_l1108_l1104_l1095_l1111_l1123_DUPLICATE_c6d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1101_l1108_l1104_l1095_l1111_l1123_DUPLICATE_c6d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1101_l1108_l1104_l1095_l1111_l1123_DUPLICATE_c6d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_adf7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1101_l1108_l1104_l1095_l1111_l1123_DUPLICATE_c6d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1117_l1111_DUPLICATE_4a57_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1117_l1111_DUPLICATE_4a57_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1101_l1108_l1104_l1095_l1111_DUPLICATE_932d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1101_l1108_l1104_l1095_l1111_DUPLICATE_932d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1101_l1108_l1104_l1095_l1111_DUPLICATE_932d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1101_l1108_l1104_l1095_l1111_DUPLICATE_932d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1101_l1108_l1104_l1095_l1111_DUPLICATE_932d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1117_l1101_l1108_l1104_l1095_l1111_DUPLICATE_932d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1117_c7_1adf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1adf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1adf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1123_c7_adf7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_adf7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_adf7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_adf7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_adf7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_adf7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_adf7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_adf7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_adf7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1117_c7_1adf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1adf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1adf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1115_c32_99ea] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1115_c32_99ea_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1115_c32_99ea_left;
     BIN_OP_GT_uxn_opcodes_h_l1115_c32_99ea_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1115_c32_99ea_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1115_c32_99ea_return_output := BIN_OP_GT_uxn_opcodes_h_l1115_c32_99ea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1123_c7_adf7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_adf7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_adf7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_adf7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_adf7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_adf7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_adf7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_adf7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_adf7_return_output;

     -- t8_MUX[uxn_opcodes_h_l1104_c7_b133] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1104_c7_b133_cond <= VAR_t8_MUX_uxn_opcodes_h_l1104_c7_b133_cond;
     t8_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue;
     t8_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1104_c7_b133_return_output := t8_MUX_uxn_opcodes_h_l1104_c7_b133_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1111_c7_bc16] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_bc16_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_bc16_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output;

     -- n8_MUX[uxn_opcodes_h_l1111_c7_bc16] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1111_c7_bc16_cond <= VAR_n8_MUX_uxn_opcodes_h_l1111_c7_bc16_cond;
     n8_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue;
     n8_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output := n8_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1095_c1_2320] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1095_c1_2320_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1095_c1_2320_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1095_c1_2320_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1095_c1_2320_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1095_c1_2320_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1095_c1_2320_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1095_c1_2320_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1095_c1_2320_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1117_c7_1adf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1adf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1adf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output := result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1115_c32_ed95_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1115_c32_99ea_return_output;
     VAR_printf_uxn_opcodes_h_l1096_c3_9f90_uxn_opcodes_h_l1096_c3_9f90_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1095_c1_2320_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1123_c7_adf7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1123_c7_adf7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1104_c7_b133_return_output;
     -- printf_uxn_opcodes_h_l1096_c3_9f90[uxn_opcodes_h_l1096_c3_9f90] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1096_c3_9f90_uxn_opcodes_h_l1096_c3_9f90_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1096_c3_9f90_uxn_opcodes_h_l1096_c3_9f90_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l1101_c7_e196] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1101_c7_e196_cond <= VAR_t8_MUX_uxn_opcodes_h_l1101_c7_e196_cond;
     t8_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue;
     t8_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1101_c7_e196_return_output := t8_MUX_uxn_opcodes_h_l1101_c7_e196_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1111_c7_bc16] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1111_c7_bc16] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_bc16_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_bc16_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1117_c7_1adf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1adf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1adf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output;

     -- MUX[uxn_opcodes_h_l1115_c32_ed95] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1115_c32_ed95_cond <= VAR_MUX_uxn_opcodes_h_l1115_c32_ed95_cond;
     MUX_uxn_opcodes_h_l1115_c32_ed95_iftrue <= VAR_MUX_uxn_opcodes_h_l1115_c32_ed95_iftrue;
     MUX_uxn_opcodes_h_l1115_c32_ed95_iffalse <= VAR_MUX_uxn_opcodes_h_l1115_c32_ed95_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1115_c32_ed95_return_output := MUX_uxn_opcodes_h_l1115_c32_ed95_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1108_c7_cd38] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_cd38_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_cd38_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1111_c7_bc16] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1111_c7_bc16_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_bc16_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output := result_stack_value_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output;

     -- n8_MUX[uxn_opcodes_h_l1108_c7_cd38] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1108_c7_cd38_cond <= VAR_n8_MUX_uxn_opcodes_h_l1108_c7_cd38_cond;
     n8_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue;
     n8_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output := n8_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1117_c7_1adf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1adf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1adf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1adf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1adf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue := VAR_MUX_uxn_opcodes_h_l1115_c32_ed95_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1117_c7_1adf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1101_c7_e196_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1111_c7_bc16] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_bc16_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_bc16_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1104_c7_b133] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_b133_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_b133_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_b133_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_b133_return_output;

     -- n8_MUX[uxn_opcodes_h_l1104_c7_b133] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1104_c7_b133_cond <= VAR_n8_MUX_uxn_opcodes_h_l1104_c7_b133_cond;
     n8_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue;
     n8_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1104_c7_b133_return_output := n8_MUX_uxn_opcodes_h_l1104_c7_b133_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1108_c7_cd38] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1108_c7_cd38] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_cd38_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_cd38_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1108_c7_cd38] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1108_c7_cd38_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_cd38_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output := result_stack_value_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output;

     -- t8_MUX[uxn_opcodes_h_l1095_c2_3a0b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond <= VAR_t8_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond;
     t8_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue;
     t8_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output := t8_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1111_c7_bc16] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1111_c7_bc16] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_bc16_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_bc16_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_bc16_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_bc16_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1104_c7_b133_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1104_c7_b133_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1111_c7_bc16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output;
     -- n8_MUX[uxn_opcodes_h_l1101_c7_e196] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1101_c7_e196_cond <= VAR_n8_MUX_uxn_opcodes_h_l1101_c7_e196_cond;
     n8_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue;
     n8_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1101_c7_e196_return_output := n8_MUX_uxn_opcodes_h_l1101_c7_e196_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1108_c7_cd38] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1104_c7_b133] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1104_c7_b133_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1104_c7_b133_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1104_c7_b133_return_output := result_stack_value_MUX_uxn_opcodes_h_l1104_c7_b133_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1108_c7_cd38] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_cd38_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_cd38_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1104_c7_b133] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_b133_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_b133_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_b133_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_b133_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1101_c7_e196] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_e196_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_e196_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_e196_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_e196_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1104_c7_b133] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_b133_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_b133_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_b133_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_b133_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1108_c7_cd38] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_cd38_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_cd38_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_cd38_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_cd38_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1101_c7_e196_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1104_c7_b133_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1101_c7_e196_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1108_c7_cd38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1104_c7_b133_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1104_c7_b133_return_output;
     -- n8_MUX[uxn_opcodes_h_l1095_c2_3a0b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond <= VAR_n8_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond;
     n8_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue;
     n8_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output := n8_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1095_c2_3a0b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1104_c7_b133] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_b133_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_b133_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_b133_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_b133_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1104_c7_b133] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_b133_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_b133_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_b133_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_b133_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1101_c7_e196] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_e196_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_e196_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_e196_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_e196_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1101_c7_e196] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1101_c7_e196_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_e196_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_e196_return_output := result_stack_value_MUX_uxn_opcodes_h_l1101_c7_e196_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1101_c7_e196] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_e196_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_e196_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_e196_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_e196_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1104_c7_b133] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_b133_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_b133_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_b133_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_b133_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_b133_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_b133_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1104_c7_b133_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1101_c7_e196_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1104_c7_b133_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1104_c7_b133_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1101_c7_e196_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1101_c7_e196_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1101_c7_e196] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_e196_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_e196_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_e196_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_e196_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1101_c7_e196] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_e196_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_e196_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_e196_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_e196_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1101_c7_e196] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_e196_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_e196_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_e196_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_e196_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_e196_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_e196_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1095_c2_3a0b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output := result_stack_value_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1095_c2_3a0b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1095_c2_3a0b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1101_c7_e196_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1101_c7_e196_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1101_c7_e196_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1095_c2_3a0b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1095_c2_3a0b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1095_c2_3a0b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c2_3a0b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c2_3a0b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c2_3a0b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1091_l1128_DUPLICATE_7ff1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1091_l1128_DUPLICATE_7ff1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1095_c2_3a0b_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1091_l1128_DUPLICATE_7ff1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l1091_l1128_DUPLICATE_7ff1_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
