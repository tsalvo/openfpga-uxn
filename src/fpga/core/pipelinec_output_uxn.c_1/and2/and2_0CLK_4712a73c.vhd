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
-- Submodules: 71
entity and2_0CLK_4712a73c is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and2_0CLK_4712a73c;
architecture arch of and2_0CLK_4712a73c is
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
-- BIN_OP_EQ[uxn_opcodes_h_l925_c6_fdb3]
signal BIN_OP_EQ_uxn_opcodes_h_l925_c6_fdb3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l925_c6_fdb3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l925_c6_fdb3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l925_c2_083e]
signal n16_MUX_uxn_opcodes_h_l925_c2_083e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l925_c2_083e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l925_c2_083e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l925_c2_083e_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l925_c2_083e]
signal t16_MUX_uxn_opcodes_h_l925_c2_083e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l925_c2_083e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l925_c2_083e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l925_c2_083e_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l925_c2_083e]
signal tmp16_MUX_uxn_opcodes_h_l925_c2_083e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l925_c2_083e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l925_c2_083e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l925_c2_083e_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l925_c2_083e]
signal result_u8_value_MUX_uxn_opcodes_h_l925_c2_083e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l925_c2_083e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l925_c2_083e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l925_c2_083e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l925_c2_083e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l925_c2_083e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l925_c2_083e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l925_c2_083e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l925_c2_083e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l925_c2_083e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l925_c2_083e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l925_c2_083e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l925_c2_083e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l925_c2_083e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l925_c2_083e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l925_c2_083e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l925_c2_083e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l925_c2_083e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l925_c2_083e_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l925_c2_083e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l925_c2_083e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l925_c2_083e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l925_c2_083e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l925_c2_083e_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l932_c11_d306]
signal BIN_OP_EQ_uxn_opcodes_h_l932_c11_d306_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l932_c11_d306_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l932_c11_d306_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l932_c7_fbf7]
signal n16_MUX_uxn_opcodes_h_l932_c7_fbf7_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l932_c7_fbf7]
signal t16_MUX_uxn_opcodes_h_l932_c7_fbf7_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l932_c7_fbf7]
signal tmp16_MUX_uxn_opcodes_h_l932_c7_fbf7_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l932_c7_fbf7]
signal result_u8_value_MUX_uxn_opcodes_h_l932_c7_fbf7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l932_c7_fbf7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_fbf7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l932_c7_fbf7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_fbf7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l932_c7_fbf7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_fbf7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l932_c7_fbf7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l932_c7_fbf7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l935_c11_ed95]
signal BIN_OP_EQ_uxn_opcodes_h_l935_c11_ed95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l935_c11_ed95_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l935_c11_ed95_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l935_c7_182a]
signal n16_MUX_uxn_opcodes_h_l935_c7_182a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l935_c7_182a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l935_c7_182a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l935_c7_182a_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l935_c7_182a]
signal t16_MUX_uxn_opcodes_h_l935_c7_182a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l935_c7_182a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l935_c7_182a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l935_c7_182a_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l935_c7_182a]
signal tmp16_MUX_uxn_opcodes_h_l935_c7_182a_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l935_c7_182a_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l935_c7_182a_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l935_c7_182a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l935_c7_182a]
signal result_u8_value_MUX_uxn_opcodes_h_l935_c7_182a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l935_c7_182a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l935_c7_182a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l935_c7_182a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l935_c7_182a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_182a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_182a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_182a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_182a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l935_c7_182a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_182a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_182a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_182a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_182a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l935_c7_182a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_182a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_182a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_182a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_182a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l935_c7_182a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l935_c7_182a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l935_c7_182a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l935_c7_182a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l935_c7_182a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l940_c11_f3d3]
signal BIN_OP_EQ_uxn_opcodes_h_l940_c11_f3d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l940_c11_f3d3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l940_c11_f3d3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l940_c7_3ec5]
signal n16_MUX_uxn_opcodes_h_l940_c7_3ec5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l940_c7_3ec5]
signal t16_MUX_uxn_opcodes_h_l940_c7_3ec5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l940_c7_3ec5]
signal tmp16_MUX_uxn_opcodes_h_l940_c7_3ec5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l940_c7_3ec5]
signal result_u8_value_MUX_uxn_opcodes_h_l940_c7_3ec5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l940_c7_3ec5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3ec5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l940_c7_3ec5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3ec5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l940_c7_3ec5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3ec5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l940_c7_3ec5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3ec5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l941_c3_7fdf]
signal BIN_OP_OR_uxn_opcodes_h_l941_c3_7fdf_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l941_c3_7fdf_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l941_c3_7fdf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l944_c11_a92c]
signal BIN_OP_EQ_uxn_opcodes_h_l944_c11_a92c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l944_c11_a92c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l944_c11_a92c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l944_c7_b5fb]
signal n16_MUX_uxn_opcodes_h_l944_c7_b5fb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l944_c7_b5fb]
signal tmp16_MUX_uxn_opcodes_h_l944_c7_b5fb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l944_c7_b5fb]
signal result_u8_value_MUX_uxn_opcodes_h_l944_c7_b5fb_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l944_c7_b5fb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_b5fb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l944_c7_b5fb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_b5fb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l944_c7_b5fb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_b5fb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l944_c7_b5fb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_b5fb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l948_c11_980e]
signal BIN_OP_EQ_uxn_opcodes_h_l948_c11_980e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l948_c11_980e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l948_c11_980e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l948_c7_3000]
signal n16_MUX_uxn_opcodes_h_l948_c7_3000_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l948_c7_3000_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l948_c7_3000_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l948_c7_3000_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l948_c7_3000]
signal tmp16_MUX_uxn_opcodes_h_l948_c7_3000_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l948_c7_3000_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l948_c7_3000_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l948_c7_3000_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l948_c7_3000]
signal result_u8_value_MUX_uxn_opcodes_h_l948_c7_3000_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l948_c7_3000_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l948_c7_3000_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l948_c7_3000_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l948_c7_3000]
signal result_is_stack_write_MUX_uxn_opcodes_h_l948_c7_3000_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l948_c7_3000_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l948_c7_3000_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l948_c7_3000_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l948_c7_3000]
signal result_is_opc_done_MUX_uxn_opcodes_h_l948_c7_3000_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l948_c7_3000_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l948_c7_3000_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l948_c7_3000_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l948_c7_3000]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l948_c7_3000_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l948_c7_3000_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l948_c7_3000_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l948_c7_3000_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l948_c7_3000]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l948_c7_3000_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l948_c7_3000_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l948_c7_3000_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l948_c7_3000_return_output : signed(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l949_c3_029b]
signal BIN_OP_OR_uxn_opcodes_h_l949_c3_029b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l949_c3_029b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l949_c3_029b_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l950_c11_38c6]
signal BIN_OP_AND_uxn_opcodes_h_l950_c11_38c6_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l950_c11_38c6_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l950_c11_38c6_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l952_c30_6e90]
signal sp_relative_shift_uxn_opcodes_h_l952_c30_6e90_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l952_c30_6e90_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l952_c30_6e90_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l952_c30_6e90_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l957_c11_c3a3]
signal BIN_OP_EQ_uxn_opcodes_h_l957_c11_c3a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l957_c11_c3a3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l957_c11_c3a3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l957_c7_3869]
signal result_u8_value_MUX_uxn_opcodes_h_l957_c7_3869_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l957_c7_3869_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l957_c7_3869_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l957_c7_3869_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l957_c7_3869]
signal result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_3869_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_3869_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_3869_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_3869_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l957_c7_3869]
signal result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_3869_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_3869_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_3869_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_3869_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l957_c7_3869]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_3869_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_3869_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_3869_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_3869_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l957_c7_3869]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_3869_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_3869_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_3869_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_3869_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l960_c31_ce50]
signal CONST_SR_8_uxn_opcodes_h_l960_c31_ce50_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l960_c31_ce50_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l962_c11_617d]
signal BIN_OP_EQ_uxn_opcodes_h_l962_c11_617d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l962_c11_617d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l962_c11_617d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l962_c7_8901]
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_8901_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_8901_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_8901_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_8901_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l962_c7_8901]
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_8901_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_8901_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_8901_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_8901_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l946_l937_DUPLICATE_3660
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l946_l937_DUPLICATE_3660_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l946_l937_DUPLICATE_3660_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l925_c6_fdb3
BIN_OP_EQ_uxn_opcodes_h_l925_c6_fdb3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l925_c6_fdb3_left,
BIN_OP_EQ_uxn_opcodes_h_l925_c6_fdb3_right,
BIN_OP_EQ_uxn_opcodes_h_l925_c6_fdb3_return_output);

