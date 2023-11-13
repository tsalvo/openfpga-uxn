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
-- Submodules: 86
entity swp2_0CLK_e768ce5a is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp2_0CLK_e768ce5a;
architecture arch of swp2_0CLK_e768ce5a is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2450_c6_2562]
signal BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2450_c1_e2dc]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_e2dc_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_e2dc_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_e2dc_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_e2dc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2450_c2_f5aa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2450_c2_f5aa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2450_c2_f5aa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2450_c2_f5aa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2450_c2_f5aa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2450_c2_f5aa]
signal result_u8_value_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2450_c2_f5aa]
signal t16_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2450_c2_f5aa]
signal n16_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2451_c3_6bb7[uxn_opcodes_h_l2451_c3_6bb7]
signal printf_uxn_opcodes_h_l2451_c3_6bb7_uxn_opcodes_h_l2451_c3_6bb7_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2455_c11_5bfc]
signal BIN_OP_EQ_uxn_opcodes_h_l2455_c11_5bfc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2455_c11_5bfc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2455_c11_5bfc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2455_c7_645f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_645f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_645f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2455_c7_645f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_645f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_645f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2455_c7_645f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_645f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_645f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2455_c7_645f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_645f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_645f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2455_c7_645f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_645f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_645f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2455_c7_645f]
signal result_u8_value_MUX_uxn_opcodes_h_l2455_c7_645f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2455_c7_645f_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2455_c7_645f]
signal t16_MUX_uxn_opcodes_h_l2455_c7_645f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2455_c7_645f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2455_c7_645f]
signal n16_MUX_uxn_opcodes_h_l2455_c7_645f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2455_c7_645f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2458_c11_a520]
signal BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a520_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a520_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a520_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2458_c7_8c79]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_8c79_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2458_c7_8c79]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2458_c7_8c79]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_8c79_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2458_c7_8c79]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_8c79_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2458_c7_8c79]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2458_c7_8c79]
signal result_u8_value_MUX_uxn_opcodes_h_l2458_c7_8c79_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2458_c7_8c79]
signal t16_MUX_uxn_opcodes_h_l2458_c7_8c79_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2458_c7_8c79]
signal n16_MUX_uxn_opcodes_h_l2458_c7_8c79_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2463_c11_b576]
signal BIN_OP_EQ_uxn_opcodes_h_l2463_c11_b576_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2463_c11_b576_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2463_c11_b576_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2463_c7_5a30]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5a30_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2463_c7_5a30]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2463_c7_5a30]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5a30_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2463_c7_5a30]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5a30_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2463_c7_5a30]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2463_c7_5a30]
signal result_u8_value_MUX_uxn_opcodes_h_l2463_c7_5a30_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2463_c7_5a30]
signal t16_MUX_uxn_opcodes_h_l2463_c7_5a30_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2463_c7_5a30]
signal n16_MUX_uxn_opcodes_h_l2463_c7_5a30_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2464_c3_57f2]
signal BIN_OP_OR_uxn_opcodes_h_l2464_c3_57f2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2464_c3_57f2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2464_c3_57f2_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2467_c11_2218]
signal BIN_OP_EQ_uxn_opcodes_h_l2467_c11_2218_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2467_c11_2218_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2467_c11_2218_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2467_c7_7462]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_7462_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_7462_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2467_c7_7462]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_7462_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_7462_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2467_c7_7462]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_7462_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_7462_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2467_c7_7462]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_7462_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_7462_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2467_c7_7462]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_7462_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_7462_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2467_c7_7462]
signal result_u8_value_MUX_uxn_opcodes_h_l2467_c7_7462_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2467_c7_7462_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2467_c7_7462]
signal n16_MUX_uxn_opcodes_h_l2467_c7_7462_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2467_c7_7462_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2471_c11_e7f3]
signal BIN_OP_EQ_uxn_opcodes_h_l2471_c11_e7f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2471_c11_e7f3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2471_c11_e7f3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2471_c7_9ac2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2471_c7_9ac2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2471_c7_9ac2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2471_c7_9ac2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2471_c7_9ac2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2471_c7_9ac2]
signal result_u8_value_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l2471_c7_9ac2]
signal n16_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2472_c3_9f0e]
signal BIN_OP_OR_uxn_opcodes_h_l2472_c3_9f0e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2472_c3_9f0e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2472_c3_9f0e_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2474_c30_9a45]
signal sp_relative_shift_uxn_opcodes_h_l2474_c30_9a45_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2474_c30_9a45_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2474_c30_9a45_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2474_c30_9a45_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2479_c11_e6bb]
signal BIN_OP_EQ_uxn_opcodes_h_l2479_c11_e6bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2479_c11_e6bb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2479_c11_e6bb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2479_c7_1f50]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_1f50_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2479_c7_1f50]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_1f50_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2479_c7_1f50]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_1f50_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2479_c7_1f50]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_1f50_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2479_c7_1f50]
signal result_u8_value_MUX_uxn_opcodes_h_l2479_c7_1f50_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2482_c31_eaf9]
signal CONST_SR_8_uxn_opcodes_h_l2482_c31_eaf9_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2482_c31_eaf9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2484_c11_f391]
signal BIN_OP_EQ_uxn_opcodes_h_l2484_c11_f391_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2484_c11_f391_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2484_c11_f391_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2484_c7_ff50]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_ff50_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2484_c7_ff50]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_ff50_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2484_c7_ff50]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_ff50_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2484_c7_ff50]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_ff50_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2484_c7_ff50]
signal result_u8_value_MUX_uxn_opcodes_h_l2484_c7_ff50_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2489_c11_16c8]
signal BIN_OP_EQ_uxn_opcodes_h_l2489_c11_16c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2489_c11_16c8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2489_c11_16c8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2489_c7_7db3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_7db3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_7db3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_7db3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_7db3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2489_c7_7db3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_7db3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_7db3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_7db3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_7db3_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2489_c7_7db3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_7db3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_7db3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_7db3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_7db3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2489_c7_7db3]
signal result_u8_value_MUX_uxn_opcodes_h_l2489_c7_7db3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2489_c7_7db3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2489_c7_7db3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2489_c7_7db3_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2491_c31_9990]
signal CONST_SR_8_uxn_opcodes_h_l2491_c31_9990_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2491_c31_9990_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2493_c11_2918]
signal BIN_OP_EQ_uxn_opcodes_h_l2493_c11_2918_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2493_c11_2918_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2493_c11_2918_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2493_c7_5481]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_5481_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_5481_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_5481_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_5481_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2493_c7_5481]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_5481_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_5481_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_5481_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_5481_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_8dc7
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_8dc7_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_8dc7_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8c29( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562
BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562_left,
BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562_right,
BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_e2dc
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_e2dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_e2dc_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_e2dc_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_e2dc_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_e2dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_f5aa
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_f5aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_f5aa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_f5aa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_f5aa
result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_f5aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2450_c2_f5aa
result_u8_value_MUX_uxn_opcodes_h_l2450_c2_f5aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond,
result_u8_value_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output);

