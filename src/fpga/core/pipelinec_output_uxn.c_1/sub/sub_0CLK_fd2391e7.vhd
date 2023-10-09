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
entity sub_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub_0CLK_fd2391e7;
architecture arch of sub_0CLK_fd2391e7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2817_c6_0399]
signal BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2817_c1_45a2]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2817_c1_45a2_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2817_c1_45a2_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2817_c1_45a2_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2817_c1_45a2_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2817_c2_5788]
signal t8_MUX_uxn_opcodes_h_l2817_c2_5788_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2817_c2_5788_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2817_c2_5788]
signal n8_MUX_uxn_opcodes_h_l2817_c2_5788_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2817_c2_5788_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2817_c2_5788]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2817_c2_5788_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2817_c2_5788_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2817_c2_5788]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2817_c2_5788_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2817_c2_5788_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2817_c2_5788]
signal result_stack_value_MUX_uxn_opcodes_h_l2817_c2_5788_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2817_c2_5788_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2817_c2_5788]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2817_c2_5788_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2817_c2_5788_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2817_c2_5788]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2817_c2_5788_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2817_c2_5788_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2817_c2_5788]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2817_c2_5788_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2817_c2_5788_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2817_c2_5788]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2817_c2_5788_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2817_c2_5788_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2818_c3_e8c3[uxn_opcodes_h_l2818_c3_e8c3]
signal printf_uxn_opcodes_h_l2818_c3_e8c3_uxn_opcodes_h_l2818_c3_e8c3_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2823_c11_d803]
signal BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2823_c7_3972]
signal t8_MUX_uxn_opcodes_h_l2823_c7_3972_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2823_c7_3972_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2823_c7_3972]
signal n8_MUX_uxn_opcodes_h_l2823_c7_3972_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2823_c7_3972_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2823_c7_3972]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2823_c7_3972_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2823_c7_3972_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2823_c7_3972]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_3972_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_3972_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2823_c7_3972]
signal result_stack_value_MUX_uxn_opcodes_h_l2823_c7_3972_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2823_c7_3972_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2823_c7_3972]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_3972_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_3972_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2823_c7_3972]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_3972_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_3972_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2823_c7_3972]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_3972_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_3972_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2823_c7_3972]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_3972_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_3972_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2826_c11_5153]
signal BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2826_c7_c041]
signal t8_MUX_uxn_opcodes_h_l2826_c7_c041_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2826_c7_c041_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2826_c7_c041]
signal n8_MUX_uxn_opcodes_h_l2826_c7_c041_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2826_c7_c041_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2826_c7_c041]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2826_c7_c041_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2826_c7_c041_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2826_c7_c041]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_c041_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_c041_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2826_c7_c041]
signal result_stack_value_MUX_uxn_opcodes_h_l2826_c7_c041_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2826_c7_c041_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2826_c7_c041]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_c041_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_c041_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2826_c7_c041]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_c041_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_c041_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2826_c7_c041]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_c041_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_c041_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2826_c7_c041]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_c041_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_c041_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2830_c11_98e7]
signal BIN_OP_EQ_uxn_opcodes_h_l2830_c11_98e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2830_c11_98e7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2830_c11_98e7_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2830_c7_0585]
signal n8_MUX_uxn_opcodes_h_l2830_c7_0585_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2830_c7_0585_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2830_c7_0585]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2830_c7_0585_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2830_c7_0585_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2830_c7_0585]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_0585_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_0585_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2830_c7_0585]
signal result_stack_value_MUX_uxn_opcodes_h_l2830_c7_0585_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2830_c7_0585_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2830_c7_0585]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_0585_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_0585_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2830_c7_0585]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_0585_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_0585_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2830_c7_0585]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_0585_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_0585_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2830_c7_0585]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_0585_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_0585_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2833_c11_d870]
signal BIN_OP_EQ_uxn_opcodes_h_l2833_c11_d870_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2833_c11_d870_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2833_c11_d870_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2833_c7_9eeb]
signal n8_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2833_c7_9eeb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2833_c7_9eeb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2833_c7_9eeb]
signal result_stack_value_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2833_c7_9eeb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2833_c7_9eeb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2833_c7_9eeb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2833_c7_9eeb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2837_c32_baa8]
signal BIN_OP_AND_uxn_opcodes_h_l2837_c32_baa8_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2837_c32_baa8_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2837_c32_baa8_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2837_c32_93af]
signal BIN_OP_GT_uxn_opcodes_h_l2837_c32_93af_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2837_c32_93af_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2837_c32_93af_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2837_c32_588d]
signal MUX_uxn_opcodes_h_l2837_c32_588d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2837_c32_588d_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2837_c32_588d_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2837_c32_588d_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2839_c11_41b3]
signal BIN_OP_EQ_uxn_opcodes_h_l2839_c11_41b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2839_c11_41b3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2839_c11_41b3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2839_c7_339b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_339b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_339b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2839_c7_339b]
signal result_stack_value_MUX_uxn_opcodes_h_l2839_c7_339b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2839_c7_339b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2839_c7_339b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_339b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_339b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2839_c7_339b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_339b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_339b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2839_c7_339b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_339b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_339b_return_output : unsigned(7 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2843_c24_f09c]
signal BIN_OP_MINUS_uxn_opcodes_h_l2843_c24_f09c_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2843_c24_f09c_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2843_c24_f09c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2845_c11_7023]
signal BIN_OP_EQ_uxn_opcodes_h_l2845_c11_7023_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2845_c11_7023_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2845_c11_7023_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2845_c7_592d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_592d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_592d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_592d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_592d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2845_c7_592d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_592d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_592d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_592d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_592d_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399
BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399_left,
BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399_right,
BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2817_c1_45a2
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2817_c1_45a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2817_c1_45a2_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2817_c1_45a2_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2817_c1_45a2_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2817_c1_45a2_return_output);

