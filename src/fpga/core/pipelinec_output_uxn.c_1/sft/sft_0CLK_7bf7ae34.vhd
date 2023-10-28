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
-- Submodules: 60
entity sft_0CLK_7bf7ae34 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft_0CLK_7bf7ae34;
architecture arch of sft_0CLK_7bf7ae34 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2354_c6_c864]
signal BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2354_c1_1c4c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2354_c1_1c4c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2354_c1_1c4c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2354_c1_1c4c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2354_c1_1c4c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2354_c2_40ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c2_40ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2354_c2_40ed]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2354_c2_40ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2354_c2_40ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2354_c2_40ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2354_c2_40ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2354_c2_40ed]
signal result_u8_value_MUX_uxn_opcodes_h_l2354_c2_40ed_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2354_c2_40ed]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output : signed(3 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2354_c2_40ed]
signal tmp8_MUX_uxn_opcodes_h_l2354_c2_40ed_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2354_c2_40ed]
signal t8_MUX_uxn_opcodes_h_l2354_c2_40ed_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2354_c2_40ed]
signal n8_MUX_uxn_opcodes_h_l2354_c2_40ed_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2355_c3_f713[uxn_opcodes_h_l2355_c3_f713]
signal printf_uxn_opcodes_h_l2355_c3_f713_uxn_opcodes_h_l2355_c3_f713_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2359_c11_b65f]
signal BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2359_c7_eafb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c7_eafb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2359_c7_eafb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2359_c7_eafb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2359_c7_eafb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2359_c7_eafb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2359_c7_eafb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2359_c7_eafb]
signal result_u8_value_MUX_uxn_opcodes_h_l2359_c7_eafb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2359_c7_eafb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output : signed(3 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2359_c7_eafb]
signal tmp8_MUX_uxn_opcodes_h_l2359_c7_eafb_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2359_c7_eafb]
signal t8_MUX_uxn_opcodes_h_l2359_c7_eafb_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2359_c7_eafb]
signal n8_MUX_uxn_opcodes_h_l2359_c7_eafb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2362_c11_a009]
signal BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2362_c7_7f41]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c7_7f41_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2362_c7_7f41]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2362_c7_7f41]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2362_c7_7f41_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2362_c7_7f41]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2362_c7_7f41_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2362_c7_7f41]
signal result_u8_value_MUX_uxn_opcodes_h_l2362_c7_7f41_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2362_c7_7f41]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output : signed(3 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2362_c7_7f41]
signal tmp8_MUX_uxn_opcodes_h_l2362_c7_7f41_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2362_c7_7f41]
signal t8_MUX_uxn_opcodes_h_l2362_c7_7f41_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2362_c7_7f41]
signal n8_MUX_uxn_opcodes_h_l2362_c7_7f41_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2366_c11_ec9e]
signal BIN_OP_EQ_uxn_opcodes_h_l2366_c11_ec9e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2366_c11_ec9e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2366_c11_ec9e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2366_c7_cd94]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2366_c7_cd94_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2366_c7_cd94]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2366_c7_cd94]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2366_c7_cd94_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2366_c7_cd94]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2366_c7_cd94_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2366_c7_cd94]
signal result_u8_value_MUX_uxn_opcodes_h_l2366_c7_cd94_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2366_c7_cd94]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output : signed(3 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2366_c7_cd94]
signal tmp8_MUX_uxn_opcodes_h_l2366_c7_cd94_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2366_c7_cd94]
signal n8_MUX_uxn_opcodes_h_l2366_c7_cd94_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2369_c11_6994]
signal BIN_OP_EQ_uxn_opcodes_h_l2369_c11_6994_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2369_c11_6994_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2369_c11_6994_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2369_c7_0ef1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2369_c7_0ef1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2369_c7_0ef1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2369_c7_0ef1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2369_c7_0ef1]
signal result_u8_value_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2369_c7_0ef1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output : signed(3 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2369_c7_0ef1]
signal tmp8_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2369_c7_0ef1]
signal n8_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2372_c30_e5dc]
signal sp_relative_shift_uxn_opcodes_h_l2372_c30_e5dc_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2372_c30_e5dc_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2372_c30_e5dc_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2372_c30_e5dc_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2373_c18_39f7]
signal BIN_OP_AND_uxn_opcodes_h_l2373_c18_39f7_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2373_c18_39f7_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2373_c18_39f7_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2373_c11_e7b8]
signal BIN_OP_SR_uxn_opcodes_h_l2373_c11_e7b8_left : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2373_c11_e7b8_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2373_c11_e7b8_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2373_c34_f438]
signal CONST_SR_4_uxn_opcodes_h_l2373_c34_f438_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2373_c34_f438_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2373_c11_41d3]
signal BIN_OP_SL_uxn_opcodes_h_l2373_c11_41d3_left : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2373_c11_41d3_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2373_c11_41d3_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2378_c11_5172]
signal BIN_OP_EQ_uxn_opcodes_h_l2378_c11_5172_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2378_c11_5172_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2378_c11_5172_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2378_c7_98cf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_98cf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_98cf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_98cf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_98cf_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2378_c7_98cf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_98cf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_98cf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_98cf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_98cf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2378_c7_98cf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_98cf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_98cf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_98cf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_98cf_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_641b( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.u8_value := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864
BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864_left,
BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864_right,
BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2354_c1_1c4c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2354_c1_1c4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2354_c1_1c4c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2354_c1_1c4c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2354_c1_1c4c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2354_c1_1c4c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c2_40ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c2_40ed : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c2_40ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c2_40ed
result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c2_40ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2354_c2_40ed
result_is_opc_done_MUX_uxn_opcodes_h_l2354_c2_40ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2354_c2_40ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2354_c2_40ed
result_is_stack_write_MUX_uxn_opcodes_h_l2354_c2_40ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2354_c2_40ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2354_c2_40ed
result_u8_value_MUX_uxn_opcodes_h_l2354_c2_40ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2354_c2_40ed_cond,
result_u8_value_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c2_40ed
result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c2_40ed : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2354_c2_40ed
tmp8_MUX_uxn_opcodes_h_l2354_c2_40ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2354_c2_40ed_cond,
tmp8_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue,
tmp8_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse,
tmp8_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output);