-- t16_MUX_uxn_opcodes_h_l2450_c2_f5aa
t16_MUX_uxn_opcodes_h_l2450_c2_f5aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond,
t16_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue,
t16_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse,
t16_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output);

-- n16_MUX_uxn_opcodes_h_l2450_c2_f5aa
n16_MUX_uxn_opcodes_h_l2450_c2_f5aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond,
n16_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue,
n16_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse,
n16_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output);

-- printf_uxn_opcodes_h_l2451_c3_6bb7_uxn_opcodes_h_l2451_c3_6bb7
printf_uxn_opcodes_h_l2451_c3_6bb7_uxn_opcodes_h_l2451_c3_6bb7 : entity work.printf_uxn_opcodes_h_l2451_c3_6bb7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2451_c3_6bb7_uxn_opcodes_h_l2451_c3_6bb7_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2455_c11_5bfc
BIN_OP_EQ_uxn_opcodes_h_l2455_c11_5bfc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2455_c11_5bfc_left,
BIN_OP_EQ_uxn_opcodes_h_l2455_c11_5bfc_right,
BIN_OP_EQ_uxn_opcodes_h_l2455_c11_5bfc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_645f
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_645f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_645f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_645f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_645f
result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_645f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_645f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_645f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_645f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_645f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_645f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_645f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_645f
result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_645f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_645f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_645f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_645f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_645f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_645f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_645f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2455_c7_645f
result_u8_value_MUX_uxn_opcodes_h_l2455_c7_645f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2455_c7_645f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2455_c7_645f_return_output);

-- t16_MUX_uxn_opcodes_h_l2455_c7_645f
t16_MUX_uxn_opcodes_h_l2455_c7_645f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2455_c7_645f_cond,
t16_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue,
t16_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse,
t16_MUX_uxn_opcodes_h_l2455_c7_645f_return_output);

-- n16_MUX_uxn_opcodes_h_l2455_c7_645f
n16_MUX_uxn_opcodes_h_l2455_c7_645f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2455_c7_645f_cond,
n16_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue,
n16_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse,
n16_MUX_uxn_opcodes_h_l2455_c7_645f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a520
BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a520 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a520_left,
BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a520_right,
BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a520_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_8c79
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_8c79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_8c79_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_8c79
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_8c79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_8c79
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_8c79 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_8c79_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_8c79
result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_8c79 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_8c79_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_8c79
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_8c79 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2458_c7_8c79
result_u8_value_MUX_uxn_opcodes_h_l2458_c7_8c79 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2458_c7_8c79_cond,
result_u8_value_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output);