-- t8_MUX_uxn_opcodes_h_l2817_c2_5788
t8_MUX_uxn_opcodes_h_l2817_c2_5788 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2817_c2_5788_cond,
t8_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue,
t8_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse,
t8_MUX_uxn_opcodes_h_l2817_c2_5788_return_output);

-- n8_MUX_uxn_opcodes_h_l2817_c2_5788
n8_MUX_uxn_opcodes_h_l2817_c2_5788 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2817_c2_5788_cond,
n8_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue,
n8_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse,
n8_MUX_uxn_opcodes_h_l2817_c2_5788_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2817_c2_5788
result_is_stack_read_MUX_uxn_opcodes_h_l2817_c2_5788 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2817_c2_5788_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2817_c2_5788_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2817_c2_5788
result_sp_relative_shift_MUX_uxn_opcodes_h_l2817_c2_5788 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2817_c2_5788_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2817_c2_5788_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2817_c2_5788
result_stack_value_MUX_uxn_opcodes_h_l2817_c2_5788 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2817_c2_5788_cond,
result_stack_value_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2817_c2_5788_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2817_c2_5788
result_is_sp_shift_MUX_uxn_opcodes_h_l2817_c2_5788 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2817_c2_5788_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2817_c2_5788_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2817_c2_5788
result_is_stack_write_MUX_uxn_opcodes_h_l2817_c2_5788 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2817_c2_5788_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2817_c2_5788_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2817_c2_5788
result_is_opc_done_MUX_uxn_opcodes_h_l2817_c2_5788 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2817_c2_5788_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2817_c2_5788_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2817_c2_5788
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2817_c2_5788 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2817_c2_5788_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2817_c2_5788_return_output);

-- printf_uxn_opcodes_h_l2818_c3_e8c3_uxn_opcodes_h_l2818_c3_e8c3
printf_uxn_opcodes_h_l2818_c3_e8c3_uxn_opcodes_h_l2818_c3_e8c3 : entity work.printf_uxn_opcodes_h_l2818_c3_e8c3_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2818_c3_e8c3_uxn_opcodes_h_l2818_c3_e8c3_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803
BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803_left,
BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803_right,
BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803_return_output);

-- t8_MUX_uxn_opcodes_h_l2823_c7_3972
t8_MUX_uxn_opcodes_h_l2823_c7_3972 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2823_c7_3972_cond,
t8_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue,
t8_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse,
t8_MUX_uxn_opcodes_h_l2823_c7_3972_return_output);

-- n8_MUX_uxn_opcodes_h_l2823_c7_3972
n8_MUX_uxn_opcodes_h_l2823_c7_3972 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2823_c7_3972_cond,
n8_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue,
n8_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse,
n8_MUX_uxn_opcodes_h_l2823_c7_3972_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2823_c7_3972
result_is_stack_read_MUX_uxn_opcodes_h_l2823_c7_3972 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2823_c7_3972_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2823_c7_3972_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_3972
result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_3972 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_3972_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_3972_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2823_c7_3972
result_stack_value_MUX_uxn_opcodes_h_l2823_c7_3972 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2823_c7_3972_cond,
result_stack_value_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2823_c7_3972_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_3972
result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_3972 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_3972_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_3972_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_3972
result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_3972 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_3972_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_3972_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_3972
result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_3972 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_3972_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_3972_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_3972
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_3972 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_3972_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_3972_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153
BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153_left,
BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153_right,
BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153_return_output);

