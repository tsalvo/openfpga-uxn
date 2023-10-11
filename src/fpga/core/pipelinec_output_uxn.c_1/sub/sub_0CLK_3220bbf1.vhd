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
-- Submodules: 59
entity sub_0CLK_3220bbf1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub_0CLK_3220bbf1;
architecture arch of sub_0CLK_3220bbf1 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2685_c6_44a0]
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2685_c1_3acd]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_3acd_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_3acd_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_3acd_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_3acd_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2685_c2_d276]
signal n8_MUX_uxn_opcodes_h_l2685_c2_d276_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2685_c2_d276_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2685_c2_d276]
signal t8_MUX_uxn_opcodes_h_l2685_c2_d276_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2685_c2_d276_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2685_c2_d276]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_d276_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_d276_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2685_c2_d276]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c2_d276_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c2_d276_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2685_c2_d276]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_d276_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_d276_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2685_c2_d276]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_d276_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_d276_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2685_c2_d276]
signal result_stack_value_MUX_uxn_opcodes_h_l2685_c2_d276_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2685_c2_d276_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2685_c2_d276]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_d276_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_d276_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2686_c3_af96[uxn_opcodes_h_l2686_c3_af96]
signal printf_uxn_opcodes_h_l2686_c3_af96_uxn_opcodes_h_l2686_c3_af96_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2690_c11_261e]
signal BIN_OP_EQ_uxn_opcodes_h_l2690_c11_261e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2690_c11_261e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2690_c11_261e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2690_c7_55a5]
signal n8_MUX_uxn_opcodes_h_l2690_c7_55a5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2690_c7_55a5]
signal t8_MUX_uxn_opcodes_h_l2690_c7_55a5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2690_c7_55a5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2690_c7_55a5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2690_c7_55a5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2690_c7_55a5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_55a5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2690_c7_55a5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2690_c7_55a5]
signal result_stack_value_MUX_uxn_opcodes_h_l2690_c7_55a5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2690_c7_55a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_55a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2693_c11_bb75]
signal BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bb75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bb75_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bb75_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2693_c7_205b]
signal n8_MUX_uxn_opcodes_h_l2693_c7_205b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2693_c7_205b_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2693_c7_205b]
signal t8_MUX_uxn_opcodes_h_l2693_c7_205b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2693_c7_205b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2693_c7_205b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_205b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_205b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2693_c7_205b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_205b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_205b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2693_c7_205b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_205b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_205b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2693_c7_205b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_205b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_205b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2693_c7_205b]
signal result_stack_value_MUX_uxn_opcodes_h_l2693_c7_205b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2693_c7_205b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2693_c7_205b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_205b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_205b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2697_c11_dc36]
signal BIN_OP_EQ_uxn_opcodes_h_l2697_c11_dc36_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2697_c11_dc36_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2697_c11_dc36_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2697_c7_4430]
signal n8_MUX_uxn_opcodes_h_l2697_c7_4430_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2697_c7_4430_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2697_c7_4430]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_4430_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_4430_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2697_c7_4430]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2697_c7_4430_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2697_c7_4430_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2697_c7_4430]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_4430_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_4430_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2697_c7_4430]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2697_c7_4430_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2697_c7_4430_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2697_c7_4430]
signal result_stack_value_MUX_uxn_opcodes_h_l2697_c7_4430_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2697_c7_4430_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2697_c7_4430]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_4430_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_4430_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2700_c11_d32f]
signal BIN_OP_EQ_uxn_opcodes_h_l2700_c11_d32f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2700_c11_d32f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2700_c11_d32f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2700_c7_36aa]
signal n8_MUX_uxn_opcodes_h_l2700_c7_36aa_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2700_c7_36aa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2700_c7_36aa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2700_c7_36aa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2700_c7_36aa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_36aa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2700_c7_36aa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2700_c7_36aa]
signal result_stack_value_MUX_uxn_opcodes_h_l2700_c7_36aa_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2700_c7_36aa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_36aa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2703_c32_6c65]
signal BIN_OP_AND_uxn_opcodes_h_l2703_c32_6c65_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2703_c32_6c65_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2703_c32_6c65_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2703_c32_eced]
signal BIN_OP_GT_uxn_opcodes_h_l2703_c32_eced_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2703_c32_eced_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2703_c32_eced_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2703_c32_d0b0]
signal MUX_uxn_opcodes_h_l2703_c32_d0b0_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2703_c32_d0b0_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2703_c32_d0b0_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2703_c32_d0b0_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2705_c11_756d]
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_756d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_756d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_756d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2705_c7_39fb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_39fb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2705_c7_39fb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2705_c7_39fb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2705_c7_39fb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_39fb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2705_c7_39fb]
signal result_stack_value_MUX_uxn_opcodes_h_l2705_c7_39fb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2705_c7_39fb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_39fb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2709_c24_00ce]
signal BIN_OP_MINUS_uxn_opcodes_h_l2709_c24_00ce_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2709_c24_00ce_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2709_c24_00ce_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2711_c11_3b9a]
signal BIN_OP_EQ_uxn_opcodes_h_l2711_c11_3b9a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2711_c11_3b9a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2711_c11_3b9a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2711_c7_aac8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2711_c7_aac8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2711_c7_aac8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2711_c7_aac8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2711_c7_aac8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2711_c7_aac8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2711_c7_aac8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2711_c7_aac8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2711_c7_aac8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2711_c7_aac8_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_09c5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0_left,
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0_right,
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_3acd
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_3acd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_3acd_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_3acd_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_3acd_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_3acd_return_output);