-- t16_MUX_uxn_opcodes_h_l2458_c7_8c79
t16_MUX_uxn_opcodes_h_l2458_c7_8c79 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2458_c7_8c79_cond,
t16_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue,
t16_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse,
t16_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output);

-- n16_MUX_uxn_opcodes_h_l2458_c7_8c79
n16_MUX_uxn_opcodes_h_l2458_c7_8c79 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2458_c7_8c79_cond,
n16_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue,
n16_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse,
n16_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2463_c11_b576
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_b576 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_b576_left,
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_b576_right,
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_b576_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5a30
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5a30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5a30_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5a30
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5a30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5a30
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5a30 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5a30_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5a30
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5a30 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5a30_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5a30
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5a30 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2463_c7_5a30
result_u8_value_MUX_uxn_opcodes_h_l2463_c7_5a30 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2463_c7_5a30_cond,
result_u8_value_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output);

-- t16_MUX_uxn_opcodes_h_l2463_c7_5a30
t16_MUX_uxn_opcodes_h_l2463_c7_5a30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2463_c7_5a30_cond,
t16_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue,
t16_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse,
t16_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output);

-- n16_MUX_uxn_opcodes_h_l2463_c7_5a30
n16_MUX_uxn_opcodes_h_l2463_c7_5a30 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2463_c7_5a30_cond,
n16_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue,
n16_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse,
n16_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2464_c3_57f2
BIN_OP_OR_uxn_opcodes_h_l2464_c3_57f2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2464_c3_57f2_left,
BIN_OP_OR_uxn_opcodes_h_l2464_c3_57f2_right,
BIN_OP_OR_uxn_opcodes_h_l2464_c3_57f2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2467_c11_2218
BIN_OP_EQ_uxn_opcodes_h_l2467_c11_2218 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2467_c11_2218_left,
BIN_OP_EQ_uxn_opcodes_h_l2467_c11_2218_right,
BIN_OP_EQ_uxn_opcodes_h_l2467_c11_2218_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_7462
result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_7462 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_7462_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_7462_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_7462
result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_7462 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_7462_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_7462_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_7462
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_7462 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_7462_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_7462_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_7462
result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_7462 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_7462_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_7462_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_7462
result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_7462 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_7462_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_7462_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2467_c7_7462
result_u8_value_MUX_uxn_opcodes_h_l2467_c7_7462 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2467_c7_7462_cond,
result_u8_value_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2467_c7_7462_return_output);

-- n16_MUX_uxn_opcodes_h_l2467_c7_7462
n16_MUX_uxn_opcodes_h_l2467_c7_7462 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2467_c7_7462_cond,
n16_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue,
n16_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse,
n16_MUX_uxn_opcodes_h_l2467_c7_7462_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2471_c11_e7f3
BIN_OP_EQ_uxn_opcodes_h_l2471_c11_e7f3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2471_c11_e7f3_left,
BIN_OP_EQ_uxn_opcodes_h_l2471_c11_e7f3_right,
BIN_OP_EQ_uxn_opcodes_h_l2471_c11_e7f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_9ac2
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_9ac2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_9ac2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_9ac2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_9ac2
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_9ac2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2471_c7_9ac2
result_u8_value_MUX_uxn_opcodes_h_l2471_c7_9ac2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output);