-- t8_MUX_uxn_opcodes_h_l2354_c2_40ed
t8_MUX_uxn_opcodes_h_l2354_c2_40ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2354_c2_40ed_cond,
t8_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue,
t8_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse,
t8_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output);

-- n8_MUX_uxn_opcodes_h_l2354_c2_40ed
n8_MUX_uxn_opcodes_h_l2354_c2_40ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2354_c2_40ed_cond,
n8_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue,
n8_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse,
n8_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output);

-- printf_uxn_opcodes_h_l2355_c3_f713_uxn_opcodes_h_l2355_c3_f713
printf_uxn_opcodes_h_l2355_c3_f713_uxn_opcodes_h_l2355_c3_f713 : entity work.printf_uxn_opcodes_h_l2355_c3_f713_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2355_c3_f713_uxn_opcodes_h_l2355_c3_f713_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f
BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f_left,
BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f_right,
BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c7_eafb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c7_eafb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c7_eafb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c7_eafb
result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c7_eafb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2359_c7_eafb
result_is_opc_done_MUX_uxn_opcodes_h_l2359_c7_eafb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2359_c7_eafb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2359_c7_eafb
result_is_stack_write_MUX_uxn_opcodes_h_l2359_c7_eafb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2359_c7_eafb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2359_c7_eafb
result_u8_value_MUX_uxn_opcodes_h_l2359_c7_eafb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2359_c7_eafb_cond,
result_u8_value_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c7_eafb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c7_eafb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2359_c7_eafb
tmp8_MUX_uxn_opcodes_h_l2359_c7_eafb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2359_c7_eafb_cond,
tmp8_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue,
tmp8_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse,
tmp8_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output);

-- t8_MUX_uxn_opcodes_h_l2359_c7_eafb
t8_MUX_uxn_opcodes_h_l2359_c7_eafb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2359_c7_eafb_cond,
t8_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue,
t8_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse,
t8_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output);

