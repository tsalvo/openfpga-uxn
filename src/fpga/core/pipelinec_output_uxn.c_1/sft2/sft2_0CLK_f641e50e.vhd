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
entity sft2_0CLK_f641e50e is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft2_0CLK_f641e50e;
architecture arch of sft2_0CLK_f641e50e is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2213_c6_bad3]
signal BIN_OP_EQ_uxn_opcodes_h_l2213_c6_bad3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2213_c6_bad3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2213_c6_bad3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2213_c2_4d25]
signal n16_MUX_uxn_opcodes_h_l2213_c2_4d25_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2213_c2_4d25]
signal tmp16_MUX_uxn_opcodes_h_l2213_c2_4d25_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2213_c2_4d25]
signal result_u8_value_MUX_uxn_opcodes_h_l2213_c2_4d25_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2213_c2_4d25]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2213_c2_4d25_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2213_c2_4d25]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_4d25_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2213_c2_4d25]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_4d25_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2213_c2_4d25]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_4d25_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l2213_c2_4d25]
signal t8_MUX_uxn_opcodes_h_l2213_c2_4d25_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2220_c11_8cb5]
signal BIN_OP_EQ_uxn_opcodes_h_l2220_c11_8cb5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2220_c11_8cb5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2220_c11_8cb5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2220_c7_d720]
signal n16_MUX_uxn_opcodes_h_l2220_c7_d720_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2220_c7_d720_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2220_c7_d720]
signal tmp16_MUX_uxn_opcodes_h_l2220_c7_d720_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2220_c7_d720_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2220_c7_d720]
signal result_u8_value_MUX_uxn_opcodes_h_l2220_c7_d720_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2220_c7_d720_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2220_c7_d720]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d720_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d720_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2220_c7_d720]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d720_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d720_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2220_c7_d720]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d720_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d720_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2220_c7_d720]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d720_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d720_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l2220_c7_d720]
signal t8_MUX_uxn_opcodes_h_l2220_c7_d720_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2220_c7_d720_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2223_c11_f398]
signal BIN_OP_EQ_uxn_opcodes_h_l2223_c11_f398_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2223_c11_f398_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2223_c11_f398_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2223_c7_6d55]
signal n16_MUX_uxn_opcodes_h_l2223_c7_6d55_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2223_c7_6d55]
signal tmp16_MUX_uxn_opcodes_h_l2223_c7_6d55_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2223_c7_6d55]
signal result_u8_value_MUX_uxn_opcodes_h_l2223_c7_6d55_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2223_c7_6d55]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_6d55_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2223_c7_6d55]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_6d55_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2223_c7_6d55]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_6d55_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2223_c7_6d55]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_6d55_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l2223_c7_6d55]
signal t8_MUX_uxn_opcodes_h_l2223_c7_6d55_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2227_c11_960c]
signal BIN_OP_EQ_uxn_opcodes_h_l2227_c11_960c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2227_c11_960c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2227_c11_960c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2227_c7_d1d3]
signal n16_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2227_c7_d1d3]
signal tmp16_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2227_c7_d1d3]
signal result_u8_value_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2227_c7_d1d3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2227_c7_d1d3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2227_c7_d1d3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2227_c7_d1d3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output : signed(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2229_c3_2568]
signal CONST_SL_8_uxn_opcodes_h_l2229_c3_2568_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2229_c3_2568_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2231_c11_f5a6]
signal BIN_OP_EQ_uxn_opcodes_h_l2231_c11_f5a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2231_c11_f5a6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2231_c11_f5a6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2231_c7_d308]
signal n16_MUX_uxn_opcodes_h_l2231_c7_d308_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2231_c7_d308_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2231_c7_d308]
signal tmp16_MUX_uxn_opcodes_h_l2231_c7_d308_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2231_c7_d308_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2231_c7_d308]
signal result_u8_value_MUX_uxn_opcodes_h_l2231_c7_d308_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2231_c7_d308_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2231_c7_d308]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_d308_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_d308_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2231_c7_d308]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_d308_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_d308_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2231_c7_d308]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_d308_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_d308_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2231_c7_d308]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_d308_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_d308_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2232_c3_ce87]
signal BIN_OP_OR_uxn_opcodes_h_l2232_c3_ce87_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2232_c3_ce87_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2232_c3_ce87_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2234_c30_ce22]
signal sp_relative_shift_uxn_opcodes_h_l2234_c30_ce22_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2234_c30_ce22_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2234_c30_ce22_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2234_c30_ce22_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2235_c20_024e]
signal BIN_OP_AND_uxn_opcodes_h_l2235_c20_024e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2235_c20_024e_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2235_c20_024e_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2235_c12_3b71]
signal BIN_OP_SR_uxn_opcodes_h_l2235_c12_3b71_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2235_c12_3b71_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2235_c12_3b71_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2235_c36_cbb7]
signal CONST_SR_4_uxn_opcodes_h_l2235_c36_cbb7_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2235_c36_cbb7_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2235_c12_ca96]
signal BIN_OP_SL_uxn_opcodes_h_l2235_c12_ca96_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2235_c12_ca96_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2235_c12_ca96_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2240_c11_5c26]
signal BIN_OP_EQ_uxn_opcodes_h_l2240_c11_5c26_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2240_c11_5c26_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2240_c11_5c26_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2240_c7_efdb]
signal result_u8_value_MUX_uxn_opcodes_h_l2240_c7_efdb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2240_c7_efdb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_efdb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2240_c7_efdb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_efdb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2240_c7_efdb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_efdb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2240_c7_efdb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_efdb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2243_c31_1cf6]
signal CONST_SR_8_uxn_opcodes_h_l2243_c31_1cf6_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2243_c31_1cf6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2245_c11_7121]
signal BIN_OP_EQ_uxn_opcodes_h_l2245_c11_7121_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2245_c11_7121_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2245_c11_7121_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2245_c7_cc10]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_cc10_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_cc10_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_cc10_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_cc10_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2245_c7_cc10]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_cc10_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_cc10_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_cc10_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_cc10_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_eae7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_write := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2213_c6_bad3
BIN_OP_EQ_uxn_opcodes_h_l2213_c6_bad3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2213_c6_bad3_left,
BIN_OP_EQ_uxn_opcodes_h_l2213_c6_bad3_right,
BIN_OP_EQ_uxn_opcodes_h_l2213_c6_bad3_return_output);