-- n16_MUX_uxn_opcodes_h_l925_c2_083e
n16_MUX_uxn_opcodes_h_l925_c2_083e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l925_c2_083e_cond,
n16_MUX_uxn_opcodes_h_l925_c2_083e_iftrue,
n16_MUX_uxn_opcodes_h_l925_c2_083e_iffalse,
n16_MUX_uxn_opcodes_h_l925_c2_083e_return_output);

-- t16_MUX_uxn_opcodes_h_l925_c2_083e
t16_MUX_uxn_opcodes_h_l925_c2_083e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l925_c2_083e_cond,
t16_MUX_uxn_opcodes_h_l925_c2_083e_iftrue,
t16_MUX_uxn_opcodes_h_l925_c2_083e_iffalse,
t16_MUX_uxn_opcodes_h_l925_c2_083e_return_output);

-- tmp16_MUX_uxn_opcodes_h_l925_c2_083e
tmp16_MUX_uxn_opcodes_h_l925_c2_083e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l925_c2_083e_cond,
tmp16_MUX_uxn_opcodes_h_l925_c2_083e_iftrue,
tmp16_MUX_uxn_opcodes_h_l925_c2_083e_iffalse,
tmp16_MUX_uxn_opcodes_h_l925_c2_083e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l925_c2_083e
result_u8_value_MUX_uxn_opcodes_h_l925_c2_083e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l925_c2_083e_cond,
result_u8_value_MUX_uxn_opcodes_h_l925_c2_083e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l925_c2_083e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l925_c2_083e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l925_c2_083e
result_is_stack_write_MUX_uxn_opcodes_h_l925_c2_083e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l925_c2_083e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l925_c2_083e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l925_c2_083e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l925_c2_083e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l925_c2_083e
result_is_opc_done_MUX_uxn_opcodes_h_l925_c2_083e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l925_c2_083e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l925_c2_083e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l925_c2_083e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l925_c2_083e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l925_c2_083e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l925_c2_083e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l925_c2_083e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l925_c2_083e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l925_c2_083e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l925_c2_083e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l925_c2_083e
result_sp_relative_shift_MUX_uxn_opcodes_h_l925_c2_083e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l925_c2_083e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l925_c2_083e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l925_c2_083e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l925_c2_083e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l932_c11_d306
BIN_OP_EQ_uxn_opcodes_h_l932_c11_d306 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l932_c11_d306_left,
BIN_OP_EQ_uxn_opcodes_h_l932_c11_d306_right,
BIN_OP_EQ_uxn_opcodes_h_l932_c11_d306_return_output);

-- n16_MUX_uxn_opcodes_h_l932_c7_fbf7
n16_MUX_uxn_opcodes_h_l932_c7_fbf7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l932_c7_fbf7_cond,
n16_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue,
n16_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse,
n16_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output);

-- t16_MUX_uxn_opcodes_h_l932_c7_fbf7
t16_MUX_uxn_opcodes_h_l932_c7_fbf7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l932_c7_fbf7_cond,
t16_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue,
t16_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse,
t16_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l932_c7_fbf7
tmp16_MUX_uxn_opcodes_h_l932_c7_fbf7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l932_c7_fbf7_cond,
tmp16_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue,
tmp16_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse,
tmp16_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l932_c7_fbf7
result_u8_value_MUX_uxn_opcodes_h_l932_c7_fbf7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l932_c7_fbf7_cond,
result_u8_value_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_fbf7
result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_fbf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_fbf7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_fbf7
result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_fbf7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_fbf7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_fbf7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_fbf7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_fbf7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l932_c7_fbf7
result_sp_relative_shift_MUX_uxn_opcodes_h_l932_c7_fbf7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l932_c7_fbf7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l935_c11_ed95
BIN_OP_EQ_uxn_opcodes_h_l935_c11_ed95 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l935_c11_ed95_left,
BIN_OP_EQ_uxn_opcodes_h_l935_c11_ed95_right,
BIN_OP_EQ_uxn_opcodes_h_l935_c11_ed95_return_output);

-- n16_MUX_uxn_opcodes_h_l935_c7_182a
n16_MUX_uxn_opcodes_h_l935_c7_182a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l935_c7_182a_cond,
n16_MUX_uxn_opcodes_h_l935_c7_182a_iftrue,
n16_MUX_uxn_opcodes_h_l935_c7_182a_iffalse,
n16_MUX_uxn_opcodes_h_l935_c7_182a_return_output);