-- n8_MUX_uxn_opcodes_h_l2685_c2_d276
n8_MUX_uxn_opcodes_h_l2685_c2_d276 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2685_c2_d276_cond,
n8_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue,
n8_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse,
n8_MUX_uxn_opcodes_h_l2685_c2_d276_return_output);

-- t8_MUX_uxn_opcodes_h_l2685_c2_d276
t8_MUX_uxn_opcodes_h_l2685_c2_d276 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2685_c2_d276_cond,
t8_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue,
t8_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse,
t8_MUX_uxn_opcodes_h_l2685_c2_d276_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_d276
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_d276 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_d276_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_d276_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c2_d276
result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c2_d276 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c2_d276_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c2_d276_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_d276
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_d276 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_d276_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_d276_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_d276
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_d276 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_d276_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_d276_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2685_c2_d276
result_stack_value_MUX_uxn_opcodes_h_l2685_c2_d276 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2685_c2_d276_cond,
result_stack_value_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2685_c2_d276_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_d276
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_d276 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_d276_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_d276_return_output);

-- printf_uxn_opcodes_h_l2686_c3_af96_uxn_opcodes_h_l2686_c3_af96
printf_uxn_opcodes_h_l2686_c3_af96_uxn_opcodes_h_l2686_c3_af96 : entity work.printf_uxn_opcodes_h_l2686_c3_af96_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2686_c3_af96_uxn_opcodes_h_l2686_c3_af96_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2690_c11_261e
BIN_OP_EQ_uxn_opcodes_h_l2690_c11_261e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2690_c11_261e_left,
BIN_OP_EQ_uxn_opcodes_h_l2690_c11_261e_right,
BIN_OP_EQ_uxn_opcodes_h_l2690_c11_261e_return_output);

-- n8_MUX_uxn_opcodes_h_l2690_c7_55a5
n8_MUX_uxn_opcodes_h_l2690_c7_55a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2690_c7_55a5_cond,
n8_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue,
n8_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse,
n8_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output);

-- t8_MUX_uxn_opcodes_h_l2690_c7_55a5
t8_MUX_uxn_opcodes_h_l2690_c7_55a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2690_c7_55a5_cond,
t8_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue,
t8_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse,
t8_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2690_c7_55a5
result_is_stack_write_MUX_uxn_opcodes_h_l2690_c7_55a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2690_c7_55a5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_55a5
result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_55a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_55a5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_55a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_55a5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_55a5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_55a5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2690_c7_55a5
result_stack_value_MUX_uxn_opcodes_h_l2690_c7_55a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2690_c7_55a5_cond,
result_stack_value_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_55a5
result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_55a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_55a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bb75
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bb75 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bb75_left,
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bb75_right,
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bb75_return_output);

