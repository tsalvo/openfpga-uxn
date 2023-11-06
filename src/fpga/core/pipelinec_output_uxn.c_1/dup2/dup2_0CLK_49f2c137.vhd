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
-- Submodules: 62
entity dup2_0CLK_49f2c137 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dup2_0CLK_49f2c137;
architecture arch of dup2_0CLK_49f2c137 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2660_c6_a2e8]
signal BIN_OP_EQ_uxn_opcodes_h_l2660_c6_a2e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2660_c6_a2e8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2660_c6_a2e8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2660_c1_ff0c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2660_c1_ff0c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2660_c1_ff0c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2660_c1_ff0c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2660_c1_ff0c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2660_c2_7dad]
signal result_u8_value_MUX_uxn_opcodes_h_l2660_c2_7dad_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2660_c2_7dad]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2660_c2_7dad]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2660_c2_7dad_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2660_c2_7dad]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2660_c2_7dad_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2660_c2_7dad]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2660_c2_7dad_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2660_c2_7dad]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2660_c2_7dad]
signal t16_MUX_uxn_opcodes_h_l2660_c2_7dad_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2661_c3_b297[uxn_opcodes_h_l2661_c3_b297]
signal printf_uxn_opcodes_h_l2661_c3_b297_uxn_opcodes_h_l2661_c3_b297_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2665_c11_b3a0]
signal BIN_OP_EQ_uxn_opcodes_h_l2665_c11_b3a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2665_c11_b3a0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2665_c11_b3a0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2665_c7_cf47]
signal result_u8_value_MUX_uxn_opcodes_h_l2665_c7_cf47_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2665_c7_cf47]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2665_c7_cf47]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_cf47_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2665_c7_cf47]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_cf47_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2665_c7_cf47]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_cf47_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2665_c7_cf47]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2665_c7_cf47]
signal t16_MUX_uxn_opcodes_h_l2665_c7_cf47_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2668_c11_8e31]
signal BIN_OP_EQ_uxn_opcodes_h_l2668_c11_8e31_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2668_c11_8e31_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2668_c11_8e31_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2668_c7_59d6]
signal result_u8_value_MUX_uxn_opcodes_h_l2668_c7_59d6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2668_c7_59d6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2668_c7_59d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_59d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2668_c7_59d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_59d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2668_c7_59d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_59d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2668_c7_59d6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2668_c7_59d6]
signal t16_MUX_uxn_opcodes_h_l2668_c7_59d6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2670_c3_a9f3]
signal CONST_SL_8_uxn_opcodes_h_l2670_c3_a9f3_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2670_c3_a9f3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2672_c11_3420]
signal BIN_OP_EQ_uxn_opcodes_h_l2672_c11_3420_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2672_c11_3420_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2672_c11_3420_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2672_c7_0f33]
signal result_u8_value_MUX_uxn_opcodes_h_l2672_c7_0f33_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2672_c7_0f33]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2672_c7_0f33]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_0f33_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2672_c7_0f33]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_0f33_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2672_c7_0f33]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_0f33_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2672_c7_0f33]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output : signed(3 downto 0);