-- n16_MUX_uxn_opcodes_h_l2213_c2_4d25
n16_MUX_uxn_opcodes_h_l2213_c2_4d25 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2213_c2_4d25_cond,
n16_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue,
n16_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse,
n16_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2213_c2_4d25
tmp16_MUX_uxn_opcodes_h_l2213_c2_4d25 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2213_c2_4d25_cond,
tmp16_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue,
tmp16_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse,
tmp16_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2213_c2_4d25
result_u8_value_MUX_uxn_opcodes_h_l2213_c2_4d25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2213_c2_4d25_cond,
result_u8_value_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2213_c2_4d25
result_is_stack_write_MUX_uxn_opcodes_h_l2213_c2_4d25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2213_c2_4d25_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_4d25
result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_4d25 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_4d25_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_4d25
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_4d25 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_4d25_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_4d25
result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_4d25 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_4d25_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output);

-- t8_MUX_uxn_opcodes_h_l2213_c2_4d25
t8_MUX_uxn_opcodes_h_l2213_c2_4d25 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2213_c2_4d25_cond,
t8_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue,
t8_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse,
t8_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2220_c11_8cb5
BIN_OP_EQ_uxn_opcodes_h_l2220_c11_8cb5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2220_c11_8cb5_left,
BIN_OP_EQ_uxn_opcodes_h_l2220_c11_8cb5_right,
BIN_OP_EQ_uxn_opcodes_h_l2220_c11_8cb5_return_output);

-- n16_MUX_uxn_opcodes_h_l2220_c7_d720
n16_MUX_uxn_opcodes_h_l2220_c7_d720 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2220_c7_d720_cond,
n16_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue,
n16_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse,
n16_MUX_uxn_opcodes_h_l2220_c7_d720_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2220_c7_d720
tmp16_MUX_uxn_opcodes_h_l2220_c7_d720 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2220_c7_d720_cond,
tmp16_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue,
tmp16_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse,
tmp16_MUX_uxn_opcodes_h_l2220_c7_d720_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2220_c7_d720
result_u8_value_MUX_uxn_opcodes_h_l2220_c7_d720 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2220_c7_d720_cond,
result_u8_value_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2220_c7_d720_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d720
result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d720 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d720_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d720_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d720
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d720 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d720_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d720_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d720
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d720 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d720_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d720_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d720
result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d720 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d720_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d720_return_output);

