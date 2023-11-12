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
-- Submodules: 77
entity sta2_0CLK_7d7b1f8b is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta2_0CLK_7d7b1f8b;
architecture arch of sta2_0CLK_7d7b1f8b is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2213_c6_6c2d]
signal BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2213_c1_aa38]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_aa38_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_aa38_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_aa38_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_aa38_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2213_c2_3a0f]
signal n16_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2213_c2_3a0f]
signal t16_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2213_c2_3a0f]
signal result_u16_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2213_c2_3a0f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2213_c2_3a0f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2213_c2_3a0f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2213_c2_3a0f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2213_c2_3a0f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2213_c2_3a0f]
signal result_u8_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2214_c3_243c[uxn_opcodes_h_l2214_c3_243c]
signal printf_uxn_opcodes_h_l2214_c3_243c_uxn_opcodes_h_l2214_c3_243c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2218_c11_08da]
signal BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2218_c7_e917]
signal n16_MUX_uxn_opcodes_h_l2218_c7_e917_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2218_c7_e917_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2218_c7_e917]
signal t16_MUX_uxn_opcodes_h_l2218_c7_e917_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2218_c7_e917_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2218_c7_e917]
signal result_u16_value_MUX_uxn_opcodes_h_l2218_c7_e917_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2218_c7_e917_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2218_c7_e917]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_e917_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_e917_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2218_c7_e917]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_e917_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_e917_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2218_c7_e917]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_e917_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_e917_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2218_c7_e917]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_e917_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_e917_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2218_c7_e917]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_e917_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_e917_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2218_c7_e917]
signal result_u8_value_MUX_uxn_opcodes_h_l2218_c7_e917_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2218_c7_e917_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2221_c11_e517]
signal BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2221_c7_75aa]
signal n16_MUX_uxn_opcodes_h_l2221_c7_75aa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2221_c7_75aa]
signal t16_MUX_uxn_opcodes_h_l2221_c7_75aa_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2221_c7_75aa]
signal result_u16_value_MUX_uxn_opcodes_h_l2221_c7_75aa_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2221_c7_75aa]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_75aa_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2221_c7_75aa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_75aa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2221_c7_75aa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2221_c7_75aa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_75aa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2221_c7_75aa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2221_c7_75aa]
signal result_u8_value_MUX_uxn_opcodes_h_l2221_c7_75aa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2226_c11_b3d5]
signal BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2226_c7_7cda]
signal n16_MUX_uxn_opcodes_h_l2226_c7_7cda_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2226_c7_7cda]
signal t16_MUX_uxn_opcodes_h_l2226_c7_7cda_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2226_c7_7cda]
signal result_u16_value_MUX_uxn_opcodes_h_l2226_c7_7cda_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2226_c7_7cda]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_7cda_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2226_c7_7cda]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_7cda_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2226_c7_7cda]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2226_c7_7cda]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_7cda_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2226_c7_7cda]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2226_c7_7cda]
signal result_u8_value_MUX_uxn_opcodes_h_l2226_c7_7cda_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2227_c3_d277]
signal BIN_OP_OR_uxn_opcodes_h_l2227_c3_d277_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2227_c3_d277_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2227_c3_d277_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2230_c11_e34d]
signal BIN_OP_EQ_uxn_opcodes_h_l2230_c11_e34d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2230_c11_e34d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2230_c11_e34d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2230_c7_8831]
signal n16_MUX_uxn_opcodes_h_l2230_c7_8831_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2230_c7_8831_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2230_c7_8831]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_8831_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_8831_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2230_c7_8831]
signal result_u16_value_MUX_uxn_opcodes_h_l2230_c7_8831_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2230_c7_8831_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2230_c7_8831]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_8831_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_8831_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2230_c7_8831]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_8831_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_8831_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2230_c7_8831]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_8831_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_8831_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2230_c7_8831]
signal result_u8_value_MUX_uxn_opcodes_h_l2230_c7_8831_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2230_c7_8831_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2234_c11_5785]
signal BIN_OP_EQ_uxn_opcodes_h_l2234_c11_5785_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2234_c11_5785_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2234_c11_5785_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2234_c7_7ec2]
signal n16_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2234_c7_7ec2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2234_c7_7ec2]
signal result_u16_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2234_c7_7ec2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2234_c7_7ec2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2234_c7_7ec2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2234_c7_7ec2]
signal result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2235_c3_7303]
signal BIN_OP_OR_uxn_opcodes_h_l2235_c3_7303_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2235_c3_7303_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2235_c3_7303_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2237_c30_25c9]
signal sp_relative_shift_uxn_opcodes_h_l2237_c30_25c9_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2237_c30_25c9_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2237_c30_25c9_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2237_c30_25c9_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2240_c31_732d]
signal CONST_SR_8_uxn_opcodes_h_l2240_c31_732d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2240_c31_732d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2242_c11_2d2d]
signal BIN_OP_EQ_uxn_opcodes_h_l2242_c11_2d2d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2242_c11_2d2d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2242_c11_2d2d_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2242_c7_5d90]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_5d90_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2242_c7_5d90]
signal result_u16_value_MUX_uxn_opcodes_h_l2242_c7_5d90_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2242_c7_5d90]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_5d90_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2242_c7_5d90]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_5d90_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2242_c7_5d90]
signal result_u8_value_MUX_uxn_opcodes_h_l2242_c7_5d90_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2244_c22_8b58]
signal BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_8b58_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_8b58_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_8b58_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2247_c11_b5fa]
signal BIN_OP_EQ_uxn_opcodes_h_l2247_c11_b5fa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2247_c11_b5fa_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2247_c11_b5fa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2247_c7_852f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_852f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_852f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_852f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_852f_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2247_c7_852f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_852f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_852f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_852f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_852f_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_2453
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_2453_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_2453_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8efe( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d
BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d_left,
BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d_right,
BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_aa38
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_aa38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_aa38_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_aa38_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_aa38_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_aa38_return_output);