-- n8_MUX_uxn_opcodes_h_l2693_c7_205b
n8_MUX_uxn_opcodes_h_l2693_c7_205b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2693_c7_205b_cond,
n8_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue,
n8_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse,
n8_MUX_uxn_opcodes_h_l2693_c7_205b_return_output);

-- t8_MUX_uxn_opcodes_h_l2693_c7_205b
t8_MUX_uxn_opcodes_h_l2693_c7_205b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2693_c7_205b_cond,
t8_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue,
t8_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse,
t8_MUX_uxn_opcodes_h_l2693_c7_205b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_205b
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_205b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_205b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_205b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_205b
result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_205b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_205b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_205b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_205b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_205b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_205b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_205b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_205b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_205b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_205b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_205b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2693_c7_205b
result_stack_value_MUX_uxn_opcodes_h_l2693_c7_205b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2693_c7_205b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2693_c7_205b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_205b
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_205b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_205b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_205b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2697_c11_dc36
BIN_OP_EQ_uxn_opcodes_h_l2697_c11_dc36 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2697_c11_dc36_left,
BIN_OP_EQ_uxn_opcodes_h_l2697_c11_dc36_right,
BIN_OP_EQ_uxn_opcodes_h_l2697_c11_dc36_return_output);

-- n8_MUX_uxn_opcodes_h_l2697_c7_4430
n8_MUX_uxn_opcodes_h_l2697_c7_4430 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2697_c7_4430_cond,
n8_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue,
n8_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse,
n8_MUX_uxn_opcodes_h_l2697_c7_4430_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_4430
result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_4430 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_4430_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_4430_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2697_c7_4430
result_is_sp_shift_MUX_uxn_opcodes_h_l2697_c7_4430 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2697_c7_4430_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2697_c7_4430_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_4430
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_4430 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_4430_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_4430_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2697_c7_4430
result_sp_relative_shift_MUX_uxn_opcodes_h_l2697_c7_4430 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2697_c7_4430_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2697_c7_4430_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2697_c7_4430
result_stack_value_MUX_uxn_opcodes_h_l2697_c7_4430 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2697_c7_4430_cond,
result_stack_value_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2697_c7_4430_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_4430
result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_4430 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_4430_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_4430_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2700_c11_d32f
BIN_OP_EQ_uxn_opcodes_h_l2700_c11_d32f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2700_c11_d32f_left,
BIN_OP_EQ_uxn_opcodes_h_l2700_c11_d32f_right,
BIN_OP_EQ_uxn_opcodes_h_l2700_c11_d32f_return_output);

-- n8_MUX_uxn_opcodes_h_l2700_c7_36aa
n8_MUX_uxn_opcodes_h_l2700_c7_36aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2700_c7_36aa_cond,
n8_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue,
n8_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse,
n8_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2700_c7_36aa
result_is_stack_write_MUX_uxn_opcodes_h_l2700_c7_36aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2700_c7_36aa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_36aa
result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_36aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_36aa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_36aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_36aa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_36aa
result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_36aa : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2700_c7_36aa
result_stack_value_MUX_uxn_opcodes_h_l2700_c7_36aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2700_c7_36aa_cond,
result_stack_value_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_36aa
result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_36aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_36aa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2703_c32_6c65
BIN_OP_AND_uxn_opcodes_h_l2703_c32_6c65 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2703_c32_6c65_left,
BIN_OP_AND_uxn_opcodes_h_l2703_c32_6c65_right,
BIN_OP_AND_uxn_opcodes_h_l2703_c32_6c65_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2703_c32_eced
BIN_OP_GT_uxn_opcodes_h_l2703_c32_eced : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2703_c32_eced_left,
BIN_OP_GT_uxn_opcodes_h_l2703_c32_eced_right,
BIN_OP_GT_uxn_opcodes_h_l2703_c32_eced_return_output);

