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
-- Submodules: 96
entity rot_0CLK_9c3c4e32 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot_0CLK_9c3c4e32;
architecture arch of rot_0CLK_9c3c4e32 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal l8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_l8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l3007_c6_df00]
signal BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3007_c1_0feb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3007_c1_0feb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3007_c1_0feb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3007_c1_0feb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3007_c1_0feb_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l3007_c2_2888]
signal l8_MUX_uxn_opcodes_h_l3007_c2_2888_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3007_c2_2888_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3007_c2_2888]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c2_2888_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c2_2888_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3007_c2_2888]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3007_c2_2888_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3007_c2_2888_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3007_c2_2888]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c2_2888_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c2_2888_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3007_c2_2888]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3007_c2_2888_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3007_c2_2888_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3007_c2_2888]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c2_2888_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c2_2888_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3007_c2_2888]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3007_c2_2888_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3007_c2_2888_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3007_c2_2888]
signal result_stack_value_MUX_uxn_opcodes_h_l3007_c2_2888_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3007_c2_2888_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l3007_c2_2888]
signal t8_MUX_uxn_opcodes_h_l3007_c2_2888_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l3007_c2_2888_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l3007_c2_2888]
signal n8_MUX_uxn_opcodes_h_l3007_c2_2888_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3007_c2_2888_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l3008_c3_b46f[uxn_opcodes_h_l3008_c3_b46f]
signal printf_uxn_opcodes_h_l3008_c3_b46f_uxn_opcodes_h_l3008_c3_b46f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3013_c11_916f]
signal BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l3013_c7_a3fc]
signal l8_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3013_c7_a3fc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3013_c7_a3fc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3013_c7_a3fc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3013_c7_a3fc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3013_c7_a3fc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3013_c7_a3fc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3013_c7_a3fc]
signal result_stack_value_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l3013_c7_a3fc]
signal t8_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l3013_c7_a3fc]
signal n8_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3016_c11_6802]
signal BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l3016_c7_6d37]
signal l8_MUX_uxn_opcodes_h_l3016_c7_6d37_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3016_c7_6d37]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3016_c7_6d37]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_6d37_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3016_c7_6d37]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3016_c7_6d37]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_6d37_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3016_c7_6d37]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_6d37_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3016_c7_6d37]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_6d37_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3016_c7_6d37]
signal result_stack_value_MUX_uxn_opcodes_h_l3016_c7_6d37_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l3016_c7_6d37]
signal t8_MUX_uxn_opcodes_h_l3016_c7_6d37_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l3016_c7_6d37]
signal n8_MUX_uxn_opcodes_h_l3016_c7_6d37_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3020_c11_ed96]
signal BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l3020_c7_c816]
signal l8_MUX_uxn_opcodes_h_l3020_c7_c816_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3020_c7_c816_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3020_c7_c816]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3020_c7_c816_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3020_c7_c816_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3020_c7_c816]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3020_c7_c816_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3020_c7_c816_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3020_c7_c816]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3020_c7_c816_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3020_c7_c816_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3020_c7_c816]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_c816_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_c816_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3020_c7_c816]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_c816_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_c816_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3020_c7_c816]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_c816_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_c816_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3020_c7_c816]
signal result_stack_value_MUX_uxn_opcodes_h_l3020_c7_c816_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3020_c7_c816_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l3020_c7_c816]
signal n8_MUX_uxn_opcodes_h_l3020_c7_c816_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3020_c7_c816_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3023_c11_fc19]
signal BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l3023_c7_34e8]
signal l8_MUX_uxn_opcodes_h_l3023_c7_34e8_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3023_c7_34e8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3023_c7_34e8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3023_c7_34e8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3023_c7_34e8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3023_c7_34e8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_34e8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3023_c7_34e8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3023_c7_34e8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3023_c7_34e8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_34e8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3023_c7_34e8]
signal result_stack_value_MUX_uxn_opcodes_h_l3023_c7_34e8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l3023_c7_34e8]
signal n8_MUX_uxn_opcodes_h_l3023_c7_34e8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3027_c11_905b]
signal BIN_OP_EQ_uxn_opcodes_h_l3027_c11_905b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3027_c11_905b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3027_c11_905b_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l3027_c7_7b6f]
signal l8_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3027_c7_7b6f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3027_c7_7b6f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3027_c7_7b6f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3027_c7_7b6f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3027_c7_7b6f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3027_c7_7b6f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3027_c7_7b6f]
signal result_stack_value_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3030_c11_75ba]
signal BIN_OP_EQ_uxn_opcodes_h_l3030_c11_75ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3030_c11_75ba_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3030_c11_75ba_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l3030_c7_7c9f]
signal l8_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3030_c7_7c9f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3030_c7_7c9f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3030_c7_7c9f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3030_c7_7c9f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3030_c7_7c9f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3030_c7_7c9f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3030_c7_7c9f]
signal result_stack_value_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3034_c32_9f20]
signal BIN_OP_AND_uxn_opcodes_h_l3034_c32_9f20_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3034_c32_9f20_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3034_c32_9f20_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3034_c32_2cc3]
signal BIN_OP_GT_uxn_opcodes_h_l3034_c32_2cc3_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3034_c32_2cc3_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3034_c32_2cc3_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l3034_c32_7c9c]
signal MUX_uxn_opcodes_h_l3034_c32_7c9c_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3034_c32_7c9c_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l3034_c32_7c9c_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l3034_c32_7c9c_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3036_c11_c2a4]
signal BIN_OP_EQ_uxn_opcodes_h_l3036_c11_c2a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3036_c11_c2a4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3036_c11_c2a4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3036_c7_8f54]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3036_c7_8f54_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3036_c7_8f54]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3036_c7_8f54_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3036_c7_8f54]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3036_c7_8f54_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3036_c7_8f54]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3036_c7_8f54_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3036_c7_8f54]
signal result_stack_value_MUX_uxn_opcodes_h_l3036_c7_8f54_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3042_c11_4579]
signal BIN_OP_EQ_uxn_opcodes_h_l3042_c11_4579_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3042_c11_4579_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3042_c11_4579_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3042_c7_9872]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_9872_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_9872_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_9872_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_9872_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3042_c7_9872]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_9872_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_9872_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_9872_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_9872_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3042_c7_9872]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_9872_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_9872_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_9872_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_9872_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3042_c7_9872]
signal result_stack_value_MUX_uxn_opcodes_h_l3042_c7_9872_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3042_c7_9872_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3042_c7_9872_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3042_c7_9872_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3046_c11_b8b1]
signal BIN_OP_EQ_uxn_opcodes_h_l3046_c11_b8b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3046_c11_b8b1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3046_c11_b8b1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3046_c7_bf04]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3046_c7_bf04_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3046_c7_bf04_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3046_c7_bf04_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3046_c7_bf04_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3046_c7_bf04]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3046_c7_bf04_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3046_c7_bf04_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3046_c7_bf04_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3046_c7_bf04_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3046_c7_bf04]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3046_c7_bf04_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3046_c7_bf04_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3046_c7_bf04_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3046_c7_bf04_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3046_c7_bf04]
signal result_stack_value_MUX_uxn_opcodes_h_l3046_c7_bf04_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3046_c7_bf04_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3046_c7_bf04_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3046_c7_bf04_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3050_c11_f18b]
signal BIN_OP_EQ_uxn_opcodes_h_l3050_c11_f18b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3050_c11_f18b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3050_c11_f18b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3050_c7_e73b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3050_c7_e73b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3050_c7_e73b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3050_c7_e73b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3050_c7_e73b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3050_c7_e73b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3050_c7_e73b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3050_c7_e73b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3050_c7_e73b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3050_c7_e73b_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00
BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_left,
BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_right,
BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3007_c1_0feb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3007_c1_0feb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3007_c1_0feb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3007_c1_0feb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3007_c1_0feb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3007_c1_0feb_return_output);