-- n16_MUX_uxn_opcodes_h_l2213_c2_3a0f
n16_MUX_uxn_opcodes_h_l2213_c2_3a0f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond,
n16_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue,
n16_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse,
n16_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output);

-- t16_MUX_uxn_opcodes_h_l2213_c2_3a0f
t16_MUX_uxn_opcodes_h_l2213_c2_3a0f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond,
t16_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue,
t16_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse,
t16_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2213_c2_3a0f
result_u16_value_MUX_uxn_opcodes_h_l2213_c2_3a0f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond,
result_u16_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_3a0f
result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_3a0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_3a0f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_3a0f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f
result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_3a0f
result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_3a0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2213_c2_3a0f
result_u8_value_MUX_uxn_opcodes_h_l2213_c2_3a0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output);

-- printf_uxn_opcodes_h_l2214_c3_243c_uxn_opcodes_h_l2214_c3_243c
printf_uxn_opcodes_h_l2214_c3_243c_uxn_opcodes_h_l2214_c3_243c : entity work.printf_uxn_opcodes_h_l2214_c3_243c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2214_c3_243c_uxn_opcodes_h_l2214_c3_243c_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da
BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da_left,
BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da_right,
BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da_return_output);

-- n16_MUX_uxn_opcodes_h_l2218_c7_e917
n16_MUX_uxn_opcodes_h_l2218_c7_e917 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2218_c7_e917_cond,
n16_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue,
n16_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse,
n16_MUX_uxn_opcodes_h_l2218_c7_e917_return_output);

-- t16_MUX_uxn_opcodes_h_l2218_c7_e917
t16_MUX_uxn_opcodes_h_l2218_c7_e917 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2218_c7_e917_cond,
t16_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue,
t16_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse,
t16_MUX_uxn_opcodes_h_l2218_c7_e917_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2218_c7_e917
result_u16_value_MUX_uxn_opcodes_h_l2218_c7_e917 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2218_c7_e917_cond,
result_u16_value_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2218_c7_e917_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_e917
result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_e917 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_e917_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_e917_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_e917
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_e917 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_e917_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_e917_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_e917
result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_e917 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_e917_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_e917_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_e917
result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_e917 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_e917_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_e917_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_e917
result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_e917 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_e917_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_e917_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2218_c7_e917
result_u8_value_MUX_uxn_opcodes_h_l2218_c7_e917 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2218_c7_e917_cond,
result_u8_value_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2218_c7_e917_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517
BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517_left,
BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517_right,
BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517_return_output);

