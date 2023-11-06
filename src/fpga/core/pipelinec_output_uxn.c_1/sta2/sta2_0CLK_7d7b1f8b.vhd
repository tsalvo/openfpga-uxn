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
-- BIN_OP_EQ[uxn_opcodes_h_l2214_c6_6764]
signal BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2214_c1_7dde]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2214_c1_7dde_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2214_c1_7dde_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2214_c1_7dde_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2214_c1_7dde_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2214_c2_7a0f]
signal n16_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2214_c2_7a0f]
signal result_u16_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2214_c2_7a0f]
signal result_u8_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2214_c2_7a0f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2214_c2_7a0f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2214_c2_7a0f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2214_c2_7a0f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2214_c2_7a0f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2214_c2_7a0f]
signal t16_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2215_c3_a32e[uxn_opcodes_h_l2215_c3_a32e]
signal printf_uxn_opcodes_h_l2215_c3_a32e_uxn_opcodes_h_l2215_c3_a32e_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2219_c11_44f3]
signal BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2219_c7_2237]
signal n16_MUX_uxn_opcodes_h_l2219_c7_2237_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2219_c7_2237_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2219_c7_2237]
signal result_u16_value_MUX_uxn_opcodes_h_l2219_c7_2237_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2219_c7_2237_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2219_c7_2237]
signal result_u8_value_MUX_uxn_opcodes_h_l2219_c7_2237_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2219_c7_2237_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2219_c7_2237]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_2237_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_2237_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2219_c7_2237]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_2237_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_2237_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2219_c7_2237]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_2237_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_2237_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2219_c7_2237]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_2237_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_2237_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2219_c7_2237]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2219_c7_2237_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2219_c7_2237_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2219_c7_2237]
signal t16_MUX_uxn_opcodes_h_l2219_c7_2237_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2219_c7_2237_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2222_c11_d0dc]
signal BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2222_c7_3ef6]
signal n16_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2222_c7_3ef6]
signal result_u16_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2222_c7_3ef6]
signal result_u8_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2222_c7_3ef6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2222_c7_3ef6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2222_c7_3ef6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2222_c7_3ef6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2222_c7_3ef6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2222_c7_3ef6]
signal t16_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2227_c11_37a5]
signal BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2227_c7_9e6a]
signal n16_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2227_c7_9e6a]
signal result_u16_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2227_c7_9e6a]
signal result_u8_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2227_c7_9e6a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2227_c7_9e6a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2227_c7_9e6a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2227_c7_9e6a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2227_c7_9e6a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2227_c7_9e6a]
signal t16_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2228_c3_f011]
signal BIN_OP_OR_uxn_opcodes_h_l2228_c3_f011_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2228_c3_f011_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2228_c3_f011_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2231_c11_b98a]
signal BIN_OP_EQ_uxn_opcodes_h_l2231_c11_b98a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2231_c11_b98a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2231_c11_b98a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2231_c7_fda3]
signal n16_MUX_uxn_opcodes_h_l2231_c7_fda3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2231_c7_fda3]
signal result_u16_value_MUX_uxn_opcodes_h_l2231_c7_fda3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2231_c7_fda3]
signal result_u8_value_MUX_uxn_opcodes_h_l2231_c7_fda3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2231_c7_fda3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2231_c7_fda3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_fda3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2231_c7_fda3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2231_c7_fda3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2231_c7_fda3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2235_c11_78f9]
signal BIN_OP_EQ_uxn_opcodes_h_l2235_c11_78f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2235_c11_78f9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2235_c11_78f9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2235_c7_ed5a]
signal n16_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2235_c7_ed5a]
signal result_u16_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2235_c7_ed5a]
signal result_u8_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2235_c7_ed5a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2235_c7_ed5a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2235_c7_ed5a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2235_c7_ed5a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2236_c3_96fd]
signal BIN_OP_OR_uxn_opcodes_h_l2236_c3_96fd_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2236_c3_96fd_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2236_c3_96fd_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2238_c30_e735]
signal sp_relative_shift_uxn_opcodes_h_l2238_c30_e735_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2238_c30_e735_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2238_c30_e735_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2238_c30_e735_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2241_c31_954c]
signal CONST_SR_8_uxn_opcodes_h_l2241_c31_954c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2241_c31_954c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2243_c11_2a50]
signal BIN_OP_EQ_uxn_opcodes_h_l2243_c11_2a50_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2243_c11_2a50_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2243_c11_2a50_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2243_c7_55c8]
signal result_u16_value_MUX_uxn_opcodes_h_l2243_c7_55c8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2243_c7_55c8]
signal result_u8_value_MUX_uxn_opcodes_h_l2243_c7_55c8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2243_c7_55c8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2243_c7_55c8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2243_c7_55c8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2243_c7_55c8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2243_c7_55c8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2243_c7_55c8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l2245_c22_19e6]
signal BIN_OP_PLUS_uxn_opcodes_h_l2245_c22_19e6_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2245_c22_19e6_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l2245_c22_19e6_return_output : unsigned(16 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2248_c11_c8fc]
signal BIN_OP_EQ_uxn_opcodes_h_l2248_c11_c8fc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2248_c11_c8fc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2248_c11_c8fc_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2248_c7_656a]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2248_c7_656a_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2248_c7_656a_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2248_c7_656a_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2248_c7_656a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2248_c7_656a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_656a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_656a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_656a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_656a_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2233_DUPLICATE_54be
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2233_DUPLICATE_54be_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2233_DUPLICATE_54be_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c878( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_ram_write := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764
BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764_left,
BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764_right,
BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2214_c1_7dde
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2214_c1_7dde : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2214_c1_7dde_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2214_c1_7dde_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2214_c1_7dde_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2214_c1_7dde_return_output);