-- t16_MUX_uxn_opcodes_h_l935_c7_182a
t16_MUX_uxn_opcodes_h_l935_c7_182a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l935_c7_182a_cond,
t16_MUX_uxn_opcodes_h_l935_c7_182a_iftrue,
t16_MUX_uxn_opcodes_h_l935_c7_182a_iffalse,
t16_MUX_uxn_opcodes_h_l935_c7_182a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l935_c7_182a
tmp16_MUX_uxn_opcodes_h_l935_c7_182a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l935_c7_182a_cond,
tmp16_MUX_uxn_opcodes_h_l935_c7_182a_iftrue,
tmp16_MUX_uxn_opcodes_h_l935_c7_182a_iffalse,
tmp16_MUX_uxn_opcodes_h_l935_c7_182a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l935_c7_182a
result_u8_value_MUX_uxn_opcodes_h_l935_c7_182a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l935_c7_182a_cond,
result_u8_value_MUX_uxn_opcodes_h_l935_c7_182a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l935_c7_182a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l935_c7_182a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_182a
result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_182a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_182a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_182a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_182a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_182a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_182a
result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_182a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_182a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_182a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_182a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_182a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_182a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_182a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_182a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_182a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_182a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_182a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l935_c7_182a
result_sp_relative_shift_MUX_uxn_opcodes_h_l935_c7_182a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l935_c7_182a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l935_c7_182a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l935_c7_182a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l935_c7_182a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l940_c11_f3d3
BIN_OP_EQ_uxn_opcodes_h_l940_c11_f3d3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l940_c11_f3d3_left,
BIN_OP_EQ_uxn_opcodes_h_l940_c11_f3d3_right,
BIN_OP_EQ_uxn_opcodes_h_l940_c11_f3d3_return_output);

-- n16_MUX_uxn_opcodes_h_l940_c7_3ec5
n16_MUX_uxn_opcodes_h_l940_c7_3ec5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l940_c7_3ec5_cond,
n16_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue,
n16_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse,
n16_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output);

-- t16_MUX_uxn_opcodes_h_l940_c7_3ec5
t16_MUX_uxn_opcodes_h_l940_c7_3ec5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l940_c7_3ec5_cond,
t16_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue,
t16_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse,
t16_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output);

-- tmp16_MUX_uxn_opcodes_h_l940_c7_3ec5
tmp16_MUX_uxn_opcodes_h_l940_c7_3ec5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l940_c7_3ec5_cond,
tmp16_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue,
tmp16_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse,
tmp16_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l940_c7_3ec5
result_u8_value_MUX_uxn_opcodes_h_l940_c7_3ec5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l940_c7_3ec5_cond,
result_u8_value_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3ec5
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3ec5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3ec5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3ec5
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3ec5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3ec5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3ec5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3ec5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3ec5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3ec5
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3ec5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3ec5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l941_c3_7fdf
BIN_OP_OR_uxn_opcodes_h_l941_c3_7fdf : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l941_c3_7fdf_left,
BIN_OP_OR_uxn_opcodes_h_l941_c3_7fdf_right,
BIN_OP_OR_uxn_opcodes_h_l941_c3_7fdf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l944_c11_a92c
BIN_OP_EQ_uxn_opcodes_h_l944_c11_a92c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l944_c11_a92c_left,
BIN_OP_EQ_uxn_opcodes_h_l944_c11_a92c_right,
BIN_OP_EQ_uxn_opcodes_h_l944_c11_a92c_return_output);

-- n16_MUX_uxn_opcodes_h_l944_c7_b5fb
n16_MUX_uxn_opcodes_h_l944_c7_b5fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l944_c7_b5fb_cond,
n16_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue,
n16_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse,
n16_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l944_c7_b5fb
tmp16_MUX_uxn_opcodes_h_l944_c7_b5fb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l944_c7_b5fb_cond,
tmp16_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue,
tmp16_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse,
tmp16_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l944_c7_b5fb
result_u8_value_MUX_uxn_opcodes_h_l944_c7_b5fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l944_c7_b5fb_cond,
result_u8_value_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_b5fb
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_b5fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_b5fb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_b5fb
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_b5fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_b5fb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_b5fb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_b5fb : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_b5fb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_b5fb
result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_b5fb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_b5fb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l948_c11_980e
BIN_OP_EQ_uxn_opcodes_h_l948_c11_980e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l948_c11_980e_left,
BIN_OP_EQ_uxn_opcodes_h_l948_c11_980e_right,
BIN_OP_EQ_uxn_opcodes_h_l948_c11_980e_return_output);

-- n16_MUX_uxn_opcodes_h_l948_c7_3000
n16_MUX_uxn_opcodes_h_l948_c7_3000 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l948_c7_3000_cond,
n16_MUX_uxn_opcodes_h_l948_c7_3000_iftrue,
n16_MUX_uxn_opcodes_h_l948_c7_3000_iffalse,
n16_MUX_uxn_opcodes_h_l948_c7_3000_return_output);

-- tmp16_MUX_uxn_opcodes_h_l948_c7_3000
tmp16_MUX_uxn_opcodes_h_l948_c7_3000 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l948_c7_3000_cond,
tmp16_MUX_uxn_opcodes_h_l948_c7_3000_iftrue,
tmp16_MUX_uxn_opcodes_h_l948_c7_3000_iffalse,
tmp16_MUX_uxn_opcodes_h_l948_c7_3000_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l948_c7_3000
result_u8_value_MUX_uxn_opcodes_h_l948_c7_3000 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l948_c7_3000_cond,
result_u8_value_MUX_uxn_opcodes_h_l948_c7_3000_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l948_c7_3000_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l948_c7_3000_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l948_c7_3000
result_is_stack_write_MUX_uxn_opcodes_h_l948_c7_3000 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l948_c7_3000_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l948_c7_3000_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l948_c7_3000_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l948_c7_3000_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l948_c7_3000
result_is_opc_done_MUX_uxn_opcodes_h_l948_c7_3000 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l948_c7_3000_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l948_c7_3000_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l948_c7_3000_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l948_c7_3000_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l948_c7_3000
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l948_c7_3000 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l948_c7_3000_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l948_c7_3000_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l948_c7_3000_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l948_c7_3000_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l948_c7_3000
result_sp_relative_shift_MUX_uxn_opcodes_h_l948_c7_3000 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l948_c7_3000_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l948_c7_3000_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l948_c7_3000_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l948_c7_3000_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l949_c3_029b
BIN_OP_OR_uxn_opcodes_h_l949_c3_029b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l949_c3_029b_left,
BIN_OP_OR_uxn_opcodes_h_l949_c3_029b_right,
BIN_OP_OR_uxn_opcodes_h_l949_c3_029b_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l950_c11_38c6
BIN_OP_AND_uxn_opcodes_h_l950_c11_38c6 : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l950_c11_38c6_left,
BIN_OP_AND_uxn_opcodes_h_l950_c11_38c6_right,
BIN_OP_AND_uxn_opcodes_h_l950_c11_38c6_return_output);