-- t16_MUX[uxn_opcodes_h_l2672_c7_0f33]
signal t16_MUX_uxn_opcodes_h_l2672_c7_0f33_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2673_c3_4fcc]
signal BIN_OP_OR_uxn_opcodes_h_l2673_c3_4fcc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2673_c3_4fcc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2673_c3_4fcc_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2675_c30_3c79]
signal sp_relative_shift_uxn_opcodes_h_l2675_c30_3c79_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2675_c30_3c79_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2675_c30_3c79_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2675_c30_3c79_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2680_c11_f45e]
signal BIN_OP_EQ_uxn_opcodes_h_l2680_c11_f45e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2680_c11_f45e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2680_c11_f45e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2680_c7_d17f]
signal result_u8_value_MUX_uxn_opcodes_h_l2680_c7_d17f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2680_c7_d17f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_d17f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2680_c7_d17f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_d17f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2680_c7_d17f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2680_c7_d17f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2680_c7_d17f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_d17f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2685_c11_d59a]
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c11_d59a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c11_d59a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c11_d59a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2685_c7_1370]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_1370_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_1370_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_1370_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_1370_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2685_c7_1370]
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c7_1370_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c7_1370_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c7_1370_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c7_1370_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2685_c7_1370]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_1370_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_1370_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_1370_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_1370_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2685_c7_1370]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c7_1370_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c7_1370_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c7_1370_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c7_1370_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2689_c11_41a0]
signal BIN_OP_EQ_uxn_opcodes_h_l2689_c11_41a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2689_c11_41a0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2689_c11_41a0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2689_c7_7cde]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_7cde_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_7cde_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_7cde_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_7cde_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2689_c7_7cde]
signal result_u8_value_MUX_uxn_opcodes_h_l2689_c7_7cde_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2689_c7_7cde_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2689_c7_7cde_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2689_c7_7cde_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2689_c7_7cde]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_7cde_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_7cde_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_7cde_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_7cde_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2689_c7_7cde]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_7cde_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_7cde_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_7cde_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_7cde_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2693_c11_9c16]
signal BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9c16_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9c16_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9c16_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2693_c7_25f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_25f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_25f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_25f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_25f7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2693_c7_25f7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_25f7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_25f7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_25f7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_25f7_return_output : unsigned(0 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l2691_l2683_DUPLICATE_6889
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l2691_l2683_DUPLICATE_6889_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l2691_l2683_DUPLICATE_6889_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2660_c6_a2e8
BIN_OP_EQ_uxn_opcodes_h_l2660_c6_a2e8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2660_c6_a2e8_left,
BIN_OP_EQ_uxn_opcodes_h_l2660_c6_a2e8_right,
BIN_OP_EQ_uxn_opcodes_h_l2660_c6_a2e8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2660_c1_ff0c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2660_c1_ff0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2660_c1_ff0c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2660_c1_ff0c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2660_c1_ff0c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2660_c1_ff0c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2660_c2_7dad
result_u8_value_MUX_uxn_opcodes_h_l2660_c2_7dad : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2660_c2_7dad_cond,
result_u8_value_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2660_c2_7dad
result_is_sp_shift_MUX_uxn_opcodes_h_l2660_c2_7dad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2660_c2_7dad
result_is_opc_done_MUX_uxn_opcodes_h_l2660_c2_7dad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2660_c2_7dad_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2660_c2_7dad
result_is_stack_write_MUX_uxn_opcodes_h_l2660_c2_7dad : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2660_c2_7dad_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2660_c2_7dad
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2660_c2_7dad : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2660_c2_7dad_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2660_c2_7dad
result_sp_relative_shift_MUX_uxn_opcodes_h_l2660_c2_7dad : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output);

-- t16_MUX_uxn_opcodes_h_l2660_c2_7dad
t16_MUX_uxn_opcodes_h_l2660_c2_7dad : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2660_c2_7dad_cond,
t16_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue,
t16_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse,
t16_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output);

-- printf_uxn_opcodes_h_l2661_c3_b297_uxn_opcodes_h_l2661_c3_b297
printf_uxn_opcodes_h_l2661_c3_b297_uxn_opcodes_h_l2661_c3_b297 : entity work.printf_uxn_opcodes_h_l2661_c3_b297_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2661_c3_b297_uxn_opcodes_h_l2661_c3_b297_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2665_c11_b3a0
BIN_OP_EQ_uxn_opcodes_h_l2665_c11_b3a0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2665_c11_b3a0_left,
BIN_OP_EQ_uxn_opcodes_h_l2665_c11_b3a0_right,
BIN_OP_EQ_uxn_opcodes_h_l2665_c11_b3a0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2665_c7_cf47
result_u8_value_MUX_uxn_opcodes_h_l2665_c7_cf47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2665_c7_cf47_cond,
result_u8_value_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_cf47
result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_cf47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_cf47
result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_cf47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_cf47_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_cf47
result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_cf47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_cf47_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_cf47
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_cf47 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_cf47_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_cf47
result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_cf47 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output);