-- l8_MUX_uxn_opcodes_h_l3007_c2_2888
l8_MUX_uxn_opcodes_h_l3007_c2_2888 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l3007_c2_2888_cond,
l8_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue,
l8_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse,
l8_MUX_uxn_opcodes_h_l3007_c2_2888_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c2_2888
result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c2_2888 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c2_2888_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c2_2888_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3007_c2_2888
result_is_stack_read_MUX_uxn_opcodes_h_l3007_c2_2888 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3007_c2_2888_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3007_c2_2888_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c2_2888
result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c2_2888 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c2_2888_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c2_2888_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3007_c2_2888
result_is_stack_write_MUX_uxn_opcodes_h_l3007_c2_2888 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3007_c2_2888_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3007_c2_2888_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c2_2888
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c2_2888 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c2_2888_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c2_2888_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3007_c2_2888
result_is_opc_done_MUX_uxn_opcodes_h_l3007_c2_2888 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3007_c2_2888_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3007_c2_2888_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3007_c2_2888
result_stack_value_MUX_uxn_opcodes_h_l3007_c2_2888 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3007_c2_2888_cond,
result_stack_value_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3007_c2_2888_return_output);

-- t8_MUX_uxn_opcodes_h_l3007_c2_2888
t8_MUX_uxn_opcodes_h_l3007_c2_2888 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l3007_c2_2888_cond,
t8_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue,
t8_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse,
t8_MUX_uxn_opcodes_h_l3007_c2_2888_return_output);

-- n8_MUX_uxn_opcodes_h_l3007_c2_2888
n8_MUX_uxn_opcodes_h_l3007_c2_2888 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l3007_c2_2888_cond,
n8_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue,
n8_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse,
n8_MUX_uxn_opcodes_h_l3007_c2_2888_return_output);

-- printf_uxn_opcodes_h_l3008_c3_b46f_uxn_opcodes_h_l3008_c3_b46f
printf_uxn_opcodes_h_l3008_c3_b46f_uxn_opcodes_h_l3008_c3_b46f : entity work.printf_uxn_opcodes_h_l3008_c3_b46f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3008_c3_b46f_uxn_opcodes_h_l3008_c3_b46f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f
BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f_left,
BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f_right,
BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f_return_output);

-- l8_MUX_uxn_opcodes_h_l3013_c7_a3fc
l8_MUX_uxn_opcodes_h_l3013_c7_a3fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond,
l8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue,
l8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse,
l8_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc
result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3013_c7_a3fc
result_is_stack_read_MUX_uxn_opcodes_h_l3013_c7_a3fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc
result_sp_relative_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_a3fc
result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_a3fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_a3fc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_a3fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_a3fc
result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_a3fc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3013_c7_a3fc
result_stack_value_MUX_uxn_opcodes_h_l3013_c7_a3fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond,
result_stack_value_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output);

-- t8_MUX_uxn_opcodes_h_l3013_c7_a3fc
t8_MUX_uxn_opcodes_h_l3013_c7_a3fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond,
t8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue,
t8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse,
t8_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output);

-- n8_MUX_uxn_opcodes_h_l3013_c7_a3fc
n8_MUX_uxn_opcodes_h_l3013_c7_a3fc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond,
n8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue,
n8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse,
n8_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802
BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802_left,
BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802_right,
BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802_return_output);

-- l8_MUX_uxn_opcodes_h_l3016_c7_6d37
l8_MUX_uxn_opcodes_h_l3016_c7_6d37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l3016_c7_6d37_cond,
l8_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue,
l8_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse,
l8_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_6d37
result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_6d37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_6d37
result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_6d37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_6d37_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_6d37
result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_6d37 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_6d37
result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_6d37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_6d37_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_6d37
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_6d37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_6d37_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_6d37
result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_6d37 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_6d37_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3016_c7_6d37
result_stack_value_MUX_uxn_opcodes_h_l3016_c7_6d37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3016_c7_6d37_cond,
result_stack_value_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output);

-- t8_MUX_uxn_opcodes_h_l3016_c7_6d37
t8_MUX_uxn_opcodes_h_l3016_c7_6d37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l3016_c7_6d37_cond,
t8_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue,
t8_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse,
t8_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output);

-- n8_MUX_uxn_opcodes_h_l3016_c7_6d37
n8_MUX_uxn_opcodes_h_l3016_c7_6d37 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l3016_c7_6d37_cond,
n8_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue,
n8_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse,
n8_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96
BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96_left,
BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96_right,
BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96_return_output);