-- sp_relative_shift_uxn_opcodes_h_l952_c30_6e90
sp_relative_shift_uxn_opcodes_h_l952_c30_6e90 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l952_c30_6e90_ins,
sp_relative_shift_uxn_opcodes_h_l952_c30_6e90_x,
sp_relative_shift_uxn_opcodes_h_l952_c30_6e90_y,
sp_relative_shift_uxn_opcodes_h_l952_c30_6e90_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l957_c11_c3a3
BIN_OP_EQ_uxn_opcodes_h_l957_c11_c3a3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l957_c11_c3a3_left,
BIN_OP_EQ_uxn_opcodes_h_l957_c11_c3a3_right,
BIN_OP_EQ_uxn_opcodes_h_l957_c11_c3a3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l957_c7_3869
result_u8_value_MUX_uxn_opcodes_h_l957_c7_3869 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l957_c7_3869_cond,
result_u8_value_MUX_uxn_opcodes_h_l957_c7_3869_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l957_c7_3869_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l957_c7_3869_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_3869
result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_3869 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_3869_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_3869_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_3869_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_3869_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_3869
result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_3869 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_3869_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_3869_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_3869_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_3869_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_3869
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_3869 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_3869_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_3869_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_3869_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_3869_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_3869
result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_3869 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_3869_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_3869_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_3869_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_3869_return_output);