-- t16_MUX_uxn_opcodes_h_l2665_c7_cf47
t16_MUX_uxn_opcodes_h_l2665_c7_cf47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2665_c7_cf47_cond,
t16_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue,
t16_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse,
t16_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2668_c11_8e31
BIN_OP_EQ_uxn_opcodes_h_l2668_c11_8e31 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2668_c11_8e31_left,
BIN_OP_EQ_uxn_opcodes_h_l2668_c11_8e31_right,
BIN_OP_EQ_uxn_opcodes_h_l2668_c11_8e31_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2668_c7_59d6
result_u8_value_MUX_uxn_opcodes_h_l2668_c7_59d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2668_c7_59d6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_59d6
result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_59d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_59d6
result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_59d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_59d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_59d6
result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_59d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_59d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_59d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_59d6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_59d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_59d6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_59d6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output);

-- t16_MUX_uxn_opcodes_h_l2668_c7_59d6
t16_MUX_uxn_opcodes_h_l2668_c7_59d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2668_c7_59d6_cond,
t16_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue,
t16_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse,
t16_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2670_c3_a9f3
CONST_SL_8_uxn_opcodes_h_l2670_c3_a9f3 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2670_c3_a9f3_x,
CONST_SL_8_uxn_opcodes_h_l2670_c3_a9f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2672_c11_3420
BIN_OP_EQ_uxn_opcodes_h_l2672_c11_3420 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2672_c11_3420_left,
BIN_OP_EQ_uxn_opcodes_h_l2672_c11_3420_right,
BIN_OP_EQ_uxn_opcodes_h_l2672_c11_3420_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2672_c7_0f33
result_u8_value_MUX_uxn_opcodes_h_l2672_c7_0f33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2672_c7_0f33_cond,
result_u8_value_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_0f33
result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_0f33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_0f33
result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_0f33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_0f33_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_0f33
result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_0f33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_0f33_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_0f33
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_0f33 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_0f33_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_0f33
result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_0f33 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output);

