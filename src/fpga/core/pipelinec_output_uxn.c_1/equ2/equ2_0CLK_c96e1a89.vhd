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
-- Submodules: 91
entity equ2_0CLK_c96e1a89 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ2_0CLK_c96e1a89;
architecture arch of equ2_0CLK_c96e1a89 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1262_c6_6a95]
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1262_c1_ee3b]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_ee3b_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_ee3b_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_ee3b_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_ee3b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1262_c2_c9b5]
signal n16_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1262_c2_c9b5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1262_c2_c9b5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1262_c2_c9b5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1262_c2_c9b5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1262_c2_c9b5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1262_c2_c9b5]
signal result_u8_value_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1262_c2_c9b5]
signal t16_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1263_c3_ddcc[uxn_opcodes_h_l1263_c3_ddcc]
signal printf_uxn_opcodes_h_l1263_c3_ddcc_uxn_opcodes_h_l1263_c3_ddcc_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1267_c11_ca64]
signal BIN_OP_EQ_uxn_opcodes_h_l1267_c11_ca64_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1267_c11_ca64_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1267_c11_ca64_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1267_c7_078d]
signal n16_MUX_uxn_opcodes_h_l1267_c7_078d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1267_c7_078d_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1267_c7_078d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_078d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_078d_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1267_c7_078d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_078d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_078d_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1267_c7_078d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_078d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_078d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1267_c7_078d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_078d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_078d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1267_c7_078d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_078d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_078d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1267_c7_078d]
signal result_u8_value_MUX_uxn_opcodes_h_l1267_c7_078d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1267_c7_078d_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1267_c7_078d]
signal t16_MUX_uxn_opcodes_h_l1267_c7_078d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1267_c7_078d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1270_c11_e4d3]
signal BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e4d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e4d3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e4d3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1270_c7_f44f]
signal n16_MUX_uxn_opcodes_h_l1270_c7_f44f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1270_c7_f44f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1270_c7_f44f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_f44f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1270_c7_f44f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1270_c7_f44f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_f44f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1270_c7_f44f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_f44f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1270_c7_f44f]
signal result_u8_value_MUX_uxn_opcodes_h_l1270_c7_f44f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1270_c7_f44f]
signal t16_MUX_uxn_opcodes_h_l1270_c7_f44f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1275_c11_6ec2]
signal BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6ec2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6ec2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6ec2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1275_c7_868a]
signal n16_MUX_uxn_opcodes_h_l1275_c7_868a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1275_c7_868a_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1275_c7_868a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_868a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_868a_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1275_c7_868a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_868a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_868a_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1275_c7_868a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_868a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_868a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1275_c7_868a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_868a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_868a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1275_c7_868a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_868a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_868a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1275_c7_868a]
signal result_u8_value_MUX_uxn_opcodes_h_l1275_c7_868a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1275_c7_868a_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1275_c7_868a]
signal t16_MUX_uxn_opcodes_h_l1275_c7_868a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1275_c7_868a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1278_c11_4ac7]
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c11_4ac7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c11_4ac7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1278_c11_4ac7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1278_c7_708b]
signal n16_MUX_uxn_opcodes_h_l1278_c7_708b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1278_c7_708b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1278_c7_708b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_708b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_708b_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1278_c7_708b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_708b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_708b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1278_c7_708b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_708b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_708b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1278_c7_708b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_708b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_708b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1278_c7_708b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_708b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_708b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1278_c7_708b]
signal result_u8_value_MUX_uxn_opcodes_h_l1278_c7_708b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1278_c7_708b_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l1278_c7_708b]
signal t16_MUX_uxn_opcodes_h_l1278_c7_708b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1278_c7_708b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1279_c3_b44c]
signal BIN_OP_OR_uxn_opcodes_h_l1279_c3_b44c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1279_c3_b44c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1279_c3_b44c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1282_c11_76da]
signal BIN_OP_EQ_uxn_opcodes_h_l1282_c11_76da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1282_c11_76da_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1282_c11_76da_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1282_c7_a830]
signal n16_MUX_uxn_opcodes_h_l1282_c7_a830_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1282_c7_a830_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1282_c7_a830]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a830_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a830_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1282_c7_a830]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a830_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a830_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1282_c7_a830]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a830_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a830_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1282_c7_a830]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a830_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a830_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1282_c7_a830]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a830_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a830_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1282_c7_a830]
signal result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a830_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a830_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1285_c11_fe7f]
signal BIN_OP_EQ_uxn_opcodes_h_l1285_c11_fe7f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1285_c11_fe7f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1285_c11_fe7f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1285_c7_80a8]
signal n16_MUX_uxn_opcodes_h_l1285_c7_80a8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1285_c7_80a8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1285_c7_80a8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_80a8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1285_c7_80a8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1285_c7_80a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_80a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1285_c7_80a8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_80a8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1285_c7_80a8]
signal result_u8_value_MUX_uxn_opcodes_h_l1285_c7_80a8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1290_c11_e450]
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_e450_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_e450_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_e450_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1290_c7_f3ba]
signal n16_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1290_c7_f3ba]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1290_c7_f3ba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1290_c7_f3ba]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1290_c7_f3ba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1290_c7_f3ba]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1290_c7_f3ba]
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1293_c11_0e45]
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0e45_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0e45_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0e45_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1293_c7_1194]
signal n16_MUX_uxn_opcodes_h_l1293_c7_1194_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_1194_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1293_c7_1194]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_1194_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_1194_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1293_c7_1194]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_1194_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_1194_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1293_c7_1194]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_1194_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_1194_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1293_c7_1194]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_1194_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_1194_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1293_c7_1194]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_1194_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_1194_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1293_c7_1194]
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_1194_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_1194_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1294_c3_4ed1]
signal BIN_OP_OR_uxn_opcodes_h_l1294_c3_4ed1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1294_c3_4ed1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1294_c3_4ed1_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1296_c30_2615]
signal sp_relative_shift_uxn_opcodes_h_l1296_c30_2615_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1296_c30_2615_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1296_c30_2615_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1296_c30_2615_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1299_c21_3506]
signal BIN_OP_EQ_uxn_opcodes_h_l1299_c21_3506_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1299_c21_3506_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1299_c21_3506_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1299_c21_4bdb]
signal MUX_uxn_opcodes_h_l1299_c21_4bdb_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1299_c21_4bdb_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1299_c21_4bdb_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1299_c21_4bdb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1301_c11_1fc5]
signal BIN_OP_EQ_uxn_opcodes_h_l1301_c11_1fc5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1301_c11_1fc5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1301_c11_1fc5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1301_c7_4c5b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_4c5b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_4c5b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_4c5b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_4c5b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1301_c7_4c5b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_4c5b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_4c5b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_4c5b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_4c5b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1301_c7_4c5b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_4c5b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_4c5b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_4c5b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_4c5b_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1287_l1272_DUPLICATE_a4e7
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1287_l1272_DUPLICATE_a4e7_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1287_l1272_DUPLICATE_a4e7_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_8cda( ref_toks_0 : opcode_result_t;
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
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95
BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95_left,
BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95_right,
BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_ee3b
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_ee3b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_ee3b_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_ee3b_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_ee3b_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_ee3b_return_output);