-- n8_MUX_uxn_opcodes_h_l2359_c7_eafb
n8_MUX_uxn_opcodes_h_l2359_c7_eafb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2359_c7_eafb_cond,
n8_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue,
n8_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse,
n8_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009
BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009_left,
BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009_right,
BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c7_7f41
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c7_7f41 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c7_7f41_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2362_c7_7f41
result_is_sp_shift_MUX_uxn_opcodes_h_l2362_c7_7f41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2362_c7_7f41
result_is_opc_done_MUX_uxn_opcodes_h_l2362_c7_7f41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2362_c7_7f41_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2362_c7_7f41
result_is_stack_write_MUX_uxn_opcodes_h_l2362_c7_7f41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2362_c7_7f41_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2362_c7_7f41
result_u8_value_MUX_uxn_opcodes_h_l2362_c7_7f41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2362_c7_7f41_cond,
result_u8_value_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c7_7f41
result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c7_7f41 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2362_c7_7f41
tmp8_MUX_uxn_opcodes_h_l2362_c7_7f41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2362_c7_7f41_cond,
tmp8_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue,
tmp8_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse,
tmp8_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output);

-- t8_MUX_uxn_opcodes_h_l2362_c7_7f41
t8_MUX_uxn_opcodes_h_l2362_c7_7f41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2362_c7_7f41_cond,
t8_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue,
t8_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse,
t8_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output);

-- n8_MUX_uxn_opcodes_h_l2362_c7_7f41
n8_MUX_uxn_opcodes_h_l2362_c7_7f41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2362_c7_7f41_cond,
n8_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue,
n8_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse,
n8_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2366_c11_ec9e
BIN_OP_EQ_uxn_opcodes_h_l2366_c11_ec9e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2366_c11_ec9e_left,
BIN_OP_EQ_uxn_opcodes_h_l2366_c11_ec9e_right,
BIN_OP_EQ_uxn_opcodes_h_l2366_c11_ec9e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2366_c7_cd94
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2366_c7_cd94 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2366_c7_cd94_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2366_c7_cd94
result_is_sp_shift_MUX_uxn_opcodes_h_l2366_c7_cd94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2366_c7_cd94
result_is_opc_done_MUX_uxn_opcodes_h_l2366_c7_cd94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2366_c7_cd94_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2366_c7_cd94
result_is_stack_write_MUX_uxn_opcodes_h_l2366_c7_cd94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2366_c7_cd94_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2366_c7_cd94
result_u8_value_MUX_uxn_opcodes_h_l2366_c7_cd94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2366_c7_cd94_cond,
result_u8_value_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2366_c7_cd94
result_sp_relative_shift_MUX_uxn_opcodes_h_l2366_c7_cd94 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2366_c7_cd94
tmp8_MUX_uxn_opcodes_h_l2366_c7_cd94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2366_c7_cd94_cond,
tmp8_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue,
tmp8_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse,
tmp8_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output);

-- n8_MUX_uxn_opcodes_h_l2366_c7_cd94
n8_MUX_uxn_opcodes_h_l2366_c7_cd94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2366_c7_cd94_cond,
n8_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue,
n8_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse,
n8_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2369_c11_6994
BIN_OP_EQ_uxn_opcodes_h_l2369_c11_6994 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2369_c11_6994_left,
BIN_OP_EQ_uxn_opcodes_h_l2369_c11_6994_right,
BIN_OP_EQ_uxn_opcodes_h_l2369_c11_6994_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_0ef1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_0ef1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1
result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_0ef1
result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_0ef1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_0ef1
result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_0ef1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2369_c7_0ef1
result_u8_value_MUX_uxn_opcodes_h_l2369_c7_0ef1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2369_c7_0ef1
tmp8_MUX_uxn_opcodes_h_l2369_c7_0ef1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond,
tmp8_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue,
tmp8_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse,
tmp8_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output);