-- CONST_SR_8_uxn_opcodes_h_l960_c31_ce50
CONST_SR_8_uxn_opcodes_h_l960_c31_ce50 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l960_c31_ce50_x,
CONST_SR_8_uxn_opcodes_h_l960_c31_ce50_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l962_c11_617d
BIN_OP_EQ_uxn_opcodes_h_l962_c11_617d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l962_c11_617d_left,
BIN_OP_EQ_uxn_opcodes_h_l962_c11_617d_right,
BIN_OP_EQ_uxn_opcodes_h_l962_c11_617d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_8901
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_8901 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_8901_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_8901_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_8901_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_8901_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_8901
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_8901 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_8901_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_8901_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_8901_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_8901_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l946_l937_DUPLICATE_3660
CONST_SL_8_uint16_t_uxn_opcodes_h_l946_l937_DUPLICATE_3660 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l946_l937_DUPLICATE_3660_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l946_l937_DUPLICATE_3660_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l925_c6_fdb3_return_output,
 n16_MUX_uxn_opcodes_h_l925_c2_083e_return_output,
 t16_MUX_uxn_opcodes_h_l925_c2_083e_return_output,
 tmp16_MUX_uxn_opcodes_h_l925_c2_083e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l925_c2_083e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l925_c2_083e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l925_c2_083e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l925_c2_083e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l925_c2_083e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l932_c11_d306_return_output,
 n16_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output,
 t16_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output,
 tmp16_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l935_c11_ed95_return_output,
 n16_MUX_uxn_opcodes_h_l935_c7_182a_return_output,
 t16_MUX_uxn_opcodes_h_l935_c7_182a_return_output,
 tmp16_MUX_uxn_opcodes_h_l935_c7_182a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l935_c7_182a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_182a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_182a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_182a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l935_c7_182a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l940_c11_f3d3_return_output,
 n16_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output,
 t16_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output,
 tmp16_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output,
 BIN_OP_OR_uxn_opcodes_h_l941_c3_7fdf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l944_c11_a92c_return_output,
 n16_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output,
 tmp16_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l948_c11_980e_return_output,
 n16_MUX_uxn_opcodes_h_l948_c7_3000_return_output,
 tmp16_MUX_uxn_opcodes_h_l948_c7_3000_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l948_c7_3000_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l948_c7_3000_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l948_c7_3000_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l948_c7_3000_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l948_c7_3000_return_output,
 BIN_OP_OR_uxn_opcodes_h_l949_c3_029b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l950_c11_38c6_return_output,
 sp_relative_shift_uxn_opcodes_h_l952_c30_6e90_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l957_c11_c3a3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l957_c7_3869_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_3869_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_3869_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_3869_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_3869_return_output,
 CONST_SR_8_uxn_opcodes_h_l960_c31_ce50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l962_c11_617d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_8901_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_8901_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l946_l937_DUPLICATE_3660_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l925_c6_fdb3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l925_c6_fdb3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l925_c6_fdb3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l925_c2_083e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l925_c2_083e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l925_c2_083e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l925_c2_083e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l925_c2_083e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l925_c2_083e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l925_c2_083e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l925_c2_083e_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l925_c2_083e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l925_c2_083e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l925_c2_083e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l925_c2_083e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l925_c2_083e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l925_c2_083e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l925_c2_083e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l925_c2_083e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l925_c2_083e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l925_c2_083e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l925_c2_083e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l925_c2_083e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l925_c2_083e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l925_c2_083e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l925_c2_083e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l925_c2_083e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l925_c2_083e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l929_c3_2a0e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l925_c2_083e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l925_c2_083e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l925_c2_083e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l925_c2_083e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l925_c2_083e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l925_c2_083e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l925_c2_083e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d306_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d306_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d306_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l935_c7_182a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l932_c7_fbf7_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l935_c7_182a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l932_c7_fbf7_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l935_c7_182a_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l932_c7_fbf7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l935_c7_182a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l932_c7_fbf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_182a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_fbf7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_182a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_fbf7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l933_c3_e280 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_182a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_fbf7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l935_c7_182a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l932_c7_fbf7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ed95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ed95_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ed95_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l935_c7_182a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l935_c7_182a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l935_c7_182a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l935_c7_182a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l935_c7_182a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l935_c7_182a_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l935_c7_182a_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l935_c7_182a_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l935_c7_182a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l935_c7_182a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l935_c7_182a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l935_c7_182a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_182a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_182a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_182a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_182a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_182a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_182a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_182a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l938_c3_9da9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_182a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_182a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l935_c7_182a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l935_c7_182a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l935_c7_182a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_f3d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_f3d3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_f3d3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l940_c7_3ec5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l940_c7_3ec5_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l940_c7_3ec5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c7_3ec5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3ec5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3ec5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l942_c3_81a1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3ec5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3ec5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l941_c3_7fdf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l941_c3_7fdf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l941_c3_7fdf_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_a92c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_a92c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_a92c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l948_c7_3000_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l944_c7_b5fb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l948_c7_3000_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l944_c7_b5fb_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l948_c7_3000_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l944_c7_b5fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l948_c7_3000_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_b5fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l948_c7_3000_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_b5fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l948_c7_3000_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_b5fb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l948_c7_3000_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_b5fb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l948_c11_980e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l948_c11_980e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l948_c11_980e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l948_c7_3000_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l948_c7_3000_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l948_c7_3000_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l948_c7_3000_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l948_c7_3000_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l948_c7_3000_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l948_c7_3000_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l948_c7_3000_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l957_c7_3869_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l948_c7_3000_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l948_c7_3000_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l948_c7_3000_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_3869_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l948_c7_3000_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l948_c7_3000_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l948_c7_3000_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_3869_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l948_c7_3000_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l948_c7_3000_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l954_c3_759b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l948_c7_3000_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_3869_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l948_c7_3000_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l948_c7_3000_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l948_c7_3000_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_3869_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l948_c7_3000_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l949_c3_029b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l949_c3_029b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l949_c3_029b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l950_c11_38c6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l950_c11_38c6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l950_c11_38c6_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l952_c30_6e90_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l952_c30_6e90_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l952_c30_6e90_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l952_c30_6e90_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l955_c21_5870_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_c3a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_c3a3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_c3a3_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l957_c7_3869_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l957_c7_3869_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l957_c7_3869_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_3869_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_3869_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_8901_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_3869_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_3869_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_3869_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_8901_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_3869_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_3869_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l959_c3_f4ab : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_3869_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_3869_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_3869_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l958_c3_5b47 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_3869_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_3869_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l960_c31_ce50_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l960_c31_ce50_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l960_c21_5c33_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_617d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_617d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_617d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_8901_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_8901_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_8901_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_8901_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_8901_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_8901_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l957_l944_l925_l935_l932_l940_DUPLICATE_9f25_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l957_l962_l944_l925_l935_l932_l940_DUPLICATE_fc43_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l957_l944_l925_l935_l932_l940_DUPLICATE_4260_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l957_l962_l944_l935_l948_l932_l940_DUPLICATE_3460_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l949_l945_l936_l941_DUPLICATE_9f60_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l946_l937_DUPLICATE_3660_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l946_l937_DUPLICATE_3660_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l957_l944_DUPLICATE_44b5_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l921_l967_DUPLICATE_9342_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_c3a3_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l948_c7_3000_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_617d_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l933_c3_e280 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l933_c3_e280;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ed95_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l958_c3_5b47 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_3869_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l958_c3_5b47;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l942_c3_81a1 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l942_c3_81a1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_a92c_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l952_c30_6e90_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_8901_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l959_c3_f4ab := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_3869_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l959_c3_f4ab;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l938_c3_9da9 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_182a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l938_c3_9da9;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_8901_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l925_c2_083e_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l952_c30_6e90_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l925_c6_fdb3_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_f3d3_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d306_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l948_c11_980e_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l954_c3_759b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l948_c7_3000_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l954_c3_759b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l929_c3_2a0e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l925_c2_083e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l929_c3_2a0e;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l952_c30_6e90_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l949_c3_029b_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l925_c2_083e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l935_c7_182a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l948_c7_3000_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l925_c6_fdb3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d306_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ed95_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_f3d3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_a92c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l948_c11_980e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_c3a3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_617d_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l950_c11_38c6_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l941_c3_7fdf_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l925_c2_083e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l960_c31_ce50_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l925_c2_083e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l935_c7_182a_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l948_c7_3000_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l948_c11_980e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l948_c11_980e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l948_c11_980e_left;
     BIN_OP_EQ_uxn_opcodes_h_l948_c11_980e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l948_c11_980e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l948_c11_980e_return_output := BIN_OP_EQ_uxn_opcodes_h_l948_c11_980e_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l957_l944_DUPLICATE_44b5 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l957_l944_DUPLICATE_44b5_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l960_c31_ce50] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l960_c31_ce50_x <= VAR_CONST_SR_8_uxn_opcodes_h_l960_c31_ce50_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l960_c31_ce50_return_output := CONST_SR_8_uxn_opcodes_h_l960_c31_ce50_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l949_l945_l936_l941_DUPLICATE_9f60 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l949_l945_l936_l941_DUPLICATE_9f60_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l935_c11_ed95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l935_c11_ed95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ed95_left;
     BIN_OP_EQ_uxn_opcodes_h_l935_c11_ed95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ed95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ed95_return_output := BIN_OP_EQ_uxn_opcodes_h_l935_c11_ed95_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l932_c11_d306] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l932_c11_d306_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d306_left;
     BIN_OP_EQ_uxn_opcodes_h_l932_c11_d306_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d306_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d306_return_output := BIN_OP_EQ_uxn_opcodes_h_l932_c11_d306_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l925_c6_fdb3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l925_c6_fdb3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l925_c6_fdb3_left;
     BIN_OP_EQ_uxn_opcodes_h_l925_c6_fdb3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l925_c6_fdb3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l925_c6_fdb3_return_output := BIN_OP_EQ_uxn_opcodes_h_l925_c6_fdb3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l957_c11_c3a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l957_c11_c3a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_c3a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l957_c11_c3a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_c3a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_c3a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l957_c11_c3a3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l944_c11_a92c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l944_c11_a92c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_a92c_left;
     BIN_OP_EQ_uxn_opcodes_h_l944_c11_a92c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_a92c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_a92c_return_output := BIN_OP_EQ_uxn_opcodes_h_l944_c11_a92c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l962_c11_617d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l962_c11_617d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_617d_left;
     BIN_OP_EQ_uxn_opcodes_h_l962_c11_617d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_617d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_617d_return_output := BIN_OP_EQ_uxn_opcodes_h_l962_c11_617d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l957_l962_l944_l925_l935_l932_l940_DUPLICATE_fc43 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l957_l962_l944_l925_l935_l932_l940_DUPLICATE_fc43_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l957_l962_l944_l935_l948_l932_l940_DUPLICATE_3460 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l957_l962_l944_l935_l948_l932_l940_DUPLICATE_3460_return_output := result.is_opc_done;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l957_l944_l925_l935_l932_l940_DUPLICATE_4260 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l957_l944_l925_l935_l932_l940_DUPLICATE_4260_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l940_c11_f3d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l940_c11_f3d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_f3d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l940_c11_f3d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_f3d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_f3d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l940_c11_f3d3_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l952_c30_6e90] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l952_c30_6e90_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l952_c30_6e90_ins;
     sp_relative_shift_uxn_opcodes_h_l952_c30_6e90_x <= VAR_sp_relative_shift_uxn_opcodes_h_l952_c30_6e90_x;
     sp_relative_shift_uxn_opcodes_h_l952_c30_6e90_y <= VAR_sp_relative_shift_uxn_opcodes_h_l952_c30_6e90_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l952_c30_6e90_return_output := sp_relative_shift_uxn_opcodes_h_l952_c30_6e90_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l957_l944_l925_l935_l932_l940_DUPLICATE_9f25 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l957_l944_l925_l935_l932_l940_DUPLICATE_9f25_return_output := result.u8_value;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l925_c2_083e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l925_c6_fdb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l925_c2_083e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l925_c6_fdb3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l925_c2_083e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l925_c6_fdb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l925_c2_083e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l925_c6_fdb3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l925_c2_083e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l925_c6_fdb3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l925_c2_083e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l925_c6_fdb3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l925_c2_083e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l925_c6_fdb3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l925_c2_083e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l925_c6_fdb3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l932_c7_fbf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d306_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_fbf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d306_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_fbf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d306_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l932_c7_fbf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d306_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_fbf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d306_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l932_c7_fbf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d306_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l932_c7_fbf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d306_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l932_c7_fbf7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l932_c11_d306_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l935_c7_182a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ed95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_182a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ed95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_182a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ed95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l935_c7_182a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ed95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_182a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ed95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l935_c7_182a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ed95_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l935_c7_182a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ed95_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l935_c7_182a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l935_c11_ed95_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l940_c7_3ec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_f3d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3ec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_f3d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3ec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_f3d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3ec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_f3d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3ec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_f3d3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c7_3ec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_f3d3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l940_c7_3ec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_f3d3_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l940_c7_3ec5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_f3d3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l944_c7_b5fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_a92c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_b5fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_a92c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_b5fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_a92c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_b5fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_a92c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_b5fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_a92c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l944_c7_b5fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_a92c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l944_c7_b5fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_a92c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l948_c7_3000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l948_c11_980e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l948_c7_3000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l948_c11_980e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l948_c7_3000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l948_c11_980e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l948_c7_3000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l948_c11_980e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l948_c7_3000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l948_c11_980e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l948_c7_3000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l948_c11_980e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l948_c7_3000_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l948_c11_980e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_3869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_c3a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_3869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_c3a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_3869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_c3a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_3869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_c3a3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l957_c7_3869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l957_c11_c3a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_8901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_617d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_8901_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l962_c11_617d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l941_c3_7fdf_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l949_l945_l936_l941_DUPLICATE_9f60_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l949_c3_029b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l949_l945_l936_l941_DUPLICATE_9f60_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l946_l937_DUPLICATE_3660_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l949_l945_l936_l941_DUPLICATE_9f60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l925_c2_083e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l957_l944_l925_l935_l932_l940_DUPLICATE_4260_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l957_l944_l925_l935_l932_l940_DUPLICATE_4260_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l935_c7_182a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l957_l944_l925_l935_l932_l940_DUPLICATE_4260_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l957_l944_l925_l935_l932_l940_DUPLICATE_4260_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l957_l944_l925_l935_l932_l940_DUPLICATE_4260_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_3869_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l957_l944_l925_l935_l932_l940_DUPLICATE_4260_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l957_l962_l944_l935_l948_l932_l940_DUPLICATE_3460_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_182a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l957_l962_l944_l935_l948_l932_l940_DUPLICATE_3460_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l957_l962_l944_l935_l948_l932_l940_DUPLICATE_3460_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l957_l962_l944_l935_l948_l932_l940_DUPLICATE_3460_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l948_c7_3000_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l957_l962_l944_l935_l948_l932_l940_DUPLICATE_3460_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_3869_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l957_l962_l944_l935_l948_l932_l940_DUPLICATE_3460_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_8901_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l957_l962_l944_l935_l948_l932_l940_DUPLICATE_3460_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l925_c2_083e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l957_l962_l944_l925_l935_l932_l940_DUPLICATE_fc43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l957_l962_l944_l925_l935_l932_l940_DUPLICATE_fc43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_182a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l957_l962_l944_l925_l935_l932_l940_DUPLICATE_fc43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l957_l962_l944_l925_l935_l932_l940_DUPLICATE_fc43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l957_l962_l944_l925_l935_l932_l940_DUPLICATE_fc43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_3869_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l957_l962_l944_l925_l935_l932_l940_DUPLICATE_fc43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_8901_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l957_l962_l944_l925_l935_l932_l940_DUPLICATE_fc43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l957_l944_DUPLICATE_44b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_3869_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l957_l944_DUPLICATE_44b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l925_c2_083e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l957_l944_l925_l935_l932_l940_DUPLICATE_9f25_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l957_l944_l925_l935_l932_l940_DUPLICATE_9f25_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l935_c7_182a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l957_l944_l925_l935_l932_l940_DUPLICATE_9f25_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l957_l944_l925_l935_l932_l940_DUPLICATE_9f25_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l957_l944_l925_l935_l932_l940_DUPLICATE_9f25_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l957_c7_3869_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l957_l944_l925_l935_l932_l940_DUPLICATE_9f25_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l948_c7_3000_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l952_c30_6e90_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l960_c21_5c33] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l960_c21_5c33_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l960_c31_ce50_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l957_c7_3869] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_3869_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_3869_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_3869_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_3869_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_3869_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_3869_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_3869_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_3869_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l946_l937_DUPLICATE_3660 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l946_l937_DUPLICATE_3660_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l946_l937_DUPLICATE_3660_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l946_l937_DUPLICATE_3660_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l946_l937_DUPLICATE_3660_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l962_c7_8901] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_8901_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_8901_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_8901_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_8901_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_8901_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_8901_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_8901_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_8901_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l962_c7_8901] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_8901_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_8901_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_8901_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_8901_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_8901_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_8901_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_8901_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_8901_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l941_c3_7fdf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l941_c3_7fdf_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l941_c3_7fdf_left;
     BIN_OP_OR_uxn_opcodes_h_l941_c3_7fdf_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l941_c3_7fdf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l941_c3_7fdf_return_output := BIN_OP_OR_uxn_opcodes_h_l941_c3_7fdf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l957_c7_3869] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_3869_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_3869_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_3869_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_3869_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_3869_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_3869_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_3869_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_3869_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l949_c3_029b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l949_c3_029b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l949_c3_029b_left;
     BIN_OP_OR_uxn_opcodes_h_l949_c3_029b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l949_c3_029b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l949_c3_029b_return_output := BIN_OP_OR_uxn_opcodes_h_l949_c3_029b_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l941_c3_7fdf_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l950_c11_38c6_right := VAR_BIN_OP_OR_uxn_opcodes_h_l949_c3_029b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l948_c7_3000_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l949_c3_029b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l957_c7_3869_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l960_c21_5c33_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l946_l937_DUPLICATE_3660_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l935_c7_182a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l946_l937_DUPLICATE_3660_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_3869_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l962_c7_8901_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_3869_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l962_c7_8901_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l948_c7_3000_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l957_c7_3869_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l948_c7_3000_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l957_c7_3869_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l948_c7_3000] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l948_c7_3000_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l948_c7_3000_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l948_c7_3000_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l948_c7_3000_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l948_c7_3000_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l948_c7_3000_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l948_c7_3000_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l948_c7_3000_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l957_c7_3869] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_3869_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_3869_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_3869_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_3869_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_3869_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_3869_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_3869_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_3869_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l948_c7_3000] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l948_c7_3000_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l948_c7_3000_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l948_c7_3000_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l948_c7_3000_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l948_c7_3000_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l948_c7_3000_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l948_c7_3000_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l948_c7_3000_return_output;

     -- t16_MUX[uxn_opcodes_h_l940_c7_3ec5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l940_c7_3ec5_cond <= VAR_t16_MUX_uxn_opcodes_h_l940_c7_3ec5_cond;
     t16_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue;
     t16_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output := t16_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l957_c7_3869] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l957_c7_3869_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l957_c7_3869_cond;
     result_u8_value_MUX_uxn_opcodes_h_l957_c7_3869_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l957_c7_3869_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l957_c7_3869_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l957_c7_3869_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l957_c7_3869_return_output := result_u8_value_MUX_uxn_opcodes_h_l957_c7_3869_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l950_c11_38c6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l950_c11_38c6_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l950_c11_38c6_left;
     BIN_OP_AND_uxn_opcodes_h_l950_c11_38c6_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l950_c11_38c6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l950_c11_38c6_return_output := BIN_OP_AND_uxn_opcodes_h_l950_c11_38c6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l957_c7_3869] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_3869_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_3869_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_3869_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_3869_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_3869_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_3869_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_3869_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_3869_return_output;

     -- n16_MUX[uxn_opcodes_h_l948_c7_3000] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l948_c7_3000_cond <= VAR_n16_MUX_uxn_opcodes_h_l948_c7_3000_cond;
     n16_MUX_uxn_opcodes_h_l948_c7_3000_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l948_c7_3000_iftrue;
     n16_MUX_uxn_opcodes_h_l948_c7_3000_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l948_c7_3000_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l948_c7_3000_return_output := n16_MUX_uxn_opcodes_h_l948_c7_3000_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l948_c7_3000_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l950_c11_38c6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l948_c7_3000_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l948_c7_3000_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l957_c7_3869_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l948_c7_3000_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l957_c7_3869_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l948_c7_3000_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l948_c7_3000_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l948_c7_3000_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l957_c7_3869_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l935_c7_182a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l944_c7_b5fb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_b5fb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_b5fb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l948_c7_3000] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l948_c7_3000_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l948_c7_3000_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l948_c7_3000_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l948_c7_3000_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l948_c7_3000_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l948_c7_3000_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l948_c7_3000_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l948_c7_3000_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l944_c7_b5fb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_b5fb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_b5fb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output;

     -- n16_MUX[uxn_opcodes_h_l944_c7_b5fb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l944_c7_b5fb_cond <= VAR_n16_MUX_uxn_opcodes_h_l944_c7_b5fb_cond;
     n16_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue;
     n16_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output := n16_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output;

     -- t16_MUX[uxn_opcodes_h_l935_c7_182a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l935_c7_182a_cond <= VAR_t16_MUX_uxn_opcodes_h_l935_c7_182a_cond;
     t16_MUX_uxn_opcodes_h_l935_c7_182a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l935_c7_182a_iftrue;
     t16_MUX_uxn_opcodes_h_l935_c7_182a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l935_c7_182a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l935_c7_182a_return_output := t16_MUX_uxn_opcodes_h_l935_c7_182a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l955_c21_5870] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l955_c21_5870_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l950_c11_38c6_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l948_c7_3000] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l948_c7_3000_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l948_c7_3000_cond;
     tmp16_MUX_uxn_opcodes_h_l948_c7_3000_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l948_c7_3000_iftrue;
     tmp16_MUX_uxn_opcodes_h_l948_c7_3000_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l948_c7_3000_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l948_c7_3000_return_output := tmp16_MUX_uxn_opcodes_h_l948_c7_3000_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l948_c7_3000] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l948_c7_3000_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l948_c7_3000_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l948_c7_3000_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l948_c7_3000_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l948_c7_3000_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l948_c7_3000_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l948_c7_3000_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l948_c7_3000_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l948_c7_3000_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l955_c21_5870_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l948_c7_3000_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l948_c7_3000_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse := VAR_t16_MUX_uxn_opcodes_h_l935_c7_182a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l948_c7_3000_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l940_c7_3ec5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3ec5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3ec5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output;

     -- t16_MUX[uxn_opcodes_h_l932_c7_fbf7] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l932_c7_fbf7_cond <= VAR_t16_MUX_uxn_opcodes_h_l932_c7_fbf7_cond;
     t16_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue;
     t16_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output := t16_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l944_c7_b5fb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l944_c7_b5fb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l944_c7_b5fb_cond;
     tmp16_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output := tmp16_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l944_c7_b5fb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_b5fb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_b5fb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output;

     -- n16_MUX[uxn_opcodes_h_l940_c7_3ec5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l940_c7_3ec5_cond <= VAR_n16_MUX_uxn_opcodes_h_l940_c7_3ec5_cond;
     n16_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue;
     n16_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output := n16_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l948_c7_3000] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l948_c7_3000_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l948_c7_3000_cond;
     result_u8_value_MUX_uxn_opcodes_h_l948_c7_3000_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l948_c7_3000_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l948_c7_3000_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l948_c7_3000_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l948_c7_3000_return_output := result_u8_value_MUX_uxn_opcodes_h_l948_c7_3000_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l944_c7_b5fb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_b5fb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_b5fb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l940_c7_3ec5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3ec5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3ec5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l935_c7_182a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l935_c7_182a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_182a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l948_c7_3000_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l925_c2_083e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l944_c7_b5fb] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l944_c7_b5fb_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l944_c7_b5fb_cond;
     result_u8_value_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l944_c7_b5fb_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l944_c7_b5fb_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output := result_u8_value_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output;

     -- n16_MUX[uxn_opcodes_h_l935_c7_182a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l935_c7_182a_cond <= VAR_n16_MUX_uxn_opcodes_h_l935_c7_182a_cond;
     n16_MUX_uxn_opcodes_h_l935_c7_182a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l935_c7_182a_iftrue;
     n16_MUX_uxn_opcodes_h_l935_c7_182a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l935_c7_182a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l935_c7_182a_return_output := n16_MUX_uxn_opcodes_h_l935_c7_182a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l940_c7_3ec5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3ec5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3ec5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l935_c7_182a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_182a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_182a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_182a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_182a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_182a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_182a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_182a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_182a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l935_c7_182a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l935_c7_182a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l935_c7_182a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l935_c7_182a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l935_c7_182a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l935_c7_182a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l935_c7_182a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l935_c7_182a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l935_c7_182a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l940_c7_3ec5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3ec5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3ec5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l940_c7_3ec5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l940_c7_3ec5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l940_c7_3ec5_cond;
     tmp16_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output := tmp16_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output;

     -- t16_MUX[uxn_opcodes_h_l925_c2_083e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l925_c2_083e_cond <= VAR_t16_MUX_uxn_opcodes_h_l925_c2_083e_cond;
     t16_MUX_uxn_opcodes_h_l925_c2_083e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l925_c2_083e_iftrue;
     t16_MUX_uxn_opcodes_h_l925_c2_083e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l925_c2_083e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l925_c2_083e_return_output := t16_MUX_uxn_opcodes_h_l925_c2_083e_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse := VAR_n16_MUX_uxn_opcodes_h_l935_c7_182a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_182a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_182a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l935_c7_182a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l935_c7_182a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l944_c7_b5fb_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l925_c2_083e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l935_c7_182a_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l935_c7_182a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_182a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_182a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_182a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_182a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_182a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_182a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_182a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_182a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l940_c7_3ec5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l940_c7_3ec5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c7_3ec5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c7_3ec5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c7_3ec5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output := result_u8_value_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l935_c7_182a] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l935_c7_182a_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l935_c7_182a_cond;
     tmp16_MUX_uxn_opcodes_h_l935_c7_182a_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l935_c7_182a_iftrue;
     tmp16_MUX_uxn_opcodes_h_l935_c7_182a_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l935_c7_182a_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l935_c7_182a_return_output := tmp16_MUX_uxn_opcodes_h_l935_c7_182a_return_output;

     -- n16_MUX[uxn_opcodes_h_l932_c7_fbf7] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l932_c7_fbf7_cond <= VAR_n16_MUX_uxn_opcodes_h_l932_c7_fbf7_cond;
     n16_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue;
     n16_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output := n16_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l932_c7_fbf7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l932_c7_fbf7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l932_c7_fbf7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l932_c7_fbf7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_fbf7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_fbf7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l935_c7_182a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_182a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_182a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_182a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_182a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_182a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_182a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_182a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_182a_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l925_c2_083e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l935_c7_182a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l935_c7_182a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l925_c2_083e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l925_c2_083e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l935_c7_182a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l940_c7_3ec5_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l935_c7_182a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l935_c7_182a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l935_c7_182a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l935_c7_182a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l935_c7_182a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l935_c7_182a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l935_c7_182a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l935_c7_182a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l935_c7_182a_return_output := result_u8_value_MUX_uxn_opcodes_h_l935_c7_182a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l925_c2_083e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l925_c2_083e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l925_c2_083e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l925_c2_083e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l925_c2_083e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l925_c2_083e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l925_c2_083e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l925_c2_083e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l925_c2_083e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l932_c7_fbf7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_fbf7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_fbf7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l932_c7_fbf7] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l932_c7_fbf7_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l932_c7_fbf7_cond;
     tmp16_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue;
     tmp16_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output := tmp16_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l932_c7_fbf7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_fbf7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_fbf7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output;

     -- n16_MUX[uxn_opcodes_h_l925_c2_083e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l925_c2_083e_cond <= VAR_n16_MUX_uxn_opcodes_h_l925_c2_083e_cond;
     n16_MUX_uxn_opcodes_h_l925_c2_083e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l925_c2_083e_iftrue;
     n16_MUX_uxn_opcodes_h_l925_c2_083e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l925_c2_083e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l925_c2_083e_return_output := n16_MUX_uxn_opcodes_h_l925_c2_083e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l925_c2_083e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l925_c2_083e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l925_c2_083e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l925_c2_083e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l925_c2_083e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l925_c2_083e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l925_c2_083e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l925_c2_083e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l925_c2_083e_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l925_c2_083e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l925_c2_083e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l925_c2_083e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l935_c7_182a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l925_c2_083e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l932_c7_fbf7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l932_c7_fbf7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l932_c7_fbf7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l932_c7_fbf7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l932_c7_fbf7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output := result_u8_value_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l925_c2_083e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l925_c2_083e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l925_c2_083e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l925_c2_083e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l925_c2_083e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l925_c2_083e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l925_c2_083e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l925_c2_083e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l925_c2_083e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l925_c2_083e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l925_c2_083e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l925_c2_083e_cond;
     tmp16_MUX_uxn_opcodes_h_l925_c2_083e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l925_c2_083e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l925_c2_083e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l925_c2_083e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l925_c2_083e_return_output := tmp16_MUX_uxn_opcodes_h_l925_c2_083e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l925_c2_083e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l925_c2_083e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l925_c2_083e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l925_c2_083e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l925_c2_083e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l925_c2_083e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l925_c2_083e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l925_c2_083e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l925_c2_083e_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l925_c2_083e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l932_c7_fbf7_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l925_c2_083e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l925_c2_083e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l925_c2_083e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l925_c2_083e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l925_c2_083e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l925_c2_083e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l925_c2_083e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l925_c2_083e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l925_c2_083e_return_output := result_u8_value_MUX_uxn_opcodes_h_l925_c2_083e_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l921_l967_DUPLICATE_9342 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l921_l967_DUPLICATE_9342_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_eae7(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l925_c2_083e_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l925_c2_083e_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l925_c2_083e_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l925_c2_083e_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l925_c2_083e_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l921_l967_DUPLICATE_9342_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_eae7_uxn_opcodes_h_l921_l967_DUPLICATE_9342_return_output;
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