-- t8_MUX_uxn_opcodes_h_l2220_c7_d720
t8_MUX_uxn_opcodes_h_l2220_c7_d720 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2220_c7_d720_cond,
t8_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue,
t8_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse,
t8_MUX_uxn_opcodes_h_l2220_c7_d720_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2223_c11_f398
BIN_OP_EQ_uxn_opcodes_h_l2223_c11_f398 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2223_c11_f398_left,
BIN_OP_EQ_uxn_opcodes_h_l2223_c11_f398_right,
BIN_OP_EQ_uxn_opcodes_h_l2223_c11_f398_return_output);

-- n16_MUX_uxn_opcodes_h_l2223_c7_6d55
n16_MUX_uxn_opcodes_h_l2223_c7_6d55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2223_c7_6d55_cond,
n16_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue,
n16_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse,
n16_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2223_c7_6d55
tmp16_MUX_uxn_opcodes_h_l2223_c7_6d55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2223_c7_6d55_cond,
tmp16_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue,
tmp16_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse,
tmp16_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2223_c7_6d55
result_u8_value_MUX_uxn_opcodes_h_l2223_c7_6d55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2223_c7_6d55_cond,
result_u8_value_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_6d55
result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_6d55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_6d55_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_6d55
result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_6d55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_6d55_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_6d55
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_6d55 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_6d55_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_6d55
result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_6d55 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_6d55_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output);

-- t8_MUX_uxn_opcodes_h_l2223_c7_6d55
t8_MUX_uxn_opcodes_h_l2223_c7_6d55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2223_c7_6d55_cond,
t8_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue,
t8_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse,
t8_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2227_c11_960c
BIN_OP_EQ_uxn_opcodes_h_l2227_c11_960c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2227_c11_960c_left,
BIN_OP_EQ_uxn_opcodes_h_l2227_c11_960c_right,
BIN_OP_EQ_uxn_opcodes_h_l2227_c11_960c_return_output);

-- n16_MUX_uxn_opcodes_h_l2227_c7_d1d3
n16_MUX_uxn_opcodes_h_l2227_c7_d1d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond,
n16_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue,
n16_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse,
n16_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2227_c7_d1d3
tmp16_MUX_uxn_opcodes_h_l2227_c7_d1d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond,
tmp16_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue,
tmp16_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse,
tmp16_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2227_c7_d1d3
result_u8_value_MUX_uxn_opcodes_h_l2227_c7_d1d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2227_c7_d1d3
result_is_stack_write_MUX_uxn_opcodes_h_l2227_c7_d1d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_d1d3
result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_d1d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_d1d3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_d1d3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_d1d3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_d1d3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2229_c3_2568
CONST_SL_8_uxn_opcodes_h_l2229_c3_2568 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2229_c3_2568_x,
CONST_SL_8_uxn_opcodes_h_l2229_c3_2568_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2231_c11_f5a6
BIN_OP_EQ_uxn_opcodes_h_l2231_c11_f5a6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2231_c11_f5a6_left,
BIN_OP_EQ_uxn_opcodes_h_l2231_c11_f5a6_right,
BIN_OP_EQ_uxn_opcodes_h_l2231_c11_f5a6_return_output);