-- t8_MUX_uxn_opcodes_h_l2826_c7_c041
t8_MUX_uxn_opcodes_h_l2826_c7_c041 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2826_c7_c041_cond,
t8_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue,
t8_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse,
t8_MUX_uxn_opcodes_h_l2826_c7_c041_return_output);

-- n8_MUX_uxn_opcodes_h_l2826_c7_c041
n8_MUX_uxn_opcodes_h_l2826_c7_c041 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2826_c7_c041_cond,
n8_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue,
n8_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse,
n8_MUX_uxn_opcodes_h_l2826_c7_c041_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2826_c7_c041
result_is_stack_read_MUX_uxn_opcodes_h_l2826_c7_c041 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2826_c7_c041_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2826_c7_c041_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_c041
result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_c041 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_c041_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_c041_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2826_c7_c041
result_stack_value_MUX_uxn_opcodes_h_l2826_c7_c041 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2826_c7_c041_cond,
result_stack_value_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2826_c7_c041_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_c041
result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_c041 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_c041_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_c041_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_c041
result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_c041 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_c041_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_c041_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_c041
result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_c041 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_c041_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_c041_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_c041
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_c041 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_c041_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_c041_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2830_c11_98e7
BIN_OP_EQ_uxn_opcodes_h_l2830_c11_98e7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2830_c11_98e7_left,
BIN_OP_EQ_uxn_opcodes_h_l2830_c11_98e7_right,
BIN_OP_EQ_uxn_opcodes_h_l2830_c11_98e7_return_output);

-- n8_MUX_uxn_opcodes_h_l2830_c7_0585
n8_MUX_uxn_opcodes_h_l2830_c7_0585 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2830_c7_0585_cond,
n8_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue,
n8_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse,
n8_MUX_uxn_opcodes_h_l2830_c7_0585_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2830_c7_0585
result_is_stack_read_MUX_uxn_opcodes_h_l2830_c7_0585 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2830_c7_0585_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2830_c7_0585_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_0585
result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_0585 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_0585_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_0585_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2830_c7_0585
result_stack_value_MUX_uxn_opcodes_h_l2830_c7_0585 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2830_c7_0585_cond,
result_stack_value_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2830_c7_0585_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_0585
result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_0585 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_0585_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_0585_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_0585
result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_0585 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_0585_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_0585_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_0585
result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_0585 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_0585_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_0585_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_0585
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_0585 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_0585_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_0585_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2833_c11_d870
BIN_OP_EQ_uxn_opcodes_h_l2833_c11_d870 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2833_c11_d870_left,
BIN_OP_EQ_uxn_opcodes_h_l2833_c11_d870_right,
BIN_OP_EQ_uxn_opcodes_h_l2833_c11_d870_return_output);

-- n8_MUX_uxn_opcodes_h_l2833_c7_9eeb
n8_MUX_uxn_opcodes_h_l2833_c7_9eeb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond,
n8_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue,
n8_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse,
n8_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2833_c7_9eeb
result_is_stack_read_MUX_uxn_opcodes_h_l2833_c7_9eeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2833_c7_9eeb
result_stack_value_MUX_uxn_opcodes_h_l2833_c7_9eeb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond,
result_stack_value_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb
result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_9eeb
result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_9eeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_9eeb
result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_9eeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_9eeb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_9eeb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2837_c32_baa8
BIN_OP_AND_uxn_opcodes_h_l2837_c32_baa8 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2837_c32_baa8_left,
BIN_OP_AND_uxn_opcodes_h_l2837_c32_baa8_right,
BIN_OP_AND_uxn_opcodes_h_l2837_c32_baa8_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2837_c32_93af
BIN_OP_GT_uxn_opcodes_h_l2837_c32_93af : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2837_c32_93af_left,
BIN_OP_GT_uxn_opcodes_h_l2837_c32_93af_right,
BIN_OP_GT_uxn_opcodes_h_l2837_c32_93af_return_output);