-- n16_MUX_uxn_opcodes_h_l2214_c2_7a0f
n16_MUX_uxn_opcodes_h_l2214_c2_7a0f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond,
n16_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue,
n16_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse,
n16_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2214_c2_7a0f
result_u16_value_MUX_uxn_opcodes_h_l2214_c2_7a0f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond,
result_u16_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2214_c2_7a0f
result_u8_value_MUX_uxn_opcodes_h_l2214_c2_7a0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f
result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2214_c2_7a0f
result_is_opc_done_MUX_uxn_opcodes_h_l2214_c2_7a0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c2_7a0f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c2_7a0f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2214_c2_7a0f
result_is_ram_write_MUX_uxn_opcodes_h_l2214_c2_7a0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output);

-- t16_MUX_uxn_opcodes_h_l2214_c2_7a0f
t16_MUX_uxn_opcodes_h_l2214_c2_7a0f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond,
t16_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue,
t16_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse,
t16_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output);

-- printf_uxn_opcodes_h_l2215_c3_a32e_uxn_opcodes_h_l2215_c3_a32e
printf_uxn_opcodes_h_l2215_c3_a32e_uxn_opcodes_h_l2215_c3_a32e : entity work.printf_uxn_opcodes_h_l2215_c3_a32e_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2215_c3_a32e_uxn_opcodes_h_l2215_c3_a32e_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3
BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3_left,
BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3_right,
BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3_return_output);

-- n16_MUX_uxn_opcodes_h_l2219_c7_2237
n16_MUX_uxn_opcodes_h_l2219_c7_2237 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2219_c7_2237_cond,
n16_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue,
n16_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse,
n16_MUX_uxn_opcodes_h_l2219_c7_2237_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2219_c7_2237
result_u16_value_MUX_uxn_opcodes_h_l2219_c7_2237 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2219_c7_2237_cond,
result_u16_value_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2219_c7_2237_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2219_c7_2237
result_u8_value_MUX_uxn_opcodes_h_l2219_c7_2237 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2219_c7_2237_cond,
result_u8_value_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2219_c7_2237_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_2237
result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_2237 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_2237_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_2237_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_2237
result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_2237 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_2237_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_2237_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_2237
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_2237 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_2237_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_2237_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_2237
result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_2237 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_2237_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_2237_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2219_c7_2237
result_is_ram_write_MUX_uxn_opcodes_h_l2219_c7_2237 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2219_c7_2237_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2219_c7_2237_return_output);

-- t16_MUX_uxn_opcodes_h_l2219_c7_2237
t16_MUX_uxn_opcodes_h_l2219_c7_2237 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2219_c7_2237_cond,
t16_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue,
t16_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse,
t16_MUX_uxn_opcodes_h_l2219_c7_2237_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc
BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc_left,
BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc_right,
BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc_return_output);