-- n16_MUX_uxn_opcodes_h_l2221_c7_75aa
n16_MUX_uxn_opcodes_h_l2221_c7_75aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2221_c7_75aa_cond,
n16_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue,
n16_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse,
n16_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output);

-- t16_MUX_uxn_opcodes_h_l2221_c7_75aa
t16_MUX_uxn_opcodes_h_l2221_c7_75aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2221_c7_75aa_cond,
t16_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue,
t16_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse,
t16_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2221_c7_75aa
result_u16_value_MUX_uxn_opcodes_h_l2221_c7_75aa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2221_c7_75aa_cond,
result_u16_value_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_75aa
result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_75aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_75aa_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_75aa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_75aa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_75aa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_75aa
result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_75aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_75aa
result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_75aa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_75aa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_75aa
result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_75aa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2221_c7_75aa
result_u8_value_MUX_uxn_opcodes_h_l2221_c7_75aa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2221_c7_75aa_cond,
result_u8_value_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5
BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5_left,
BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5_right,
BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5_return_output);

-- n16_MUX_uxn_opcodes_h_l2226_c7_7cda
n16_MUX_uxn_opcodes_h_l2226_c7_7cda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2226_c7_7cda_cond,
n16_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue,
n16_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse,
n16_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output);

-- t16_MUX_uxn_opcodes_h_l2226_c7_7cda
t16_MUX_uxn_opcodes_h_l2226_c7_7cda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2226_c7_7cda_cond,
t16_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue,
t16_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse,
t16_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2226_c7_7cda
result_u16_value_MUX_uxn_opcodes_h_l2226_c7_7cda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2226_c7_7cda_cond,
result_u16_value_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_7cda
result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_7cda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_7cda_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_7cda
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_7cda : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_7cda_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_7cda
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_7cda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_7cda
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_7cda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_7cda_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_7cda
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_7cda : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2226_c7_7cda
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_7cda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_7cda_cond,
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2227_c3_d277
BIN_OP_OR_uxn_opcodes_h_l2227_c3_d277 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2227_c3_d277_left,
BIN_OP_OR_uxn_opcodes_h_l2227_c3_d277_right,
BIN_OP_OR_uxn_opcodes_h_l2227_c3_d277_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2230_c11_e34d
BIN_OP_EQ_uxn_opcodes_h_l2230_c11_e34d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2230_c11_e34d_left,
BIN_OP_EQ_uxn_opcodes_h_l2230_c11_e34d_right,
BIN_OP_EQ_uxn_opcodes_h_l2230_c11_e34d_return_output);

-- n16_MUX_uxn_opcodes_h_l2230_c7_8831
n16_MUX_uxn_opcodes_h_l2230_c7_8831 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2230_c7_8831_cond,
n16_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue,
n16_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse,
n16_MUX_uxn_opcodes_h_l2230_c7_8831_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_8831
result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_8831 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_8831_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_8831_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2230_c7_8831
result_u16_value_MUX_uxn_opcodes_h_l2230_c7_8831 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2230_c7_8831_cond,
result_u16_value_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2230_c7_8831_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_8831
result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_8831 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_8831_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_8831_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_8831
result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_8831 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_8831_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_8831_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_8831
result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_8831 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_8831_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_8831_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2230_c7_8831
result_u8_value_MUX_uxn_opcodes_h_l2230_c7_8831 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2230_c7_8831_cond,
result_u8_value_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2230_c7_8831_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2234_c11_5785
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_5785 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_5785_left,
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_5785_right,
BIN_OP_EQ_uxn_opcodes_h_l2234_c11_5785_return_output);