-- MUX_uxn_opcodes_h_l2703_c32_d0b0
MUX_uxn_opcodes_h_l2703_c32_d0b0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2703_c32_d0b0_cond,
MUX_uxn_opcodes_h_l2703_c32_d0b0_iftrue,
MUX_uxn_opcodes_h_l2703_c32_d0b0_iffalse,
MUX_uxn_opcodes_h_l2703_c32_d0b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2705_c11_756d
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_756d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_756d_left,
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_756d_right,
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_756d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_39fb
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_39fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_39fb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2705_c7_39fb
result_is_sp_shift_MUX_uxn_opcodes_h_l2705_c7_39fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2705_c7_39fb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_39fb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_39fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_39fb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2705_c7_39fb
result_stack_value_MUX_uxn_opcodes_h_l2705_c7_39fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2705_c7_39fb_cond,
result_stack_value_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_39fb
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_39fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_39fb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2709_c24_00ce
BIN_OP_MINUS_uxn_opcodes_h_l2709_c24_00ce : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2709_c24_00ce_left,
BIN_OP_MINUS_uxn_opcodes_h_l2709_c24_00ce_right,
BIN_OP_MINUS_uxn_opcodes_h_l2709_c24_00ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2711_c11_3b9a
BIN_OP_EQ_uxn_opcodes_h_l2711_c11_3b9a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2711_c11_3b9a_left,
BIN_OP_EQ_uxn_opcodes_h_l2711_c11_3b9a_right,
BIN_OP_EQ_uxn_opcodes_h_l2711_c11_3b9a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2711_c7_aac8
result_is_stack_write_MUX_uxn_opcodes_h_l2711_c7_aac8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2711_c7_aac8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2711_c7_aac8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2711_c7_aac8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2711_c7_aac8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2711_c7_aac8
result_is_opc_done_MUX_uxn_opcodes_h_l2711_c7_aac8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2711_c7_aac8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2711_c7_aac8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2711_c7_aac8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2711_c7_aac8_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_3acd_return_output,
 n8_MUX_uxn_opcodes_h_l2685_c2_d276_return_output,
 t8_MUX_uxn_opcodes_h_l2685_c2_d276_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_d276_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c2_d276_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_d276_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_d276_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2685_c2_d276_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_d276_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2690_c11_261e_return_output,
 n8_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output,
 t8_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bb75_return_output,
 n8_MUX_uxn_opcodes_h_l2693_c7_205b_return_output,
 t8_MUX_uxn_opcodes_h_l2693_c7_205b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_205b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_205b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_205b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_205b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2693_c7_205b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_205b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2697_c11_dc36_return_output,
 n8_MUX_uxn_opcodes_h_l2697_c7_4430_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_4430_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2697_c7_4430_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_4430_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2697_c7_4430_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2697_c7_4430_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_4430_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2700_c11_d32f_return_output,
 n8_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2703_c32_6c65_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2703_c32_eced_return_output,
 MUX_uxn_opcodes_h_l2703_c32_d0b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2705_c11_756d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2709_c24_00ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2711_c11_3b9a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2711_c7_aac8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2711_c7_aac8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_3acd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_3acd_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_3acd_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_3acd_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2685_c2_d276_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2685_c2_d276_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2685_c2_d276_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2685_c2_d276_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_d276_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_d276_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c2_d276_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c2_d276_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2687_c3_d71e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_d276_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_d276_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_d276_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_d276_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2685_c2_d276_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2685_c2_d276_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_d276_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_d276_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2686_c3_af96_uxn_opcodes_h_l2686_c3_af96_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_261e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_261e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_261e_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2693_c7_205b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2690_c7_55a5_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2693_c7_205b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2690_c7_55a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_205b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2690_c7_55a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_205b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2691_c3_6a48 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_205b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_55a5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_205b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2693_c7_205b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2690_c7_55a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_205b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_55a5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bb75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bb75_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bb75_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2697_c7_4430_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2693_c7_205b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2693_c7_205b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_4430_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_205b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2697_c7_4430_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_205b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_fca8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_4430_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_205b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2697_c7_4430_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_205b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2697_c7_4430_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2693_c7_205b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_4430_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_205b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_dc36_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_dc36_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_dc36_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2697_c7_4430_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_4430_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2697_c7_4430_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2698_c3_66c5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_4430_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2697_c7_4430_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2697_c7_4430_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_4430_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_d32f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_d32f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_d32f_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2700_c7_36aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2700_c7_36aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_36aa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2700_c7_36aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_36aa_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2703_c32_d0b0_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2703_c32_d0b0_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2703_c32_d0b0_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2703_c32_6c65_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2703_c32_6c65_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2703_c32_6c65_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2703_c32_eced_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2703_c32_eced_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2703_c32_eced_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2703_c32_d0b0_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_756d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_756d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_756d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2711_c7_aac8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_39fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2705_c7_39fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2708_c3_dbe9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_39fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2705_c7_39fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2711_c7_aac8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_39fb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2709_c24_00ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2709_c24_00ce_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2709_c24_00ce_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_3b9a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_3b9a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_3b9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2711_c7_aac8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2711_c7_aac8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2711_c7_aac8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2711_c7_aac8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2711_c7_aac8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2711_c7_aac8_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2690_l2711_l2685_l2700_l2697_l2693_DUPLICATE_58aa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2690_l2685_l2705_l2697_l2693_DUPLICATE_e5fe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2690_l2685_l2700_l2697_l2693_DUPLICATE_7f99_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2690_l2685_l2705_l2700_l2697_l2693_DUPLICATE_3b4d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2690_l2711_l2705_l2700_l2697_l2693_DUPLICATE_cf81_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2700_l2705_DUPLICATE_518c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2716_l2681_DUPLICATE_1289_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_d32f_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2691_c3_6a48 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2691_c3_6a48;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2711_c7_aac8_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bb75_right := to_unsigned(2, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2703_c32_eced_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_fca8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_fca8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_261e_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_dc36_right := to_unsigned(3, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_3acd_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2698_c3_66c5 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2698_c3_66c5;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_756d_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2687_c3_d71e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2687_c3_d71e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_3b9a_right := to_unsigned(6, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2703_c32_6c65_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2711_c7_aac8_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2703_c32_d0b0_iffalse := resize(to_signed(-1, 2), 8);
     VAR_MUX_uxn_opcodes_h_l2703_c32_d0b0_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2708_c3_dbe9 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2708_c3_dbe9;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_3acd_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2703_c32_6c65_left := VAR_ins;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2709_c24_00ce_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_261e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bb75_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_dc36_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_d32f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_756d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_3b9a_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2709_c24_00ce_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2711_c11_3b9a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2711_c11_3b9a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_3b9a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2711_c11_3b9a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_3b9a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_3b9a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2711_c11_3b9a_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2709_c24_00ce] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2709_c24_00ce_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2709_c24_00ce_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2709_c24_00ce_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2709_c24_00ce_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2709_c24_00ce_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2709_c24_00ce_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2690_c11_261e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2690_c11_261e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_261e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2690_c11_261e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_261e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_261e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2690_c11_261e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2690_l2711_l2705_l2700_l2697_l2693_DUPLICATE_cf81 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2690_l2711_l2705_l2700_l2697_l2693_DUPLICATE_cf81_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2705_c11_756d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2705_c11_756d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_756d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2705_c11_756d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_756d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_756d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2705_c11_756d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2700_c11_d32f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2700_c11_d32f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_d32f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2700_c11_d32f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_d32f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_d32f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2700_c11_d32f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2690_l2685_l2705_l2697_l2693_DUPLICATE_e5fe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2690_l2685_l2705_l2697_l2693_DUPLICATE_e5fe_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2693_c11_bb75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bb75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bb75_left;
     BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bb75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bb75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bb75_return_output := BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bb75_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2685_c6_44a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2690_l2711_l2685_l2700_l2697_l2693_DUPLICATE_58aa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2690_l2711_l2685_l2700_l2697_l2693_DUPLICATE_58aa_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2700_l2705_DUPLICATE_518c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2700_l2705_DUPLICATE_518c_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2697_c11_dc36] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2697_c11_dc36_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_dc36_left;
     BIN_OP_EQ_uxn_opcodes_h_l2697_c11_dc36_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_dc36_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_dc36_return_output := BIN_OP_EQ_uxn_opcodes_h_l2697_c11_dc36_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2690_l2685_l2700_l2697_l2693_DUPLICATE_7f99 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2690_l2685_l2700_l2697_l2693_DUPLICATE_7f99_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2690_l2685_l2705_l2700_l2697_l2693_DUPLICATE_3b4d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2690_l2685_l2705_l2700_l2697_l2693_DUPLICATE_3b4d_return_output := result.stack_value;

     -- BIN_OP_AND[uxn_opcodes_h_l2703_c32_6c65] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2703_c32_6c65_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2703_c32_6c65_left;
     BIN_OP_AND_uxn_opcodes_h_l2703_c32_6c65_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2703_c32_6c65_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2703_c32_6c65_return_output := BIN_OP_AND_uxn_opcodes_h_l2703_c32_6c65_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2703_c32_eced_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2703_c32_6c65_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_3acd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2685_c2_d276_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_d276_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c2_d276_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_d276_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_d276_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_d276_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2685_c2_d276_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2685_c2_d276_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_44a0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2690_c7_55a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_261e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_55a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_261e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_261e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2690_c7_55a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_261e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_261e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_55a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_261e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2690_c7_55a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_261e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2690_c7_55a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2690_c11_261e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2693_c7_205b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bb75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_205b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bb75_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_205b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bb75_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_205b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bb75_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_205b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bb75_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_205b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bb75_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2693_c7_205b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bb75_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2693_c7_205b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_bb75_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2697_c7_4430_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_dc36_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_4430_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_dc36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2697_c7_4430_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_dc36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_4430_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_dc36_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2697_c7_4430_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_dc36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_4430_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_dc36_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2697_c7_4430_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2697_c11_dc36_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2700_c7_36aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_d32f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_36aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_d32f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_d32f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2700_c7_36aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_d32f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_d32f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_36aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_d32f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2700_c7_36aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2700_c11_d32f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_39fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_756d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2705_c7_39fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_756d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_39fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_756d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_39fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_756d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2705_c7_39fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_756d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2711_c7_aac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_3b9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2711_c7_aac8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2711_c11_3b9a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2709_c24_00ce_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2690_l2685_l2700_l2697_l2693_DUPLICATE_7f99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2690_l2685_l2700_l2697_l2693_DUPLICATE_7f99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2690_l2685_l2700_l2697_l2693_DUPLICATE_7f99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2690_l2685_l2700_l2697_l2693_DUPLICATE_7f99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2690_l2685_l2700_l2697_l2693_DUPLICATE_7f99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2690_l2711_l2705_l2700_l2697_l2693_DUPLICATE_cf81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2690_l2711_l2705_l2700_l2697_l2693_DUPLICATE_cf81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2690_l2711_l2705_l2700_l2697_l2693_DUPLICATE_cf81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2690_l2711_l2705_l2700_l2697_l2693_DUPLICATE_cf81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2690_l2711_l2705_l2700_l2697_l2693_DUPLICATE_cf81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2711_c7_aac8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2690_l2711_l2705_l2700_l2697_l2693_DUPLICATE_cf81_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2690_l2685_l2705_l2697_l2693_DUPLICATE_e5fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2690_l2685_l2705_l2697_l2693_DUPLICATE_e5fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2690_l2685_l2705_l2697_l2693_DUPLICATE_e5fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2690_l2685_l2705_l2697_l2693_DUPLICATE_e5fe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2690_l2685_l2705_l2697_l2693_DUPLICATE_e5fe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2690_l2711_l2685_l2700_l2697_l2693_DUPLICATE_58aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2690_l2711_l2685_l2700_l2697_l2693_DUPLICATE_58aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2690_l2711_l2685_l2700_l2697_l2693_DUPLICATE_58aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2690_l2711_l2685_l2700_l2697_l2693_DUPLICATE_58aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2690_l2711_l2685_l2700_l2697_l2693_DUPLICATE_58aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2711_c7_aac8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2690_l2711_l2685_l2700_l2697_l2693_DUPLICATE_58aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2700_l2705_DUPLICATE_518c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2700_l2705_DUPLICATE_518c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2690_l2685_l2705_l2700_l2697_l2693_DUPLICATE_3b4d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2690_l2685_l2705_l2700_l2697_l2693_DUPLICATE_3b4d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2690_l2685_l2705_l2700_l2697_l2693_DUPLICATE_3b4d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2690_l2685_l2705_l2700_l2697_l2693_DUPLICATE_3b4d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2690_l2685_l2705_l2700_l2697_l2693_DUPLICATE_3b4d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2690_l2685_l2705_l2700_l2697_l2693_DUPLICATE_3b4d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2711_c7_aac8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2711_c7_aac8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2711_c7_aac8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2711_c7_aac8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2711_c7_aac8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2711_c7_aac8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2711_c7_aac8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2711_c7_aac8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2711_c7_aac8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2705_c7_39fb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2705_c7_39fb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2705_c7_39fb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2685_c1_3acd] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_3acd_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_3acd_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_3acd_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_3acd_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_3acd_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_3acd_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_3acd_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_3acd_return_output;

     -- t8_MUX[uxn_opcodes_h_l2693_c7_205b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2693_c7_205b_cond <= VAR_t8_MUX_uxn_opcodes_h_l2693_c7_205b_cond;
     t8_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue;
     t8_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2693_c7_205b_return_output := t8_MUX_uxn_opcodes_h_l2693_c7_205b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2711_c7_aac8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2711_c7_aac8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2711_c7_aac8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2711_c7_aac8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2711_c7_aac8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2711_c7_aac8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2711_c7_aac8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2711_c7_aac8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2711_c7_aac8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2705_c7_39fb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2705_c7_39fb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2705_c7_39fb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output := result_stack_value_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2705_c7_39fb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_39fb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_39fb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output;

     -- n8_MUX[uxn_opcodes_h_l2700_c7_36aa] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2700_c7_36aa_cond <= VAR_n8_MUX_uxn_opcodes_h_l2700_c7_36aa_cond;
     n8_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue;
     n8_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output := n8_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2703_c32_eced] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2703_c32_eced_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2703_c32_eced_left;
     BIN_OP_GT_uxn_opcodes_h_l2703_c32_eced_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2703_c32_eced_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2703_c32_eced_return_output := BIN_OP_GT_uxn_opcodes_h_l2703_c32_eced_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2703_c32_d0b0_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2703_c32_eced_return_output;
     VAR_printf_uxn_opcodes_h_l2686_c3_af96_uxn_opcodes_h_l2686_c3_af96_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2685_c1_3acd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2711_c7_aac8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2711_c7_aac8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2693_c7_205b_return_output;
     -- t8_MUX[uxn_opcodes_h_l2690_c7_55a5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2690_c7_55a5_cond <= VAR_t8_MUX_uxn_opcodes_h_l2690_c7_55a5_cond;
     t8_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue;
     t8_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output := t8_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output;

     -- n8_MUX[uxn_opcodes_h_l2697_c7_4430] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2697_c7_4430_cond <= VAR_n8_MUX_uxn_opcodes_h_l2697_c7_4430_cond;
     n8_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue;
     n8_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2697_c7_4430_return_output := n8_MUX_uxn_opcodes_h_l2697_c7_4430_return_output;

     -- MUX[uxn_opcodes_h_l2703_c32_d0b0] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2703_c32_d0b0_cond <= VAR_MUX_uxn_opcodes_h_l2703_c32_d0b0_cond;
     MUX_uxn_opcodes_h_l2703_c32_d0b0_iftrue <= VAR_MUX_uxn_opcodes_h_l2703_c32_d0b0_iftrue;
     MUX_uxn_opcodes_h_l2703_c32_d0b0_iffalse <= VAR_MUX_uxn_opcodes_h_l2703_c32_d0b0_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2703_c32_d0b0_return_output := MUX_uxn_opcodes_h_l2703_c32_d0b0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2705_c7_39fb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_39fb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_39fb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2705_c7_39fb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_39fb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_39fb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_39fb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_39fb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2700_c7_36aa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_36aa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_36aa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output;

     -- printf_uxn_opcodes_h_l2686_c3_af96[uxn_opcodes_h_l2686_c3_af96] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2686_c3_af96_uxn_opcodes_h_l2686_c3_af96_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2686_c3_af96_uxn_opcodes_h_l2686_c3_af96_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2700_c7_36aa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2700_c7_36aa] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2700_c7_36aa_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2700_c7_36aa_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output := result_stack_value_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue := VAR_MUX_uxn_opcodes_h_l2703_c32_d0b0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2697_c7_4430_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_39fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2697_c7_4430] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2697_c7_4430_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2697_c7_4430_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2697_c7_4430_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2697_c7_4430_return_output;

     -- t8_MUX[uxn_opcodes_h_l2685_c2_d276] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2685_c2_d276_cond <= VAR_t8_MUX_uxn_opcodes_h_l2685_c2_d276_cond;
     t8_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue;
     t8_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2685_c2_d276_return_output := t8_MUX_uxn_opcodes_h_l2685_c2_d276_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2700_c7_36aa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2700_c7_36aa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2700_c7_36aa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2700_c7_36aa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2700_c7_36aa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_36aa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_36aa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_36aa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_36aa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output;

     -- n8_MUX[uxn_opcodes_h_l2693_c7_205b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2693_c7_205b_cond <= VAR_n8_MUX_uxn_opcodes_h_l2693_c7_205b_cond;
     n8_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue;
     n8_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2693_c7_205b_return_output := n8_MUX_uxn_opcodes_h_l2693_c7_205b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2697_c7_4430] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_4430_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_4430_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_4430_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_4430_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2697_c7_4430] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2697_c7_4430_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2697_c7_4430_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2697_c7_4430_return_output := result_stack_value_MUX_uxn_opcodes_h_l2697_c7_4430_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2693_c7_205b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2697_c7_4430_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2700_c7_36aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2697_c7_4430_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2697_c7_4430_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2685_c2_d276_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2693_c7_205b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_205b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_205b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_205b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_205b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2693_c7_205b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2693_c7_205b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2693_c7_205b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2693_c7_205b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2693_c7_205b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2697_c7_4430] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2697_c7_4430_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2697_c7_4430_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2697_c7_4430_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2697_c7_4430_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2693_c7_205b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_205b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_205b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_205b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_205b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2697_c7_4430] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_4430_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_4430_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_4430_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_4430_return_output;

     -- n8_MUX[uxn_opcodes_h_l2690_c7_55a5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2690_c7_55a5_cond <= VAR_n8_MUX_uxn_opcodes_h_l2690_c7_55a5_cond;
     n8_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue;
     n8_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output := n8_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2697_c7_4430] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_4430_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_4430_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_4430_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_4430_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_4430_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_4430_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2697_c7_4430_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_205b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2697_c7_4430_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2697_c7_4430_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_205b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2693_c7_205b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2693_c7_205b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_205b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_205b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_205b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_205b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2690_c7_55a5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_55a5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_55a5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2693_c7_205b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_205b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_205b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_205b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_205b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2690_c7_55a5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2690_c7_55a5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2690_c7_55a5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output := result_stack_value_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output;

     -- n8_MUX[uxn_opcodes_h_l2685_c2_d276] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2685_c2_d276_cond <= VAR_n8_MUX_uxn_opcodes_h_l2685_c2_d276_cond;
     n8_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue;
     n8_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2685_c2_d276_return_output := n8_MUX_uxn_opcodes_h_l2685_c2_d276_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2690_c7_55a5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2693_c7_205b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_205b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_205b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_205b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_205b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_205b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_205b_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2685_c2_d276_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_205b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_205b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_205b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2690_c7_55a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_55a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_55a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2690_c7_55a5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2690_c7_55a5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2690_c7_55a5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2685_c2_d276] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2685_c2_d276_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2685_c2_d276_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2685_c2_d276_return_output := result_stack_value_MUX_uxn_opcodes_h_l2685_c2_d276_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2690_c7_55a5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2685_c2_d276] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_d276_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_d276_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_d276_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_d276_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2685_c2_d276] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c2_d276_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c2_d276_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c2_d276_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c2_d276_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2690_c7_55a5_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2685_c2_d276] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_d276_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_d276_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_d276_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_d276_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2685_c2_d276] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_d276_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_d276_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_d276_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_d276_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2685_c2_d276] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_d276_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_d276_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_d276_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_d276_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_d276_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_d276_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2716_l2681_DUPLICATE_1289 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2716_l2681_DUPLICATE_1289_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_d276_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2685_c2_d276_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_d276_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_d276_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2685_c2_d276_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_d276_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2716_l2681_DUPLICATE_1289_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2716_l2681_DUPLICATE_1289_return_output;
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