-- n8_MUX_uxn_opcodes_h_l2369_c7_0ef1
n8_MUX_uxn_opcodes_h_l2369_c7_0ef1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond,
n8_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue,
n8_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse,
n8_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2372_c30_e5dc
sp_relative_shift_uxn_opcodes_h_l2372_c30_e5dc : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2372_c30_e5dc_ins,
sp_relative_shift_uxn_opcodes_h_l2372_c30_e5dc_x,
sp_relative_shift_uxn_opcodes_h_l2372_c30_e5dc_y,
sp_relative_shift_uxn_opcodes_h_l2372_c30_e5dc_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2373_c18_39f7
BIN_OP_AND_uxn_opcodes_h_l2373_c18_39f7 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2373_c18_39f7_left,
BIN_OP_AND_uxn_opcodes_h_l2373_c18_39f7_right,
BIN_OP_AND_uxn_opcodes_h_l2373_c18_39f7_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2373_c11_e7b8
BIN_OP_SR_uxn_opcodes_h_l2373_c11_e7b8 : entity work.BIN_OP_SR_uint8_t_uint8_t_0CLK_25d197a7 port map (
BIN_OP_SR_uxn_opcodes_h_l2373_c11_e7b8_left,
BIN_OP_SR_uxn_opcodes_h_l2373_c11_e7b8_right,
BIN_OP_SR_uxn_opcodes_h_l2373_c11_e7b8_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2373_c34_f438
CONST_SR_4_uxn_opcodes_h_l2373_c34_f438 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2373_c34_f438_x,
CONST_SR_4_uxn_opcodes_h_l2373_c34_f438_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2373_c11_41d3
BIN_OP_SL_uxn_opcodes_h_l2373_c11_41d3 : entity work.BIN_OP_SL_uint8_t_uint8_t_0CLK_10d8c973 port map (
BIN_OP_SL_uxn_opcodes_h_l2373_c11_41d3_left,
BIN_OP_SL_uxn_opcodes_h_l2373_c11_41d3_right,
BIN_OP_SL_uxn_opcodes_h_l2373_c11_41d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2378_c11_5172
BIN_OP_EQ_uxn_opcodes_h_l2378_c11_5172 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2378_c11_5172_left,
BIN_OP_EQ_uxn_opcodes_h_l2378_c11_5172_right,
BIN_OP_EQ_uxn_opcodes_h_l2378_c11_5172_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_98cf
result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_98cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_98cf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_98cf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_98cf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_98cf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_98cf
result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_98cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_98cf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_98cf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_98cf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_98cf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_98cf
result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_98cf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_98cf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_98cf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_98cf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_98cf_return_output);



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
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2354_c1_1c4c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output,
 tmp8_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output,
 t8_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output,
 n8_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output,
 tmp8_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output,
 t8_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output,
 n8_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output,
 tmp8_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output,
 t8_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output,
 n8_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2366_c11_ec9e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output,
 tmp8_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output,
 n8_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2369_c11_6994_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output,
 tmp8_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output,
 n8_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output,
 sp_relative_shift_uxn_opcodes_h_l2372_c30_e5dc_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2373_c18_39f7_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2373_c11_e7b8_return_output,
 CONST_SR_4_uxn_opcodes_h_l2373_c34_f438_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2373_c11_41d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2378_c11_5172_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_98cf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_98cf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_98cf_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2354_c1_1c4c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2354_c1_1c4c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2354_c1_1c4c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2354_c1_1c4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2356_c3_44cc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c2_40ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c2_40ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c2_40ed_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c2_40ed_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2354_c2_40ed_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2354_c2_40ed_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2354_c2_40ed_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2355_c3_f713_uxn_opcodes_h_l2355_c3_f713_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2360_c3_f47a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c7_eafb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2359_c7_eafb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2359_c7_eafb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2359_c7_eafb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2359_c7_eafb_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2359_c7_eafb_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2359_c7_eafb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2364_c3_9406 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c7_7f41_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c7_7f41_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c7_7f41_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c7_7f41_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2362_c7_7f41_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2362_c7_7f41_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2362_c7_7f41_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2366_c11_ec9e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2366_c11_ec9e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2366_c11_ec9e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2367_c3_77b6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2366_c7_cd94_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2366_c7_cd94_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2366_c7_cd94_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2366_c7_cd94_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2366_c7_cd94_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2366_c7_cd94_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_6994_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_6994_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_6994_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2375_c3_ccf7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2369_c7_0ef1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_98cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_98cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_98cf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2372_c30_e5dc_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2372_c30_e5dc_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2372_c30_e5dc_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2372_c30_e5dc_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2373_c11_e7b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2373_c18_39f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2373_c18_39f7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2373_c18_39f7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2373_c11_e7b8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2373_c11_e7b8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2373_c11_41d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2373_c11_41d3_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2373_c34_f438_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2373_c34_f438_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2373_c11_41d3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_5172_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_5172_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_5172_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_98cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_98cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_98cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_98cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_98cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_98cf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_98cf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_98cf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_98cf_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2378_DUPLICATE_73e2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2378_DUPLICATE_d161_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2369_DUPLICATE_2c89_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2369_DUPLICATE_0e53_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2378_l2369_DUPLICATE_ae18_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2384_l2350_DUPLICATE_6d77_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l2372_c30_e5dc_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_98cf_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2375_c3_ccf7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2375_c3_ccf7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_6994_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2366_c11_ec9e_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2364_c3_9406 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2364_c3_9406;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2354_c1_1c4c_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2356_c3_44cc := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2356_c3_44cc;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_5172_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_98cf_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2373_c18_39f7_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2360_c3_f47a := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2360_c3_f47a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2372_c30_e5dc_y := resize(to_signed(-1, 2), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_98cf_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2367_c3_77b6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2367_c3_77b6;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2354_c1_1c4c_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2372_c30_e5dc_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2366_c11_ec9e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_6994_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_5172_left := VAR_phase;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2373_c11_e7b8_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2373_c18_39f7_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2373_c34_f438_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse := t8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse := tmp8;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2369_DUPLICATE_0e53 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2369_DUPLICATE_0e53_return_output := result.sp_relative_shift;

     -- CONST_SR_4[uxn_opcodes_h_l2373_c34_f438] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2373_c34_f438_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2373_c34_f438_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2373_c34_f438_return_output := CONST_SR_4_uxn_opcodes_h_l2373_c34_f438_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2366_c11_ec9e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2366_c11_ec9e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2366_c11_ec9e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2366_c11_ec9e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2366_c11_ec9e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2366_c11_ec9e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2366_c11_ec9e_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2372_c30_e5dc] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2372_c30_e5dc_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2372_c30_e5dc_ins;
     sp_relative_shift_uxn_opcodes_h_l2372_c30_e5dc_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2372_c30_e5dc_x;
     sp_relative_shift_uxn_opcodes_h_l2372_c30_e5dc_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2372_c30_e5dc_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2372_c30_e5dc_return_output := sp_relative_shift_uxn_opcodes_h_l2372_c30_e5dc_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2369_DUPLICATE_2c89 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2369_DUPLICATE_2c89_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2378_c11_5172] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2378_c11_5172_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_5172_left;
     BIN_OP_EQ_uxn_opcodes_h_l2378_c11_5172_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_5172_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_5172_return_output := BIN_OP_EQ_uxn_opcodes_h_l2378_c11_5172_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2378_DUPLICATE_d161 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2378_DUPLICATE_d161_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2354_c6_c864] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864_left;
     BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864_return_output := BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2378_DUPLICATE_73e2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2378_DUPLICATE_73e2_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2359_c11_b65f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2373_c18_39f7] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2373_c18_39f7_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2373_c18_39f7_left;
     BIN_OP_AND_uxn_opcodes_h_l2373_c18_39f7_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2373_c18_39f7_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2373_c18_39f7_return_output := BIN_OP_AND_uxn_opcodes_h_l2373_c18_39f7_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2369_c7_0ef1] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2369_c7_0ef1_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2362_c11_a009] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009_left;
     BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009_return_output := BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2369_c11_6994] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2369_c11_6994_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_6994_left;
     BIN_OP_EQ_uxn_opcodes_h_l2369_c11_6994_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_6994_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_6994_return_output := BIN_OP_EQ_uxn_opcodes_h_l2369_c11_6994_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2378_l2369_DUPLICATE_ae18 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2378_l2369_DUPLICATE_ae18_return_output := result.is_opc_done;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2373_c11_e7b8_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2373_c18_39f7_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2354_c1_1c4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2354_c2_40ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c2_40ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c2_40ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c2_40ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c2_40ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2354_c2_40ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2354_c2_40ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c6_c864_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2359_c7_eafb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2359_c7_eafb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2359_c7_eafb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c7_eafb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2359_c7_eafb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2359_c7_eafb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2359_c7_eafb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2359_c11_b65f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2362_c7_7f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c7_7f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c7_7f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c7_7f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c7_7f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2362_c7_7f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2362_c7_7f41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2362_c11_a009_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2366_c7_cd94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2366_c11_ec9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2366_c7_cd94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2366_c11_ec9e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2366_c11_ec9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2366_c7_cd94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2366_c11_ec9e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2366_c11_ec9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2366_c7_cd94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2366_c11_ec9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2366_c7_cd94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2366_c11_ec9e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2366_c7_cd94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2366_c11_ec9e_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_6994_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_6994_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_6994_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_6994_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_6994_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_6994_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_6994_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2369_c11_6994_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_98cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_5172_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_98cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_5172_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_98cf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2378_c11_5172_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2369_DUPLICATE_0e53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2369_DUPLICATE_0e53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2369_DUPLICATE_0e53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2369_DUPLICATE_0e53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2369_DUPLICATE_0e53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2378_l2369_DUPLICATE_ae18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2378_l2369_DUPLICATE_ae18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2378_l2369_DUPLICATE_ae18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2378_l2369_DUPLICATE_ae18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_98cf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2378_l2369_DUPLICATE_ae18_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2378_DUPLICATE_73e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2378_DUPLICATE_73e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2378_DUPLICATE_73e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2378_DUPLICATE_73e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_98cf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2378_DUPLICATE_73e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2378_DUPLICATE_d161_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2378_DUPLICATE_d161_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2378_DUPLICATE_d161_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2378_DUPLICATE_d161_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_98cf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2378_DUPLICATE_d161_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2369_DUPLICATE_2c89_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2369_DUPLICATE_2c89_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2369_DUPLICATE_2c89_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2369_DUPLICATE_2c89_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2366_l2362_l2359_l2354_l2369_DUPLICATE_2c89_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2373_c11_41d3_right := VAR_CONST_SR_4_uxn_opcodes_h_l2373_c34_f438_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2369_c7_0ef1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2372_c30_e5dc_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2378_c7_98cf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_98cf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_98cf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_98cf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_98cf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_98cf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_98cf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_98cf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_98cf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2369_c7_0ef1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2373_c11_e7b8] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2373_c11_e7b8_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2373_c11_e7b8_left;
     BIN_OP_SR_uxn_opcodes_h_l2373_c11_e7b8_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2373_c11_e7b8_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2373_c11_e7b8_return_output := BIN_OP_SR_uxn_opcodes_h_l2373_c11_e7b8_return_output;

     -- t8_MUX[uxn_opcodes_h_l2362_c7_7f41] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2362_c7_7f41_cond <= VAR_t8_MUX_uxn_opcodes_h_l2362_c7_7f41_cond;
     t8_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue;
     t8_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output := t8_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2378_c7_98cf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_98cf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_98cf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_98cf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_98cf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_98cf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_98cf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_98cf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_98cf_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2354_c1_1c4c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2354_c1_1c4c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2354_c1_1c4c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2354_c1_1c4c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2354_c1_1c4c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2354_c1_1c4c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2354_c1_1c4c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2354_c1_1c4c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2354_c1_1c4c_return_output;

     -- n8_MUX[uxn_opcodes_h_l2369_c7_0ef1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond <= VAR_n8_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond;
     n8_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue;
     n8_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output := n8_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2369_c7_0ef1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2378_c7_98cf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_98cf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_98cf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_98cf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_98cf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_98cf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_98cf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_98cf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_98cf_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SL_uxn_opcodes_h_l2373_c11_41d3_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2373_c11_e7b8_return_output;
     VAR_printf_uxn_opcodes_h_l2355_c3_f713_uxn_opcodes_h_l2355_c3_f713_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2354_c1_1c4c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2378_c7_98cf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2378_c7_98cf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2378_c7_98cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output;
     -- printf_uxn_opcodes_h_l2355_c3_f713[uxn_opcodes_h_l2355_c3_f713] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2355_c3_f713_uxn_opcodes_h_l2355_c3_f713_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2355_c3_f713_uxn_opcodes_h_l2355_c3_f713_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n8_MUX[uxn_opcodes_h_l2366_c7_cd94] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2366_c7_cd94_cond <= VAR_n8_MUX_uxn_opcodes_h_l2366_c7_cd94_cond;
     n8_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue;
     n8_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output := n8_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2366_c7_cd94] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2369_c7_0ef1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2369_c7_0ef1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2369_c7_0ef1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output;

     -- t8_MUX[uxn_opcodes_h_l2359_c7_eafb] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2359_c7_eafb_cond <= VAR_t8_MUX_uxn_opcodes_h_l2359_c7_eafb_cond;
     t8_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue;
     t8_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output := t8_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2373_c11_41d3] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2373_c11_41d3_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2373_c11_41d3_left;
     BIN_OP_SL_uxn_opcodes_h_l2373_c11_41d3_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2373_c11_41d3_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2373_c11_41d3_return_output := BIN_OP_SL_uxn_opcodes_h_l2373_c11_41d3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2366_c7_cd94] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2366_c7_cd94_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2366_c7_cd94_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2373_c11_41d3_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2373_c11_41d3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output;
     -- t8_MUX[uxn_opcodes_h_l2354_c2_40ed] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2354_c2_40ed_cond <= VAR_t8_MUX_uxn_opcodes_h_l2354_c2_40ed_cond;
     t8_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue;
     t8_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output := t8_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2369_c7_0ef1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2366_c7_cd94] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2366_c7_cd94_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2366_c7_cd94_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2362_c7_7f41] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c7_7f41_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c7_7f41_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2369_c7_0ef1] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2369_c7_0ef1_cond;
     tmp8_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2369_c7_0ef1_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2369_c7_0ef1_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output := tmp8_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2366_c7_cd94] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2366_c7_cd94_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2366_c7_cd94_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output;

     -- n8_MUX[uxn_opcodes_h_l2362_c7_7f41] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2362_c7_7f41_cond <= VAR_n8_MUX_uxn_opcodes_h_l2362_c7_7f41_cond;
     n8_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue;
     n8_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output := n8_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2362_c7_7f41] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2366_c7_cd94] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2369_c7_0ef1_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l2366_c7_cd94] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2366_c7_cd94_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2366_c7_cd94_cond;
     tmp8_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output := tmp8_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2359_c7_eafb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output;

     -- n8_MUX[uxn_opcodes_h_l2359_c7_eafb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2359_c7_eafb_cond <= VAR_n8_MUX_uxn_opcodes_h_l2359_c7_eafb_cond;
     n8_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue;
     n8_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output := n8_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2362_c7_7f41] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2362_c7_7f41_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c7_7f41_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2359_c7_eafb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c7_eafb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c7_eafb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2362_c7_7f41] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2366_c7_cd94] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2366_c7_cd94_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2366_c7_cd94_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2366_c7_cd94_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2366_c7_cd94_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output := result_u8_value_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2362_c7_7f41] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2362_c7_7f41_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c7_7f41_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2366_c7_cd94_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l2362_c7_7f41] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2362_c7_7f41_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2362_c7_7f41_cond;
     tmp8_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output := tmp8_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2362_c7_7f41] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2362_c7_7f41_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c7_7f41_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c7_7f41_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c7_7f41_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output := result_u8_value_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2354_c2_40ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c2_40ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c2_40ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2359_c7_eafb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2359_c7_eafb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2359_c7_eafb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2359_c7_eafb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2359_c7_eafb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2359_c7_eafb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2359_c7_eafb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output;

     -- n8_MUX[uxn_opcodes_h_l2354_c2_40ed] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2354_c2_40ed_cond <= VAR_n8_MUX_uxn_opcodes_h_l2354_c2_40ed_cond;
     n8_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue;
     n8_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output := n8_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2354_c2_40ed] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2362_c7_7f41_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2354_c2_40ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2354_c2_40ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c2_40ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2359_c7_eafb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2359_c7_eafb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2359_c7_eafb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output := result_u8_value_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2354_c2_40ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2354_c2_40ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c2_40ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2354_c2_40ed] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2359_c7_eafb] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2359_c7_eafb_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2359_c7_eafb_cond;
     tmp8_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2359_c7_eafb_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2359_c7_eafb_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output := tmp8_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output;

     -- Submodule level 7
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2359_c7_eafb_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l2354_c2_40ed] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2354_c2_40ed_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2354_c2_40ed_cond;
     tmp8_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output := tmp8_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2354_c2_40ed] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2354_c2_40ed_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c2_40ed_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c2_40ed_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c2_40ed_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output := result_u8_value_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output;

     -- Submodule level 8
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2384_l2350_DUPLICATE_6d77 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2384_l2350_DUPLICATE_6d77_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_641b(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c2_40ed_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2384_l2350_DUPLICATE_6d77_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_641b_uxn_opcodes_h_l2384_l2350_DUPLICATE_6d77_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