-- n16_MUX_uxn_opcodes_h_l2234_c7_7ec2
n16_MUX_uxn_opcodes_h_l2234_c7_7ec2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond,
n16_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue,
n16_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse,
n16_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_7ec2
result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_7ec2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2234_c7_7ec2
result_u16_value_MUX_uxn_opcodes_h_l2234_c7_7ec2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond,
result_u16_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7ec2
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7ec2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7ec2
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7ec2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2235_c3_7303
BIN_OP_OR_uxn_opcodes_h_l2235_c3_7303 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2235_c3_7303_left,
BIN_OP_OR_uxn_opcodes_h_l2235_c3_7303_right,
BIN_OP_OR_uxn_opcodes_h_l2235_c3_7303_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2237_c30_25c9
sp_relative_shift_uxn_opcodes_h_l2237_c30_25c9 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2237_c30_25c9_ins,
sp_relative_shift_uxn_opcodes_h_l2237_c30_25c9_x,
sp_relative_shift_uxn_opcodes_h_l2237_c30_25c9_y,
sp_relative_shift_uxn_opcodes_h_l2237_c30_25c9_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2240_c31_732d
CONST_SR_8_uxn_opcodes_h_l2240_c31_732d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2240_c31_732d_x,
CONST_SR_8_uxn_opcodes_h_l2240_c31_732d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2242_c11_2d2d
BIN_OP_EQ_uxn_opcodes_h_l2242_c11_2d2d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2242_c11_2d2d_left,
BIN_OP_EQ_uxn_opcodes_h_l2242_c11_2d2d_right,
BIN_OP_EQ_uxn_opcodes_h_l2242_c11_2d2d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_5d90
result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_5d90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_5d90_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2242_c7_5d90
result_u16_value_MUX_uxn_opcodes_h_l2242_c7_5d90 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2242_c7_5d90_cond,
result_u16_value_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_5d90
result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_5d90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_5d90_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_5d90
result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_5d90 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_5d90_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2242_c7_5d90
result_u8_value_MUX_uxn_opcodes_h_l2242_c7_5d90 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2242_c7_5d90_cond,
result_u8_value_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_8b58
BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_8b58 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_8b58_left,
BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_8b58_right,
BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_8b58_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2247_c11_b5fa
BIN_OP_EQ_uxn_opcodes_h_l2247_c11_b5fa : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2247_c11_b5fa_left,
BIN_OP_EQ_uxn_opcodes_h_l2247_c11_b5fa_right,
BIN_OP_EQ_uxn_opcodes_h_l2247_c11_b5fa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_852f
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_852f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_852f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_852f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_852f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_852f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_852f
result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_852f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_852f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_852f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_852f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_852f_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_2453
CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_2453 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_2453_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_2453_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_aa38_return_output,
 n16_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output,
 t16_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da_return_output,
 n16_MUX_uxn_opcodes_h_l2218_c7_e917_return_output,
 t16_MUX_uxn_opcodes_h_l2218_c7_e917_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2218_c7_e917_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_e917_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_e917_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_e917_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_e917_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_e917_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2218_c7_e917_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517_return_output,
 n16_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output,
 t16_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5_return_output,
 n16_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output,
 t16_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2227_c3_d277_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2230_c11_e34d_return_output,
 n16_MUX_uxn_opcodes_h_l2230_c7_8831_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_8831_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2230_c7_8831_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_8831_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_8831_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_8831_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2230_c7_8831_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2234_c11_5785_return_output,
 n16_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2235_c3_7303_return_output,
 sp_relative_shift_uxn_opcodes_h_l2237_c30_25c9_return_output,
 CONST_SR_8_uxn_opcodes_h_l2240_c31_732d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2242_c11_2d2d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_8b58_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2247_c11_b5fa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_852f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_852f_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_2453_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_aa38_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_aa38_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_aa38_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_aa38_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2218_c7_e917_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2218_c7_e917_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_e917_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_e917_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2215_c3_2a89 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_e917_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_e917_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_e917_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_e917_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_e917_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2214_c3_243c_uxn_opcodes_h_l2214_c3_243c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2218_c7_e917_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2218_c7_e917_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_e917_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_e917_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2219_c3_a7c2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_e917_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_e917_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_e917_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_e917_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_e917_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2221_c7_75aa_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2221_c7_75aa_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_75aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_75aa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2224_c3_3655 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_75aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_75aa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_75aa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2230_c7_8831_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2226_c7_7cda_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2226_c7_7cda_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_8831_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_7cda_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_8831_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_7cda_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2228_c3_4f3e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2226_c7_7cda_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_7cda_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_8831_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_8831_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_7cda_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_8831_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_8831_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_7cda_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_d277_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_d277_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_d277_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_e34d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_e34d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_e34d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2230_c7_8831_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_8831_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_8831_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_8831_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_8831_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_8831_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_8831_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_5785_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_5785_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_5785_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_7303_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_7303_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_7303_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_25c9_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_25c9_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_25c9_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_25c9_return_output : signed(3 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2240_c31_732d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2240_c31_732d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2240_c21_0729_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_2d2d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_2d2d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_2d2d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_852f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_5d90_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l2244_c3_3a27 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_5d90_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_5d90_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_852f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_5d90_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_5d90_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_8b58_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_8b58_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_8b58_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2245_c21_a073_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_b5fa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_b5fa_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_b5fa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_852f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_852f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_852f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_852f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_852f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_852f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_e26c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2218_l2247_l2213_l2242_l2230_l2226_l2221_DUPLICATE_01e9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_0b57_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2218_l2213_l2234_l2230_l2226_l2221_DUPLICATE_629d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_9413_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2218_l2247_l2242_l2234_l2230_l2226_l2221_DUPLICATE_e96b_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2227_l2235_l2222_l2231_DUPLICATE_69dc_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_2453_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_2453_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8efe_uxn_opcodes_h_l2252_l2209_DUPLICATE_c874_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_e34d_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_852f_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_8b58_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_b5fa_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2224_c3_3655 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2224_c3_3655;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2215_c3_2a89 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2215_c3_2a89;
     VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_25c9_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_25c9_y := to_signed(-4, 4);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_852f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_2d2d_right := to_unsigned(6, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_5785_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_aa38_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2219_c3_a7c2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2219_c3_a7c2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2228_c3_4f3e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2228_c3_4f3e;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_aa38_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_25c9_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_7303_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_e34d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_5785_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_2d2d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_b5fa_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_d277_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_8b58_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2230_c11_e34d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2230_c11_e34d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_e34d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2230_c11_e34d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_e34d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_e34d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2230_c11_e34d_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2226_c7_7cda] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2226_c7_7cda_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2218_l2213_l2234_l2230_l2226_l2221_DUPLICATE_629d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2218_l2213_l2234_l2230_l2226_l2221_DUPLICATE_629d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2221_c11_e517] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517_left;
     BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517_return_output := BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2234_c11_5785] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2234_c11_5785_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_5785_left;
     BIN_OP_EQ_uxn_opcodes_h_l2234_c11_5785_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_5785_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_5785_return_output := BIN_OP_EQ_uxn_opcodes_h_l2234_c11_5785_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2218_l2247_l2213_l2242_l2230_l2226_l2221_DUPLICATE_01e9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2218_l2247_l2213_l2242_l2230_l2226_l2221_DUPLICATE_01e9_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2242_c11_2d2d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2242_c11_2d2d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_2d2d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2242_c11_2d2d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_2d2d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_2d2d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2242_c11_2d2d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2218_l2247_l2242_l2234_l2230_l2226_l2221_DUPLICATE_e96b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2218_l2247_l2242_l2234_l2230_l2226_l2221_DUPLICATE_e96b_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2218_c11_08da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da_left;
     BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da_return_output := BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2213_c6_6c2d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2245_c21_a073] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2245_c21_a073_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_e26c LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_e26c_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_0b57 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_0b57_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2226_c11_b3d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2244_c22_8b58] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_8b58_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_8b58_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_8b58_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_8b58_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_8b58_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_8b58_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2227_l2235_l2222_l2231_DUPLICATE_69dc LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2227_l2235_l2222_l2231_DUPLICATE_69dc_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_9413 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_9413_return_output := result.u8_value;

     -- sp_relative_shift[uxn_opcodes_h_l2237_c30_25c9] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2237_c30_25c9_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_25c9_ins;
     sp_relative_shift_uxn_opcodes_h_l2237_c30_25c9_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_25c9_x;
     sp_relative_shift_uxn_opcodes_h_l2237_c30_25c9_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_25c9_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_25c9_return_output := sp_relative_shift_uxn_opcodes_h_l2237_c30_25c9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2247_c11_b5fa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2247_c11_b5fa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_b5fa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2247_c11_b5fa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_b5fa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_b5fa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2247_c11_b5fa_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_aa38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2213_c6_6c2d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2218_c7_e917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_e917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_e917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_e917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_e917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_e917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_e917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_e917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2218_c7_e917_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2218_c11_08da_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2221_c7_75aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_75aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_75aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_75aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_75aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_75aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2221_c7_75aa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2221_c11_e517_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2226_c7_7cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_7cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_7cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_7cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_7cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_7cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2226_c7_7cda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2226_c11_b3d5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2230_c7_8831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_e34d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_8831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_e34d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_8831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_e34d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_8831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_e34d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_8831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_e34d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_8831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_e34d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_8831_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2230_c11_e34d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_5785_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_5785_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_5785_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_5785_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_5785_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_5785_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2234_c11_5785_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_5d90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_2d2d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_5d90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_2d2d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_5d90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_2d2d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_5d90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_2d2d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_5d90_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2242_c11_2d2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_852f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_b5fa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_852f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2247_c11_b5fa_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l2244_c3_3a27 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2244_c22_8b58_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_d277_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2227_l2235_l2222_l2231_DUPLICATE_69dc_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_7303_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2227_l2235_l2222_l2231_DUPLICATE_69dc_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_2453_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2227_l2235_l2222_l2231_DUPLICATE_69dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2245_c21_a073_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2218_l2213_l2234_l2230_l2226_l2221_DUPLICATE_629d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2218_l2213_l2234_l2230_l2226_l2221_DUPLICATE_629d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2218_l2213_l2234_l2230_l2226_l2221_DUPLICATE_629d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2218_l2213_l2234_l2230_l2226_l2221_DUPLICATE_629d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2218_l2213_l2234_l2230_l2226_l2221_DUPLICATE_629d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2218_l2213_l2234_l2230_l2226_l2221_DUPLICATE_629d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_e26c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_e26c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_e26c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_e26c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_e26c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_e26c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2218_l2247_l2242_l2234_l2230_l2226_l2221_DUPLICATE_e96b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2218_l2247_l2242_l2234_l2230_l2226_l2221_DUPLICATE_e96b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2218_l2247_l2242_l2234_l2230_l2226_l2221_DUPLICATE_e96b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2218_l2247_l2242_l2234_l2230_l2226_l2221_DUPLICATE_e96b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2218_l2247_l2242_l2234_l2230_l2226_l2221_DUPLICATE_e96b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2218_l2247_l2242_l2234_l2230_l2226_l2221_DUPLICATE_e96b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_852f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2218_l2247_l2242_l2234_l2230_l2226_l2221_DUPLICATE_e96b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2218_l2247_l2213_l2242_l2230_l2226_l2221_DUPLICATE_01e9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2218_l2247_l2213_l2242_l2230_l2226_l2221_DUPLICATE_01e9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2218_l2247_l2213_l2242_l2230_l2226_l2221_DUPLICATE_01e9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2218_l2247_l2213_l2242_l2230_l2226_l2221_DUPLICATE_01e9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2218_l2247_l2213_l2242_l2230_l2226_l2221_DUPLICATE_01e9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2218_l2247_l2213_l2242_l2230_l2226_l2221_DUPLICATE_01e9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_852f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2218_l2247_l2213_l2242_l2230_l2226_l2221_DUPLICATE_01e9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_0b57_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_0b57_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_0b57_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_0b57_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_0b57_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_0b57_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_9413_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_9413_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_9413_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_9413_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_9413_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2218_l2213_l2242_l2230_l2226_l2221_DUPLICATE_9413_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2226_c7_7cda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2237_c30_25c9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue := VAR_result_u16_value_uxn_opcodes_h_l2244_c3_3a27;
     -- BIN_OP_OR[uxn_opcodes_h_l2235_c3_7303] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2235_c3_7303_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_7303_left;
     BIN_OP_OR_uxn_opcodes_h_l2235_c3_7303_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_7303_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_7303_return_output := BIN_OP_OR_uxn_opcodes_h_l2235_c3_7303_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2247_c7_852f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_852f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_852f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_852f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_852f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_852f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_852f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_852f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_852f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2213_c1_aa38] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_aa38_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_aa38_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_aa38_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_aa38_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_aa38_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_aa38_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_aa38_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_aa38_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2226_c7_7cda] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_7cda_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_7cda_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2242_c7_5d90] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2242_c7_5d90_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_5d90_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output := result_u16_value_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2242_c7_5d90] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_5d90_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_5d90_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2242_c7_5d90] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2242_c7_5d90_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_5d90_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output := result_u8_value_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2234_c7_7ec2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_2453 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_2453_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_2453_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_2453_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_2453_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2227_c3_d277] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2227_c3_d277_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_d277_left;
     BIN_OP_OR_uxn_opcodes_h_l2227_c3_d277_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_d277_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_d277_return_output := BIN_OP_OR_uxn_opcodes_h_l2227_c3_d277_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2247_c7_852f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_852f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_852f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_852f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_852f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_852f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_852f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_852f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_852f_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2227_c3_d277_return_output;
     VAR_CONST_SR_8_uxn_opcodes_h_l2240_c31_732d_x := VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_7303_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2235_c3_7303_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_2453_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2232_l2223_DUPLICATE_2453_return_output;
     VAR_printf_uxn_opcodes_h_l2214_c3_243c_uxn_opcodes_h_l2214_c3_243c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2213_c1_aa38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2247_c7_852f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2247_c7_852f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output;
     -- printf_uxn_opcodes_h_l2214_c3_243c[uxn_opcodes_h_l2214_c3_243c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2214_c3_243c_uxn_opcodes_h_l2214_c3_243c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2214_c3_243c_uxn_opcodes_h_l2214_c3_243c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2242_c7_5d90] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_5d90_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_5d90_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2242_c7_5d90] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_5d90_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_5d90_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_5d90_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_5d90_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output;

     -- n16_MUX[uxn_opcodes_h_l2234_c7_7ec2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond;
     n16_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue;
     n16_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output := n16_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2240_c31_732d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2240_c31_732d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2240_c31_732d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2240_c31_732d_return_output := CONST_SR_8_uxn_opcodes_h_l2240_c31_732d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2221_c7_75aa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_75aa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_75aa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2234_c7_7ec2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2234_c7_7ec2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output := result_u16_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2230_c7_8831] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_8831_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_8831_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_8831_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_8831_return_output;

     -- t16_MUX[uxn_opcodes_h_l2226_c7_7cda] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2226_c7_7cda_cond <= VAR_t16_MUX_uxn_opcodes_h_l2226_c7_7cda_cond;
     t16_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue;
     t16_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output := t16_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output;

     -- Submodule level 3
     VAR_n16_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2242_c7_5d90_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2230_c7_8831_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2226_c7_7cda] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output;

     -- t16_MUX[uxn_opcodes_h_l2221_c7_75aa] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2221_c7_75aa_cond <= VAR_t16_MUX_uxn_opcodes_h_l2221_c7_75aa_cond;
     t16_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue;
     t16_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output := t16_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2234_c7_7ec2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2240_c21_0729] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2240_c21_0729_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2240_c31_732d_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2218_c7_e917] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_e917_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_e917_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_e917_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_e917_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2230_c7_8831] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2230_c7_8831_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_8831_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_8831_return_output := result_u16_value_MUX_uxn_opcodes_h_l2230_c7_8831_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2234_c7_7ec2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2230_c7_8831] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2230_c7_8831_cond <= VAR_n16_MUX_uxn_opcodes_h_l2230_c7_8831_cond;
     n16_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue;
     n16_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2230_c7_8831_return_output := n16_MUX_uxn_opcodes_h_l2230_c7_8831_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2230_c7_8831] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_8831_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_8831_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_8831_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_8831_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2240_c21_0729_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2230_c7_8831_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2230_c7_8831_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2218_c7_e917_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2230_c7_8831_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output;
     -- t16_MUX[uxn_opcodes_h_l2218_c7_e917] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2218_c7_e917_cond <= VAR_t16_MUX_uxn_opcodes_h_l2218_c7_e917_cond;
     t16_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue;
     t16_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2218_c7_e917_return_output := t16_MUX_uxn_opcodes_h_l2218_c7_e917_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2230_c7_8831] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_8831_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_8831_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_8831_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_8831_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2230_c7_8831] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_8831_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_8831_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_8831_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_8831_return_output;

     -- n16_MUX[uxn_opcodes_h_l2226_c7_7cda] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2226_c7_7cda_cond <= VAR_n16_MUX_uxn_opcodes_h_l2226_c7_7cda_cond;
     n16_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue;
     n16_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output := n16_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2213_c2_3a0f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2226_c7_7cda] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2221_c7_75aa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2226_c7_7cda] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2226_c7_7cda_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_7cda_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output := result_u16_value_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2234_c7_7ec2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2230_c7_8831_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2230_c7_8831_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2234_c7_7ec2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2218_c7_e917_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2226_c7_7cda] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_7cda_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_7cda_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2230_c7_8831] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2230_c7_8831_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_8831_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_8831_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_8831_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_8831_return_output := result_u8_value_MUX_uxn_opcodes_h_l2230_c7_8831_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2226_c7_7cda] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_7cda_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_7cda_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output;

     -- n16_MUX[uxn_opcodes_h_l2221_c7_75aa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2221_c7_75aa_cond <= VAR_n16_MUX_uxn_opcodes_h_l2221_c7_75aa_cond;
     n16_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue;
     n16_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output := n16_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2221_c7_75aa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2218_c7_e917] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_e917_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_e917_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_e917_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_e917_return_output;

     -- t16_MUX[uxn_opcodes_h_l2213_c2_3a0f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond;
     t16_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue;
     t16_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output := t16_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2221_c7_75aa] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2221_c7_75aa_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_75aa_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output := result_u16_value_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2218_c7_e917_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2230_c7_8831_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2213_c2_3a0f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2218_c7_e917] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2218_c7_e917_cond <= VAR_n16_MUX_uxn_opcodes_h_l2218_c7_e917_cond;
     n16_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue;
     n16_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2218_c7_e917_return_output := n16_MUX_uxn_opcodes_h_l2218_c7_e917_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2221_c7_75aa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_75aa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_75aa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2218_c7_e917] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2218_c7_e917_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_e917_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_e917_return_output := result_u16_value_MUX_uxn_opcodes_h_l2218_c7_e917_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2226_c7_7cda] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2226_c7_7cda_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_7cda_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_7cda_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_7cda_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output := result_u8_value_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2218_c7_e917] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_e917_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_e917_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_e917_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_e917_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2221_c7_75aa] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_75aa_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_75aa_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2218_c7_e917_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2218_c7_e917_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2218_c7_e917_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2226_c7_7cda_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l2213_c2_3a0f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output := result_u16_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2218_c7_e917] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_e917_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_e917_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_e917_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_e917_return_output;

     -- n16_MUX[uxn_opcodes_h_l2213_c2_3a0f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond;
     n16_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue;
     n16_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output := n16_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2218_c7_e917] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_e917_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_e917_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_e917_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_e917_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2213_c2_3a0f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2221_c7_75aa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2221_c7_75aa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_75aa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_75aa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_75aa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output := result_u8_value_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2218_c7_e917_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2218_c7_e917_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2221_c7_75aa_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2213_c2_3a0f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2213_c2_3a0f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2218_c7_e917] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2218_c7_e917_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_e917_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_e917_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_e917_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_e917_return_output := result_u8_value_MUX_uxn_opcodes_h_l2218_c7_e917_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2218_c7_e917_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2213_c2_3a0f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8efe_uxn_opcodes_h_l2252_l2209_DUPLICATE_c874 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8efe_uxn_opcodes_h_l2252_l2209_DUPLICATE_c874_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8efe(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2213_c2_3a0f_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8efe_uxn_opcodes_h_l2252_l2209_DUPLICATE_c874_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8efe_uxn_opcodes_h_l2252_l2209_DUPLICATE_c874_return_output;
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