-- t16_MUX_uxn_opcodes_h_l2672_c7_0f33
t16_MUX_uxn_opcodes_h_l2672_c7_0f33 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2672_c7_0f33_cond,
t16_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue,
t16_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse,
t16_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2673_c3_4fcc
BIN_OP_OR_uxn_opcodes_h_l2673_c3_4fcc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2673_c3_4fcc_left,
BIN_OP_OR_uxn_opcodes_h_l2673_c3_4fcc_right,
BIN_OP_OR_uxn_opcodes_h_l2673_c3_4fcc_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2675_c30_3c79
sp_relative_shift_uxn_opcodes_h_l2675_c30_3c79 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2675_c30_3c79_ins,
sp_relative_shift_uxn_opcodes_h_l2675_c30_3c79_x,
sp_relative_shift_uxn_opcodes_h_l2675_c30_3c79_y,
sp_relative_shift_uxn_opcodes_h_l2675_c30_3c79_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2680_c11_f45e
BIN_OP_EQ_uxn_opcodes_h_l2680_c11_f45e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2680_c11_f45e_left,
BIN_OP_EQ_uxn_opcodes_h_l2680_c11_f45e_right,
BIN_OP_EQ_uxn_opcodes_h_l2680_c11_f45e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2680_c7_d17f
result_u8_value_MUX_uxn_opcodes_h_l2680_c7_d17f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2680_c7_d17f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_d17f
result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_d17f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_d17f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_d17f
result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_d17f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_d17f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2680_c7_d17f
result_is_stack_write_MUX_uxn_opcodes_h_l2680_c7_d17f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2680_c7_d17f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_d17f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_d17f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_d17f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2685_c11_d59a
BIN_OP_EQ_uxn_opcodes_h_l2685_c11_d59a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2685_c11_d59a_left,
BIN_OP_EQ_uxn_opcodes_h_l2685_c11_d59a_right,
BIN_OP_EQ_uxn_opcodes_h_l2685_c11_d59a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_1370
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_1370 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_1370_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_1370_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_1370_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_1370_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2685_c7_1370
result_u8_value_MUX_uxn_opcodes_h_l2685_c7_1370 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2685_c7_1370_cond,
result_u8_value_MUX_uxn_opcodes_h_l2685_c7_1370_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2685_c7_1370_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2685_c7_1370_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_1370
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_1370 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_1370_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_1370_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_1370_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_1370_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2685_c7_1370
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c7_1370 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c7_1370_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c7_1370_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c7_1370_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c7_1370_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2689_c11_41a0
BIN_OP_EQ_uxn_opcodes_h_l2689_c11_41a0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2689_c11_41a0_left,
BIN_OP_EQ_uxn_opcodes_h_l2689_c11_41a0_right,
BIN_OP_EQ_uxn_opcodes_h_l2689_c11_41a0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_7cde
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_7cde : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_7cde_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_7cde_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_7cde_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_7cde_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2689_c7_7cde
result_u8_value_MUX_uxn_opcodes_h_l2689_c7_7cde : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2689_c7_7cde_cond,
result_u8_value_MUX_uxn_opcodes_h_l2689_c7_7cde_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2689_c7_7cde_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2689_c7_7cde_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_7cde
result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_7cde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_7cde_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_7cde_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_7cde_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_7cde_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_7cde
result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_7cde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_7cde_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_7cde_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_7cde_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_7cde_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9c16
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9c16 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9c16_left,
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9c16_right,
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9c16_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_25f7
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_25f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_25f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_25f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_25f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_25f7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_25f7
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_25f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_25f7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_25f7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_25f7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_25f7_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l2691_l2683_DUPLICATE_6889
CONST_SR_8_uint16_t_uxn_opcodes_h_l2691_l2683_DUPLICATE_6889 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l2691_l2683_DUPLICATE_6889_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l2691_l2683_DUPLICATE_6889_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2660_c6_a2e8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2660_c1_ff0c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output,
 t16_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2665_c11_b3a0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output,
 t16_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2668_c11_8e31_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output,
 t16_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output,
 CONST_SL_8_uxn_opcodes_h_l2670_c3_a9f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2672_c11_3420_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output,
 t16_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2673_c3_4fcc_return_output,
 sp_relative_shift_uxn_opcodes_h_l2675_c30_3c79_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2680_c11_f45e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2685_c11_d59a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_1370_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2685_c7_1370_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_1370_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2685_c7_1370_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2689_c11_41a0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_7cde_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2689_c7_7cde_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_7cde_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_7cde_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9c16_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_25f7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_25f7_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l2691_l2683_DUPLICATE_6889_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2660_c6_a2e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2660_c6_a2e8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2660_c6_a2e8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2660_c1_ff0c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2660_c1_ff0c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2660_c1_ff0c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2660_c1_ff0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2660_c2_7dad_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2660_c2_7dad_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2660_c2_7dad_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2662_c3_2a54 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2660_c2_7dad_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2660_c2_7dad_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2661_c3_b297_uxn_opcodes_h_l2661_c3_b297_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_b3a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_b3a0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_b3a0_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_cf47_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_cf47_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_cf47_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2666_c3_4f25 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_cf47_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2665_c7_cf47_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_8e31_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_8e31_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_8e31_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2668_c7_59d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_59d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_59d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_59d6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2668_c7_59d6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2670_c3_a9f3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2670_c3_a9f3_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_3420_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_3420_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_3420_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2672_c7_0f33_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_0f33_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_0f33_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2677_c3_66ec : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_0f33_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2672_c7_0f33_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2673_c3_4fcc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2673_c3_4fcc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2673_c3_4fcc_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2675_c30_3c79_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2675_c30_3c79_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2675_c30_3c79_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2675_c30_3c79_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2678_c21_80c2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_f45e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_f45e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_f45e_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c7_1370_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2680_c7_d17f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_d17f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_1370_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_d17f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c7_1370_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2680_c7_d17f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2682_c3_0c5b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_1370_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_d17f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_d59a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_d59a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_d59a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_1370_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2686_c3_3d97 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_1370_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_7cde_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_1370_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c7_1370_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c7_1370_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_7cde_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c7_1370_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_1370_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_1370_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_7cde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_1370_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c7_1370_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c7_1370_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_7cde_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c7_1370_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2687_c21_0c21_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_41a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_41a0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_41a0_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_7cde_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2690_c3_14e6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_7cde_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_7cde_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_7cde_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_7cde_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_7cde_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_7cde_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_7cde_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_25f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_7cde_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_7cde_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_7cde_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_25f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_7cde_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9c16_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9c16_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9c16_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_25f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_25f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_25f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_25f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_25f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_25f7_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2689_l2665_l2668_l2660_DUPLICATE_ce54_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2665_l2680_l2668_l2660_DUPLICATE_0851_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2668_l2665_l2693_l2660_l2689_l2685_l2680_DUPLICATE_726a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2665_l2668_l2660_l2672_DUPLICATE_0216_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2668_l2665_l2693_l2689_l2685_l2680_l2672_DUPLICATE_9818_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2673_l2669_DUPLICATE_fae0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2689_l2668_DUPLICATE_3393_return_output : unsigned(3 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2691_l2683_DUPLICATE_6889_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2691_l2683_DUPLICATE_6889_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2683_l2691_DUPLICATE_cda6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2656_l2698_DUPLICATE_eb9f_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9c16_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_f45e_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2660_c1_ff0c_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2666_c3_4f25 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2666_c3_4f25;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_b3a0_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_25f7_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_25f7_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2677_c3_66ec := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2677_c3_66ec;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2682_c3_0c5b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2682_c3_0c5b;
     VAR_sp_relative_shift_uxn_opcodes_h_l2675_c30_3c79_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_3420_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2686_c3_3d97 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_1370_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2686_c3_3d97;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2690_c3_14e6 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_7cde_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2690_c3_14e6;
     VAR_sp_relative_shift_uxn_opcodes_h_l2675_c30_3c79_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2662_c3_2a54 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2662_c3_2a54;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_41a0_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_d59a_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2660_c6_a2e8_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_8e31_right := to_unsigned(2, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2660_c1_ff0c_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2675_c30_3c79_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2660_c6_a2e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_b3a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_8e31_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_3420_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_f45e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_d59a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_41a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9c16_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2673_c3_4fcc_left := t16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2691_l2683_DUPLICATE_6889_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse := t16;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2689_l2665_l2668_l2660_DUPLICATE_ce54 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2689_l2665_l2668_l2660_DUPLICATE_ce54_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2668_c11_8e31] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2668_c11_8e31_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_8e31_left;
     BIN_OP_EQ_uxn_opcodes_h_l2668_c11_8e31_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_8e31_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_8e31_return_output := BIN_OP_EQ_uxn_opcodes_h_l2668_c11_8e31_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2680_c11_f45e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2680_c11_f45e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_f45e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2680_c11_f45e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_f45e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_f45e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2680_c11_f45e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2668_l2665_l2693_l2689_l2685_l2680_l2672_DUPLICATE_9818 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2668_l2665_l2693_l2689_l2685_l2680_l2672_DUPLICATE_9818_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2665_l2668_l2660_l2672_DUPLICATE_0216 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2665_l2668_l2660_l2672_DUPLICATE_0216_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2673_l2669_DUPLICATE_fae0 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2673_l2669_DUPLICATE_fae0_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2689_l2668_DUPLICATE_3393 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2689_l2668_DUPLICATE_3393_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2665_l2680_l2668_l2660_DUPLICATE_0851 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2665_l2680_l2668_l2660_DUPLICATE_0851_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2689_c11_41a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2689_c11_41a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_41a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2689_c11_41a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_41a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_41a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2689_c11_41a0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2693_c11_9c16] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9c16_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9c16_left;
     BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9c16_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9c16_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9c16_return_output := BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9c16_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2675_c30_3c79] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2675_c30_3c79_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2675_c30_3c79_ins;
     sp_relative_shift_uxn_opcodes_h_l2675_c30_3c79_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2675_c30_3c79_x;
     sp_relative_shift_uxn_opcodes_h_l2675_c30_3c79_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2675_c30_3c79_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2675_c30_3c79_return_output := sp_relative_shift_uxn_opcodes_h_l2675_c30_3c79_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2687_c21_0c21] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2687_c21_0c21_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2672_c11_3420] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2672_c11_3420_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_3420_left;
     BIN_OP_EQ_uxn_opcodes_h_l2672_c11_3420_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_3420_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_3420_return_output := BIN_OP_EQ_uxn_opcodes_h_l2672_c11_3420_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2685_c11_d59a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2685_c11_d59a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_d59a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2685_c11_d59a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_d59a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_d59a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2685_c11_d59a_return_output;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l2691_l2683_DUPLICATE_6889 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l2691_l2683_DUPLICATE_6889_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2691_l2683_DUPLICATE_6889_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2691_l2683_DUPLICATE_6889_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l2691_l2683_DUPLICATE_6889_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2665_c11_b3a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2665_c11_b3a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_b3a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2665_c11_b3a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_b3a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_b3a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2665_c11_b3a0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2668_l2665_l2693_l2660_l2689_l2685_l2680_DUPLICATE_726a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2668_l2665_l2693_l2660_l2689_l2685_l2680_DUPLICATE_726a_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2660_c6_a2e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2660_c6_a2e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2660_c6_a2e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2660_c6_a2e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2660_c6_a2e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2660_c6_a2e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2660_c6_a2e8_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2660_c1_ff0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2660_c6_a2e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2660_c2_7dad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2660_c6_a2e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2660_c6_a2e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2660_c2_7dad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2660_c6_a2e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2660_c6_a2e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2660_c2_7dad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2660_c6_a2e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2660_c2_7dad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2660_c6_a2e8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2660_c2_7dad_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2660_c6_a2e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_cf47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_b3a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_b3a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_cf47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_b3a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_b3a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_cf47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_b3a0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_cf47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_b3a0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2665_c7_cf47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2665_c11_b3a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_59d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_8e31_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_8e31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_59d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_8e31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_8e31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_59d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_8e31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2668_c7_59d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_8e31_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2668_c7_59d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2668_c11_8e31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_0f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_3420_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_3420_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_0f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_3420_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_3420_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_0f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_3420_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2672_c7_0f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_3420_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2672_c7_0f33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2672_c11_3420_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_d17f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_f45e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_d17f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_f45e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2680_c7_d17f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_f45e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_d17f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_f45e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2680_c7_d17f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2680_c11_f45e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_1370_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_d59a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c7_1370_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_d59a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_1370_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_d59a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c7_1370_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c11_d59a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_7cde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_41a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_7cde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_41a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_7cde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_41a0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_7cde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_41a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_25f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9c16_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_25f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_9c16_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2673_c3_4fcc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2673_l2669_DUPLICATE_fae0_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2670_c3_a9f3_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2673_l2669_DUPLICATE_fae0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c7_1370_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2687_c21_0c21_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2665_l2668_l2660_l2672_DUPLICATE_0216_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2665_l2668_l2660_l2672_DUPLICATE_0216_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2665_l2668_l2660_l2672_DUPLICATE_0216_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2665_l2668_l2660_l2672_DUPLICATE_0216_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2668_l2665_l2693_l2689_l2685_l2680_l2672_DUPLICATE_9818_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2668_l2665_l2693_l2689_l2685_l2680_l2672_DUPLICATE_9818_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2668_l2665_l2693_l2689_l2685_l2680_l2672_DUPLICATE_9818_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2668_l2665_l2693_l2689_l2685_l2680_l2672_DUPLICATE_9818_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_1370_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2668_l2665_l2693_l2689_l2685_l2680_l2672_DUPLICATE_9818_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_7cde_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2668_l2665_l2693_l2689_l2685_l2680_l2672_DUPLICATE_9818_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_25f7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2668_l2665_l2693_l2689_l2685_l2680_l2672_DUPLICATE_9818_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2665_l2680_l2668_l2660_DUPLICATE_0851_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2665_l2680_l2668_l2660_DUPLICATE_0851_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2665_l2680_l2668_l2660_DUPLICATE_0851_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2665_l2680_l2668_l2660_DUPLICATE_0851_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2668_l2665_l2693_l2660_l2689_l2685_l2680_DUPLICATE_726a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2668_l2665_l2693_l2660_l2689_l2685_l2680_DUPLICATE_726a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2668_l2665_l2693_l2660_l2689_l2685_l2680_DUPLICATE_726a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2668_l2665_l2693_l2660_l2689_l2685_l2680_DUPLICATE_726a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c7_1370_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2668_l2665_l2693_l2660_l2689_l2685_l2680_DUPLICATE_726a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_7cde_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2668_l2665_l2693_l2660_l2689_l2685_l2680_DUPLICATE_726a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_25f7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2668_l2665_l2693_l2660_l2689_l2685_l2680_DUPLICATE_726a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2689_l2668_DUPLICATE_3393_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_7cde_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2689_l2668_DUPLICATE_3393_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2689_l2665_l2668_l2660_DUPLICATE_ce54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2689_l2665_l2668_l2660_DUPLICATE_ce54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2689_l2665_l2668_l2660_DUPLICATE_ce54_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_7cde_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2689_l2665_l2668_l2660_DUPLICATE_ce54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2675_c30_3c79_return_output;
     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2683_l2691_DUPLICATE_cda6 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2683_l2691_DUPLICATE_cda6_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2691_l2683_DUPLICATE_6889_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2660_c1_ff0c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2660_c1_ff0c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2660_c1_ff0c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2660_c1_ff0c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2660_c1_ff0c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2660_c1_ff0c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2660_c1_ff0c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2660_c1_ff0c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2660_c1_ff0c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2673_c3_4fcc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2673_c3_4fcc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2673_c3_4fcc_left;
     BIN_OP_OR_uxn_opcodes_h_l2673_c3_4fcc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2673_c3_4fcc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2673_c3_4fcc_return_output := BIN_OP_OR_uxn_opcodes_h_l2673_c3_4fcc_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2670_c3_a9f3] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2670_c3_a9f3_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2670_c3_a9f3_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2670_c3_a9f3_return_output := CONST_SL_8_uxn_opcodes_h_l2670_c3_a9f3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2680_c7_d17f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_d17f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_d17f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2672_c7_0f33] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2693_c7_25f7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_25f7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_25f7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_25f7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_25f7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_25f7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_25f7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_25f7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_25f7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2693_c7_25f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_25f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_25f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_25f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_25f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_25f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_25f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_25f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_25f7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2689_c7_7cde] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_7cde_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_7cde_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_7cde_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_7cde_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_7cde_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_7cde_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_7cde_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_7cde_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2673_c3_4fcc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2683_l2691_DUPLICATE_cda6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_7cde_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2683_l2691_DUPLICATE_cda6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2670_c3_a9f3_return_output;
     VAR_printf_uxn_opcodes_h_l2661_c3_b297_uxn_opcodes_h_l2661_c3_b297_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2660_c1_ff0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_7cde_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_25f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_7cde_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_25f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_1370_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_7cde_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l2678_c21_80c2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2678_c21_80c2_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l2673_c3_4fcc_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2689_c7_7cde] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_7cde_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_7cde_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_7cde_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_7cde_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_7cde_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_7cde_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_7cde_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_7cde_return_output;

     -- t16_MUX[uxn_opcodes_h_l2672_c7_0f33] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2672_c7_0f33_cond <= VAR_t16_MUX_uxn_opcodes_h_l2672_c7_0f33_cond;
     t16_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue;
     t16_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output := t16_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2689_c7_7cde] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_7cde_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_7cde_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_7cde_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_7cde_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_7cde_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_7cde_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_7cde_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_7cde_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2668_c7_59d6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2672_c7_0f33] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2685_c7_1370] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_1370_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_1370_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_1370_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_1370_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_1370_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_1370_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_1370_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_1370_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2689_c7_7cde] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2689_c7_7cde_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_7cde_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2689_c7_7cde_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_7cde_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2689_c7_7cde_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_7cde_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_7cde_return_output := result_u8_value_MUX_uxn_opcodes_h_l2689_c7_7cde_return_output;

     -- printf_uxn_opcodes_h_l2661_c3_b297[uxn_opcodes_h_l2661_c3_b297] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2661_c3_b297_uxn_opcodes_h_l2661_c3_b297_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2661_c3_b297_uxn_opcodes_h_l2661_c3_b297_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2678_c21_80c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_1370_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_7cde_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c7_1370_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_7cde_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c7_1370_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c7_1370_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2689_c7_7cde_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2665_c7_cf47] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2668_c7_59d6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2685_c7_1370] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2685_c7_1370_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c7_1370_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2685_c7_1370_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c7_1370_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2685_c7_1370_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c7_1370_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c7_1370_return_output := result_u8_value_MUX_uxn_opcodes_h_l2685_c7_1370_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2685_c7_1370] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_1370_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_1370_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_1370_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_1370_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_1370_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_1370_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_1370_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_1370_return_output;

     -- t16_MUX[uxn_opcodes_h_l2668_c7_59d6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2668_c7_59d6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2668_c7_59d6_cond;
     t16_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue;
     t16_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output := t16_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2685_c7_1370] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2685_c7_1370_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c7_1370_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2685_c7_1370_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c7_1370_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2685_c7_1370_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c7_1370_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c7_1370_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2685_c7_1370_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2680_c7_d17f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_d17f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_d17f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c7_1370_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c7_1370_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c7_1370_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2680_c7_d17f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2680_c7_d17f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2680_c7_d17f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2665_c7_cf47] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2680_c7_d17f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2680_c7_d17f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2680_c7_d17f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2672_c7_0f33] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_0f33_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_0f33_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2680_c7_d17f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_d17f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_d17f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_d17f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_d17f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2660_c2_7dad] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output;

     -- t16_MUX[uxn_opcodes_h_l2665_c7_cf47] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2665_c7_cf47_cond <= VAR_t16_MUX_uxn_opcodes_h_l2665_c7_cf47_cond;
     t16_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue;
     t16_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output := t16_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2680_c7_d17f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2672_c7_0f33] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_0f33_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_0f33_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2668_c7_59d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_59d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_59d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2660_c2_7dad] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output;

     -- t16_MUX[uxn_opcodes_h_l2660_c2_7dad] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2660_c2_7dad_cond <= VAR_t16_MUX_uxn_opcodes_h_l2660_c2_7dad_cond;
     t16_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue;
     t16_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output := t16_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2672_c7_0f33] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_0f33_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_0f33_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2672_c7_0f33] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2672_c7_0f33_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2672_c7_0f33_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2672_c7_0f33_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2672_c7_0f33_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output := result_u8_value_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2672_c7_0f33_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2668_c7_59d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_59d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_59d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2668_c7_59d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_59d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_59d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2665_c7_cf47] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_cf47_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_cf47_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2668_c7_59d6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2668_c7_59d6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2668_c7_59d6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2668_c7_59d6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2668_c7_59d6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2668_c7_59d6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2665_c7_cf47] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_cf47_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_cf47_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2665_c7_cf47] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2665_c7_cf47_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_cf47_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output := result_u8_value_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2660_c2_7dad] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2660_c2_7dad_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2660_c2_7dad_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2665_c7_cf47] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_cf47_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_cf47_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_cf47_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_cf47_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2665_c7_cf47_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2660_c2_7dad] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2660_c2_7dad_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2660_c2_7dad_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2660_c2_7dad] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2660_c2_7dad_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2660_c2_7dad_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2660_c2_7dad] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2660_c2_7dad_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2660_c2_7dad_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2660_c2_7dad_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2660_c2_7dad_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output := result_u8_value_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2656_l2698_DUPLICATE_eb9f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2656_l2698_DUPLICATE_eb9f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2660_c2_7dad_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2656_l2698_DUPLICATE_eb9f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5cd2_uxn_opcodes_h_l2656_l2698_DUPLICATE_eb9f_return_output;
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