-- n16_MUX_uxn_opcodes_h_l2471_c7_9ac2
n16_MUX_uxn_opcodes_h_l2471_c7_9ac2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond,
n16_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue,
n16_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse,
n16_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2472_c3_9f0e
BIN_OP_OR_uxn_opcodes_h_l2472_c3_9f0e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2472_c3_9f0e_left,
BIN_OP_OR_uxn_opcodes_h_l2472_c3_9f0e_right,
BIN_OP_OR_uxn_opcodes_h_l2472_c3_9f0e_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2474_c30_9a45
sp_relative_shift_uxn_opcodes_h_l2474_c30_9a45 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2474_c30_9a45_ins,
sp_relative_shift_uxn_opcodes_h_l2474_c30_9a45_x,
sp_relative_shift_uxn_opcodes_h_l2474_c30_9a45_y,
sp_relative_shift_uxn_opcodes_h_l2474_c30_9a45_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2479_c11_e6bb
BIN_OP_EQ_uxn_opcodes_h_l2479_c11_e6bb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2479_c11_e6bb_left,
BIN_OP_EQ_uxn_opcodes_h_l2479_c11_e6bb_right,
BIN_OP_EQ_uxn_opcodes_h_l2479_c11_e6bb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_1f50
result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_1f50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_1f50_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_1f50
result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_1f50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_1f50_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_1f50
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_1f50 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_1f50_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_1f50
result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_1f50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_1f50_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2479_c7_1f50
result_u8_value_MUX_uxn_opcodes_h_l2479_c7_1f50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2479_c7_1f50_cond,
result_u8_value_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2482_c31_eaf9
CONST_SR_8_uxn_opcodes_h_l2482_c31_eaf9 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2482_c31_eaf9_x,
CONST_SR_8_uxn_opcodes_h_l2482_c31_eaf9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2484_c11_f391
BIN_OP_EQ_uxn_opcodes_h_l2484_c11_f391 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2484_c11_f391_left,
BIN_OP_EQ_uxn_opcodes_h_l2484_c11_f391_right,
BIN_OP_EQ_uxn_opcodes_h_l2484_c11_f391_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_ff50
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_ff50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_ff50_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_ff50
result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_ff50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_ff50_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_ff50
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_ff50 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_ff50_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_ff50
result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_ff50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_ff50_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2484_c7_ff50
result_u8_value_MUX_uxn_opcodes_h_l2484_c7_ff50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2484_c7_ff50_cond,
result_u8_value_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2489_c11_16c8
BIN_OP_EQ_uxn_opcodes_h_l2489_c11_16c8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2489_c11_16c8_left,
BIN_OP_EQ_uxn_opcodes_h_l2489_c11_16c8_right,
BIN_OP_EQ_uxn_opcodes_h_l2489_c11_16c8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_7db3
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_7db3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_7db3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_7db3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_7db3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_7db3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_7db3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_7db3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_7db3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_7db3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_7db3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_7db3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_7db3
result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_7db3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_7db3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_7db3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_7db3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_7db3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2489_c7_7db3
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_7db3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_7db3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_7db3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_7db3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2489_c7_7db3_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2491_c31_9990
CONST_SR_8_uxn_opcodes_h_l2491_c31_9990 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2491_c31_9990_x,
CONST_SR_8_uxn_opcodes_h_l2491_c31_9990_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2493_c11_2918
BIN_OP_EQ_uxn_opcodes_h_l2493_c11_2918 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2493_c11_2918_left,
BIN_OP_EQ_uxn_opcodes_h_l2493_c11_2918_right,
BIN_OP_EQ_uxn_opcodes_h_l2493_c11_2918_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_5481
result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_5481 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_5481_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_5481_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_5481_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_5481_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_5481
result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_5481 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_5481_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_5481_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_5481_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_5481_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_8dc7
CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_8dc7 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_8dc7_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_8dc7_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_e2dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output,
 t16_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output,
 n16_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2455_c11_5bfc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_645f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_645f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_645f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_645f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_645f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2455_c7_645f_return_output,
 t16_MUX_uxn_opcodes_h_l2455_c7_645f_return_output,
 n16_MUX_uxn_opcodes_h_l2455_c7_645f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a520_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output,
 t16_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output,
 n16_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2463_c11_b576_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output,
 t16_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output,
 n16_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2464_c3_57f2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2467_c11_2218_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_7462_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_7462_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_7462_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_7462_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_7462_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2467_c7_7462_return_output,
 n16_MUX_uxn_opcodes_h_l2467_c7_7462_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2471_c11_e7f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output,
 n16_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2472_c3_9f0e_return_output,
 sp_relative_shift_uxn_opcodes_h_l2474_c30_9a45_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2479_c11_e6bb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output,
 CONST_SR_8_uxn_opcodes_h_l2482_c31_eaf9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2484_c11_f391_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2489_c11_16c8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_7db3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_7db3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_7db3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2489_c7_7db3_return_output,
 CONST_SR_8_uxn_opcodes_h_l2491_c31_9990_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2493_c11_2918_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_5481_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_5481_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_8dc7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_e2dc_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_e2dc_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_e2dc_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_e2dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_645f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_645f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2452_c3_1ad6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_645f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_645f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_645f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_645f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2455_c7_645f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2455_c7_645f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2451_c3_6bb7_uxn_opcodes_h_l2451_c3_6bb7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_5bfc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_5bfc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_5bfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_645f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_645f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2456_c3_d8f8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_645f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_645f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_645f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_645f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2455_c7_645f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2455_c7_645f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a520_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a520_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a520_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_8c79_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2461_c3_5ff2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_8c79_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_8c79_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_8c79_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2458_c7_8c79_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2458_c7_8c79_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_b576_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_b576_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_b576_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_7462_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5a30_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_7462_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2465_c3_6dc9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_7462_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5a30_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_7462_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5a30_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_7462_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_7462_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_5a30_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2463_c7_5a30_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2467_c7_7462_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2463_c7_5a30_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_57f2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_57f2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_57f2_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_2218_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_2218_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_2218_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_7462_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_7462_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_7462_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_7462_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_7462_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_7462_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2467_c7_7462_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_e7f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_e7f3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_e7f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2476_c3_db3c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_9f0e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_9f0e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_9f0e_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_9a45_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_9a45_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_9a45_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_9a45_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2477_c21_e51a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_e6bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_e6bb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_e6bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_1f50_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_1f50_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2481_c3_7034 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_1f50_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_1f50_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_1f50_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2482_c31_eaf9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2482_c31_eaf9_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2482_c21_6d9c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_f391_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_f391_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_f391_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_7db3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_ff50_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_ff50_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2486_c3_71ee : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_7db3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_ff50_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_7db3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_ff50_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_7db3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_ff50_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2487_c21_b9e0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_16c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_16c8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_16c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_7db3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_7db3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_5481_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_7db3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_7db3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2490_c3_5c8a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_7db3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_7db3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_7db3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_7db3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_5481_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_7db3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_7db3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_7db3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_7db3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2491_c31_9990_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2491_c31_9990_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2491_c21_126a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_2918_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_2918_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_2918_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_5481_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_5481_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_5481_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_5481_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_5481_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_5481_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2455_l2484_l2450_DUPLICATE_5b96_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2450_l2479_DUPLICATE_b5d0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2458_l2455_l2450_DUPLICATE_838a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2489_l2455_l2450_DUPLICATE_b0ae_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2479_DUPLICATE_3189_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2468_l2472_l2464_l2459_DUPLICATE_1c8a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_8dc7_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_8dc7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2489_l2467_DUPLICATE_c6c6_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2498_l2446_DUPLICATE_2262_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2476_c3_db3c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2476_c3_db3c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_f391_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_5bfc_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2465_c3_6dc9 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2465_c3_6dc9;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_e2dc_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2486_c3_71ee := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2486_c3_71ee;
     VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_9a45_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_9a45_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2452_c3_1ad6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2452_c3_1ad6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_2218_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_5481_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_2918_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2481_c3_7034 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2481_c3_7034;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2456_c3_d8f8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2456_c3_d8f8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2461_c3_5ff2 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2461_c3_5ff2;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2490_c3_5c8a := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_7db3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2490_c3_5c8a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_e7f3_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_16c8_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a520_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_b576_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_5481_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_e6bb_right := to_unsigned(6, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_e2dc_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_9a45_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_9f0e_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2482_c31_eaf9_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_5bfc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a520_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_b576_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_2218_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_e7f3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_e6bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_f391_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_16c8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_2918_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_57f2_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2491_c31_9990_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2458_c11_a520] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a520_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a520_left;
     BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a520_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a520_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a520_return_output := BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a520_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2467_c11_2218] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2467_c11_2218_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_2218_left;
     BIN_OP_EQ_uxn_opcodes_h_l2467_c11_2218_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_2218_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_2218_return_output := BIN_OP_EQ_uxn_opcodes_h_l2467_c11_2218_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2489_l2467_DUPLICATE_c6c6 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2489_l2467_DUPLICATE_c6c6_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2487_c21_b9e0] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2487_c21_b9e0_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_SR_8[uxn_opcodes_h_l2491_c31_9990] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2491_c31_9990_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2491_c31_9990_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2491_c31_9990_return_output := CONST_SR_8_uxn_opcodes_h_l2491_c31_9990_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2455_c11_5bfc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2455_c11_5bfc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_5bfc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2455_c11_5bfc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_5bfc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_5bfc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2455_c11_5bfc_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2450_l2479_DUPLICATE_b5d0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2450_l2479_DUPLICATE_b5d0_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2489_c11_16c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2489_c11_16c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_16c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2489_c11_16c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_16c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_16c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2489_c11_16c8_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2482_c31_eaf9] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2482_c31_eaf9_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2482_c31_eaf9_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2482_c31_eaf9_return_output := CONST_SR_8_uxn_opcodes_h_l2482_c31_eaf9_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2489_l2455_l2450_DUPLICATE_b0ae LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2489_l2455_l2450_DUPLICATE_b0ae_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2479_c11_e6bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2479_c11_e6bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_e6bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2479_c11_e6bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_e6bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_e6bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2479_c11_e6bb_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2474_c30_9a45] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2474_c30_9a45_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_9a45_ins;
     sp_relative_shift_uxn_opcodes_h_l2474_c30_9a45_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_9a45_x;
     sp_relative_shift_uxn_opcodes_h_l2474_c30_9a45_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_9a45_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_9a45_return_output := sp_relative_shift_uxn_opcodes_h_l2474_c30_9a45_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2484_c11_f391] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2484_c11_f391_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_f391_left;
     BIN_OP_EQ_uxn_opcodes_h_l2484_c11_f391_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_f391_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_f391_return_output := BIN_OP_EQ_uxn_opcodes_h_l2484_c11_f391_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2479_DUPLICATE_3189 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2479_DUPLICATE_3189_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2458_l2455_l2450_DUPLICATE_838a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2458_l2455_l2450_DUPLICATE_838a_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2450_c6_2562] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562_left;
     BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562_return_output := BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2493_c11_2918] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2493_c11_2918_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_2918_left;
     BIN_OP_EQ_uxn_opcodes_h_l2493_c11_2918_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_2918_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_2918_return_output := BIN_OP_EQ_uxn_opcodes_h_l2493_c11_2918_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2463_c11_b576] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2463_c11_b576_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_b576_left;
     BIN_OP_EQ_uxn_opcodes_h_l2463_c11_b576_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_b576_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_b576_return_output := BIN_OP_EQ_uxn_opcodes_h_l2463_c11_b576_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2468_l2472_l2464_l2459_DUPLICATE_1c8a LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2468_l2472_l2464_l2459_DUPLICATE_1c8a_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2471_c11_e7f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2471_c11_e7f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_e7f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2471_c11_e7f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_e7f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_e7f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2471_c11_e7f3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2455_l2484_l2450_DUPLICATE_5b96 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2455_l2484_l2450_DUPLICATE_5b96_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_e2dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2450_c6_2562_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2455_c7_645f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_5bfc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_645f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_5bfc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_645f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_5bfc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_645f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_5bfc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_645f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_5bfc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_645f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_5bfc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_645f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_5bfc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2455_c7_645f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2455_c11_5bfc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2458_c7_8c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a520_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_8c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a520_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a520_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_8c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a520_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a520_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_8c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a520_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_8c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a520_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2458_c7_8c79_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2458_c11_a520_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2463_c7_5a30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_b576_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5a30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_b576_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_b576_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5a30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_b576_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_b576_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5a30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_b576_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_5a30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_b576_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2463_c7_5a30_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_b576_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2467_c7_7462_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_2218_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_7462_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_2218_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_7462_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_2218_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_7462_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_2218_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_7462_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_2218_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_7462_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_2218_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_7462_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2467_c11_2218_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_e7f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_e7f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_e7f3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_e7f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_e7f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_e7f3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_e7f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_1f50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_e6bb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_1f50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_e6bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_1f50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_e6bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_1f50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_e6bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_1f50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2479_c11_e6bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_ff50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_f391_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_ff50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_f391_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_ff50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_f391_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_ff50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_f391_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_ff50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2484_c11_f391_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_7db3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_16c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_7db3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_16c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_7db3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_16c8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_7db3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2489_c11_16c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_5481_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_2918_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_5481_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2493_c11_2918_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_57f2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2468_l2472_l2464_l2459_DUPLICATE_1c8a_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_9f0e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2468_l2472_l2464_l2459_DUPLICATE_1c8a_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_8dc7_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2468_l2472_l2464_l2459_DUPLICATE_1c8a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2487_c21_b9e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2458_l2455_l2450_DUPLICATE_838a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2458_l2455_l2450_DUPLICATE_838a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2458_l2455_l2450_DUPLICATE_838a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2458_l2455_l2450_DUPLICATE_838a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2458_l2455_l2450_DUPLICATE_838a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2458_l2455_l2450_DUPLICATE_838a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2479_DUPLICATE_3189_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2479_DUPLICATE_3189_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2479_DUPLICATE_3189_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2479_DUPLICATE_3189_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2479_DUPLICATE_3189_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2479_DUPLICATE_3189_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2479_DUPLICATE_3189_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_7db3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2479_DUPLICATE_3189_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_5481_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2479_DUPLICATE_3189_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2455_l2484_l2450_DUPLICATE_5b96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2455_l2484_l2450_DUPLICATE_5b96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2455_l2484_l2450_DUPLICATE_5b96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2455_l2484_l2450_DUPLICATE_5b96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2455_l2484_l2450_DUPLICATE_5b96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2455_l2484_l2450_DUPLICATE_5b96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2450_l2479_DUPLICATE_b5d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2450_l2479_DUPLICATE_b5d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2450_l2479_DUPLICATE_b5d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2450_l2479_DUPLICATE_b5d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2450_l2479_DUPLICATE_b5d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2450_l2479_DUPLICATE_b5d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2450_l2479_DUPLICATE_b5d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_7db3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2450_l2479_DUPLICATE_b5d0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_5481_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2467_l2463_l2493_l2458_l2489_l2455_l2484_l2450_l2479_DUPLICATE_b5d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2489_l2467_DUPLICATE_c6c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_7db3_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2489_l2467_DUPLICATE_c6c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2489_l2455_l2450_DUPLICATE_b0ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2489_l2455_l2450_DUPLICATE_b0ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2489_l2455_l2450_DUPLICATE_b0ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2489_l2455_l2450_DUPLICATE_b0ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2489_l2455_l2450_DUPLICATE_b0ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_7db3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2467_l2463_l2458_l2489_l2455_l2450_DUPLICATE_b0ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2474_c30_9a45_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2482_c21_6d9c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2482_c21_6d9c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2482_c31_eaf9_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_8dc7 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_8dc7_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_8dc7_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_8dc7_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_8dc7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2464_c3_57f2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2464_c3_57f2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_57f2_left;
     BIN_OP_OR_uxn_opcodes_h_l2464_c3_57f2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_57f2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_57f2_return_output := BIN_OP_OR_uxn_opcodes_h_l2464_c3_57f2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2484_c7_ff50] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_ff50_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_ff50_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2450_c1_e2dc] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_e2dc_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_e2dc_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_e2dc_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_e2dc_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_e2dc_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_e2dc_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_e2dc_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_e2dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2493_c7_5481] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_5481_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_5481_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_5481_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_5481_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_5481_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_5481_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_5481_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_5481_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2472_c3_9f0e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2472_c3_9f0e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_9f0e_left;
     BIN_OP_OR_uxn_opcodes_h_l2472_c3_9f0e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_9f0e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_9f0e_return_output := BIN_OP_OR_uxn_opcodes_h_l2472_c3_9f0e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2493_c7_5481] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_5481_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_5481_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_5481_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_5481_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_5481_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_5481_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_5481_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_5481_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2489_c7_7db3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_7db3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_7db3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_7db3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_7db3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_7db3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_7db3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_7db3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_7db3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2471_c7_9ac2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2491_c21_126a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2491_c21_126a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2491_c31_9990_return_output);

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2464_c3_57f2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_9f0e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2482_c21_6d9c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_7db3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2491_c21_126a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_8dc7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2469_l2460_DUPLICATE_8dc7_return_output;
     VAR_printf_uxn_opcodes_h_l2451_c3_6bb7_uxn_opcodes_h_l2451_c3_6bb7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2450_c1_e2dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_7db3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2493_c7_5481_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_7db3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2493_c7_5481_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2489_c7_7db3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2489_c7_7db3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_7db3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_7db3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_7db3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_7db3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_7db3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_7db3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_7db3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_7db3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2467_c7_7462] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_7462_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_7462_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_7462_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_7462_return_output;

     -- printf_uxn_opcodes_h_l2451_c3_6bb7[uxn_opcodes_h_l2451_c3_6bb7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2451_c3_6bb7_uxn_opcodes_h_l2451_c3_6bb7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2451_c3_6bb7_uxn_opcodes_h_l2451_c3_6bb7_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2479_c7_1f50] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_1f50_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_1f50_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2489_c7_7db3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_7db3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_7db3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_7db3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_7db3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_7db3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_7db3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_7db3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_7db3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2471_c7_9ac2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond;
     n16_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue;
     n16_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output := n16_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2489_c7_7db3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2489_c7_7db3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_7db3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2489_c7_7db3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_7db3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2489_c7_7db3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_7db3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_7db3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2489_c7_7db3_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2477_c21_e51a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2477_c21_e51a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l2472_c3_9f0e_return_output);

     -- t16_MUX[uxn_opcodes_h_l2463_c7_5a30] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2463_c7_5a30_cond <= VAR_t16_MUX_uxn_opcodes_h_l2463_c7_5a30_cond;
     t16_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue;
     t16_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output := t16_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2484_c7_ff50] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_ff50_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_ff50_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2477_c21_e51a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2489_c7_7db3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2489_c7_7db3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2467_c7_7462_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2489_c7_7db3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2463_c7_5a30] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output;

     -- t16_MUX[uxn_opcodes_h_l2458_c7_8c79] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2458_c7_8c79_cond <= VAR_t16_MUX_uxn_opcodes_h_l2458_c7_8c79_cond;
     t16_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue;
     t16_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output := t16_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output;

     -- n16_MUX[uxn_opcodes_h_l2467_c7_7462] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2467_c7_7462_cond <= VAR_n16_MUX_uxn_opcodes_h_l2467_c7_7462_cond;
     n16_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue;
     n16_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2467_c7_7462_return_output := n16_MUX_uxn_opcodes_h_l2467_c7_7462_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2484_c7_ff50] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2484_c7_ff50_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_ff50_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output := result_u8_value_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2484_c7_ff50] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_ff50_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_ff50_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2484_c7_ff50] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_ff50_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_ff50_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_ff50_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_ff50_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2471_c7_9ac2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2479_c7_1f50] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_1f50_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_1f50_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2467_c7_7462_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2484_c7_ff50_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2479_c7_1f50] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_1f50_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_1f50_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2471_c7_9ac2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2479_c7_1f50] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2479_c7_1f50_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_1f50_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output := result_u8_value_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output;

     -- n16_MUX[uxn_opcodes_h_l2463_c7_5a30] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2463_c7_5a30_cond <= VAR_n16_MUX_uxn_opcodes_h_l2463_c7_5a30_cond;
     n16_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue;
     n16_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output := n16_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output;

     -- t16_MUX[uxn_opcodes_h_l2455_c7_645f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2455_c7_645f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2455_c7_645f_cond;
     t16_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue;
     t16_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2455_c7_645f_return_output := t16_MUX_uxn_opcodes_h_l2455_c7_645f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2479_c7_1f50] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_1f50_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_1f50_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_1f50_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_1f50_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2458_c7_8c79] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2467_c7_7462] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_7462_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_7462_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_7462_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_7462_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2467_c7_7462_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2479_c7_1f50_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2455_c7_645f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2471_c7_9ac2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2467_c7_7462] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_7462_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_7462_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_7462_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_7462_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2455_c7_645f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_645f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_645f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_645f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_645f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2471_c7_9ac2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2471_c7_9ac2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_9ac2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_9ac2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_9ac2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2458_c7_8c79] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2458_c7_8c79_cond <= VAR_n16_MUX_uxn_opcodes_h_l2458_c7_8c79_cond;
     n16_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue;
     n16_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output := n16_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2463_c7_5a30] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output;

     -- t16_MUX[uxn_opcodes_h_l2450_c2_f5aa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond <= VAR_t16_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond;
     t16_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue;
     t16_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output := t16_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2455_c7_645f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2467_c7_7462_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2471_c7_9ac2_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2450_c2_f5aa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2467_c7_7462] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_7462_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_7462_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_7462_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_7462_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2467_c7_7462] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_7462_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_7462_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_7462_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_7462_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2458_c7_8c79] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2467_c7_7462] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2467_c7_7462_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_7462_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_7462_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_7462_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_7462_return_output := result_u8_value_MUX_uxn_opcodes_h_l2467_c7_7462_return_output;

     -- n16_MUX[uxn_opcodes_h_l2455_c7_645f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2455_c7_645f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2455_c7_645f_cond;
     n16_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue;
     n16_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2455_c7_645f_return_output := n16_MUX_uxn_opcodes_h_l2455_c7_645f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2463_c7_5a30] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5a30_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5a30_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2455_c7_645f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2467_c7_7462_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2467_c7_7462_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2467_c7_7462_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2458_c7_8c79] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_8c79_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_8c79_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2463_c7_5a30] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5a30_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5a30_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output;

     -- n16_MUX[uxn_opcodes_h_l2450_c2_f5aa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond <= VAR_n16_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond;
     n16_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue;
     n16_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output := n16_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2463_c7_5a30] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2463_c7_5a30_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_5a30_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output := result_u8_value_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2463_c7_5a30] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5a30_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5a30_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5a30_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5a30_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2455_c7_645f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_645f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_645f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_645f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_645f_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2455_c7_645f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_5a30_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2458_c7_8c79] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_8c79_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_8c79_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2455_c7_645f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_645f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_645f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_645f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_645f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2450_c2_f5aa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2458_c7_8c79] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2458_c7_8c79_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_8c79_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output := result_u8_value_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2458_c7_8c79] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_8c79_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_8c79_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_8c79_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_8c79_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2455_c7_645f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2458_c7_8c79_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2455_c7_645f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_645f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_645f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_645f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_645f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2455_c7_645f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2455_c7_645f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_645f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_645f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2455_c7_645f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2455_c7_645f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_645f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_645f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_645f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_645f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_645f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_645f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2450_c2_f5aa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2455_c7_645f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2455_c7_645f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2455_c7_645f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2450_c2_f5aa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output := result_u8_value_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2450_c2_f5aa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2450_c2_f5aa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_f5aa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_f5aa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_f5aa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2498_l2446_DUPLICATE_2262 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2498_l2446_DUPLICATE_2262_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8c29(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2450_c2_f5aa_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2498_l2446_DUPLICATE_2262_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2498_l2446_DUPLICATE_2262_return_output;
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