-- l8_MUX_uxn_opcodes_h_l3020_c7_c816
l8_MUX_uxn_opcodes_h_l3020_c7_c816 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l3020_c7_c816_cond,
l8_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue,
l8_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse,
l8_MUX_uxn_opcodes_h_l3020_c7_c816_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3020_c7_c816
result_is_sp_shift_MUX_uxn_opcodes_h_l3020_c7_c816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3020_c7_c816_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3020_c7_c816_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3020_c7_c816
result_is_stack_read_MUX_uxn_opcodes_h_l3020_c7_c816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3020_c7_c816_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3020_c7_c816_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3020_c7_c816
result_sp_relative_shift_MUX_uxn_opcodes_h_l3020_c7_c816 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3020_c7_c816_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3020_c7_c816_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_c816
result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_c816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_c816_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_c816_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_c816
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_c816 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_c816_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_c816_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_c816
result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_c816 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_c816_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_c816_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3020_c7_c816
result_stack_value_MUX_uxn_opcodes_h_l3020_c7_c816 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3020_c7_c816_cond,
result_stack_value_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3020_c7_c816_return_output);

-- n8_MUX_uxn_opcodes_h_l3020_c7_c816
n8_MUX_uxn_opcodes_h_l3020_c7_c816 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l3020_c7_c816_cond,
n8_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue,
n8_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse,
n8_MUX_uxn_opcodes_h_l3020_c7_c816_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19
BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19_left,
BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19_right,
BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19_return_output);

-- l8_MUX_uxn_opcodes_h_l3023_c7_34e8
l8_MUX_uxn_opcodes_h_l3023_c7_34e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l3023_c7_34e8_cond,
l8_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue,
l8_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse,
l8_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3023_c7_34e8
result_is_sp_shift_MUX_uxn_opcodes_h_l3023_c7_34e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3023_c7_34e8
result_is_stack_read_MUX_uxn_opcodes_h_l3023_c7_34e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3023_c7_34e8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3023_c7_34e8
result_sp_relative_shift_MUX_uxn_opcodes_h_l3023_c7_34e8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_34e8
result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_34e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_34e8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3023_c7_34e8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3023_c7_34e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3023_c7_34e8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_34e8
result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_34e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_34e8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3023_c7_34e8
result_stack_value_MUX_uxn_opcodes_h_l3023_c7_34e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3023_c7_34e8_cond,
result_stack_value_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output);

-- n8_MUX_uxn_opcodes_h_l3023_c7_34e8
n8_MUX_uxn_opcodes_h_l3023_c7_34e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l3023_c7_34e8_cond,
n8_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue,
n8_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse,
n8_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3027_c11_905b
BIN_OP_EQ_uxn_opcodes_h_l3027_c11_905b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3027_c11_905b_left,
BIN_OP_EQ_uxn_opcodes_h_l3027_c11_905b_right,
BIN_OP_EQ_uxn_opcodes_h_l3027_c11_905b_return_output);

-- l8_MUX_uxn_opcodes_h_l3027_c7_7b6f
l8_MUX_uxn_opcodes_h_l3027_c7_7b6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond,
l8_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue,
l8_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse,
l8_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f
result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_7b6f
result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_7b6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f
result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_7b6f
result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_7b6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_7b6f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_7b6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_7b6f
result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_7b6f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3027_c7_7b6f
result_stack_value_MUX_uxn_opcodes_h_l3027_c7_7b6f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond,
result_stack_value_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3030_c11_75ba
BIN_OP_EQ_uxn_opcodes_h_l3030_c11_75ba : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3030_c11_75ba_left,
BIN_OP_EQ_uxn_opcodes_h_l3030_c11_75ba_right,
BIN_OP_EQ_uxn_opcodes_h_l3030_c11_75ba_return_output);

-- l8_MUX_uxn_opcodes_h_l3030_c7_7c9f
l8_MUX_uxn_opcodes_h_l3030_c7_7c9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond,
l8_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue,
l8_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse,
l8_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f
result_is_sp_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3030_c7_7c9f
result_is_stack_read_MUX_uxn_opcodes_h_l3030_c7_7c9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f
result_sp_relative_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3030_c7_7c9f
result_is_stack_write_MUX_uxn_opcodes_h_l3030_c7_7c9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3030_c7_7c9f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3030_c7_7c9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3030_c7_7c9f
result_is_opc_done_MUX_uxn_opcodes_h_l3030_c7_7c9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3030_c7_7c9f
result_stack_value_MUX_uxn_opcodes_h_l3030_c7_7c9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond,
result_stack_value_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3034_c32_9f20
BIN_OP_AND_uxn_opcodes_h_l3034_c32_9f20 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3034_c32_9f20_left,
BIN_OP_AND_uxn_opcodes_h_l3034_c32_9f20_right,
BIN_OP_AND_uxn_opcodes_h_l3034_c32_9f20_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3034_c32_2cc3
BIN_OP_GT_uxn_opcodes_h_l3034_c32_2cc3 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3034_c32_2cc3_left,
BIN_OP_GT_uxn_opcodes_h_l3034_c32_2cc3_right,
BIN_OP_GT_uxn_opcodes_h_l3034_c32_2cc3_return_output);