-- n16_MUX_uxn_opcodes_h_l2222_c7_3ef6
n16_MUX_uxn_opcodes_h_l2222_c7_3ef6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond,
n16_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue,
n16_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse,
n16_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2222_c7_3ef6
result_u16_value_MUX_uxn_opcodes_h_l2222_c7_3ef6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond,
result_u16_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2222_c7_3ef6
result_u8_value_MUX_uxn_opcodes_h_l2222_c7_3ef6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6
result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_3ef6
result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_3ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_3ef6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_3ef6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_3ef6
result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_3ef6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output);

-- t16_MUX_uxn_opcodes_h_l2222_c7_3ef6
t16_MUX_uxn_opcodes_h_l2222_c7_3ef6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond,
t16_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue,
t16_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse,
t16_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5
BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5_left,
BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5_right,
BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5_return_output);

-- n16_MUX_uxn_opcodes_h_l2227_c7_9e6a
n16_MUX_uxn_opcodes_h_l2227_c7_9e6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond,
n16_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue,
n16_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse,
n16_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2227_c7_9e6a
result_u16_value_MUX_uxn_opcodes_h_l2227_c7_9e6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond,
result_u16_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2227_c7_9e6a
result_u8_value_MUX_uxn_opcodes_h_l2227_c7_9e6a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a
result_is_sp_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_9e6a
result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_9e6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_9e6a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_9e6a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2227_c7_9e6a
result_is_ram_write_MUX_uxn_opcodes_h_l2227_c7_9e6a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output);

-- t16_MUX_uxn_opcodes_h_l2227_c7_9e6a
t16_MUX_uxn_opcodes_h_l2227_c7_9e6a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond,
t16_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue,
t16_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse,
t16_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2228_c3_f011
BIN_OP_OR_uxn_opcodes_h_l2228_c3_f011 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2228_c3_f011_left,
BIN_OP_OR_uxn_opcodes_h_l2228_c3_f011_right,
BIN_OP_OR_uxn_opcodes_h_l2228_c3_f011_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2231_c11_b98a
BIN_OP_EQ_uxn_opcodes_h_l2231_c11_b98a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2231_c11_b98a_left,
BIN_OP_EQ_uxn_opcodes_h_l2231_c11_b98a_right,
BIN_OP_EQ_uxn_opcodes_h_l2231_c11_b98a_return_output);

-- n16_MUX_uxn_opcodes_h_l2231_c7_fda3
n16_MUX_uxn_opcodes_h_l2231_c7_fda3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2231_c7_fda3_cond,
n16_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue,
n16_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse,
n16_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2231_c7_fda3
result_u16_value_MUX_uxn_opcodes_h_l2231_c7_fda3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2231_c7_fda3_cond,
result_u16_value_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2231_c7_fda3
result_u8_value_MUX_uxn_opcodes_h_l2231_c7_fda3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2231_c7_fda3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_fda3
result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_fda3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_fda3
result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_fda3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_fda3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_fda3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_fda3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2231_c7_fda3
result_is_ram_write_MUX_uxn_opcodes_h_l2231_c7_fda3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2231_c7_fda3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2235_c11_78f9
BIN_OP_EQ_uxn_opcodes_h_l2235_c11_78f9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2235_c11_78f9_left,
BIN_OP_EQ_uxn_opcodes_h_l2235_c11_78f9_right,
BIN_OP_EQ_uxn_opcodes_h_l2235_c11_78f9_return_output);