-- n16_MUX_uxn_opcodes_h_l1262_c2_c9b5
n16_MUX_uxn_opcodes_h_l1262_c2_c9b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond,
n16_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue,
n16_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse,
n16_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_c9b5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_c9b5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_c9b5
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_c9b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_c9b5
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_c9b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1262_c2_c9b5
result_u8_value_MUX_uxn_opcodes_h_l1262_c2_c9b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output);

-- t16_MUX_uxn_opcodes_h_l1262_c2_c9b5
t16_MUX_uxn_opcodes_h_l1262_c2_c9b5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond,
t16_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue,
t16_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse,
t16_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output);

-- printf_uxn_opcodes_h_l1263_c3_ddcc_uxn_opcodes_h_l1263_c3_ddcc
printf_uxn_opcodes_h_l1263_c3_ddcc_uxn_opcodes_h_l1263_c3_ddcc : entity work.printf_uxn_opcodes_h_l1263_c3_ddcc_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1263_c3_ddcc_uxn_opcodes_h_l1263_c3_ddcc_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1267_c11_ca64
BIN_OP_EQ_uxn_opcodes_h_l1267_c11_ca64 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1267_c11_ca64_left,
BIN_OP_EQ_uxn_opcodes_h_l1267_c11_ca64_right,
BIN_OP_EQ_uxn_opcodes_h_l1267_c11_ca64_return_output);

-- n16_MUX_uxn_opcodes_h_l1267_c7_078d
n16_MUX_uxn_opcodes_h_l1267_c7_078d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1267_c7_078d_cond,
n16_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue,
n16_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse,
n16_MUX_uxn_opcodes_h_l1267_c7_078d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_078d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_078d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_078d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_078d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_078d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_078d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_078d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_078d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_078d
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_078d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_078d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_078d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_078d
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_078d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_078d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_078d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_078d
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_078d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_078d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_078d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1267_c7_078d
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_078d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_078d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1267_c7_078d_return_output);

-- t16_MUX_uxn_opcodes_h_l1267_c7_078d
t16_MUX_uxn_opcodes_h_l1267_c7_078d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1267_c7_078d_cond,
t16_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue,
t16_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse,
t16_MUX_uxn_opcodes_h_l1267_c7_078d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e4d3
BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e4d3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e4d3_left,
BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e4d3_right,
BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e4d3_return_output);

-- n16_MUX_uxn_opcodes_h_l1270_c7_f44f
n16_MUX_uxn_opcodes_h_l1270_c7_f44f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1270_c7_f44f_cond,
n16_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue,
n16_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse,
n16_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_f44f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_f44f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_f44f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_f44f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_f44f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_f44f
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_f44f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_f44f
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_f44f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_f44f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_f44f
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_f44f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_f44f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1270_c7_f44f
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_f44f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_f44f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output);

-- t16_MUX_uxn_opcodes_h_l1270_c7_f44f
t16_MUX_uxn_opcodes_h_l1270_c7_f44f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1270_c7_f44f_cond,
t16_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue,
t16_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse,
t16_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6ec2
BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6ec2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6ec2_left,
BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6ec2_right,
BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6ec2_return_output);

-- n16_MUX_uxn_opcodes_h_l1275_c7_868a
n16_MUX_uxn_opcodes_h_l1275_c7_868a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1275_c7_868a_cond,
n16_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue,
n16_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse,
n16_MUX_uxn_opcodes_h_l1275_c7_868a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_868a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_868a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_868a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_868a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_868a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_868a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_868a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_868a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_868a
result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_868a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_868a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_868a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_868a
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_868a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_868a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_868a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_868a
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_868a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_868a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_868a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1275_c7_868a
result_u8_value_MUX_uxn_opcodes_h_l1275_c7_868a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1275_c7_868a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1275_c7_868a_return_output);