-- n16_MUX_uxn_opcodes_h_l2231_c7_d308
n16_MUX_uxn_opcodes_h_l2231_c7_d308 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2231_c7_d308_cond,
n16_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue,
n16_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse,
n16_MUX_uxn_opcodes_h_l2231_c7_d308_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2231_c7_d308
tmp16_MUX_uxn_opcodes_h_l2231_c7_d308 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2231_c7_d308_cond,
tmp16_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue,
tmp16_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse,
tmp16_MUX_uxn_opcodes_h_l2231_c7_d308_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2231_c7_d308
result_u8_value_MUX_uxn_opcodes_h_l2231_c7_d308 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2231_c7_d308_cond,
result_u8_value_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2231_c7_d308_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_d308
result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_d308 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_d308_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_d308_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_d308
result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_d308 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_d308_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_d308_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_d308
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_d308 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_d308_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_d308_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_d308
result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_d308 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_d308_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_d308_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2232_c3_ce87
BIN_OP_OR_uxn_opcodes_h_l2232_c3_ce87 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2232_c3_ce87_left,
BIN_OP_OR_uxn_opcodes_h_l2232_c3_ce87_right,
BIN_OP_OR_uxn_opcodes_h_l2232_c3_ce87_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2234_c30_ce22
sp_relative_shift_uxn_opcodes_h_l2234_c30_ce22 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2234_c30_ce22_ins,
sp_relative_shift_uxn_opcodes_h_l2234_c30_ce22_x,
sp_relative_shift_uxn_opcodes_h_l2234_c30_ce22_y,
sp_relative_shift_uxn_opcodes_h_l2234_c30_ce22_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2235_c20_024e
BIN_OP_AND_uxn_opcodes_h_l2235_c20_024e : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2235_c20_024e_left,
BIN_OP_AND_uxn_opcodes_h_l2235_c20_024e_right,
BIN_OP_AND_uxn_opcodes_h_l2235_c20_024e_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2235_c12_3b71
BIN_OP_SR_uxn_opcodes_h_l2235_c12_3b71 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l2235_c12_3b71_left,
BIN_OP_SR_uxn_opcodes_h_l2235_c12_3b71_right,
BIN_OP_SR_uxn_opcodes_h_l2235_c12_3b71_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2235_c36_cbb7
CONST_SR_4_uxn_opcodes_h_l2235_c36_cbb7 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2235_c36_cbb7_x,
CONST_SR_4_uxn_opcodes_h_l2235_c36_cbb7_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2235_c12_ca96
BIN_OP_SL_uxn_opcodes_h_l2235_c12_ca96 : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l2235_c12_ca96_left,
BIN_OP_SL_uxn_opcodes_h_l2235_c12_ca96_right,
BIN_OP_SL_uxn_opcodes_h_l2235_c12_ca96_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2240_c11_5c26
BIN_OP_EQ_uxn_opcodes_h_l2240_c11_5c26 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2240_c11_5c26_left,
BIN_OP_EQ_uxn_opcodes_h_l2240_c11_5c26_right,
BIN_OP_EQ_uxn_opcodes_h_l2240_c11_5c26_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2240_c7_efdb
result_u8_value_MUX_uxn_opcodes_h_l2240_c7_efdb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2240_c7_efdb_cond,
result_u8_value_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_efdb
result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_efdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_efdb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_efdb
result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_efdb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_efdb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_efdb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_efdb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_efdb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_efdb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_efdb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_efdb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2243_c31_1cf6
CONST_SR_8_uxn_opcodes_h_l2243_c31_1cf6 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2243_c31_1cf6_x,
CONST_SR_8_uxn_opcodes_h_l2243_c31_1cf6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2245_c11_7121
BIN_OP_EQ_uxn_opcodes_h_l2245_c11_7121 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2245_c11_7121_left,
BIN_OP_EQ_uxn_opcodes_h_l2245_c11_7121_right,
BIN_OP_EQ_uxn_opcodes_h_l2245_c11_7121_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_cc10
result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_cc10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_cc10_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_cc10_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_cc10_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_cc10_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_cc10
result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_cc10 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_cc10_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_cc10_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_cc10_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_cc10_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2213_c6_bad3_return_output,
 n16_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output,
 tmp16_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output,
 t8_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2220_c11_8cb5_return_output,
 n16_MUX_uxn_opcodes_h_l2220_c7_d720_return_output,
 tmp16_MUX_uxn_opcodes_h_l2220_c7_d720_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2220_c7_d720_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d720_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d720_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d720_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d720_return_output,
 t8_MUX_uxn_opcodes_h_l2220_c7_d720_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2223_c11_f398_return_output,
 n16_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output,
 tmp16_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output,
 t8_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2227_c11_960c_return_output,
 n16_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output,
 tmp16_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output,
 CONST_SL_8_uxn_opcodes_h_l2229_c3_2568_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2231_c11_f5a6_return_output,
 n16_MUX_uxn_opcodes_h_l2231_c7_d308_return_output,
 tmp16_MUX_uxn_opcodes_h_l2231_c7_d308_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2231_c7_d308_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_d308_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_d308_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_d308_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_d308_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2232_c3_ce87_return_output,
 sp_relative_shift_uxn_opcodes_h_l2234_c30_ce22_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2235_c20_024e_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2235_c12_3b71_return_output,
 CONST_SR_4_uxn_opcodes_h_l2235_c36_cbb7_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2235_c12_ca96_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2240_c11_5c26_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output,
 CONST_SR_8_uxn_opcodes_h_l2243_c31_1cf6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2245_c11_7121_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_cc10_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_cc10_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_bad3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_bad3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_bad3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2220_c7_d720_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2213_c2_4d25_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2220_c7_d720_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2213_c2_4d25_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2220_c7_d720_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_4d25_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d720_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2213_c2_4d25_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d720_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_4d25_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2217_c3_17e3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d720_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_4d25_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d720_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_4d25_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2220_c7_d720_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2213_c2_4d25_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_8cb5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_8cb5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_8cb5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2220_c7_d720_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2220_c7_d720_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2220_c7_d720_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d720_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d720_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2221_c3_8ca0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d720_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d720_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2220_c7_d720_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_f398_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_f398_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_f398_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2223_c7_6d55_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2223_c7_6d55_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2223_c7_6d55_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_6d55_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_6d55_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2225_c3_6219 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_6d55_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_6d55_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2223_c7_6d55_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_960c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_960c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_960c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2231_c7_d308_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2231_c7_d308_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_d308_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_d308_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_d308_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_d308_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_d308_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2229_c3_2568_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2229_c3_2568_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_f5a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_f5a6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_f5a6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2231_c7_d308_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2231_c7_d308_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_d308_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_d308_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_d308_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2237_c3_6b90 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_d308_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_d308_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2232_c3_ce87_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2232_c3_ce87_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2232_c3_ce87_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2234_c30_ce22_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2234_c30_ce22_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2234_c30_ce22_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2234_c30_ce22_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2235_c12_3b71_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2235_c20_024e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2235_c20_024e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2235_c20_024e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2235_c12_3b71_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2235_c12_3b71_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2235_c12_ca96_left : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2235_c36_cbb7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2235_c12_ca96_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2235_c36_cbb7_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2235_c12_ca96_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2238_c21_4e43_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_5c26_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_5c26_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_5c26_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2240_c7_efdb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_cc10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_efdb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_cc10_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_efdb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2242_c3_df89 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_efdb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2241_c3_a0f6 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_efdb_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2243_c31_1cf6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2243_c31_1cf6_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2243_c21_cc9c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_7121_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_7121_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_7121_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_cc10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_cc10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_cc10_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_cc10_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_cc10_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_cc10_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2213_l2240_DUPLICATE_6b0d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2213_l2245_l2240_DUPLICATE_07a2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2213_l2240_DUPLICATE_0577_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2245_l2240_l2231_DUPLICATE_2d64_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2228_l2232_DUPLICATE_23e0_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2227_l2240_DUPLICATE_32a1_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2250_l2208_DUPLICATE_62e7_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_960c_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_f5a6_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2225_c3_6219 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2225_c3_6219;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2217_c3_17e3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2217_c3_17e3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_5c26_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_bad3_right := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2241_c3_a0f6 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2241_c3_a0f6;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_cc10_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2234_c30_ce22_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_AND_uxn_opcodes_h_l2235_c20_024e_right := to_unsigned(15, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_f398_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2237_c3_6b90 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2237_c3_6b90;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_7121_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2242_c3_df89 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2242_c3_df89;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2221_c3_8ca0 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2221_c3_8ca0;
     VAR_sp_relative_shift_uxn_opcodes_h_l2234_c30_ce22_y := resize(to_signed(-1, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_8cb5_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_cc10_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2234_c30_ce22_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2232_c3_ce87_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_bad3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_8cb5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_f398_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_960c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_f5a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_5c26_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_7121_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2235_c20_024e_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2235_c36_cbb7_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2243_c31_1cf6_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2227_c11_960c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2227_c11_960c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_960c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2227_c11_960c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_960c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_960c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2227_c11_960c_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2227_l2240_DUPLICATE_32a1 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2227_l2240_DUPLICATE_32a1_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2231_c11_f5a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2231_c11_f5a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_f5a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2231_c11_f5a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_f5a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_f5a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2231_c11_f5a6_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2228_l2232_DUPLICATE_23e0 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2228_l2232_DUPLICATE_23e0_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2240_c11_5c26] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2240_c11_5c26_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_5c26_left;
     BIN_OP_EQ_uxn_opcodes_h_l2240_c11_5c26_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_5c26_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_5c26_return_output := BIN_OP_EQ_uxn_opcodes_h_l2240_c11_5c26_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2245_l2240_l2231_DUPLICATE_2d64 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2245_l2240_l2231_DUPLICATE_2d64_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2213_c6_bad3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2213_c6_bad3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_bad3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2213_c6_bad3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_bad3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_bad3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2213_c6_bad3_return_output;

     -- CONST_SR_4[uxn_opcodes_h_l2235_c36_cbb7] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2235_c36_cbb7_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2235_c36_cbb7_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2235_c36_cbb7_return_output := CONST_SR_4_uxn_opcodes_h_l2235_c36_cbb7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2220_c11_8cb5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2220_c11_8cb5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_8cb5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2220_c11_8cb5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_8cb5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_8cb5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2220_c11_8cb5_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2213_l2240_DUPLICATE_6b0d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2213_l2240_DUPLICATE_6b0d_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2213_l2245_l2240_DUPLICATE_07a2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2213_l2245_l2240_DUPLICATE_07a2_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l2234_c30_ce22] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2234_c30_ce22_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2234_c30_ce22_ins;
     sp_relative_shift_uxn_opcodes_h_l2234_c30_ce22_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2234_c30_ce22_x;
     sp_relative_shift_uxn_opcodes_h_l2234_c30_ce22_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2234_c30_ce22_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2234_c30_ce22_return_output := sp_relative_shift_uxn_opcodes_h_l2234_c30_ce22_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2213_l2240_DUPLICATE_0577 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2213_l2240_DUPLICATE_0577_return_output := result.sp_relative_shift;

     -- CONST_SR_8[uxn_opcodes_h_l2243_c31_1cf6] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2243_c31_1cf6_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2243_c31_1cf6_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2243_c31_1cf6_return_output := CONST_SR_8_uxn_opcodes_h_l2243_c31_1cf6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2245_c11_7121] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2245_c11_7121_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_7121_left;
     BIN_OP_EQ_uxn_opcodes_h_l2245_c11_7121_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_7121_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_7121_return_output := BIN_OP_EQ_uxn_opcodes_h_l2245_c11_7121_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2235_c20_024e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2235_c20_024e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2235_c20_024e_left;
     BIN_OP_AND_uxn_opcodes_h_l2235_c20_024e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2235_c20_024e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2235_c20_024e_return_output := BIN_OP_AND_uxn_opcodes_h_l2235_c20_024e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2223_c11_f398] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2223_c11_f398_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_f398_left;
     BIN_OP_EQ_uxn_opcodes_h_l2223_c11_f398_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_f398_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_f398_return_output := BIN_OP_EQ_uxn_opcodes_h_l2223_c11_f398_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2235_c12_3b71_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2235_c20_024e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2213_c2_4d25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_bad3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_4d25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_bad3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2213_c2_4d25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_bad3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_4d25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_bad3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_4d25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_bad3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_4d25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_bad3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2213_c2_4d25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_bad3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2213_c2_4d25_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_bad3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2220_c7_d720_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_8cb5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d720_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_8cb5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d720_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_8cb5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d720_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_8cb5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d720_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_8cb5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2220_c7_d720_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_8cb5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2220_c7_d720_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_8cb5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2220_c7_d720_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2220_c11_8cb5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2223_c7_6d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_f398_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_6d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_f398_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_6d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_f398_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_6d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_f398_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_6d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_f398_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2223_c7_6d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_f398_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2223_c7_6d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_f398_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2223_c7_6d55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2223_c11_f398_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_960c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_960c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_960c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_960c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_960c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_960c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_960c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2231_c7_d308_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_f5a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_d308_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_f5a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_d308_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_f5a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_d308_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_f5a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_d308_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_f5a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_d308_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_f5a6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2231_c7_d308_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_f5a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_efdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_5c26_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_efdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_5c26_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_efdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_5c26_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_efdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_5c26_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2240_c7_efdb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2240_c11_5c26_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_cc10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_7121_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_cc10_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2245_c11_7121_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2232_c3_ce87_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2228_l2232_DUPLICATE_23e0_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2229_c3_2568_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2228_l2232_DUPLICATE_23e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2213_l2240_DUPLICATE_0577_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2213_l2240_DUPLICATE_0577_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2213_l2240_DUPLICATE_0577_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2213_l2240_DUPLICATE_0577_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2213_l2240_DUPLICATE_0577_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2245_l2240_l2231_DUPLICATE_2d64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2245_l2240_l2231_DUPLICATE_2d64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2245_l2240_l2231_DUPLICATE_2d64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2245_l2240_l2231_DUPLICATE_2d64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2245_l2240_l2231_DUPLICATE_2d64_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_cc10_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2245_l2240_l2231_DUPLICATE_2d64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2213_l2245_l2240_DUPLICATE_07a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2213_l2245_l2240_DUPLICATE_07a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2213_l2245_l2240_DUPLICATE_07a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2213_l2245_l2240_DUPLICATE_07a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2213_l2245_l2240_DUPLICATE_07a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_cc10_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2213_l2245_l2240_DUPLICATE_07a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2227_l2240_DUPLICATE_32a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2227_l2240_DUPLICATE_32a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2213_l2240_DUPLICATE_6b0d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2213_l2240_DUPLICATE_6b0d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2213_l2240_DUPLICATE_6b0d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2213_l2240_DUPLICATE_6b0d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2227_l2223_l2220_l2213_l2240_DUPLICATE_6b0d_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2235_c12_ca96_right := VAR_CONST_SR_4_uxn_opcodes_h_l2235_c36_cbb7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2234_c30_ce22_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2240_c7_efdb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_efdb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_efdb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output;

     -- t8_MUX[uxn_opcodes_h_l2223_c7_6d55] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2223_c7_6d55_cond <= VAR_t8_MUX_uxn_opcodes_h_l2223_c7_6d55_cond;
     t8_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue;
     t8_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output := t8_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2229_c3_2568] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2229_c3_2568_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2229_c3_2568_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2229_c3_2568_return_output := CONST_SL_8_uxn_opcodes_h_l2229_c3_2568_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2240_c7_efdb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_efdb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_efdb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2232_c3_ce87] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2232_c3_ce87_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2232_c3_ce87_left;
     BIN_OP_OR_uxn_opcodes_h_l2232_c3_ce87_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2232_c3_ce87_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2232_c3_ce87_return_output := BIN_OP_OR_uxn_opcodes_h_l2232_c3_ce87_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2245_c7_cc10] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_cc10_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_cc10_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_cc10_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_cc10_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_cc10_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_cc10_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_cc10_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_cc10_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2243_c21_cc9c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2243_c21_cc9c_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2243_c31_1cf6_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2245_c7_cc10] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_cc10_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_cc10_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_cc10_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_cc10_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_cc10_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_cc10_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_cc10_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_cc10_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l2235_c12_3b71_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2232_c3_ce87_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2232_c3_ce87_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2243_c21_cc9c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2229_c3_2568_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2245_c7_cc10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2245_c7_cc10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2240_c7_efdb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2240_c7_efdb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2240_c7_efdb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output := result_u8_value_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2240_c7_efdb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_efdb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_efdb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2240_c7_efdb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_efdb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_efdb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_efdb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_efdb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2231_c7_d308] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_d308_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_d308_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_d308_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_d308_return_output;

     -- n16_MUX[uxn_opcodes_h_l2231_c7_d308] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2231_c7_d308_cond <= VAR_n16_MUX_uxn_opcodes_h_l2231_c7_d308_cond;
     n16_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue;
     n16_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2231_c7_d308_return_output := n16_MUX_uxn_opcodes_h_l2231_c7_d308_return_output;

     -- t8_MUX[uxn_opcodes_h_l2220_c7_d720] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2220_c7_d720_cond <= VAR_t8_MUX_uxn_opcodes_h_l2220_c7_d720_cond;
     t8_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue;
     t8_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2220_c7_d720_return_output := t8_MUX_uxn_opcodes_h_l2220_c7_d720_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2235_c12_3b71] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2235_c12_3b71_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2235_c12_3b71_left;
     BIN_OP_SR_uxn_opcodes_h_l2235_c12_3b71_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2235_c12_3b71_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2235_c12_3b71_return_output := BIN_OP_SR_uxn_opcodes_h_l2235_c12_3b71_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2231_c7_d308] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_d308_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_d308_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_d308_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_d308_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l2235_c12_ca96_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2235_c12_3b71_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2231_c7_d308_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_d308_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2231_c7_d308_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2240_c7_efdb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2220_c7_d720_return_output;
     -- t8_MUX[uxn_opcodes_h_l2213_c2_4d25] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2213_c2_4d25_cond <= VAR_t8_MUX_uxn_opcodes_h_l2213_c2_4d25_cond;
     t8_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue;
     t8_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output := t8_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output;

     -- n16_MUX[uxn_opcodes_h_l2227_c7_d1d3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond;
     n16_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue;
     n16_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output := n16_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2227_c7_d1d3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2235_c12_ca96] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2235_c12_ca96_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2235_c12_ca96_left;
     BIN_OP_SL_uxn_opcodes_h_l2235_c12_ca96_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2235_c12_ca96_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2235_c12_ca96_return_output := BIN_OP_SL_uxn_opcodes_h_l2235_c12_ca96_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2231_c7_d308] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_d308_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_d308_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_d308_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_d308_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2231_c7_d308] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_d308_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_d308_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_d308_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_d308_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2227_c7_d1d3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2235_c12_ca96_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_d308_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2231_c7_d308_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2223_c7_6d55] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_6d55_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_6d55_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2227_c7_d1d3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2223_c7_6d55] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2223_c7_6d55_cond <= VAR_n16_MUX_uxn_opcodes_h_l2223_c7_6d55_cond;
     n16_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue;
     n16_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output := n16_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2238_c21_4e43] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2238_c21_4e43_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2235_c12_ca96_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l2231_c7_d308] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2231_c7_d308_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2231_c7_d308_cond;
     tmp16_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2231_c7_d308_return_output := tmp16_MUX_uxn_opcodes_h_l2231_c7_d308_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2227_c7_d1d3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2223_c7_6d55] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_6d55_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_6d55_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2238_c21_4e43_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2231_c7_d308_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2223_c7_6d55] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_6d55_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_6d55_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2231_c7_d308] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2231_c7_d308_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_d308_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_d308_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_d308_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_d308_return_output := result_u8_value_MUX_uxn_opcodes_h_l2231_c7_d308_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2220_c7_d720] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d720_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d720_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d720_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d720_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2227_c7_d1d3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond;
     tmp16_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output := tmp16_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2220_c7_d720] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2220_c7_d720_cond <= VAR_n16_MUX_uxn_opcodes_h_l2220_c7_d720_cond;
     n16_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue;
     n16_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2220_c7_d720_return_output := n16_MUX_uxn_opcodes_h_l2220_c7_d720_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2223_c7_6d55] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_6d55_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_6d55_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2220_c7_d720] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d720_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d720_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d720_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d720_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2220_c7_d720_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2220_c7_d720_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2220_c7_d720_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_d308_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output;
     -- n16_MUX[uxn_opcodes_h_l2213_c2_4d25] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2213_c2_4d25_cond <= VAR_n16_MUX_uxn_opcodes_h_l2213_c2_4d25_cond;
     n16_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue;
     n16_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output := n16_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2213_c2_4d25] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_4d25_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_4d25_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2220_c7_d720] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d720_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d720_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d720_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d720_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2213_c2_4d25] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_4d25_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_4d25_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2223_c7_6d55] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2223_c7_6d55_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2223_c7_6d55_cond;
     tmp16_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output := tmp16_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2220_c7_d720] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d720_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d720_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d720_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d720_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2227_c7_d1d3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2227_c7_d1d3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2227_c7_d1d3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2227_c7_d1d3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2220_c7_d720_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2220_c7_d720_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2227_c7_d1d3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2223_c7_6d55] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2223_c7_6d55_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2223_c7_6d55_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2223_c7_6d55_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2223_c7_6d55_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output := result_u8_value_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2220_c7_d720] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2220_c7_d720_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2220_c7_d720_cond;
     tmp16_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2220_c7_d720_return_output := tmp16_MUX_uxn_opcodes_h_l2220_c7_d720_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2213_c2_4d25] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_4d25_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_4d25_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2213_c2_4d25] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2213_c2_4d25_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2213_c2_4d25_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2223_c7_6d55_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2220_c7_d720_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2213_c2_4d25] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2213_c2_4d25_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2213_c2_4d25_cond;
     tmp16_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output := tmp16_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2220_c7_d720] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2220_c7_d720_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2220_c7_d720_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2220_c7_d720_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2220_c7_d720_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2220_c7_d720_return_output := result_u8_value_MUX_uxn_opcodes_h_l2220_c7_d720_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2220_c7_d720_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2213_c2_4d25] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2213_c2_4d25_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_4d25_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_4d25_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_4d25_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output := result_u8_value_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2250_l2208_DUPLICATE_62e7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2250_l2208_DUPLICATE_62e7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_eae7(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_4d25_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2250_l2208_DUPLICATE_62e7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l2250_l2208_DUPLICATE_62e7_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