-- MUX_uxn_opcodes_h_l2837_c32_588d
MUX_uxn_opcodes_h_l2837_c32_588d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2837_c32_588d_cond,
MUX_uxn_opcodes_h_l2837_c32_588d_iftrue,
MUX_uxn_opcodes_h_l2837_c32_588d_iffalse,
MUX_uxn_opcodes_h_l2837_c32_588d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2839_c11_41b3
BIN_OP_EQ_uxn_opcodes_h_l2839_c11_41b3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2839_c11_41b3_left,
BIN_OP_EQ_uxn_opcodes_h_l2839_c11_41b3_right,
BIN_OP_EQ_uxn_opcodes_h_l2839_c11_41b3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_339b
result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_339b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_339b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_339b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2839_c7_339b
result_stack_value_MUX_uxn_opcodes_h_l2839_c7_339b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2839_c7_339b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2839_c7_339b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_339b
result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_339b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_339b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_339b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_339b
result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_339b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_339b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_339b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_339b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_339b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_339b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_339b_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2843_c24_f09c
BIN_OP_MINUS_uxn_opcodes_h_l2843_c24_f09c : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2843_c24_f09c_left,
BIN_OP_MINUS_uxn_opcodes_h_l2843_c24_f09c_right,
BIN_OP_MINUS_uxn_opcodes_h_l2843_c24_f09c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2845_c11_7023
BIN_OP_EQ_uxn_opcodes_h_l2845_c11_7023 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2845_c11_7023_left,
BIN_OP_EQ_uxn_opcodes_h_l2845_c11_7023_right,
BIN_OP_EQ_uxn_opcodes_h_l2845_c11_7023_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_592d
result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_592d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_592d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_592d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_592d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_592d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_592d
result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_592d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_592d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_592d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_592d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_592d_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2817_c1_45a2_return_output,
 t8_MUX_uxn_opcodes_h_l2817_c2_5788_return_output,
 n8_MUX_uxn_opcodes_h_l2817_c2_5788_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2817_c2_5788_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2817_c2_5788_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2817_c2_5788_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2817_c2_5788_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2817_c2_5788_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2817_c2_5788_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2817_c2_5788_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803_return_output,
 t8_MUX_uxn_opcodes_h_l2823_c7_3972_return_output,
 n8_MUX_uxn_opcodes_h_l2823_c7_3972_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2823_c7_3972_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_3972_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2823_c7_3972_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_3972_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_3972_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_3972_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_3972_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153_return_output,
 t8_MUX_uxn_opcodes_h_l2826_c7_c041_return_output,
 n8_MUX_uxn_opcodes_h_l2826_c7_c041_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2826_c7_c041_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_c041_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2826_c7_c041_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_c041_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_c041_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_c041_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_c041_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2830_c11_98e7_return_output,
 n8_MUX_uxn_opcodes_h_l2830_c7_0585_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2830_c7_0585_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_0585_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2830_c7_0585_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_0585_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_0585_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_0585_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_0585_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2833_c11_d870_return_output,
 n8_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2837_c32_baa8_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2837_c32_93af_return_output,
 MUX_uxn_opcodes_h_l2837_c32_588d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2839_c11_41b3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_339b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2839_c7_339b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_339b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_339b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_339b_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2843_c24_f09c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2845_c11_7023_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_592d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_592d_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2817_c1_45a2_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2817_c1_45a2_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2817_c1_45a2_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2817_c1_45a2_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2823_c7_3972_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2817_c2_5788_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2817_c2_5788_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2823_c7_3972_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2817_c2_5788_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2817_c2_5788_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2823_c7_3972_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2817_c2_5788_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2817_c2_5788_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_3972_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2817_c2_5788_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2817_c2_5788_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2823_c7_3972_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2817_c2_5788_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2817_c2_5788_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_3972_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2817_c2_5788_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2817_c2_5788_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_3972_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2817_c2_5788_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2817_c2_5788_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_3972_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2817_c2_5788_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2817_c2_5788_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2820_c3_2154 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_3972_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2817_c2_5788_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2817_c2_5788_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2818_c3_e8c3_uxn_opcodes_h_l2818_c3_e8c3_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2826_c7_c041_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2823_c7_3972_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2826_c7_c041_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2823_c7_3972_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2826_c7_c041_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2823_c7_3972_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_c041_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_3972_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2826_c7_c041_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2823_c7_3972_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_c041_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_3972_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_c041_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_3972_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_c041_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_3972_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2824_c3_9985 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_c041_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_3972_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2826_c7_c041_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2830_c7_0585_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2826_c7_c041_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2830_c7_0585_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2826_c7_c041_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_0585_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_c041_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2830_c7_0585_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2826_c7_c041_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_0585_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_c041_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_0585_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_c041_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_0585_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_c041_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2828_c3_e972 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_0585_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_c041_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_98e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_98e7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_98e7_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2830_c7_0585_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2830_c7_0585_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_0585_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2830_c7_0585_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_0585_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_0585_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_0585_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2831_c3_11d6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_0585_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_d870_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_d870_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_d870_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2839_c7_339b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_339b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_339b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_339b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_339b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2837_c32_588d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2837_c32_588d_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2837_c32_588d_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2837_c32_baa8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2837_c32_baa8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2837_c32_baa8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2837_c32_93af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2837_c32_93af_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2837_c32_93af_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2837_c32_588d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_41b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_41b3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_41b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_339b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2839_c7_339b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_592d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_339b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_592d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_339b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2842_c3_0e2a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_339b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2843_c24_f09c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2843_c24_f09c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2843_c24_f09c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_7023_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_7023_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_7023_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_592d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_592d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_592d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_592d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_592d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_592d_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2833_l2830_l2826_l2823_l2817_DUPLICATE_f7ee_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2839_l2833_l2830_l2826_l2823_l2817_DUPLICATE_c4b4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2839_l2830_l2826_l2823_l2817_DUPLICATE_45f6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2833_l2830_l2826_l2823_l2817_l2845_DUPLICATE_589a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2826_l2830_l2823_l2833_DUPLICATE_8c3e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2839_l2833_l2830_l2826_l2823_l2845_DUPLICATE_3fec_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2839_l2833_DUPLICATE_388a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2850_l2813_DUPLICATE_bcbe_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2817_c1_45a2_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2824_c3_9985 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2824_c3_9985;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_41b3_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2831_c3_11d6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2831_c3_11d6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2842_c3_0e2a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2842_c3_0e2a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_d870_right := to_unsigned(4, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2837_c32_93af_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2837_c32_588d_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2837_c32_588d_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_7023_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_98e7_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2820_c3_2154 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2820_c3_2154;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2837_c32_baa8_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_592d_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_592d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2828_c3_e972 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2828_c3_e972;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2817_c1_45a2_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2837_c32_baa8_left := VAR_ins;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2843_c24_f09c_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_98e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_d870_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_41b3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_7023_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2843_c24_f09c_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2845_c11_7023] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2845_c11_7023_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_7023_left;
     BIN_OP_EQ_uxn_opcodes_h_l2845_c11_7023_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_7023_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_7023_return_output := BIN_OP_EQ_uxn_opcodes_h_l2845_c11_7023_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2817_c6_0399] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399_left;
     BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399_return_output := BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2833_l2830_l2826_l2823_l2817_l2845_DUPLICATE_589a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2833_l2830_l2826_l2823_l2817_l2845_DUPLICATE_589a_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2823_c11_d803] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803_left;
     BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803_return_output := BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2826_c11_5153] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153_left;
     BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153_return_output := BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2839_l2833_DUPLICATE_388a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2839_l2833_DUPLICATE_388a_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2839_l2833_l2830_l2826_l2823_l2845_DUPLICATE_3fec LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2839_l2833_l2830_l2826_l2823_l2845_DUPLICATE_3fec_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2839_l2833_l2830_l2826_l2823_l2817_DUPLICATE_c4b4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2839_l2833_l2830_l2826_l2823_l2817_DUPLICATE_c4b4_return_output := result.stack_value;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2843_c24_f09c] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2843_c24_f09c_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2843_c24_f09c_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2843_c24_f09c_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2843_c24_f09c_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2843_c24_f09c_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2843_c24_f09c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2839_c11_41b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2839_c11_41b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_41b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2839_c11_41b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_41b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_41b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2839_c11_41b3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2833_c11_d870] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2833_c11_d870_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_d870_left;
     BIN_OP_EQ_uxn_opcodes_h_l2833_c11_d870_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_d870_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_d870_return_output := BIN_OP_EQ_uxn_opcodes_h_l2833_c11_d870_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2837_c32_baa8] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2837_c32_baa8_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2837_c32_baa8_left;
     BIN_OP_AND_uxn_opcodes_h_l2837_c32_baa8_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2837_c32_baa8_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2837_c32_baa8_return_output := BIN_OP_AND_uxn_opcodes_h_l2837_c32_baa8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2839_l2830_l2826_l2823_l2817_DUPLICATE_45f6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2839_l2830_l2826_l2823_l2817_DUPLICATE_45f6_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2826_l2830_l2823_l2833_DUPLICATE_8c3e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2826_l2830_l2823_l2833_DUPLICATE_8c3e_return_output := result.is_stack_read;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2833_l2830_l2826_l2823_l2817_DUPLICATE_f7ee LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2833_l2830_l2826_l2823_l2817_DUPLICATE_f7ee_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2830_c11_98e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2830_c11_98e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_98e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2830_c11_98e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_98e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_98e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2830_c11_98e7_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2837_c32_93af_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2837_c32_baa8_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2817_c1_45a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2817_c2_5788_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2817_c2_5788_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2817_c2_5788_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2817_c2_5788_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2817_c2_5788_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2817_c2_5788_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2817_c2_5788_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2817_c2_5788_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2817_c2_5788_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2817_c6_0399_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2823_c7_3972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_3972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_3972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2823_c7_3972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_3972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_3972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_3972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2823_c7_3972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2823_c7_3972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2823_c11_d803_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2826_c7_c041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_c041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_c041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2826_c7_c041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_c041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_c041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_c041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2826_c7_c041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2826_c7_c041_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2826_c11_5153_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2830_c7_0585_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_98e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_0585_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_98e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_0585_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_98e7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2830_c7_0585_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_98e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_0585_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_98e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_0585_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_98e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_0585_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_98e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2830_c7_0585_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2830_c11_98e7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_d870_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_d870_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_d870_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_d870_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_d870_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_d870_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_d870_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_d870_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_339b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_41b3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_339b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_41b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_339b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_41b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_339b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_41b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2839_c7_339b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2839_c11_41b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_592d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_7023_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_592d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2845_c11_7023_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2843_c24_f09c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2833_l2830_l2826_l2823_l2817_DUPLICATE_f7ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2833_l2830_l2826_l2823_l2817_DUPLICATE_f7ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2833_l2830_l2826_l2823_l2817_DUPLICATE_f7ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2833_l2830_l2826_l2823_l2817_DUPLICATE_f7ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2833_l2830_l2826_l2823_l2817_DUPLICATE_f7ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2839_l2833_l2830_l2826_l2823_l2845_DUPLICATE_3fec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2839_l2833_l2830_l2826_l2823_l2845_DUPLICATE_3fec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2839_l2833_l2830_l2826_l2823_l2845_DUPLICATE_3fec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2839_l2833_l2830_l2826_l2823_l2845_DUPLICATE_3fec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2839_l2833_l2830_l2826_l2823_l2845_DUPLICATE_3fec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_592d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2839_l2833_l2830_l2826_l2823_l2845_DUPLICATE_3fec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2839_l2830_l2826_l2823_l2817_DUPLICATE_45f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2839_l2830_l2826_l2823_l2817_DUPLICATE_45f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2839_l2830_l2826_l2823_l2817_DUPLICATE_45f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2839_l2830_l2826_l2823_l2817_DUPLICATE_45f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2839_l2830_l2826_l2823_l2817_DUPLICATE_45f6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2826_l2830_l2823_l2833_DUPLICATE_8c3e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2826_l2830_l2823_l2833_DUPLICATE_8c3e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2826_l2830_l2823_l2833_DUPLICATE_8c3e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2826_l2830_l2823_l2833_DUPLICATE_8c3e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2833_l2830_l2826_l2823_l2817_l2845_DUPLICATE_589a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2833_l2830_l2826_l2823_l2817_l2845_DUPLICATE_589a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2833_l2830_l2826_l2823_l2817_l2845_DUPLICATE_589a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2833_l2830_l2826_l2823_l2817_l2845_DUPLICATE_589a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2833_l2830_l2826_l2823_l2817_l2845_DUPLICATE_589a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_592d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2833_l2830_l2826_l2823_l2817_l2845_DUPLICATE_589a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2839_l2833_DUPLICATE_388a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2839_l2833_DUPLICATE_388a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2839_l2833_l2830_l2826_l2823_l2817_DUPLICATE_c4b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2839_l2833_l2830_l2826_l2823_l2817_DUPLICATE_c4b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2839_l2833_l2830_l2826_l2823_l2817_DUPLICATE_c4b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2839_l2833_l2830_l2826_l2823_l2817_DUPLICATE_c4b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2839_l2833_l2830_l2826_l2823_l2817_DUPLICATE_c4b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2839_l2833_l2830_l2826_l2823_l2817_DUPLICATE_c4b4_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2839_c7_339b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_339b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_339b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_339b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_339b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2845_c7_592d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_592d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_592d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_592d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_592d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_592d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_592d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_592d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_592d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2839_c7_339b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2839_c7_339b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2839_c7_339b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2839_c7_339b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2839_c7_339b_return_output;

     -- t8_MUX[uxn_opcodes_h_l2826_c7_c041] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2826_c7_c041_cond <= VAR_t8_MUX_uxn_opcodes_h_l2826_c7_c041_cond;
     t8_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue;
     t8_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2826_c7_c041_return_output := t8_MUX_uxn_opcodes_h_l2826_c7_c041_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2845_c7_592d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_592d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_592d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_592d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_592d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_592d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_592d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_592d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_592d_return_output;

     -- n8_MUX[uxn_opcodes_h_l2833_c7_9eeb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond <= VAR_n8_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond;
     n8_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue;
     n8_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output := n8_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2817_c1_45a2] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2817_c1_45a2_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2817_c1_45a2_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2817_c1_45a2_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2817_c1_45a2_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2817_c1_45a2_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2817_c1_45a2_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2817_c1_45a2_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2817_c1_45a2_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2837_c32_93af] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2837_c32_93af_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2837_c32_93af_left;
     BIN_OP_GT_uxn_opcodes_h_l2837_c32_93af_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2837_c32_93af_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2837_c32_93af_return_output := BIN_OP_GT_uxn_opcodes_h_l2837_c32_93af_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2839_c7_339b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_339b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_339b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_339b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_339b_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2833_c7_9eeb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2837_c32_588d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2837_c32_93af_return_output;
     VAR_printf_uxn_opcodes_h_l2818_c3_e8c3_uxn_opcodes_h_l2818_c3_e8c3_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2817_c1_45a2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2845_c7_592d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2839_c7_339b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2845_c7_592d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2839_c7_339b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2839_c7_339b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2826_c7_c041_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2839_c7_339b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_339b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_339b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_339b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_339b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2833_c7_9eeb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2833_c7_9eeb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output;

     -- t8_MUX[uxn_opcodes_h_l2823_c7_3972] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2823_c7_3972_cond <= VAR_t8_MUX_uxn_opcodes_h_l2823_c7_3972_cond;
     t8_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue;
     t8_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2823_c7_3972_return_output := t8_MUX_uxn_opcodes_h_l2823_c7_3972_return_output;

     -- printf_uxn_opcodes_h_l2818_c3_e8c3[uxn_opcodes_h_l2818_c3_e8c3] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2818_c3_e8c3_uxn_opcodes_h_l2818_c3_e8c3_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2818_c3_e8c3_uxn_opcodes_h_l2818_c3_e8c3_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l2837_c32_588d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2837_c32_588d_cond <= VAR_MUX_uxn_opcodes_h_l2837_c32_588d_cond;
     MUX_uxn_opcodes_h_l2837_c32_588d_iftrue <= VAR_MUX_uxn_opcodes_h_l2837_c32_588d_iftrue;
     MUX_uxn_opcodes_h_l2837_c32_588d_iffalse <= VAR_MUX_uxn_opcodes_h_l2837_c32_588d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2837_c32_588d_return_output := MUX_uxn_opcodes_h_l2837_c32_588d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2833_c7_9eeb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output := result_stack_value_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output;

     -- n8_MUX[uxn_opcodes_h_l2830_c7_0585] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2830_c7_0585_cond <= VAR_n8_MUX_uxn_opcodes_h_l2830_c7_0585_cond;
     n8_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue;
     n8_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2830_c7_0585_return_output := n8_MUX_uxn_opcodes_h_l2830_c7_0585_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2830_c7_0585] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2830_c7_0585_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2830_c7_0585_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2830_c7_0585_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2830_c7_0585_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2839_c7_339b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_339b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_339b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_339b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_339b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_339b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_339b_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue := VAR_MUX_uxn_opcodes_h_l2837_c32_588d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2830_c7_0585_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2839_c7_339b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2830_c7_0585_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2839_c7_339b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2823_c7_3972_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l2826_c7_c041] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2826_c7_c041_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2826_c7_c041_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2826_c7_c041_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2826_c7_c041_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2830_c7_0585] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_0585_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_0585_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_0585_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_0585_return_output;

     -- t8_MUX[uxn_opcodes_h_l2817_c2_5788] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2817_c2_5788_cond <= VAR_t8_MUX_uxn_opcodes_h_l2817_c2_5788_cond;
     t8_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue;
     t8_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2817_c2_5788_return_output := t8_MUX_uxn_opcodes_h_l2817_c2_5788_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2833_c7_9eeb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2833_c7_9eeb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2830_c7_0585] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2830_c7_0585_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2830_c7_0585_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2830_c7_0585_return_output := result_stack_value_MUX_uxn_opcodes_h_l2830_c7_0585_return_output;

     -- n8_MUX[uxn_opcodes_h_l2826_c7_c041] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2826_c7_c041_cond <= VAR_n8_MUX_uxn_opcodes_h_l2826_c7_c041_cond;
     n8_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue;
     n8_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2826_c7_c041_return_output := n8_MUX_uxn_opcodes_h_l2826_c7_c041_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2830_c7_0585] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_0585_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_0585_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_0585_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_0585_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2833_c7_9eeb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2826_c7_c041_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2830_c7_0585_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2826_c7_c041_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_9eeb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2830_c7_0585_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2830_c7_0585_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2817_c2_5788_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2826_c7_c041] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2826_c7_c041_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2826_c7_c041_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2826_c7_c041_return_output := result_stack_value_MUX_uxn_opcodes_h_l2826_c7_c041_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2826_c7_c041] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_c041_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_c041_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_c041_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_c041_return_output;

     -- n8_MUX[uxn_opcodes_h_l2823_c7_3972] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2823_c7_3972_cond <= VAR_n8_MUX_uxn_opcodes_h_l2823_c7_3972_cond;
     n8_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue;
     n8_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2823_c7_3972_return_output := n8_MUX_uxn_opcodes_h_l2823_c7_3972_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2830_c7_0585] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_0585_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_0585_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_0585_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_0585_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2830_c7_0585] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_0585_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_0585_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_0585_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_0585_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2823_c7_3972] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2823_c7_3972_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2823_c7_3972_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2823_c7_3972_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2823_c7_3972_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2830_c7_0585] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_0585_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_0585_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_0585_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_0585_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_0585_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_0585_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2826_c7_c041] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_c041_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_c041_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_c041_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_c041_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2823_c7_3972_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2830_c7_0585_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2826_c7_c041_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2823_c7_3972_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2830_c7_0585_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2830_c7_0585_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2826_c7_c041_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2826_c7_c041_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2826_c7_c041] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_c041_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_c041_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_c041_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_c041_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2823_c7_3972] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_3972_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_3972_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_3972_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_3972_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2823_c7_3972] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2823_c7_3972_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2823_c7_3972_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2823_c7_3972_return_output := result_stack_value_MUX_uxn_opcodes_h_l2823_c7_3972_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2826_c7_c041] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_c041_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_c041_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_c041_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_c041_return_output;

     -- n8_MUX[uxn_opcodes_h_l2817_c2_5788] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2817_c2_5788_cond <= VAR_n8_MUX_uxn_opcodes_h_l2817_c2_5788_cond;
     n8_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue;
     n8_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2817_c2_5788_return_output := n8_MUX_uxn_opcodes_h_l2817_c2_5788_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2817_c2_5788] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2817_c2_5788_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2817_c2_5788_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2817_c2_5788_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2817_c2_5788_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2826_c7_c041] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_c041_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_c041_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_c041_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_c041_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_c041_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_c041_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2823_c7_3972] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_3972_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_3972_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_3972_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_3972_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2817_c2_5788_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2826_c7_c041_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2823_c7_3972_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2826_c7_c041_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2826_c7_c041_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2823_c7_3972_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2823_c7_3972_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2823_c7_3972] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_3972_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_3972_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_3972_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_3972_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2817_c2_5788] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2817_c2_5788_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2817_c2_5788_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2817_c2_5788_return_output := result_stack_value_MUX_uxn_opcodes_h_l2817_c2_5788_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2823_c7_3972] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_3972_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_3972_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_3972_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_3972_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2823_c7_3972] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_3972_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_3972_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_3972_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_3972_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_3972_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_3972_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2817_c2_5788] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2817_c2_5788_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2817_c2_5788_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2817_c2_5788_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2817_c2_5788_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2817_c2_5788] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2817_c2_5788_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2817_c2_5788_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2817_c2_5788_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2817_c2_5788_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2823_c7_3972_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2823_c7_3972_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2823_c7_3972_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2817_c2_5788] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2817_c2_5788_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2817_c2_5788_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2817_c2_5788_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2817_c2_5788_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2817_c2_5788] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2817_c2_5788_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2817_c2_5788_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2817_c2_5788_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2817_c2_5788_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2817_c2_5788] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2817_c2_5788_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2817_c2_5788_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2817_c2_5788_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2817_c2_5788_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2817_c2_5788_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2817_c2_5788_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2850_l2813_DUPLICATE_bcbe LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2850_l2813_DUPLICATE_bcbe_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2817_c2_5788_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2817_c2_5788_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2817_c2_5788_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2817_c2_5788_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2817_c2_5788_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2817_c2_5788_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2817_c2_5788_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2850_l2813_DUPLICATE_bcbe_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l2850_l2813_DUPLICATE_bcbe_return_output;
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