-- t16_MUX_uxn_opcodes_h_l1275_c7_868a
t16_MUX_uxn_opcodes_h_l1275_c7_868a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1275_c7_868a_cond,
t16_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue,
t16_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse,
t16_MUX_uxn_opcodes_h_l1275_c7_868a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1278_c11_4ac7
BIN_OP_EQ_uxn_opcodes_h_l1278_c11_4ac7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1278_c11_4ac7_left,
BIN_OP_EQ_uxn_opcodes_h_l1278_c11_4ac7_right,
BIN_OP_EQ_uxn_opcodes_h_l1278_c11_4ac7_return_output);

-- n16_MUX_uxn_opcodes_h_l1278_c7_708b
n16_MUX_uxn_opcodes_h_l1278_c7_708b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1278_c7_708b_cond,
n16_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue,
n16_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse,
n16_MUX_uxn_opcodes_h_l1278_c7_708b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_708b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_708b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_708b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_708b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_708b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_708b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_708b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_708b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_708b
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_708b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_708b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_708b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_708b
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_708b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_708b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_708b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_708b
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_708b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_708b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_708b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1278_c7_708b
result_u8_value_MUX_uxn_opcodes_h_l1278_c7_708b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1278_c7_708b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1278_c7_708b_return_output);

-- t16_MUX_uxn_opcodes_h_l1278_c7_708b
t16_MUX_uxn_opcodes_h_l1278_c7_708b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1278_c7_708b_cond,
t16_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue,
t16_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse,
t16_MUX_uxn_opcodes_h_l1278_c7_708b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1279_c3_b44c
BIN_OP_OR_uxn_opcodes_h_l1279_c3_b44c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1279_c3_b44c_left,
BIN_OP_OR_uxn_opcodes_h_l1279_c3_b44c_right,
BIN_OP_OR_uxn_opcodes_h_l1279_c3_b44c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1282_c11_76da
BIN_OP_EQ_uxn_opcodes_h_l1282_c11_76da : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1282_c11_76da_left,
BIN_OP_EQ_uxn_opcodes_h_l1282_c11_76da_right,
BIN_OP_EQ_uxn_opcodes_h_l1282_c11_76da_return_output);

-- n16_MUX_uxn_opcodes_h_l1282_c7_a830
n16_MUX_uxn_opcodes_h_l1282_c7_a830 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1282_c7_a830_cond,
n16_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue,
n16_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse,
n16_MUX_uxn_opcodes_h_l1282_c7_a830_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a830
result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a830 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a830_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a830_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a830
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a830 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a830_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a830_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a830
result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a830 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a830_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a830_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a830
result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a830 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a830_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a830_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a830
result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a830 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a830_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a830_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a830
result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a830 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a830_cond,
result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a830_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1285_c11_fe7f
BIN_OP_EQ_uxn_opcodes_h_l1285_c11_fe7f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1285_c11_fe7f_left,
BIN_OP_EQ_uxn_opcodes_h_l1285_c11_fe7f_right,
BIN_OP_EQ_uxn_opcodes_h_l1285_c11_fe7f_return_output);

-- n16_MUX_uxn_opcodes_h_l1285_c7_80a8
n16_MUX_uxn_opcodes_h_l1285_c7_80a8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1285_c7_80a8_cond,
n16_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue,
n16_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse,
n16_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_80a8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_80a8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_80a8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_80a8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_80a8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_80a8
result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_80a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_80a8
result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_80a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_80a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_80a8
result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_80a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_80a8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1285_c7_80a8
result_u8_value_MUX_uxn_opcodes_h_l1285_c7_80a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1285_c7_80a8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1290_c11_e450
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_e450 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_e450_left,
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_e450_right,
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_e450_return_output);

-- n16_MUX_uxn_opcodes_h_l1290_c7_f3ba
n16_MUX_uxn_opcodes_h_l1290_c7_f3ba : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond,
n16_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue,
n16_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse,
n16_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_f3ba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_f3ba : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba
result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_f3ba
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_f3ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_f3ba
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_f3ba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1290_c7_f3ba
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_f3ba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0e45
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0e45 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0e45_left,
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0e45_right,
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0e45_return_output);

-- n16_MUX_uxn_opcodes_h_l1293_c7_1194
n16_MUX_uxn_opcodes_h_l1293_c7_1194 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1293_c7_1194_cond,
n16_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue,
n16_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse,
n16_MUX_uxn_opcodes_h_l1293_c7_1194_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_1194
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_1194 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_1194_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_1194_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_1194
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_1194 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_1194_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_1194_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_1194
result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_1194 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_1194_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_1194_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_1194
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_1194 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_1194_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_1194_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_1194
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_1194 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_1194_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_1194_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1293_c7_1194
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_1194 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_1194_cond,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_1194_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1294_c3_4ed1
BIN_OP_OR_uxn_opcodes_h_l1294_c3_4ed1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1294_c3_4ed1_left,
BIN_OP_OR_uxn_opcodes_h_l1294_c3_4ed1_right,
BIN_OP_OR_uxn_opcodes_h_l1294_c3_4ed1_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1296_c30_2615
sp_relative_shift_uxn_opcodes_h_l1296_c30_2615 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1296_c30_2615_ins,
sp_relative_shift_uxn_opcodes_h_l1296_c30_2615_x,
sp_relative_shift_uxn_opcodes_h_l1296_c30_2615_y,
sp_relative_shift_uxn_opcodes_h_l1296_c30_2615_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1299_c21_3506
BIN_OP_EQ_uxn_opcodes_h_l1299_c21_3506 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1299_c21_3506_left,
BIN_OP_EQ_uxn_opcodes_h_l1299_c21_3506_right,
BIN_OP_EQ_uxn_opcodes_h_l1299_c21_3506_return_output);