-- n16_MUX_uxn_opcodes_h_l2235_c7_ed5a
n16_MUX_uxn_opcodes_h_l2235_c7_ed5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond,
n16_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue,
n16_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse,
n16_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2235_c7_ed5a
result_u16_value_MUX_uxn_opcodes_h_l2235_c7_ed5a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond,
result_u16_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2235_c7_ed5a
result_u8_value_MUX_uxn_opcodes_h_l2235_c7_ed5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a
result_is_sp_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_ed5a
result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_ed5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2235_c7_ed5a
result_is_ram_write_MUX_uxn_opcodes_h_l2235_c7_ed5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2236_c3_96fd
BIN_OP_OR_uxn_opcodes_h_l2236_c3_96fd : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2236_c3_96fd_left,
BIN_OP_OR_uxn_opcodes_h_l2236_c3_96fd_right,
BIN_OP_OR_uxn_opcodes_h_l2236_c3_96fd_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2238_c30_e735
sp_relative_shift_uxn_opcodes_h_l2238_c30_e735 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2238_c30_e735_ins,
sp_relative_shift_uxn_opcodes_h_l2238_c30_e735_x,
sp_relative_shift_uxn_opcodes_h_l2238_c30_e735_y,
sp_relative_shift_uxn_opcodes_h_l2238_c30_e735_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2241_c31_954c
CONST_SR_8_uxn_opcodes_h_l2241_c31_954c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2241_c31_954c_x,
CONST_SR_8_uxn_opcodes_h_l2241_c31_954c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2243_c11_2a50
BIN_OP_EQ_uxn_opcodes_h_l2243_c11_2a50 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2243_c11_2a50_left,
BIN_OP_EQ_uxn_opcodes_h_l2243_c11_2a50_right,
BIN_OP_EQ_uxn_opcodes_h_l2243_c11_2a50_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2243_c7_55c8
result_u16_value_MUX_uxn_opcodes_h_l2243_c7_55c8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2243_c7_55c8_cond,
result_u16_value_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2243_c7_55c8
result_u8_value_MUX_uxn_opcodes_h_l2243_c7_55c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2243_c7_55c8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2243_c7_55c8
result_is_sp_shift_MUX_uxn_opcodes_h_l2243_c7_55c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2243_c7_55c8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2243_c7_55c8
result_is_opc_done_MUX_uxn_opcodes_h_l2243_c7_55c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2243_c7_55c8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2243_c7_55c8
result_is_ram_write_MUX_uxn_opcodes_h_l2243_c7_55c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2243_c7_55c8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l2245_c22_19e6
BIN_OP_PLUS_uxn_opcodes_h_l2245_c22_19e6 : entity work.BIN_OP_PLUS_uint16_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l2245_c22_19e6_left,
BIN_OP_PLUS_uxn_opcodes_h_l2245_c22_19e6_right,
BIN_OP_PLUS_uxn_opcodes_h_l2245_c22_19e6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2248_c11_c8fc
BIN_OP_EQ_uxn_opcodes_h_l2248_c11_c8fc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2248_c11_c8fc_left,
BIN_OP_EQ_uxn_opcodes_h_l2248_c11_c8fc_right,
BIN_OP_EQ_uxn_opcodes_h_l2248_c11_c8fc_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2248_c7_656a
result_is_ram_write_MUX_uxn_opcodes_h_l2248_c7_656a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2248_c7_656a_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2248_c7_656a_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2248_c7_656a_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2248_c7_656a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_656a
result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_656a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_656a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_656a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_656a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_656a_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2233_DUPLICATE_54be
CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2233_DUPLICATE_54be : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2233_DUPLICATE_54be_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2233_DUPLICATE_54be_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2214_c1_7dde_return_output,
 n16_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output,
 t16_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3_return_output,
 n16_MUX_uxn_opcodes_h_l2219_c7_2237_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2219_c7_2237_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2219_c7_2237_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_2237_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_2237_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_2237_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_2237_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2219_c7_2237_return_output,
 t16_MUX_uxn_opcodes_h_l2219_c7_2237_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc_return_output,
 n16_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output,
 t16_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5_return_output,
 n16_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output,
 t16_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2228_c3_f011_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2231_c11_b98a_return_output,
 n16_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2235_c11_78f9_return_output,
 n16_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2236_c3_96fd_return_output,
 sp_relative_shift_uxn_opcodes_h_l2238_c30_e735_return_output,
 CONST_SR_8_uxn_opcodes_h_l2241_c31_954c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2243_c11_2a50_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l2245_c22_19e6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2248_c11_c8fc_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2248_c7_656a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_656a_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2233_DUPLICATE_54be_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2214_c1_7dde_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2214_c1_7dde_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2214_c1_7dde_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2214_c1_7dde_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2219_c7_2237_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2219_c7_2237_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2219_c7_2237_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_2237_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_2237_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2216_c3_8abf : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_2237_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_2237_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2219_c7_2237_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2219_c7_2237_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2215_c3_a32e_uxn_opcodes_h_l2215_c3_a32e_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2219_c7_2237_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2219_c7_2237_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2219_c7_2237_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_2237_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_2237_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2220_c3_f9e0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_2237_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_2237_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2219_c7_2237_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2219_c7_2237_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2225_c3_f12e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2229_c3_c58c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2227_c7_9e6a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2228_c3_f011_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2228_c3_f011_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2228_c3_f011_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_b98a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_b98a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_b98a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2231_c7_fda3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2231_c7_fda3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_fda3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_fda3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2231_c7_fda3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2235_c11_78f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2235_c11_78f9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2235_c11_78f9_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2236_c3_96fd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2236_c3_96fd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2236_c3_96fd_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2238_c30_e735_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2238_c30_e735_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2238_c30_e735_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2238_c30_e735_return_output : signed(3 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2241_c31_954c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2241_c31_954c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2241_c21_bef7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2243_c11_2a50_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2243_c11_2a50_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2243_c11_2a50_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l2245_c3_4b53 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2243_c7_55c8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2243_c7_55c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2243_c7_55c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_656a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2243_c7_55c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2248_c7_656a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2243_c7_55c8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2245_c22_19e6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2245_c22_19e6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l2245_c22_19e6_return_output : unsigned(16 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2246_c21_68f7_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_c8fc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_c8fc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_c8fc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2248_c7_656a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2248_c7_656a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2248_c7_656a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_656a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_656a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_656a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2214_DUPLICATE_99d1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2214_DUPLICATE_9c5d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2214_DUPLICATE_d337_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2235_l2231_l2227_l2222_l2219_l2214_DUPLICATE_f142_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2248_l2214_DUPLICATE_679b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2243_l2235_l2231_l2227_l2222_l2219_l2248_DUPLICATE_b1ca_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2232_l2228_l2236_l2223_DUPLICATE_031e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2233_DUPLICATE_54be_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2233_DUPLICATE_54be_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c878_uxn_opcodes_h_l2210_l2253_DUPLICATE_652f_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2245_c22_19e6_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3_right := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2220_c3_f9e0 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2220_c3_f9e0;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2243_c11_2a50_right := to_unsigned(6, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2248_c7_656a_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2238_c30_e735_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2229_c3_c58c := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2229_c3_c58c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2225_c3_f12e := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2225_c3_f12e;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_656a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2216_c3_8abf := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2216_c3_8abf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_b98a_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2238_c30_e735_y := to_signed(-4, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_c8fc_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2235_c11_78f9_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2214_c1_7dde_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5_right := to_unsigned(3, 2);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2214_c1_7dde_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2238_c30_e735_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2236_c3_96fd_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_b98a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2235_c11_78f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2243_c11_2a50_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_c8fc_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2228_c3_f011_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2245_c22_19e6_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2243_c11_2a50] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2243_c11_2a50_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2243_c11_2a50_left;
     BIN_OP_EQ_uxn_opcodes_h_l2243_c11_2a50_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2243_c11_2a50_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2243_c11_2a50_return_output := BIN_OP_EQ_uxn_opcodes_h_l2243_c11_2a50_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2222_c11_d0dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2214_DUPLICATE_9c5d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2214_DUPLICATE_9c5d_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2227_c11_37a5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2248_l2214_DUPLICATE_679b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2248_l2214_DUPLICATE_679b_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2232_l2228_l2236_l2223_DUPLICATE_031e LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2232_l2228_l2236_l2223_DUPLICATE_031e_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2214_c6_6764] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764_left;
     BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764_return_output := BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2248_c11_c8fc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2248_c11_c8fc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_c8fc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2248_c11_c8fc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_c8fc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_c8fc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2248_c11_c8fc_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2238_c30_e735] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2238_c30_e735_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2238_c30_e735_ins;
     sp_relative_shift_uxn_opcodes_h_l2238_c30_e735_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2238_c30_e735_x;
     sp_relative_shift_uxn_opcodes_h_l2238_c30_e735_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2238_c30_e735_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2238_c30_e735_return_output := sp_relative_shift_uxn_opcodes_h_l2238_c30_e735_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2235_l2231_l2227_l2222_l2219_l2214_DUPLICATE_f142 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2235_l2231_l2227_l2222_l2219_l2214_DUPLICATE_f142_return_output := result.sp_relative_shift;

     -- BIN_OP_PLUS[uxn_opcodes_h_l2245_c22_19e6] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l2245_c22_19e6_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2245_c22_19e6_left;
     BIN_OP_PLUS_uxn_opcodes_h_l2245_c22_19e6_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l2245_c22_19e6_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l2245_c22_19e6_return_output := BIN_OP_PLUS_uxn_opcodes_h_l2245_c22_19e6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2235_c11_78f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2235_c11_78f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2235_c11_78f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2235_c11_78f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2235_c11_78f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2235_c11_78f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2235_c11_78f9_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2214_DUPLICATE_d337 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2214_DUPLICATE_d337_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2231_c11_b98a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2231_c11_b98a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_b98a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2231_c11_b98a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_b98a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_b98a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2231_c11_b98a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2243_l2235_l2231_l2227_l2222_l2219_l2248_DUPLICATE_b1ca LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2243_l2235_l2231_l2227_l2222_l2219_l2248_DUPLICATE_b1ca_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2227_c7_9e6a] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2227_c7_9e6a_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2246_c21_68f7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2246_c21_68f7_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2219_c11_44f3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2214_DUPLICATE_99d1 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2214_DUPLICATE_99d1_return_output := result.u16_value;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2214_c1_7dde_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2214_c6_6764_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2219_c7_2237_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_2237_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2219_c7_2237_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_2237_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_2237_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_2237_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2219_c7_2237_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2219_c7_2237_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2219_c7_2237_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2219_c11_44f3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2222_c11_d0dc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2227_c11_37a5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2231_c7_fda3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_b98a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_fda3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_b98a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2231_c7_fda3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_b98a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_b98a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_b98a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2231_c7_fda3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_b98a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_fda3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2231_c11_b98a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2235_c11_78f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2235_c11_78f9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2235_c11_78f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2235_c11_78f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2235_c11_78f9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2235_c11_78f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2235_c11_78f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2243_c7_55c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2243_c11_2a50_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2243_c7_55c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2243_c11_2a50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2243_c7_55c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2243_c11_2a50_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2243_c7_55c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2243_c11_2a50_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2243_c7_55c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2243_c11_2a50_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_656a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_c8fc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2248_c7_656a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2248_c11_c8fc_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l2245_c3_4b53 := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l2245_c22_19e6_return_output, 16);
     VAR_BIN_OP_OR_uxn_opcodes_h_l2228_c3_f011_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2232_l2228_l2236_l2223_DUPLICATE_031e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2236_c3_96fd_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2232_l2228_l2236_l2223_DUPLICATE_031e_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2233_DUPLICATE_54be_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2232_l2228_l2236_l2223_DUPLICATE_031e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2246_c21_68f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2235_l2231_l2227_l2222_l2219_l2214_DUPLICATE_f142_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2235_l2231_l2227_l2222_l2219_l2214_DUPLICATE_f142_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2235_l2231_l2227_l2222_l2219_l2214_DUPLICATE_f142_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2235_l2231_l2227_l2222_l2219_l2214_DUPLICATE_f142_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2235_l2231_l2227_l2222_l2219_l2214_DUPLICATE_f142_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2235_l2231_l2227_l2222_l2219_l2214_DUPLICATE_f142_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2214_DUPLICATE_99d1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2214_DUPLICATE_99d1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2214_DUPLICATE_99d1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2214_DUPLICATE_99d1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2214_DUPLICATE_99d1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2214_DUPLICATE_99d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2243_l2235_l2231_l2227_l2222_l2219_l2248_DUPLICATE_b1ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2243_l2235_l2231_l2227_l2222_l2219_l2248_DUPLICATE_b1ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2243_l2235_l2231_l2227_l2222_l2219_l2248_DUPLICATE_b1ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2243_l2235_l2231_l2227_l2222_l2219_l2248_DUPLICATE_b1ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2243_l2235_l2231_l2227_l2222_l2219_l2248_DUPLICATE_b1ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2243_l2235_l2231_l2227_l2222_l2219_l2248_DUPLICATE_b1ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_656a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2243_l2235_l2231_l2227_l2222_l2219_l2248_DUPLICATE_b1ca_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2248_l2214_DUPLICATE_679b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2248_l2214_DUPLICATE_679b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2248_l2214_DUPLICATE_679b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2248_l2214_DUPLICATE_679b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2248_l2214_DUPLICATE_679b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2248_l2214_DUPLICATE_679b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2248_c7_656a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2248_l2214_DUPLICATE_679b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2214_DUPLICATE_d337_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2214_DUPLICATE_d337_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2214_DUPLICATE_d337_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2214_DUPLICATE_d337_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2214_DUPLICATE_d337_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2214_DUPLICATE_d337_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2214_DUPLICATE_9c5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2214_DUPLICATE_9c5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2214_DUPLICATE_9c5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2214_DUPLICATE_9c5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2214_DUPLICATE_9c5d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2243_l2231_l2227_l2222_l2219_l2214_DUPLICATE_9c5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2227_c7_9e6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2238_c30_e735_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue := VAR_result_u16_value_uxn_opcodes_h_l2245_c3_4b53;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2248_c7_656a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2248_c7_656a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2248_c7_656a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2248_c7_656a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2248_c7_656a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2248_c7_656a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2248_c7_656a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2248_c7_656a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2248_c7_656a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2236_c3_96fd] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2236_c3_96fd_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2236_c3_96fd_left;
     BIN_OP_OR_uxn_opcodes_h_l2236_c3_96fd_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2236_c3_96fd_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2236_c3_96fd_return_output := BIN_OP_OR_uxn_opcodes_h_l2236_c3_96fd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2235_c7_ed5a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2233_DUPLICATE_54be LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2233_DUPLICATE_54be_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2233_DUPLICATE_54be_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2233_DUPLICATE_54be_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2233_DUPLICATE_54be_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2243_c7_55c8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2243_c7_55c8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2243_c7_55c8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2214_c1_7dde] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2214_c1_7dde_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2214_c1_7dde_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2214_c1_7dde_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2214_c1_7dde_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2214_c1_7dde_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2214_c1_7dde_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2214_c1_7dde_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2214_c1_7dde_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2248_c7_656a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_656a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_656a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_656a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_656a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_656a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_656a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_656a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_656a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2227_c7_9e6a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2243_c7_55c8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2243_c7_55c8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2243_c7_55c8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output := result_u16_value_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2228_c3_f011] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2228_c3_f011_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2228_c3_f011_left;
     BIN_OP_OR_uxn_opcodes_h_l2228_c3_f011_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2228_c3_f011_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2228_c3_f011_return_output := BIN_OP_OR_uxn_opcodes_h_l2228_c3_f011_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2243_c7_55c8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2243_c7_55c8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2243_c7_55c8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2228_c3_f011_return_output;
     VAR_CONST_SR_8_uxn_opcodes_h_l2241_c31_954c_x := VAR_BIN_OP_OR_uxn_opcodes_h_l2236_c3_96fd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2236_c3_96fd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2233_DUPLICATE_54be_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2224_l2233_DUPLICATE_54be_return_output;
     VAR_printf_uxn_opcodes_h_l2215_c3_a32e_uxn_opcodes_h_l2215_c3_a32e_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2214_c1_7dde_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2248_c7_656a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2248_c7_656a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2231_c7_fda3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output;

     -- t16_MUX[uxn_opcodes_h_l2227_c7_9e6a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond <= VAR_t16_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond;
     t16_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue;
     t16_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output := t16_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2235_c7_ed5a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output := result_u16_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2235_c7_ed5a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output;

     -- printf_uxn_opcodes_h_l2215_c3_a32e[uxn_opcodes_h_l2215_c3_a32e] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2215_c3_a32e_uxn_opcodes_h_l2215_c3_a32e_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2215_c3_a32e_uxn_opcodes_h_l2215_c3_a32e_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2222_c7_3ef6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2241_c31_954c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2241_c31_954c_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2241_c31_954c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2241_c31_954c_return_output := CONST_SR_8_uxn_opcodes_h_l2241_c31_954c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2243_c7_55c8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2243_c7_55c8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2243_c7_55c8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2243_c7_55c8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2243_c7_55c8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2243_c7_55c8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2243_c7_55c8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2243_c7_55c8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2235_c7_ed5a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond;
     n16_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue;
     n16_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output := n16_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output;

     -- Submodule level 3
     VAR_n16_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2243_c7_55c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output;
     -- t16_MUX[uxn_opcodes_h_l2222_c7_3ef6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond;
     t16_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue;
     t16_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output := t16_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2241_c21_bef7] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2241_c21_bef7_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2241_c31_954c_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2219_c7_2237] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_2237_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_2237_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_2237_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_2237_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2231_c7_fda3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2231_c7_fda3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2231_c7_fda3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2231_c7_fda3_cond;
     n16_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue;
     n16_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output := n16_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2235_c7_ed5a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2231_c7_fda3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2231_c7_fda3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2231_c7_fda3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output := result_u16_value_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2235_c7_ed5a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2227_c7_9e6a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2241_c21_bef7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2219_c7_2237_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2214_c2_7a0f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2231_c7_fda3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2231_c7_fda3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2231_c7_fda3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output;

     -- t16_MUX[uxn_opcodes_h_l2219_c7_2237] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2219_c7_2237_cond <= VAR_t16_MUX_uxn_opcodes_h_l2219_c7_2237_cond;
     t16_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue;
     t16_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2219_c7_2237_return_output := t16_MUX_uxn_opcodes_h_l2219_c7_2237_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2231_c7_fda3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_fda3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_fda3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2222_c7_3ef6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2227_c7_9e6a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond <= VAR_n16_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond;
     n16_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue;
     n16_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output := n16_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2235_c7_ed5a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2227_c7_9e6a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output := result_u16_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2227_c7_9e6a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2235_c7_ed5a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2219_c7_2237_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2231_c7_fda3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2231_c7_fda3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_fda3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_fda3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_fda3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2222_c7_3ef6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output := result_u16_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2227_c7_9e6a] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2222_c7_3ef6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output;

     -- t16_MUX[uxn_opcodes_h_l2214_c2_7a0f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond;
     t16_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue;
     t16_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output := t16_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2227_c7_9e6a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output;

     -- n16_MUX[uxn_opcodes_h_l2222_c7_3ef6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond;
     n16_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue;
     n16_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output := n16_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2219_c7_2237] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_2237_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_2237_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_2237_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_2237_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2219_c7_2237_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2231_c7_fda3_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2222_c7_3ef6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2214_c2_7a0f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2219_c7_2237] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_2237_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_2237_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_2237_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_2237_return_output;

     -- n16_MUX[uxn_opcodes_h_l2219_c7_2237] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2219_c7_2237_cond <= VAR_n16_MUX_uxn_opcodes_h_l2219_c7_2237_cond;
     n16_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue;
     n16_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2219_c7_2237_return_output := n16_MUX_uxn_opcodes_h_l2219_c7_2237_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2227_c7_9e6a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2222_c7_3ef6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2219_c7_2237] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2219_c7_2237_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2219_c7_2237_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2219_c7_2237_return_output := result_u16_value_MUX_uxn_opcodes_h_l2219_c7_2237_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2219_c7_2237_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2219_c7_2237_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2219_c7_2237_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2227_c7_9e6a_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l2219_c7_2237] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2219_c7_2237_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2219_c7_2237_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2219_c7_2237_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2219_c7_2237_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2214_c2_7a0f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2222_c7_3ef6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2214_c2_7a0f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond;
     n16_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue;
     n16_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output := n16_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2214_c2_7a0f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output := result_u16_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2219_c7_2237] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_2237_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_2237_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_2237_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_2237_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2219_c7_2237_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2219_c7_2237_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2222_c7_3ef6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2219_c7_2237] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2219_c7_2237_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2219_c7_2237_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2219_c7_2237_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2219_c7_2237_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2219_c7_2237_return_output := result_u8_value_MUX_uxn_opcodes_h_l2219_c7_2237_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2214_c2_7a0f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2214_c2_7a0f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2219_c7_2237_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2214_c2_7a0f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c878_uxn_opcodes_h_l2210_l2253_DUPLICATE_652f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c878_uxn_opcodes_h_l2210_l2253_DUPLICATE_652f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c878(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2214_c2_7a0f_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c878_uxn_opcodes_h_l2210_l2253_DUPLICATE_652f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c878_uxn_opcodes_h_l2210_l2253_DUPLICATE_652f_return_output;
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