-- MUX_uxn_opcodes_h_l3034_c32_7c9c
MUX_uxn_opcodes_h_l3034_c32_7c9c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3034_c32_7c9c_cond,
MUX_uxn_opcodes_h_l3034_c32_7c9c_iftrue,
MUX_uxn_opcodes_h_l3034_c32_7c9c_iffalse,
MUX_uxn_opcodes_h_l3034_c32_7c9c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3036_c11_c2a4
BIN_OP_EQ_uxn_opcodes_h_l3036_c11_c2a4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3036_c11_c2a4_left,
BIN_OP_EQ_uxn_opcodes_h_l3036_c11_c2a4_right,
BIN_OP_EQ_uxn_opcodes_h_l3036_c11_c2a4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3036_c7_8f54
result_is_sp_shift_MUX_uxn_opcodes_h_l3036_c7_8f54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3036_c7_8f54_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3036_c7_8f54
result_is_stack_write_MUX_uxn_opcodes_h_l3036_c7_8f54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3036_c7_8f54_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3036_c7_8f54
result_is_opc_done_MUX_uxn_opcodes_h_l3036_c7_8f54 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3036_c7_8f54_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3036_c7_8f54
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3036_c7_8f54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3036_c7_8f54_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3036_c7_8f54
result_stack_value_MUX_uxn_opcodes_h_l3036_c7_8f54 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3036_c7_8f54_cond,
result_stack_value_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3042_c11_4579
BIN_OP_EQ_uxn_opcodes_h_l3042_c11_4579 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3042_c11_4579_left,
BIN_OP_EQ_uxn_opcodes_h_l3042_c11_4579_right,
BIN_OP_EQ_uxn_opcodes_h_l3042_c11_4579_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_9872
result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_9872 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_9872_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_9872_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_9872_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_9872_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_9872
result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_9872 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_9872_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_9872_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_9872_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_9872_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_9872
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_9872 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_9872_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_9872_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_9872_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_9872_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3042_c7_9872
result_stack_value_MUX_uxn_opcodes_h_l3042_c7_9872 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3042_c7_9872_cond,
result_stack_value_MUX_uxn_opcodes_h_l3042_c7_9872_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3042_c7_9872_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3042_c7_9872_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3046_c11_b8b1
BIN_OP_EQ_uxn_opcodes_h_l3046_c11_b8b1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3046_c11_b8b1_left,
BIN_OP_EQ_uxn_opcodes_h_l3046_c11_b8b1_right,
BIN_OP_EQ_uxn_opcodes_h_l3046_c11_b8b1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3046_c7_bf04
result_is_stack_write_MUX_uxn_opcodes_h_l3046_c7_bf04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3046_c7_bf04_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3046_c7_bf04_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3046_c7_bf04_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3046_c7_bf04_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3046_c7_bf04
result_is_opc_done_MUX_uxn_opcodes_h_l3046_c7_bf04 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3046_c7_bf04_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3046_c7_bf04_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3046_c7_bf04_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3046_c7_bf04_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3046_c7_bf04
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3046_c7_bf04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3046_c7_bf04_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3046_c7_bf04_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3046_c7_bf04_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3046_c7_bf04_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3046_c7_bf04
result_stack_value_MUX_uxn_opcodes_h_l3046_c7_bf04 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3046_c7_bf04_cond,
result_stack_value_MUX_uxn_opcodes_h_l3046_c7_bf04_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3046_c7_bf04_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3046_c7_bf04_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3050_c11_f18b
BIN_OP_EQ_uxn_opcodes_h_l3050_c11_f18b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3050_c11_f18b_left,
BIN_OP_EQ_uxn_opcodes_h_l3050_c11_f18b_right,
BIN_OP_EQ_uxn_opcodes_h_l3050_c11_f18b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3050_c7_e73b
result_is_stack_write_MUX_uxn_opcodes_h_l3050_c7_e73b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3050_c7_e73b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3050_c7_e73b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3050_c7_e73b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3050_c7_e73b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3050_c7_e73b
result_is_opc_done_MUX_uxn_opcodes_h_l3050_c7_e73b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3050_c7_e73b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3050_c7_e73b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3050_c7_e73b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3050_c7_e73b_return_output);



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
 l8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3007_c1_0feb_return_output,
 l8_MUX_uxn_opcodes_h_l3007_c2_2888_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c2_2888_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3007_c2_2888_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c2_2888_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3007_c2_2888_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c2_2888_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3007_c2_2888_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3007_c2_2888_return_output,
 t8_MUX_uxn_opcodes_h_l3007_c2_2888_return_output,
 n8_MUX_uxn_opcodes_h_l3007_c2_2888_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f_return_output,
 l8_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output,
 t8_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output,
 n8_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802_return_output,
 l8_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output,
 t8_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output,
 n8_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96_return_output,
 l8_MUX_uxn_opcodes_h_l3020_c7_c816_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3020_c7_c816_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3020_c7_c816_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3020_c7_c816_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_c816_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_c816_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_c816_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3020_c7_c816_return_output,
 n8_MUX_uxn_opcodes_h_l3020_c7_c816_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19_return_output,
 l8_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output,
 n8_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3027_c11_905b_return_output,
 l8_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3030_c11_75ba_return_output,
 l8_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3034_c32_9f20_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3034_c32_2cc3_return_output,
 MUX_uxn_opcodes_h_l3034_c32_7c9c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3036_c11_c2a4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3042_c11_4579_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_9872_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_9872_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_9872_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3042_c7_9872_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3046_c11_b8b1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3046_c7_bf04_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3046_c7_bf04_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3046_c7_bf04_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3046_c7_bf04_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3050_c11_f18b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3050_c7_e73b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3050_c7_e73b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3007_c1_0feb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3007_c1_0feb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3007_c1_0feb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3007_c1_0feb_iffalse : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3007_c2_2888_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3007_c2_2888_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c2_2888_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c2_2888_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3007_c2_2888_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3007_c2_2888_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c2_2888_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c2_2888_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3007_c2_2888_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3007_c2_2888_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3010_c3_b46c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c2_2888_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c2_2888_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3007_c2_2888_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3007_c2_2888_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3007_c2_2888_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3007_c2_2888_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3007_c2_2888_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3007_c2_2888_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3007_c2_2888_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3007_c2_2888_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3008_c3_b46f_uxn_opcodes_h_l3008_c3_b46f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3014_c3_8981 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3020_c7_c816_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3016_c7_6d37_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3020_c7_c816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3020_c7_c816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_6d37_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3020_c7_c816_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_c816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_6d37_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3018_c3_1b6b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_c816_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_6d37_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_c816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_6d37_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3020_c7_c816_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3016_c7_6d37_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3016_c7_6d37_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3020_c7_c816_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3016_c7_6d37_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3020_c7_c816_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3020_c7_c816_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3020_c7_c816_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3020_c7_c816_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_c816_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3021_c3_9ed2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_c816_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_c816_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3020_c7_c816_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3020_c7_c816_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3023_c7_34e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3023_c7_34e8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_34e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3025_c3_66da : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3023_c7_34e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_34e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3023_c7_34e8_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3023_c7_34e8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_905b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_905b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_905b_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3028_c3_ce22 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3030_c11_75ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3030_c11_75ba_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3030_c11_75ba_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3034_c32_7c9c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3034_c32_7c9c_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3034_c32_7c9c_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3034_c32_9f20_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3034_c32_9f20_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3034_c32_9f20_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3034_c32_2cc3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3034_c32_2cc3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3034_c32_2cc3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3034_c32_7c9c_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3036_c11_c2a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3036_c11_c2a4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3036_c11_c2a4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3036_c7_8f54_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_9872_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3036_c7_8f54_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_9872_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3036_c7_8f54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3039_c3_583a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_9872_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3036_c7_8f54_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3042_c7_9872_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3036_c7_8f54_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3042_c11_4579_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3042_c11_4579_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3042_c11_4579_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_9872_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_9872_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3046_c7_bf04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_9872_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_9872_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_9872_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3046_c7_bf04_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_9872_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_9872_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3043_c3_7091 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_9872_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3046_c7_bf04_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_9872_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3042_c7_9872_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3042_c7_9872_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3046_c7_bf04_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3042_c7_9872_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3046_c11_b8b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3046_c11_b8b1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3046_c11_b8b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3046_c7_bf04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3046_c7_bf04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3050_c7_e73b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3046_c7_bf04_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3046_c7_bf04_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3046_c7_bf04_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3050_c7_e73b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3046_c7_bf04_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3046_c7_bf04_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3047_c3_e407 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3046_c7_bf04_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3046_c7_bf04_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3046_c7_bf04_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3046_c7_bf04_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3046_c7_bf04_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c11_f18b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c11_f18b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c11_f18b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3050_c7_e73b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3050_c7_e73b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3050_c7_e73b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3050_c7_e73b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3050_c7_e73b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3050_c7_e73b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3036_l3007_l3027_l3023_DUPLICATE_1d39_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3007_l3030_l3027_l3023_DUPLICATE_b55a_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3042_l3013_l3007_l3030_l3027_l3023_l3050_DUPLICATE_87b2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3013_l3007_l3030_l3027_l3023_DUPLICATE_076b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3030_l3027_l3023_DUPLICATE_b3c8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3042_l3013_l3036_l3030_l3027_l3023_l3050_DUPLICATE_a965_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3030_l3046_DUPLICATE_ec16_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l3055_l3003_DUPLICATE_35af_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_l8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_l8 := l8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3043_c3_7091 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_9872_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3043_c3_7091;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3021_c3_9ed2 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3021_c3_9ed2;
     VAR_BIN_OP_GT_uxn_opcodes_h_l3034_c32_2cc3_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c11_f18b_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3036_c11_c2a4_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3018_c3_1b6b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3018_c3_1b6b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3010_c3_b46c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3010_c3_b46c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3039_c3_583a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3039_c3_583a;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3050_c7_e73b_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3014_c3_8981 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3014_c3_8981;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3030_c11_75ba_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3028_c3_ce22 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3028_c3_ce22;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3034_c32_9f20_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3007_c1_0feb_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3050_c7_e73b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3042_c11_4579_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3047_c3_e407 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3046_c7_bf04_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3047_c3_e407;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3046_c11_b8b1_right := to_unsigned(9, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_905b_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l3034_c32_7c9c_iftrue := signed(std_logic_vector(resize(to_unsigned(3, 2), 8)));
     VAR_MUX_uxn_opcodes_h_l3034_c32_7c9c_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3025_c3_66da := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3025_c3_66da;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3007_c1_0feb_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3034_c32_9f20_left := VAR_ins;
     VAR_l8_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse := l8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue := l8;
     VAR_n8_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3046_c7_bf04_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_905b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3030_c11_75ba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3036_c11_c2a4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3042_c11_4579_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3046_c11_b8b1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c11_f18b_left := VAR_phase;
     VAR_l8_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue := VAR_previous_stack_read;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3042_c7_9872_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l3036_c11_c2a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3036_c11_c2a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3036_c11_c2a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l3036_c11_c2a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3036_c11_c2a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3036_c11_c2a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l3036_c11_c2a4_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3007_l3030_l3027_l3023_DUPLICATE_b55a LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3007_l3030_l3027_l3023_DUPLICATE_b55a_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l3020_c11_ed96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96_left;
     BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96_return_output := BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3042_l3013_l3007_l3030_l3027_l3023_l3050_DUPLICATE_87b2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3042_l3013_l3007_l3030_l3027_l3023_l3050_DUPLICATE_87b2_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3042_l3013_l3036_l3030_l3027_l3023_l3050_DUPLICATE_a965 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3042_l3013_l3036_l3030_l3027_l3023_l3050_DUPLICATE_a965_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l3013_c11_916f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f_left;
     BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f_return_output := BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3030_c11_75ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3030_c11_75ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3030_c11_75ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l3030_c11_75ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3030_c11_75ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3030_c11_75ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l3030_c11_75ba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3023_c11_fc19] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19_left;
     BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19_return_output := BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3050_c11_f18b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3050_c11_f18b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c11_f18b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3050_c11_f18b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c11_f18b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c11_f18b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3050_c11_f18b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3042_c11_4579] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3042_c11_4579_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3042_c11_4579_left;
     BIN_OP_EQ_uxn_opcodes_h_l3042_c11_4579_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3042_c11_4579_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3042_c11_4579_return_output := BIN_OP_EQ_uxn_opcodes_h_l3042_c11_4579_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3007_c6_df00] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_left;
     BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_return_output := BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3013_l3007_l3030_l3027_l3023_DUPLICATE_076b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3013_l3007_l3030_l3027_l3023_DUPLICATE_076b_return_output := result.stack_value;

     -- BIN_OP_AND[uxn_opcodes_h_l3034_c32_9f20] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3034_c32_9f20_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3034_c32_9f20_left;
     BIN_OP_AND_uxn_opcodes_h_l3034_c32_9f20_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3034_c32_9f20_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3034_c32_9f20_return_output := BIN_OP_AND_uxn_opcodes_h_l3034_c32_9f20_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3036_l3007_l3027_l3023_DUPLICATE_1d39 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3036_l3007_l3027_l3023_DUPLICATE_1d39_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3030_l3046_DUPLICATE_ec16 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3030_l3046_DUPLICATE_ec16_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l3046_c11_b8b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3046_c11_b8b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3046_c11_b8b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l3046_c11_b8b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3046_c11_b8b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3046_c11_b8b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l3046_c11_b8b1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3016_c11_6802] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802_left;
     BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802_return_output := BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3027_c11_905b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3027_c11_905b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_905b_left;
     BIN_OP_EQ_uxn_opcodes_h_l3027_c11_905b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_905b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_905b_return_output := BIN_OP_EQ_uxn_opcodes_h_l3027_c11_905b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3030_l3027_l3023_DUPLICATE_b3c8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3030_l3027_l3023_DUPLICATE_b3c8_return_output := result.is_stack_read;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l3034_c32_2cc3_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3034_c32_9f20_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3007_c1_0feb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l3007_c2_2888_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l3007_c2_2888_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3007_c2_2888_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c2_2888_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3007_c2_2888_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3007_c2_2888_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c2_2888_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c2_2888_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3007_c2_2888_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l3007_c2_2888_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3007_c6_df00_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_916f_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l3016_c7_6d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l3016_c7_6d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_6d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_6d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_6d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_6d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3016_c7_6d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l3016_c7_6d37_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3016_c11_6802_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l3020_c7_c816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l3020_c7_c816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_c816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3020_c7_c816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3020_c7_c816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_c816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3020_c7_c816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_c816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3020_c7_c816_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3020_c11_ed96_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l3023_c7_34e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l3023_c7_34e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_34e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3023_c7_34e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_34e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3023_c7_34e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3023_c7_34e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_fc19_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_905b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_905b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_905b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_905b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_905b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_905b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_905b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3027_c11_905b_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3030_c11_75ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3030_c11_75ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3030_c11_75ba_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3030_c11_75ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3030_c11_75ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3030_c11_75ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3030_c11_75ba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3030_c11_75ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3036_c7_8f54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3036_c11_c2a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3036_c7_8f54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3036_c11_c2a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3036_c7_8f54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3036_c11_c2a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3036_c7_8f54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3036_c11_c2a4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3036_c7_8f54_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3036_c11_c2a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_9872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3042_c11_4579_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_9872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3042_c11_4579_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_9872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3042_c11_4579_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3042_c7_9872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3042_c11_4579_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3046_c7_bf04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3046_c11_b8b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3046_c7_bf04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3046_c11_b8b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3046_c7_bf04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3046_c11_b8b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3046_c7_bf04_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3046_c11_b8b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3050_c7_e73b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c11_f18b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3050_c7_e73b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3050_c11_f18b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3007_l3030_l3027_l3023_DUPLICATE_b55a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3007_l3030_l3027_l3023_DUPLICATE_b55a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3007_l3030_l3027_l3023_DUPLICATE_b55a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3007_l3030_l3027_l3023_DUPLICATE_b55a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3007_l3030_l3027_l3023_DUPLICATE_b55a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3007_l3030_l3027_l3023_DUPLICATE_b55a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3007_l3030_l3027_l3023_DUPLICATE_b55a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3042_l3013_l3036_l3030_l3027_l3023_l3050_DUPLICATE_a965_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3042_l3013_l3036_l3030_l3027_l3023_l3050_DUPLICATE_a965_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3042_l3013_l3036_l3030_l3027_l3023_l3050_DUPLICATE_a965_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3042_l3013_l3036_l3030_l3027_l3023_l3050_DUPLICATE_a965_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3042_l3013_l3036_l3030_l3027_l3023_l3050_DUPLICATE_a965_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3042_l3013_l3036_l3030_l3027_l3023_l3050_DUPLICATE_a965_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3042_l3013_l3036_l3030_l3027_l3023_l3050_DUPLICATE_a965_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_9872_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3042_l3013_l3036_l3030_l3027_l3023_l3050_DUPLICATE_a965_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3046_c7_bf04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3042_l3013_l3036_l3030_l3027_l3023_l3050_DUPLICATE_a965_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3050_c7_e73b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3042_l3013_l3036_l3030_l3027_l3023_l3050_DUPLICATE_a965_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3036_l3007_l3027_l3023_DUPLICATE_1d39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3036_l3007_l3027_l3023_DUPLICATE_1d39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3036_l3007_l3027_l3023_DUPLICATE_1d39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3036_l3007_l3027_l3023_DUPLICATE_1d39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3036_l3007_l3027_l3023_DUPLICATE_1d39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3036_l3007_l3027_l3023_DUPLICATE_1d39_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3036_l3007_l3027_l3023_DUPLICATE_1d39_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3030_l3027_l3023_DUPLICATE_b3c8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3030_l3027_l3023_DUPLICATE_b3c8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3030_l3027_l3023_DUPLICATE_b3c8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3030_l3027_l3023_DUPLICATE_b3c8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3030_l3027_l3023_DUPLICATE_b3c8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3020_l3016_l3013_l3030_l3027_l3023_DUPLICATE_b3c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3042_l3013_l3007_l3030_l3027_l3023_l3050_DUPLICATE_87b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3042_l3013_l3007_l3030_l3027_l3023_l3050_DUPLICATE_87b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3042_l3013_l3007_l3030_l3027_l3023_l3050_DUPLICATE_87b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3042_l3013_l3007_l3030_l3027_l3023_l3050_DUPLICATE_87b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3042_l3013_l3007_l3030_l3027_l3023_l3050_DUPLICATE_87b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3042_l3013_l3007_l3030_l3027_l3023_l3050_DUPLICATE_87b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3042_l3013_l3007_l3030_l3027_l3023_l3050_DUPLICATE_87b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_9872_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3042_l3013_l3007_l3030_l3027_l3023_l3050_DUPLICATE_87b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3046_c7_bf04_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3042_l3013_l3007_l3030_l3027_l3023_l3050_DUPLICATE_87b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3050_c7_e73b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3042_l3013_l3007_l3030_l3027_l3023_l3050_DUPLICATE_87b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3030_l3046_DUPLICATE_ec16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3046_c7_bf04_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3030_l3046_DUPLICATE_ec16_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3013_l3007_l3030_l3027_l3023_DUPLICATE_076b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3013_l3007_l3030_l3027_l3023_DUPLICATE_076b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3013_l3007_l3030_l3027_l3023_DUPLICATE_076b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3013_l3007_l3030_l3027_l3023_DUPLICATE_076b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3013_l3007_l3030_l3027_l3023_DUPLICATE_076b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3013_l3007_l3030_l3027_l3023_DUPLICATE_076b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3013_l3007_l3030_l3027_l3023_DUPLICATE_076b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3046_c7_bf04_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3020_l3046_l3016_l3013_l3007_l3030_l3027_l3023_DUPLICATE_076b_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3007_c1_0feb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3007_c1_0feb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3007_c1_0feb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3007_c1_0feb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3007_c1_0feb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3007_c1_0feb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3007_c1_0feb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3007_c1_0feb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3007_c1_0feb_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l3034_c32_2cc3] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3034_c32_2cc3_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3034_c32_2cc3_left;
     BIN_OP_GT_uxn_opcodes_h_l3034_c32_2cc3_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3034_c32_2cc3_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3034_c32_2cc3_return_output := BIN_OP_GT_uxn_opcodes_h_l3034_c32_2cc3_return_output;

     -- n8_MUX[uxn_opcodes_h_l3023_c7_34e8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l3023_c7_34e8_cond <= VAR_n8_MUX_uxn_opcodes_h_l3023_c7_34e8_cond;
     n8_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue;
     n8_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output := n8_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3046_c7_bf04] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3046_c7_bf04_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3046_c7_bf04_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3046_c7_bf04_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3046_c7_bf04_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3046_c7_bf04_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3046_c7_bf04_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3046_c7_bf04_return_output := result_stack_value_MUX_uxn_opcodes_h_l3046_c7_bf04_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3036_c7_8f54] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3036_c7_8f54_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3036_c7_8f54_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3030_c7_7c9f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3050_c7_e73b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3050_c7_e73b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3050_c7_e73b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3050_c7_e73b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3050_c7_e73b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3050_c7_e73b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3050_c7_e73b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3050_c7_e73b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3050_c7_e73b_return_output;

     -- l8_MUX[uxn_opcodes_h_l3030_c7_7c9f] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond <= VAR_l8_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond;
     l8_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue;
     l8_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output := l8_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3050_c7_e73b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3050_c7_e73b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3050_c7_e73b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3050_c7_e73b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3050_c7_e73b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3050_c7_e73b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3050_c7_e73b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3050_c7_e73b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3050_c7_e73b_return_output;

     -- t8_MUX[uxn_opcodes_h_l3016_c7_6d37] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l3016_c7_6d37_cond <= VAR_t8_MUX_uxn_opcodes_h_l3016_c7_6d37_cond;
     t8_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue;
     t8_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output := t8_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3046_c7_bf04] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3046_c7_bf04_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3046_c7_bf04_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3046_c7_bf04_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3046_c7_bf04_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3046_c7_bf04_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3046_c7_bf04_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3046_c7_bf04_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3046_c7_bf04_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l3034_c32_7c9c_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3034_c32_2cc3_return_output;
     VAR_printf_uxn_opcodes_h_l3008_c3_b46f_uxn_opcodes_h_l3008_c3_b46f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3007_c1_0feb_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse := VAR_l8_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse := VAR_n8_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3046_c7_bf04_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3050_c7_e73b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3046_c7_bf04_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3050_c7_e73b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_9872_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3046_c7_bf04_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3042_c7_9872_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3046_c7_bf04_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse := VAR_t8_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output;
     -- n8_MUX[uxn_opcodes_h_l3020_c7_c816] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l3020_c7_c816_cond <= VAR_n8_MUX_uxn_opcodes_h_l3020_c7_c816_cond;
     n8_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue;
     n8_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l3020_c7_c816_return_output := n8_MUX_uxn_opcodes_h_l3020_c7_c816_return_output;

     -- l8_MUX[uxn_opcodes_h_l3027_c7_7b6f] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond <= VAR_l8_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond;
     l8_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue;
     l8_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output := l8_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3030_c7_7c9f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3046_c7_bf04] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3046_c7_bf04_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3046_c7_bf04_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3046_c7_bf04_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3046_c7_bf04_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3046_c7_bf04_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3046_c7_bf04_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3046_c7_bf04_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3046_c7_bf04_return_output;

     -- t8_MUX[uxn_opcodes_h_l3013_c7_a3fc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond <= VAR_t8_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond;
     t8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue;
     t8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output := t8_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3027_c7_7b6f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3042_c7_9872] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_9872_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_9872_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_9872_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_9872_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_9872_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_9872_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_9872_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_9872_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3046_c7_bf04] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3046_c7_bf04_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3046_c7_bf04_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3046_c7_bf04_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3046_c7_bf04_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3046_c7_bf04_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3046_c7_bf04_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3046_c7_bf04_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3046_c7_bf04_return_output;

     -- MUX[uxn_opcodes_h_l3034_c32_7c9c] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3034_c32_7c9c_cond <= VAR_MUX_uxn_opcodes_h_l3034_c32_7c9c_cond;
     MUX_uxn_opcodes_h_l3034_c32_7c9c_iftrue <= VAR_MUX_uxn_opcodes_h_l3034_c32_7c9c_iftrue;
     MUX_uxn_opcodes_h_l3034_c32_7c9c_iffalse <= VAR_MUX_uxn_opcodes_h_l3034_c32_7c9c_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3034_c32_7c9c_return_output := MUX_uxn_opcodes_h_l3034_c32_7c9c_return_output;

     -- printf_uxn_opcodes_h_l3008_c3_b46f[uxn_opcodes_h_l3008_c3_b46f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3008_c3_b46f_uxn_opcodes_h_l3008_c3_b46f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3008_c3_b46f_uxn_opcodes_h_l3008_c3_b46f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_value_MUX[uxn_opcodes_h_l3042_c7_9872] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3042_c7_9872_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3042_c7_9872_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3042_c7_9872_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3042_c7_9872_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3042_c7_9872_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3042_c7_9872_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3042_c7_9872_return_output := result_stack_value_MUX_uxn_opcodes_h_l3042_c7_9872_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue := VAR_MUX_uxn_opcodes_h_l3034_c32_7c9c_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse := VAR_l8_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse := VAR_n8_MUX_uxn_opcodes_h_l3020_c7_c816_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_9872_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3046_c7_bf04_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_9872_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3046_c7_bf04_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3042_c7_9872_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3042_c7_9872_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse := VAR_t8_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3042_c7_9872] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_9872_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_9872_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_9872_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_9872_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_9872_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_9872_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_9872_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_9872_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3036_c7_8f54] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3036_c7_8f54_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3036_c7_8f54_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output := result_stack_value_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3027_c7_7b6f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output;

     -- l8_MUX[uxn_opcodes_h_l3023_c7_34e8] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l3023_c7_34e8_cond <= VAR_l8_MUX_uxn_opcodes_h_l3023_c7_34e8_cond;
     l8_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue;
     l8_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output := l8_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3030_c7_7c9f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output;

     -- t8_MUX[uxn_opcodes_h_l3007_c2_2888] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l3007_c2_2888_cond <= VAR_t8_MUX_uxn_opcodes_h_l3007_c2_2888_cond;
     t8_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue;
     t8_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l3007_c2_2888_return_output := t8_MUX_uxn_opcodes_h_l3007_c2_2888_return_output;

     -- n8_MUX[uxn_opcodes_h_l3016_c7_6d37] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l3016_c7_6d37_cond <= VAR_n8_MUX_uxn_opcodes_h_l3016_c7_6d37_cond;
     n8_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue;
     n8_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output := n8_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3023_c7_34e8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3023_c7_34e8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3023_c7_34e8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3036_c7_8f54] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3036_c7_8f54_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3036_c7_8f54_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3042_c7_9872] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_9872_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_9872_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_9872_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_9872_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_9872_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_9872_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_9872_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_9872_return_output;

     -- Submodule level 4
     VAR_l8_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse := VAR_l8_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse := VAR_n8_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3042_c7_9872_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3042_c7_9872_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l3007_c2_2888_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3030_c7_7c9f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3023_c7_34e8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3020_c7_c816] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3020_c7_c816_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3020_c7_c816_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3020_c7_c816_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3020_c7_c816_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3030_c7_7c9f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output := result_stack_value_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3036_c7_8f54] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3036_c7_8f54_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3036_c7_8f54_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3036_c7_8f54] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3036_c7_8f54_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3036_c7_8f54_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3036_c7_8f54_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3036_c7_8f54_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output;

     -- n8_MUX[uxn_opcodes_h_l3013_c7_a3fc] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond <= VAR_n8_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond;
     n8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue;
     n8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output := n8_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output;

     -- l8_MUX[uxn_opcodes_h_l3020_c7_c816] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l3020_c7_c816_cond <= VAR_l8_MUX_uxn_opcodes_h_l3020_c7_c816_cond;
     l8_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue;
     l8_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l3020_c7_c816_return_output := l8_MUX_uxn_opcodes_h_l3020_c7_c816_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3027_c7_7b6f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output;

     -- Submodule level 5
     VAR_l8_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse := VAR_l8_MUX_uxn_opcodes_h_l3020_c7_c816_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse := VAR_n8_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3020_c7_c816_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3036_c7_8f54_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3027_c7_7b6f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3027_c7_7b6f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output := result_stack_value_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3020_c7_c816] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3020_c7_c816_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3020_c7_c816_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3020_c7_c816_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3020_c7_c816_return_output;

     -- n8_MUX[uxn_opcodes_h_l3007_c2_2888] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l3007_c2_2888_cond <= VAR_n8_MUX_uxn_opcodes_h_l3007_c2_2888_cond;
     n8_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue;
     n8_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l3007_c2_2888_return_output := n8_MUX_uxn_opcodes_h_l3007_c2_2888_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3030_c7_7c9f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3016_c7_6d37] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_6d37_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_6d37_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3023_c7_34e8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3030_c7_7c9f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3030_c7_7c9f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3030_c7_7c9f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3030_c7_7c9f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output;

     -- l8_MUX[uxn_opcodes_h_l3016_c7_6d37] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l3016_c7_6d37_cond <= VAR_l8_MUX_uxn_opcodes_h_l3016_c7_6d37_cond;
     l8_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue;
     l8_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output := l8_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output;

     -- Submodule level 6
     VAR_l8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse := VAR_l8_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l3007_c2_2888_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3020_c7_c816_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3030_c7_7c9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3027_c7_7b6f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3027_c7_7b6f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_7b6f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_7b6f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_7b6f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3016_c7_6d37] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3023_c7_34e8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3023_c7_34e8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3023_c7_34e8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output;

     -- l8_MUX[uxn_opcodes_h_l3013_c7_a3fc] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond <= VAR_l8_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond;
     l8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue;
     l8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output := l8_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3023_c7_34e8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3023_c7_34e8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3023_c7_34e8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output := result_stack_value_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3020_c7_c816] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3020_c7_c816_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3020_c7_c816_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3020_c7_c816_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3020_c7_c816_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3013_c7_a3fc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output;

     -- Submodule level 7
     VAR_l8_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse := VAR_l8_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3027_c7_7b6f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3020_c7_c816_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3013_c7_a3fc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3020_c7_c816] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3020_c7_c816_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3020_c7_c816_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3020_c7_c816_return_output := result_stack_value_MUX_uxn_opcodes_h_l3020_c7_c816_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3007_c2_2888] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3007_c2_2888_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3007_c2_2888_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3007_c2_2888_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3007_c2_2888_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3016_c7_6d37] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output;

     -- l8_MUX[uxn_opcodes_h_l3007_c2_2888] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l3007_c2_2888_cond <= VAR_l8_MUX_uxn_opcodes_h_l3007_c2_2888_cond;
     l8_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue;
     l8_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l3007_c2_2888_return_output := l8_MUX_uxn_opcodes_h_l3007_c2_2888_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3020_c7_c816] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_c816_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_c816_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_c816_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_c816_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3023_c7_34e8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_34e8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_34e8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3023_c7_34e8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_34e8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_34e8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_34e8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_34e8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output;

     -- Submodule level 8
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l3007_c2_2888_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_34e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3020_c7_c816_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3020_c7_c816_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3020_c7_c816] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_c816_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_c816_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_c816_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_c816_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3007_c2_2888] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c2_2888_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c2_2888_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c2_2888_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c2_2888_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3020_c7_c816] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_c816_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_c816_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_c816_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_c816_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_c816_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_c816_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3013_c7_a3fc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3016_c7_6d37] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_6d37_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_6d37_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3016_c7_6d37] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3016_c7_6d37_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3016_c7_6d37_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output := result_stack_value_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3020_c7_c816_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3020_c7_c816_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3007_c2_2888] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c2_2888_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c2_2888_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c2_2888_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c2_2888_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3013_c7_a3fc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output := result_stack_value_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3013_c7_a3fc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3016_c7_6d37] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_6d37_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_6d37_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3016_c7_6d37] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_6d37_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_6d37_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_6d37_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_6d37_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3016_c7_6d37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3013_c7_a3fc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3007_c2_2888] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c2_2888_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c2_2888_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c2_2888_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c2_2888_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3007_c2_2888] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3007_c2_2888_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3007_c2_2888_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3007_c2_2888_return_output := result_stack_value_MUX_uxn_opcodes_h_l3007_c2_2888_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3013_c7_a3fc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_a3fc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_a3fc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_a3fc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_a3fc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3007_c2_2888] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3007_c2_2888_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3007_c2_2888_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3007_c2_2888_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3007_c2_2888_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3007_c2_2888] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3007_c2_2888_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3007_c2_2888_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3007_c2_2888_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3007_c2_2888_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3007_c2_2888_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3007_c2_2888_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l3055_l3003_DUPLICATE_35af LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l3055_l3003_DUPLICATE_35af_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3007_c2_2888_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3007_c2_2888_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3007_c2_2888_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3007_c2_2888_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3007_c2_2888_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3007_c2_2888_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3007_c2_2888_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l3055_l3003_DUPLICATE_35af_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l3055_l3003_DUPLICATE_35af_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_l8 <= REG_VAR_l8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     l8 <= REG_COMB_l8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