-- MUX_uxn_opcodes_h_l1299_c21_4bdb
MUX_uxn_opcodes_h_l1299_c21_4bdb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1299_c21_4bdb_cond,
MUX_uxn_opcodes_h_l1299_c21_4bdb_iftrue,
MUX_uxn_opcodes_h_l1299_c21_4bdb_iffalse,
MUX_uxn_opcodes_h_l1299_c21_4bdb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1301_c11_1fc5
BIN_OP_EQ_uxn_opcodes_h_l1301_c11_1fc5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1301_c11_1fc5_left,
BIN_OP_EQ_uxn_opcodes_h_l1301_c11_1fc5_right,
BIN_OP_EQ_uxn_opcodes_h_l1301_c11_1fc5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_4c5b
result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_4c5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_4c5b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_4c5b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_4c5b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_4c5b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_4c5b
result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_4c5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_4c5b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_4c5b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_4c5b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_4c5b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_4c5b
result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_4c5b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_4c5b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_4c5b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_4c5b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_4c5b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1287_l1272_DUPLICATE_a4e7
CONST_SL_8_uint16_t_uxn_opcodes_h_l1287_l1272_DUPLICATE_a4e7 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1287_l1272_DUPLICATE_a4e7_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1287_l1272_DUPLICATE_a4e7_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_ee3b_return_output,
 n16_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output,
 t16_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1267_c11_ca64_return_output,
 n16_MUX_uxn_opcodes_h_l1267_c7_078d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_078d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_078d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_078d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_078d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_078d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1267_c7_078d_return_output,
 t16_MUX_uxn_opcodes_h_l1267_c7_078d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e4d3_return_output,
 n16_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output,
 t16_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6ec2_return_output,
 n16_MUX_uxn_opcodes_h_l1275_c7_868a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_868a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_868a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_868a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_868a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_868a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1275_c7_868a_return_output,
 t16_MUX_uxn_opcodes_h_l1275_c7_868a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1278_c11_4ac7_return_output,
 n16_MUX_uxn_opcodes_h_l1278_c7_708b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_708b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_708b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_708b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_708b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_708b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1278_c7_708b_return_output,
 t16_MUX_uxn_opcodes_h_l1278_c7_708b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1279_c3_b44c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1282_c11_76da_return_output,
 n16_MUX_uxn_opcodes_h_l1282_c7_a830_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a830_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a830_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a830_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a830_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a830_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a830_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1285_c11_fe7f_return_output,
 n16_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1290_c11_e450_return_output,
 n16_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0e45_return_output,
 n16_MUX_uxn_opcodes_h_l1293_c7_1194_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_1194_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_1194_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_1194_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_1194_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_1194_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1293_c7_1194_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1294_c3_4ed1_return_output,
 sp_relative_shift_uxn_opcodes_h_l1296_c30_2615_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1299_c21_3506_return_output,
 MUX_uxn_opcodes_h_l1299_c21_4bdb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1301_c11_1fc5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_4c5b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_4c5b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_4c5b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1287_l1272_DUPLICATE_a4e7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_ee3b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_ee3b_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_ee3b_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_ee3b_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1267_c7_078d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_078d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1264_c3_cc99 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_078d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_078d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_078d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_078d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_078d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1267_c7_078d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1263_c3_ddcc_uxn_opcodes_h_l1263_c3_ddcc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_ca64_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_ca64_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_ca64_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1267_c7_078d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_078d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1268_c3_3701 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_078d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_078d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_078d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_078d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_078d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1267_c7_078d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e4d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e4d3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e4d3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1275_c7_868a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1270_c7_f44f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_868a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1273_c3_cb0b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_868a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_f44f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_868a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_868a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_f44f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_868a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_f44f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_868a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_f44f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1275_c7_868a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1270_c7_f44f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6ec2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6ec2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6ec2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1278_c7_708b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1275_c7_868a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_708b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_868a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1276_c3_27fa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_708b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_868a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_708b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_868a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_708b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_868a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_708b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_868a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_708b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_868a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1278_c7_708b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1275_c7_868a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_4ac7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_4ac7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_4ac7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1282_c7_a830_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1278_c7_708b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a830_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_708b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1280_c3_f5f8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a830_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_708b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a830_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_708b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a830_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_708b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a830_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_708b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a830_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_708b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1278_c7_708b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1279_c3_b44c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1279_c3_b44c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1279_c3_b44c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_76da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_76da_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_76da_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1282_c7_a830_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a830_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1283_c3_3441 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a830_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a830_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a830_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a830_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a830_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_fe7f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_fe7f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_fe7f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1285_c7_80a8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1288_c3_da74 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_80a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_80a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_80a8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_80a8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_e450_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_e450_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_e450_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_1194_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_1194_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_0bbc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_1194_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_1194_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_1194_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_1194_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_1194_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0e45_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0e45_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0e45_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_1194_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_1194_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1298_c3_2b8f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1293_c7_1194_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_1194_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_4c5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_1194_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_4c5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_1194_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_4c5b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_1194_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_1194_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_4ed1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_4ed1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_4ed1_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1296_c30_2615_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1296_c30_2615_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1296_c30_2615_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1296_c30_2615_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1299_c21_4bdb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1299_c21_4bdb_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1299_c21_4bdb_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c21_3506_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c21_3506_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c21_3506_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1299_c21_4bdb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1301_c11_1fc5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1301_c11_1fc5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1301_c11_1fc5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_4c5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_4c5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_4c5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_4c5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_4c5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_4c5b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_4c5b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_4c5b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_4c5b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_l1275_DUPLICATE_40f9_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1270_l1267_l1290_l1262_l1285_l1282_l1278_l1275_l1301_DUPLICATE_e2e9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1270_l1267_l1290_l1262_l1285_l1282_l1278_l1275_l1301_DUPLICATE_11d0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_l1275_DUPLICATE_8677_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1285_l1282_l1278_l1275_l1301_DUPLICATE_adae_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1271_l1294_l1279_l1286_DUPLICATE_f582_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1287_l1272_DUPLICATE_a4e7_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1287_l1272_DUPLICATE_a4e7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1258_l1307_DUPLICATE_e798_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1276_c3_27fa := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1276_c3_27fa;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_4c5b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1301_c11_1fc5_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_fe7f_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_76da_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1283_c3_3441 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1283_c3_3441;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_0bbc := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_0bbc;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_4c5b_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_4c5b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1288_c3_da74 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1288_c3_da74;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e4d3_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0e45_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1268_c3_3701 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1268_c3_3701;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_e450_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1280_c3_f5f8 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1280_c3_f5f8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1264_c3_cc99 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1264_c3_cc99;
     VAR_sp_relative_shift_uxn_opcodes_h_l1296_c30_2615_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_ca64_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1296_c30_2615_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6ec2_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_4ac7_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1273_c3_cb0b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1273_c3_cb0b;
     VAR_MUX_uxn_opcodes_h_l1299_c21_4bdb_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_MUX_uxn_opcodes_h_l1299_c21_4bdb_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1298_c3_2b8f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1298_c3_2b8f;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_ee3b_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_ee3b_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1296_c30_2615_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_4ed1_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_ca64_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e4d3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6ec2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_4ac7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_76da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_fe7f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_e450_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0e45_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1301_c11_1fc5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c21_3506_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1279_c3_b44c_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse := t16;
     -- sp_relative_shift[uxn_opcodes_h_l1296_c30_2615] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1296_c30_2615_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1296_c30_2615_ins;
     sp_relative_shift_uxn_opcodes_h_l1296_c30_2615_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1296_c30_2615_x;
     sp_relative_shift_uxn_opcodes_h_l1296_c30_2615_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1296_c30_2615_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1296_c30_2615_return_output := sp_relative_shift_uxn_opcodes_h_l1296_c30_2615_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1293_c7_1194] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1293_c7_1194_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_l1275_DUPLICATE_8677 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_l1275_DUPLICATE_8677_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1267_c11_ca64] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1267_c11_ca64_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_ca64_left;
     BIN_OP_EQ_uxn_opcodes_h_l1267_c11_ca64_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_ca64_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_ca64_return_output := BIN_OP_EQ_uxn_opcodes_h_l1267_c11_ca64_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1262_c6_6a95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95_left;
     BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95_return_output := BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1285_c11_fe7f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1285_c11_fe7f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_fe7f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1285_c11_fe7f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_fe7f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_fe7f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1285_c11_fe7f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1293_c11_0e45] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0e45_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0e45_left;
     BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0e45_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0e45_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0e45_return_output := BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0e45_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1285_l1282_l1278_l1275_l1301_DUPLICATE_adae LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1285_l1282_l1278_l1275_l1301_DUPLICATE_adae_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1301_c11_1fc5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1301_c11_1fc5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1301_c11_1fc5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1301_c11_1fc5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1301_c11_1fc5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1301_c11_1fc5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1301_c11_1fc5_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_l1275_DUPLICATE_40f9 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_l1275_DUPLICATE_40f9_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1278_c11_4ac7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1278_c11_4ac7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_4ac7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1278_c11_4ac7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_4ac7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_4ac7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1278_c11_4ac7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1290_c11_e450] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1290_c11_e450_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_e450_left;
     BIN_OP_EQ_uxn_opcodes_h_l1290_c11_e450_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_e450_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_e450_return_output := BIN_OP_EQ_uxn_opcodes_h_l1290_c11_e450_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1270_l1267_l1290_l1262_l1285_l1282_l1278_l1275_l1301_DUPLICATE_e2e9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1270_l1267_l1290_l1262_l1285_l1282_l1278_l1275_l1301_DUPLICATE_e2e9_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1282_c11_76da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1282_c11_76da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_76da_left;
     BIN_OP_EQ_uxn_opcodes_h_l1282_c11_76da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_76da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_76da_return_output := BIN_OP_EQ_uxn_opcodes_h_l1282_c11_76da_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1270_l1267_l1290_l1262_l1285_l1282_l1278_l1275_l1301_DUPLICATE_11d0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1270_l1267_l1290_l1262_l1285_l1282_l1278_l1275_l1301_DUPLICATE_11d0_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1271_l1294_l1279_l1286_DUPLICATE_f582 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1271_l1294_l1279_l1286_DUPLICATE_f582_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1275_c11_6ec2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6ec2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6ec2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6ec2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6ec2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6ec2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6ec2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1270_c11_e4d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e4d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e4d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e4d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e4d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e4d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e4d3_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_ee3b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1262_c6_6a95_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1267_c7_078d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_ca64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_078d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_ca64_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_078d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_ca64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_078d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_ca64_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_078d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_ca64_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_078d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_ca64_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_078d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_ca64_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1267_c7_078d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1267_c11_ca64_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1270_c7_f44f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e4d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_f44f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e4d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e4d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_f44f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e4d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e4d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_f44f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e4d3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_f44f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e4d3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1270_c7_f44f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1270_c11_e4d3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1275_c7_868a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6ec2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_868a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6ec2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_868a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6ec2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_868a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6ec2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_868a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6ec2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_868a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6ec2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_868a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6ec2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1275_c7_868a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1275_c11_6ec2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1278_c7_708b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_4ac7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_708b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_4ac7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_708b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_4ac7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_708b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_4ac7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_708b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_4ac7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_708b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_4ac7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_708b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_4ac7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1278_c7_708b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1278_c11_4ac7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1282_c7_a830_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_76da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a830_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_76da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a830_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_76da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a830_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_76da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a830_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_76da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a830_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_76da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a830_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1282_c11_76da_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1285_c7_80a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_fe7f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_80a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_fe7f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_fe7f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_80a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_fe7f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_fe7f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_80a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_fe7f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_80a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1285_c11_fe7f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_e450_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_e450_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_e450_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_e450_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_e450_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_e450_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_e450_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_1194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0e45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_1194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0e45_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_1194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0e45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_1194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0e45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_1194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0e45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_1194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0e45_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_1194_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_0e45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_4c5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1301_c11_1fc5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_4c5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1301_c11_1fc5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_4c5b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1301_c11_1fc5_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1279_c3_b44c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1271_l1294_l1279_l1286_DUPLICATE_f582_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_4ed1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1271_l1294_l1279_l1286_DUPLICATE_f582_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1287_l1272_DUPLICATE_a4e7_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1271_l1294_l1279_l1286_DUPLICATE_f582_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_l1275_DUPLICATE_40f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_l1275_DUPLICATE_40f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_l1275_DUPLICATE_40f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_l1275_DUPLICATE_40f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_l1275_DUPLICATE_40f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_l1275_DUPLICATE_40f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_l1275_DUPLICATE_40f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_l1275_DUPLICATE_40f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_l1275_DUPLICATE_40f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1285_l1282_l1278_l1275_l1301_DUPLICATE_adae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1285_l1282_l1278_l1275_l1301_DUPLICATE_adae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1285_l1282_l1278_l1275_l1301_DUPLICATE_adae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1285_l1282_l1278_l1275_l1301_DUPLICATE_adae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1285_l1282_l1278_l1275_l1301_DUPLICATE_adae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1285_l1282_l1278_l1275_l1301_DUPLICATE_adae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1285_l1282_l1278_l1275_l1301_DUPLICATE_adae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1285_l1282_l1278_l1275_l1301_DUPLICATE_adae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_4c5b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1285_l1282_l1278_l1275_l1301_DUPLICATE_adae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1270_l1267_l1290_l1262_l1285_l1282_l1278_l1275_l1301_DUPLICATE_e2e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1270_l1267_l1290_l1262_l1285_l1282_l1278_l1275_l1301_DUPLICATE_e2e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1270_l1267_l1290_l1262_l1285_l1282_l1278_l1275_l1301_DUPLICATE_e2e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1270_l1267_l1290_l1262_l1285_l1282_l1278_l1275_l1301_DUPLICATE_e2e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1270_l1267_l1290_l1262_l1285_l1282_l1278_l1275_l1301_DUPLICATE_e2e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1270_l1267_l1290_l1262_l1285_l1282_l1278_l1275_l1301_DUPLICATE_e2e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1270_l1267_l1290_l1262_l1285_l1282_l1278_l1275_l1301_DUPLICATE_e2e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1270_l1267_l1290_l1262_l1285_l1282_l1278_l1275_l1301_DUPLICATE_e2e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_4c5b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1270_l1267_l1290_l1262_l1285_l1282_l1278_l1275_l1301_DUPLICATE_e2e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1270_l1267_l1290_l1262_l1285_l1282_l1278_l1275_l1301_DUPLICATE_11d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1270_l1267_l1290_l1262_l1285_l1282_l1278_l1275_l1301_DUPLICATE_11d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1270_l1267_l1290_l1262_l1285_l1282_l1278_l1275_l1301_DUPLICATE_11d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1270_l1267_l1290_l1262_l1285_l1282_l1278_l1275_l1301_DUPLICATE_11d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1270_l1267_l1290_l1262_l1285_l1282_l1278_l1275_l1301_DUPLICATE_11d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1270_l1267_l1290_l1262_l1285_l1282_l1278_l1275_l1301_DUPLICATE_11d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1270_l1267_l1290_l1262_l1285_l1282_l1278_l1275_l1301_DUPLICATE_11d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1270_l1267_l1290_l1262_l1285_l1282_l1278_l1275_l1301_DUPLICATE_11d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_4c5b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1270_l1267_l1290_l1262_l1285_l1282_l1278_l1275_l1301_DUPLICATE_11d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_l1275_DUPLICATE_8677_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_l1275_DUPLICATE_8677_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_l1275_DUPLICATE_8677_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_l1275_DUPLICATE_8677_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_l1275_DUPLICATE_8677_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_l1275_DUPLICATE_8677_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_l1275_DUPLICATE_8677_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_l1275_DUPLICATE_8677_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1270_l1293_l1267_l1290_l1262_l1285_l1282_l1278_l1275_DUPLICATE_8677_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1293_c7_1194_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1296_c30_2615_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1293_c7_1194] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_1194_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_1194_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_1194_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_1194_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1301_c7_4c5b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_4c5b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_4c5b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_4c5b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_4c5b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_4c5b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_4c5b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_4c5b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_4c5b_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1262_c1_ee3b] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_ee3b_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_ee3b_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_ee3b_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_ee3b_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_ee3b_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_ee3b_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_ee3b_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_ee3b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1301_c7_4c5b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_4c5b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_4c5b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_4c5b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_4c5b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_4c5b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_4c5b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_4c5b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_4c5b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1293_c7_1194] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_1194_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_1194_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_1194_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_1194_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1279_c3_b44c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1279_c3_b44c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1279_c3_b44c_left;
     BIN_OP_OR_uxn_opcodes_h_l1279_c3_b44c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1279_c3_b44c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1279_c3_b44c_return_output := BIN_OP_OR_uxn_opcodes_h_l1279_c3_b44c_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1287_l1272_DUPLICATE_a4e7 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1287_l1272_DUPLICATE_a4e7_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1287_l1272_DUPLICATE_a4e7_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1287_l1272_DUPLICATE_a4e7_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1287_l1272_DUPLICATE_a4e7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1294_c3_4ed1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1294_c3_4ed1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_4ed1_left;
     BIN_OP_OR_uxn_opcodes_h_l1294_c3_4ed1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_4ed1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_4ed1_return_output := BIN_OP_OR_uxn_opcodes_h_l1294_c3_4ed1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1301_c7_4c5b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_4c5b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_4c5b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_4c5b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_4c5b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_4c5b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_4c5b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_4c5b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_4c5b_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1279_c3_b44c_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c21_3506_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_4ed1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1294_c3_4ed1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1287_l1272_DUPLICATE_a4e7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1287_l1272_DUPLICATE_a4e7_return_output;
     VAR_printf_uxn_opcodes_h_l1263_c3_ddcc_uxn_opcodes_h_l1263_c3_ddcc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1262_c1_ee3b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1301_c7_4c5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1301_c7_4c5b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1301_c7_4c5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_1194_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_1194_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1293_c7_1194] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_1194_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_1194_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_1194_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_1194_return_output;

     -- t16_MUX[uxn_opcodes_h_l1278_c7_708b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1278_c7_708b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1278_c7_708b_cond;
     t16_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue;
     t16_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1278_c7_708b_return_output := t16_MUX_uxn_opcodes_h_l1278_c7_708b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1293_c7_1194] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_1194_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_1194_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_1194_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_1194_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1290_c7_f3ba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1293_c7_1194] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_1194_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_1194_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_1194_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_1194_return_output;

     -- n16_MUX[uxn_opcodes_h_l1293_c7_1194] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1293_c7_1194_cond <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_1194_cond;
     n16_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue;
     n16_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_1194_return_output := n16_MUX_uxn_opcodes_h_l1293_c7_1194_return_output;

     -- printf_uxn_opcodes_h_l1263_c3_ddcc[uxn_opcodes_h_l1263_c3_ddcc] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1263_c3_ddcc_uxn_opcodes_h_l1263_c3_ddcc_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1263_c3_ddcc_uxn_opcodes_h_l1263_c3_ddcc_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1290_c7_f3ba] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1299_c21_3506] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1299_c21_3506_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c21_3506_left;
     BIN_OP_EQ_uxn_opcodes_h_l1299_c21_3506_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c21_3506_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c21_3506_return_output := BIN_OP_EQ_uxn_opcodes_h_l1299_c21_3506_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1299_c21_4bdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1299_c21_3506_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1293_c7_1194_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_1194_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1293_c7_1194_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_1194_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1278_c7_708b_return_output;
     -- n16_MUX[uxn_opcodes_h_l1290_c7_f3ba] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond;
     n16_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue;
     n16_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output := n16_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1285_c7_80a8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_80a8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_80a8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output;

     -- MUX[uxn_opcodes_h_l1299_c21_4bdb] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1299_c21_4bdb_cond <= VAR_MUX_uxn_opcodes_h_l1299_c21_4bdb_cond;
     MUX_uxn_opcodes_h_l1299_c21_4bdb_iftrue <= VAR_MUX_uxn_opcodes_h_l1299_c21_4bdb_iftrue;
     MUX_uxn_opcodes_h_l1299_c21_4bdb_iffalse <= VAR_MUX_uxn_opcodes_h_l1299_c21_4bdb_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1299_c21_4bdb_return_output := MUX_uxn_opcodes_h_l1299_c21_4bdb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1290_c7_f3ba] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1285_c7_80a8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1290_c7_f3ba] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1290_c7_f3ba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output;

     -- t16_MUX[uxn_opcodes_h_l1275_c7_868a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1275_c7_868a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1275_c7_868a_cond;
     t16_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue;
     t16_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1275_c7_868a_return_output := t16_MUX_uxn_opcodes_h_l1275_c7_868a_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue := VAR_MUX_uxn_opcodes_h_l1299_c21_4bdb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1275_c7_868a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1285_c7_80a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_80a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_80a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1270_c7_f44f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1270_c7_f44f_cond <= VAR_t16_MUX_uxn_opcodes_h_l1270_c7_f44f_cond;
     t16_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue;
     t16_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output := t16_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1285_c7_80a8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_80a8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_80a8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1293_c7_1194] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_1194_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_1194_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_1194_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_1194_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_1194_return_output := result_u8_value_MUX_uxn_opcodes_h_l1293_c7_1194_return_output;

     -- n16_MUX[uxn_opcodes_h_l1285_c7_80a8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1285_c7_80a8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1285_c7_80a8_cond;
     n16_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue;
     n16_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output := n16_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1282_c7_a830] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a830_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a830_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a830_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a830_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1282_c7_a830] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a830_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a830_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a830_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a830_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1285_c7_80a8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1282_c7_a830_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1282_c7_a830_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_1194_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output;
     -- n16_MUX[uxn_opcodes_h_l1282_c7_a830] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1282_c7_a830_cond <= VAR_n16_MUX_uxn_opcodes_h_l1282_c7_a830_cond;
     n16_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue;
     n16_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1282_c7_a830_return_output := n16_MUX_uxn_opcodes_h_l1282_c7_a830_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1282_c7_a830] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a830_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a830_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a830_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a830_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1278_c7_708b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_708b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_708b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_708b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_708b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1290_c7_f3ba] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_f3ba_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_f3ba_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_f3ba_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output := result_u8_value_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1282_c7_a830] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a830_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a830_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a830_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a830_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1278_c7_708b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_708b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_708b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_708b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_708b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1282_c7_a830] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a830_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a830_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a830_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a830_return_output;

     -- t16_MUX[uxn_opcodes_h_l1267_c7_078d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1267_c7_078d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1267_c7_078d_cond;
     t16_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue;
     t16_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1267_c7_078d_return_output := t16_MUX_uxn_opcodes_h_l1267_c7_078d_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1282_c7_a830_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1282_c7_a830_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1282_c7_a830_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1282_c7_a830_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1278_c7_708b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1278_c7_708b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_f3ba_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1267_c7_078d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1275_c7_868a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_868a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_868a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_868a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_868a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1285_c7_80a8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1285_c7_80a8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_80a8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_80a8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_80a8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1262_c2_c9b5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond;
     t16_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue;
     t16_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output := t16_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1278_c7_708b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_708b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_708b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_708b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_708b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1278_c7_708b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_708b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_708b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_708b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_708b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1278_c7_708b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_708b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_708b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_708b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_708b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1278_c7_708b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1278_c7_708b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1278_c7_708b_cond;
     n16_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue;
     n16_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1278_c7_708b_return_output := n16_MUX_uxn_opcodes_h_l1278_c7_708b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1275_c7_868a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_868a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_868a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_868a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_868a_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1278_c7_708b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1278_c7_708b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1278_c7_708b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1278_c7_708b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1275_c7_868a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1275_c7_868a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1285_c7_80a8_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1275_c7_868a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_868a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_868a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_868a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_868a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1282_c7_a830] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a830_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a830_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a830_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a830_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a830_return_output := result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a830_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1275_c7_868a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_868a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_868a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_868a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_868a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1275_c7_868a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_868a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_868a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_868a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_868a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1270_c7_f44f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_f44f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_f44f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1275_c7_868a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1275_c7_868a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1275_c7_868a_cond;
     n16_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue;
     n16_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1275_c7_868a_return_output := n16_MUX_uxn_opcodes_h_l1275_c7_868a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1270_c7_f44f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1275_c7_868a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1275_c7_868a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1275_c7_868a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1275_c7_868a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1282_c7_a830_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1270_c7_f44f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1267_c7_078d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_078d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_078d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_078d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_078d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1270_c7_f44f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_f44f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_f44f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1278_c7_708b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1278_c7_708b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_708b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_708b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_708b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_708b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1278_c7_708b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1267_c7_078d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_078d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_078d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_078d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_078d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1270_c7_f44f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_f44f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_f44f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1270_c7_f44f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1270_c7_f44f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1270_c7_f44f_cond;
     n16_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue;
     n16_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output := n16_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1267_c7_078d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1267_c7_078d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1278_c7_708b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1275_c7_868a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1275_c7_868a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_868a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_868a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_868a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_868a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1275_c7_868a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1267_c7_078d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_078d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_078d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_078d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_078d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1267_c7_078d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1267_c7_078d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1267_c7_078d_cond;
     n16_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue;
     n16_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1267_c7_078d_return_output := n16_MUX_uxn_opcodes_h_l1267_c7_078d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1262_c2_c9b5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1267_c7_078d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_078d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_078d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_078d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_078d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1262_c2_c9b5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1267_c7_078d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_078d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_078d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_078d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_078d_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1267_c7_078d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1267_c7_078d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1267_c7_078d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1267_c7_078d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1275_c7_868a_return_output;
     -- n16_MUX[uxn_opcodes_h_l1262_c2_c9b5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond;
     n16_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue;
     n16_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output := n16_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1262_c2_c9b5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1270_c7_f44f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1270_c7_f44f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_f44f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_f44f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_f44f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1262_c2_c9b5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1262_c2_c9b5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1270_c7_f44f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1267_c7_078d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1267_c7_078d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_078d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_078d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_078d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_078d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1267_c7_078d_return_output;

     -- Submodule level 12
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1267_c7_078d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1262_c2_c9b5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_c9b5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_c9b5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_c9b5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1258_l1307_DUPLICATE_e798 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1258_l1307_DUPLICATE_e798_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8cda(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1262_c2_c9b5_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1258_l1307_DUPLICATE_e798_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l1258_l1307_DUPLICATE_e798_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
