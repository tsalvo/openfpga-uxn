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
-- Submodules: 107
entity equ2_0CLK_3a9c1537 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ2_0CLK_3a9c1537;
architecture arch of equ2_0CLK_3a9c1537 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l878_c6_4e0c]
signal BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l878_c1_f31a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l878_c1_f31a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l878_c1_f31a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l878_c1_f31a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l878_c1_f31a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l878_c2_695a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l878_c2_695a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l878_c2_695a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l878_c2_695a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l878_c2_695a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l878_c2_695a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c2_695a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c2_695a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c2_695a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c2_695a_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l878_c2_695a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c2_695a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c2_695a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c2_695a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c2_695a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l878_c2_695a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c2_695a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c2_695a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c2_695a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c2_695a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l878_c2_695a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l878_c2_695a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l878_c2_695a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l878_c2_695a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l878_c2_695a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l878_c2_695a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c2_695a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c2_695a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c2_695a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c2_695a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l878_c2_695a]
signal result_stack_value_MUX_uxn_opcodes_h_l878_c2_695a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l878_c2_695a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l878_c2_695a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l878_c2_695a_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l878_c2_695a]
signal t16_MUX_uxn_opcodes_h_l878_c2_695a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l878_c2_695a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l878_c2_695a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l878_c2_695a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l878_c2_695a]
signal n16_MUX_uxn_opcodes_h_l878_c2_695a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l878_c2_695a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l878_c2_695a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l878_c2_695a_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l879_c3_da05[uxn_opcodes_h_l879_c3_da05]
signal printf_uxn_opcodes_h_l879_c3_da05_uxn_opcodes_h_l879_c3_da05_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l884_c11_c962]
signal BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l884_c7_b10e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l884_c7_b10e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l884_c7_b10e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l884_c7_b10e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_b10e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_b10e_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l884_c7_b10e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_b10e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_b10e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l884_c7_b10e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_b10e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_b10e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l884_c7_b10e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l884_c7_b10e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l884_c7_b10e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l884_c7_b10e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_b10e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_b10e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l884_c7_b10e]
signal result_stack_value_MUX_uxn_opcodes_h_l884_c7_b10e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l884_c7_b10e_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l884_c7_b10e]
signal t16_MUX_uxn_opcodes_h_l884_c7_b10e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l884_c7_b10e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l884_c7_b10e]
signal n16_MUX_uxn_opcodes_h_l884_c7_b10e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l884_c7_b10e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l887_c11_1a8d]
signal BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l887_c7_c2d1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l887_c7_c2d1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l887_c7_c2d1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l887_c7_c2d1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_c2d1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l887_c7_c2d1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_c2d1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l887_c7_c2d1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l887_c7_c2d1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_c2d1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l887_c7_c2d1]
signal result_stack_value_MUX_uxn_opcodes_h_l887_c7_c2d1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l887_c7_c2d1]
signal t16_MUX_uxn_opcodes_h_l887_c7_c2d1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l887_c7_c2d1]
signal n16_MUX_uxn_opcodes_h_l887_c7_c2d1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l892_c11_4173]
signal BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l892_c7_b948]
signal result_is_stack_read_MUX_uxn_opcodes_h_l892_c7_b948_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l892_c7_b948_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l892_c7_b948_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l892_c7_b948_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l892_c7_b948]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_b948_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_b948_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_b948_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_b948_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l892_c7_b948]
signal result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_b948_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_b948_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_b948_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_b948_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l892_c7_b948]
signal result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_b948_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_b948_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_b948_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_b948_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l892_c7_b948]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l892_c7_b948_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l892_c7_b948_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l892_c7_b948_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l892_c7_b948_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l892_c7_b948]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_b948_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_b948_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_b948_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_b948_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l892_c7_b948]
signal result_stack_value_MUX_uxn_opcodes_h_l892_c7_b948_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l892_c7_b948_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l892_c7_b948_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l892_c7_b948_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l892_c7_b948]
signal t16_MUX_uxn_opcodes_h_l892_c7_b948_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l892_c7_b948_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l892_c7_b948_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l892_c7_b948_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l892_c7_b948]
signal n16_MUX_uxn_opcodes_h_l892_c7_b948_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l892_c7_b948_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l892_c7_b948_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l892_c7_b948_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l895_c11_77b6]
signal BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l895_c7_ef4e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l895_c7_ef4e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l895_c7_ef4e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l895_c7_ef4e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_ef4e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l895_c7_ef4e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_ef4e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l895_c7_ef4e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l895_c7_ef4e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_ef4e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l895_c7_ef4e]
signal result_stack_value_MUX_uxn_opcodes_h_l895_c7_ef4e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l895_c7_ef4e]
signal t16_MUX_uxn_opcodes_h_l895_c7_ef4e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l895_c7_ef4e]
signal n16_MUX_uxn_opcodes_h_l895_c7_ef4e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l896_c3_f388]
signal BIN_OP_OR_uxn_opcodes_h_l896_c3_f388_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l896_c3_f388_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l896_c3_f388_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l899_c11_5691]
signal BIN_OP_EQ_uxn_opcodes_h_l899_c11_5691_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l899_c11_5691_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l899_c11_5691_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l899_c7_8ccd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_8ccd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l899_c7_8ccd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l899_c7_8ccd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_8ccd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l899_c7_8ccd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_8ccd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l899_c7_8ccd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l899_c7_8ccd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_8ccd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l899_c7_8ccd]
signal result_stack_value_MUX_uxn_opcodes_h_l899_c7_8ccd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l899_c7_8ccd]
signal n16_MUX_uxn_opcodes_h_l899_c7_8ccd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l902_c11_9aca]
signal BIN_OP_EQ_uxn_opcodes_h_l902_c11_9aca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l902_c11_9aca_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l902_c11_9aca_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l902_c7_908d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_908d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_908d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_908d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_908d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l902_c7_908d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_908d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_908d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_908d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_908d_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l902_c7_908d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_908d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_908d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_908d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_908d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l902_c7_908d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_908d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_908d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_908d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_908d_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l902_c7_908d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_908d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_908d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_908d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_908d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l902_c7_908d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_908d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_908d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_908d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_908d_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l902_c7_908d]
signal result_stack_value_MUX_uxn_opcodes_h_l902_c7_908d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l902_c7_908d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l902_c7_908d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l902_c7_908d_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l902_c7_908d]
signal n16_MUX_uxn_opcodes_h_l902_c7_908d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l902_c7_908d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l902_c7_908d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l902_c7_908d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l907_c11_80ba]
signal BIN_OP_EQ_uxn_opcodes_h_l907_c11_80ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l907_c11_80ba_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l907_c11_80ba_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l907_c7_f212]
signal result_is_stack_read_MUX_uxn_opcodes_h_l907_c7_f212_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l907_c7_f212_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l907_c7_f212_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l907_c7_f212_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l907_c7_f212]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_f212_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_f212_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_f212_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_f212_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l907_c7_f212]
signal result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_f212_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_f212_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_f212_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_f212_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l907_c7_f212]
signal result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_f212_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_f212_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_f212_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_f212_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l907_c7_f212]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_f212_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_f212_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_f212_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_f212_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l907_c7_f212]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_f212_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_f212_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_f212_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_f212_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l907_c7_f212]
signal result_stack_value_MUX_uxn_opcodes_h_l907_c7_f212_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l907_c7_f212_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l907_c7_f212_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l907_c7_f212_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l907_c7_f212]
signal n16_MUX_uxn_opcodes_h_l907_c7_f212_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l907_c7_f212_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l907_c7_f212_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l907_c7_f212_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l910_c11_a7c3]
signal BIN_OP_EQ_uxn_opcodes_h_l910_c11_a7c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l910_c11_a7c3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l910_c11_a7c3_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l910_c7_047e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l910_c7_047e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l910_c7_047e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l910_c7_047e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l910_c7_047e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l910_c7_047e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_047e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_047e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_047e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_047e_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l910_c7_047e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_047e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_047e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_047e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_047e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l910_c7_047e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_047e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_047e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_047e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_047e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l910_c7_047e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_047e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_047e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_047e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_047e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l910_c7_047e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_047e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_047e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_047e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_047e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l910_c7_047e]
signal result_stack_value_MUX_uxn_opcodes_h_l910_c7_047e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l910_c7_047e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l910_c7_047e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l910_c7_047e_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l910_c7_047e]
signal n16_MUX_uxn_opcodes_h_l910_c7_047e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l910_c7_047e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l910_c7_047e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l910_c7_047e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l911_c3_b6cc]
signal BIN_OP_OR_uxn_opcodes_h_l911_c3_b6cc_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l911_c3_b6cc_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l911_c3_b6cc_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l914_c32_d2ce]
signal BIN_OP_AND_uxn_opcodes_h_l914_c32_d2ce_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l914_c32_d2ce_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l914_c32_d2ce_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l914_c32_9ee3]
signal BIN_OP_GT_uxn_opcodes_h_l914_c32_9ee3_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l914_c32_9ee3_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l914_c32_9ee3_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l914_c32_2fa8]
signal MUX_uxn_opcodes_h_l914_c32_2fa8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l914_c32_2fa8_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l914_c32_2fa8_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l914_c32_2fa8_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l916_c11_a9ef]
signal BIN_OP_EQ_uxn_opcodes_h_l916_c11_a9ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l916_c11_a9ef_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l916_c11_a9ef_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l916_c7_3184]
signal result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_3184_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_3184_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_3184_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_3184_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l916_c7_3184]
signal result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_3184_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_3184_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_3184_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_3184_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l916_c7_3184]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_3184_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_3184_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_3184_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_3184_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l916_c7_3184]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_3184_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_3184_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_3184_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_3184_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l916_c7_3184]
signal result_stack_value_MUX_uxn_opcodes_h_l916_c7_3184_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l916_c7_3184_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l916_c7_3184_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l916_c7_3184_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l920_c24_8344]
signal BIN_OP_EQ_uxn_opcodes_h_l920_c24_8344_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l920_c24_8344_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l920_c24_8344_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l920_c24_9236]
signal MUX_uxn_opcodes_h_l920_c24_9236_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l920_c24_9236_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l920_c24_9236_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l920_c24_9236_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l922_c11_15d8]
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_15d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_15d8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l922_c11_15d8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l922_c7_8425]
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_8425_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_8425_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_8425_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_8425_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l922_c7_8425]
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_8425_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_8425_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_8425_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_8425_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l904_l889_DUPLICATE_e187
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l904_l889_DUPLICATE_e187_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l904_l889_DUPLICATE_e187_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_28d7( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c
BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c_left,
BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c_right,
BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l878_c1_f31a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l878_c1_f31a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l878_c1_f31a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l878_c1_f31a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l878_c1_f31a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l878_c1_f31a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l878_c2_695a
result_is_stack_read_MUX_uxn_opcodes_h_l878_c2_695a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l878_c2_695a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l878_c2_695a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l878_c2_695a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l878_c2_695a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c2_695a
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c2_695a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c2_695a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c2_695a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c2_695a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c2_695a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l878_c2_695a
result_is_opc_done_MUX_uxn_opcodes_h_l878_c2_695a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l878_c2_695a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l878_c2_695a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l878_c2_695a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l878_c2_695a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l878_c2_695a
result_is_stack_write_MUX_uxn_opcodes_h_l878_c2_695a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l878_c2_695a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l878_c2_695a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l878_c2_695a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l878_c2_695a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l878_c2_695a
result_is_sp_shift_MUX_uxn_opcodes_h_l878_c2_695a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l878_c2_695a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l878_c2_695a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l878_c2_695a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l878_c2_695a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c2_695a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c2_695a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c2_695a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c2_695a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c2_695a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c2_695a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l878_c2_695a
result_stack_value_MUX_uxn_opcodes_h_l878_c2_695a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l878_c2_695a_cond,
result_stack_value_MUX_uxn_opcodes_h_l878_c2_695a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l878_c2_695a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l878_c2_695a_return_output);

-- t16_MUX_uxn_opcodes_h_l878_c2_695a
t16_MUX_uxn_opcodes_h_l878_c2_695a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l878_c2_695a_cond,
t16_MUX_uxn_opcodes_h_l878_c2_695a_iftrue,
t16_MUX_uxn_opcodes_h_l878_c2_695a_iffalse,
t16_MUX_uxn_opcodes_h_l878_c2_695a_return_output);

-- n16_MUX_uxn_opcodes_h_l878_c2_695a
n16_MUX_uxn_opcodes_h_l878_c2_695a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l878_c2_695a_cond,
n16_MUX_uxn_opcodes_h_l878_c2_695a_iftrue,
n16_MUX_uxn_opcodes_h_l878_c2_695a_iffalse,
n16_MUX_uxn_opcodes_h_l878_c2_695a_return_output);

-- printf_uxn_opcodes_h_l879_c3_da05_uxn_opcodes_h_l879_c3_da05
printf_uxn_opcodes_h_l879_c3_da05_uxn_opcodes_h_l879_c3_da05 : entity work.printf_uxn_opcodes_h_l879_c3_da05_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l879_c3_da05_uxn_opcodes_h_l879_c3_da05_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962
BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962_left,
BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962_right,
BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l884_c7_b10e
result_is_stack_read_MUX_uxn_opcodes_h_l884_c7_b10e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l884_c7_b10e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l884_c7_b10e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_b10e
result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_b10e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_b10e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_b10e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_b10e
result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_b10e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_b10e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_b10e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_b10e
result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_b10e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_b10e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_b10e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l884_c7_b10e
result_is_sp_shift_MUX_uxn_opcodes_h_l884_c7_b10e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l884_c7_b10e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l884_c7_b10e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_b10e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_b10e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_b10e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_b10e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l884_c7_b10e
result_stack_value_MUX_uxn_opcodes_h_l884_c7_b10e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l884_c7_b10e_cond,
result_stack_value_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l884_c7_b10e_return_output);

-- t16_MUX_uxn_opcodes_h_l884_c7_b10e
t16_MUX_uxn_opcodes_h_l884_c7_b10e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l884_c7_b10e_cond,
t16_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue,
t16_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse,
t16_MUX_uxn_opcodes_h_l884_c7_b10e_return_output);

-- n16_MUX_uxn_opcodes_h_l884_c7_b10e
n16_MUX_uxn_opcodes_h_l884_c7_b10e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l884_c7_b10e_cond,
n16_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue,
n16_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse,
n16_MUX_uxn_opcodes_h_l884_c7_b10e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d
BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d_left,
BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d_right,
BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l887_c7_c2d1
result_is_stack_read_MUX_uxn_opcodes_h_l887_c7_c2d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l887_c7_c2d1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_c2d1
result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_c2d1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_c2d1
result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_c2d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_c2d1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_c2d1
result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_c2d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_c2d1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l887_c7_c2d1
result_is_sp_shift_MUX_uxn_opcodes_h_l887_c7_c2d1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_c2d1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_c2d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_c2d1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l887_c7_c2d1
result_stack_value_MUX_uxn_opcodes_h_l887_c7_c2d1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l887_c7_c2d1_cond,
result_stack_value_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output);

-- t16_MUX_uxn_opcodes_h_l887_c7_c2d1
t16_MUX_uxn_opcodes_h_l887_c7_c2d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l887_c7_c2d1_cond,
t16_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue,
t16_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse,
t16_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output);

-- n16_MUX_uxn_opcodes_h_l887_c7_c2d1
n16_MUX_uxn_opcodes_h_l887_c7_c2d1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l887_c7_c2d1_cond,
n16_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue,
n16_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse,
n16_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173
BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173_left,
BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173_right,
BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l892_c7_b948
result_is_stack_read_MUX_uxn_opcodes_h_l892_c7_b948 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l892_c7_b948_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l892_c7_b948_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l892_c7_b948_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l892_c7_b948_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_b948
result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_b948 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_b948_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_b948_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_b948_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_b948_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_b948
result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_b948 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_b948_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_b948_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_b948_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_b948_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_b948
result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_b948 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_b948_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_b948_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_b948_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_b948_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l892_c7_b948
result_is_sp_shift_MUX_uxn_opcodes_h_l892_c7_b948 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l892_c7_b948_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l892_c7_b948_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l892_c7_b948_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l892_c7_b948_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_b948
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_b948 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_b948_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_b948_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_b948_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_b948_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l892_c7_b948
result_stack_value_MUX_uxn_opcodes_h_l892_c7_b948 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l892_c7_b948_cond,
result_stack_value_MUX_uxn_opcodes_h_l892_c7_b948_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l892_c7_b948_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l892_c7_b948_return_output);

-- t16_MUX_uxn_opcodes_h_l892_c7_b948
t16_MUX_uxn_opcodes_h_l892_c7_b948 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l892_c7_b948_cond,
t16_MUX_uxn_opcodes_h_l892_c7_b948_iftrue,
t16_MUX_uxn_opcodes_h_l892_c7_b948_iffalse,
t16_MUX_uxn_opcodes_h_l892_c7_b948_return_output);

-- n16_MUX_uxn_opcodes_h_l892_c7_b948
n16_MUX_uxn_opcodes_h_l892_c7_b948 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l892_c7_b948_cond,
n16_MUX_uxn_opcodes_h_l892_c7_b948_iftrue,
n16_MUX_uxn_opcodes_h_l892_c7_b948_iffalse,
n16_MUX_uxn_opcodes_h_l892_c7_b948_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6
BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6_left,
BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6_right,
BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l895_c7_ef4e
result_is_stack_read_MUX_uxn_opcodes_h_l895_c7_ef4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l895_c7_ef4e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_ef4e
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_ef4e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_ef4e
result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_ef4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_ef4e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_ef4e
result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_ef4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_ef4e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_ef4e
result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_ef4e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_ef4e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_ef4e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_ef4e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l895_c7_ef4e
result_stack_value_MUX_uxn_opcodes_h_l895_c7_ef4e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l895_c7_ef4e_cond,
result_stack_value_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output);

-- t16_MUX_uxn_opcodes_h_l895_c7_ef4e
t16_MUX_uxn_opcodes_h_l895_c7_ef4e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l895_c7_ef4e_cond,
t16_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue,
t16_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse,
t16_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output);

-- n16_MUX_uxn_opcodes_h_l895_c7_ef4e
n16_MUX_uxn_opcodes_h_l895_c7_ef4e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l895_c7_ef4e_cond,
n16_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue,
n16_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse,
n16_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l896_c3_f388
BIN_OP_OR_uxn_opcodes_h_l896_c3_f388 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l896_c3_f388_left,
BIN_OP_OR_uxn_opcodes_h_l896_c3_f388_right,
BIN_OP_OR_uxn_opcodes_h_l896_c3_f388_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l899_c11_5691
BIN_OP_EQ_uxn_opcodes_h_l899_c11_5691 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l899_c11_5691_left,
BIN_OP_EQ_uxn_opcodes_h_l899_c11_5691_right,
BIN_OP_EQ_uxn_opcodes_h_l899_c11_5691_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_8ccd
result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_8ccd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_8ccd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_8ccd
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_8ccd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_8ccd
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_8ccd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_8ccd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_8ccd
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_8ccd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_8ccd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_8ccd
result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_8ccd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_8ccd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_8ccd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_8ccd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l899_c7_8ccd
result_stack_value_MUX_uxn_opcodes_h_l899_c7_8ccd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l899_c7_8ccd_cond,
result_stack_value_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output);

-- n16_MUX_uxn_opcodes_h_l899_c7_8ccd
n16_MUX_uxn_opcodes_h_l899_c7_8ccd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l899_c7_8ccd_cond,
n16_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue,
n16_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse,
n16_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l902_c11_9aca
BIN_OP_EQ_uxn_opcodes_h_l902_c11_9aca : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l902_c11_9aca_left,
BIN_OP_EQ_uxn_opcodes_h_l902_c11_9aca_right,
BIN_OP_EQ_uxn_opcodes_h_l902_c11_9aca_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_908d
result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_908d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_908d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_908d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_908d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_908d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_908d
result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_908d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_908d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_908d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_908d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_908d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_908d
result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_908d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_908d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_908d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_908d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_908d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_908d
result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_908d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_908d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_908d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_908d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_908d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_908d
result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_908d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_908d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_908d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_908d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_908d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_908d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_908d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_908d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_908d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_908d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_908d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l902_c7_908d
result_stack_value_MUX_uxn_opcodes_h_l902_c7_908d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l902_c7_908d_cond,
result_stack_value_MUX_uxn_opcodes_h_l902_c7_908d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l902_c7_908d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l902_c7_908d_return_output);

-- n16_MUX_uxn_opcodes_h_l902_c7_908d
n16_MUX_uxn_opcodes_h_l902_c7_908d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l902_c7_908d_cond,
n16_MUX_uxn_opcodes_h_l902_c7_908d_iftrue,
n16_MUX_uxn_opcodes_h_l902_c7_908d_iffalse,
n16_MUX_uxn_opcodes_h_l902_c7_908d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l907_c11_80ba
BIN_OP_EQ_uxn_opcodes_h_l907_c11_80ba : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l907_c11_80ba_left,
BIN_OP_EQ_uxn_opcodes_h_l907_c11_80ba_right,
BIN_OP_EQ_uxn_opcodes_h_l907_c11_80ba_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l907_c7_f212
result_is_stack_read_MUX_uxn_opcodes_h_l907_c7_f212 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l907_c7_f212_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l907_c7_f212_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l907_c7_f212_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l907_c7_f212_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_f212
result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_f212 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_f212_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_f212_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_f212_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_f212_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_f212
result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_f212 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_f212_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_f212_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_f212_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_f212_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_f212
result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_f212 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_f212_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_f212_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_f212_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_f212_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_f212
result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_f212 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_f212_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_f212_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_f212_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_f212_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_f212
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_f212 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_f212_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_f212_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_f212_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_f212_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l907_c7_f212
result_stack_value_MUX_uxn_opcodes_h_l907_c7_f212 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l907_c7_f212_cond,
result_stack_value_MUX_uxn_opcodes_h_l907_c7_f212_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l907_c7_f212_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l907_c7_f212_return_output);

-- n16_MUX_uxn_opcodes_h_l907_c7_f212
n16_MUX_uxn_opcodes_h_l907_c7_f212 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l907_c7_f212_cond,
n16_MUX_uxn_opcodes_h_l907_c7_f212_iftrue,
n16_MUX_uxn_opcodes_h_l907_c7_f212_iffalse,
n16_MUX_uxn_opcodes_h_l907_c7_f212_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l910_c11_a7c3
BIN_OP_EQ_uxn_opcodes_h_l910_c11_a7c3 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l910_c11_a7c3_left,
BIN_OP_EQ_uxn_opcodes_h_l910_c11_a7c3_right,
BIN_OP_EQ_uxn_opcodes_h_l910_c11_a7c3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l910_c7_047e
result_is_stack_read_MUX_uxn_opcodes_h_l910_c7_047e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l910_c7_047e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l910_c7_047e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l910_c7_047e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l910_c7_047e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_047e
result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_047e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_047e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_047e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_047e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_047e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_047e
result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_047e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_047e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_047e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_047e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_047e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_047e
result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_047e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_047e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_047e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_047e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_047e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_047e
result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_047e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_047e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_047e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_047e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_047e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_047e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_047e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_047e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_047e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_047e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_047e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l910_c7_047e
result_stack_value_MUX_uxn_opcodes_h_l910_c7_047e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l910_c7_047e_cond,
result_stack_value_MUX_uxn_opcodes_h_l910_c7_047e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l910_c7_047e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l910_c7_047e_return_output);

-- n16_MUX_uxn_opcodes_h_l910_c7_047e
n16_MUX_uxn_opcodes_h_l910_c7_047e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l910_c7_047e_cond,
n16_MUX_uxn_opcodes_h_l910_c7_047e_iftrue,
n16_MUX_uxn_opcodes_h_l910_c7_047e_iffalse,
n16_MUX_uxn_opcodes_h_l910_c7_047e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l911_c3_b6cc
BIN_OP_OR_uxn_opcodes_h_l911_c3_b6cc : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l911_c3_b6cc_left,
BIN_OP_OR_uxn_opcodes_h_l911_c3_b6cc_right,
BIN_OP_OR_uxn_opcodes_h_l911_c3_b6cc_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l914_c32_d2ce
BIN_OP_AND_uxn_opcodes_h_l914_c32_d2ce : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l914_c32_d2ce_left,
BIN_OP_AND_uxn_opcodes_h_l914_c32_d2ce_right,
BIN_OP_AND_uxn_opcodes_h_l914_c32_d2ce_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l914_c32_9ee3
BIN_OP_GT_uxn_opcodes_h_l914_c32_9ee3 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l914_c32_9ee3_left,
BIN_OP_GT_uxn_opcodes_h_l914_c32_9ee3_right,
BIN_OP_GT_uxn_opcodes_h_l914_c32_9ee3_return_output);

-- MUX_uxn_opcodes_h_l914_c32_2fa8
MUX_uxn_opcodes_h_l914_c32_2fa8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l914_c32_2fa8_cond,
MUX_uxn_opcodes_h_l914_c32_2fa8_iftrue,
MUX_uxn_opcodes_h_l914_c32_2fa8_iffalse,
MUX_uxn_opcodes_h_l914_c32_2fa8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l916_c11_a9ef
BIN_OP_EQ_uxn_opcodes_h_l916_c11_a9ef : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l916_c11_a9ef_left,
BIN_OP_EQ_uxn_opcodes_h_l916_c11_a9ef_right,
BIN_OP_EQ_uxn_opcodes_h_l916_c11_a9ef_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_3184
result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_3184 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_3184_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_3184_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_3184_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_3184_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_3184
result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_3184 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_3184_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_3184_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_3184_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_3184_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_3184
result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_3184 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_3184_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_3184_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_3184_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_3184_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_3184
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_3184 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_3184_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_3184_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_3184_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_3184_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l916_c7_3184
result_stack_value_MUX_uxn_opcodes_h_l916_c7_3184 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l916_c7_3184_cond,
result_stack_value_MUX_uxn_opcodes_h_l916_c7_3184_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l916_c7_3184_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l916_c7_3184_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l920_c24_8344
BIN_OP_EQ_uxn_opcodes_h_l920_c24_8344 : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l920_c24_8344_left,
BIN_OP_EQ_uxn_opcodes_h_l920_c24_8344_right,
BIN_OP_EQ_uxn_opcodes_h_l920_c24_8344_return_output);

-- MUX_uxn_opcodes_h_l920_c24_9236
MUX_uxn_opcodes_h_l920_c24_9236 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l920_c24_9236_cond,
MUX_uxn_opcodes_h_l920_c24_9236_iftrue,
MUX_uxn_opcodes_h_l920_c24_9236_iffalse,
MUX_uxn_opcodes_h_l920_c24_9236_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l922_c11_15d8
BIN_OP_EQ_uxn_opcodes_h_l922_c11_15d8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l922_c11_15d8_left,
BIN_OP_EQ_uxn_opcodes_h_l922_c11_15d8_right,
BIN_OP_EQ_uxn_opcodes_h_l922_c11_15d8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_8425
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_8425 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_8425_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_8425_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_8425_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_8425_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_8425
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_8425 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_8425_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_8425_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_8425_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_8425_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l904_l889_DUPLICATE_e187
CONST_SL_8_uint16_t_uxn_opcodes_h_l904_l889_DUPLICATE_e187 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l904_l889_DUPLICATE_e187_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l904_l889_DUPLICATE_e187_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l878_c1_f31a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l878_c2_695a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c2_695a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l878_c2_695a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l878_c2_695a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l878_c2_695a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c2_695a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l878_c2_695a_return_output,
 t16_MUX_uxn_opcodes_h_l878_c2_695a_return_output,
 n16_MUX_uxn_opcodes_h_l878_c2_695a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l884_c7_b10e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_b10e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_b10e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_b10e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l884_c7_b10e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_b10e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l884_c7_b10e_return_output,
 t16_MUX_uxn_opcodes_h_l884_c7_b10e_return_output,
 n16_MUX_uxn_opcodes_h_l884_c7_b10e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output,
 t16_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output,
 n16_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l892_c7_b948_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_b948_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_b948_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_b948_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l892_c7_b948_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_b948_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l892_c7_b948_return_output,
 t16_MUX_uxn_opcodes_h_l892_c7_b948_return_output,
 n16_MUX_uxn_opcodes_h_l892_c7_b948_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output,
 t16_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output,
 n16_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l896_c3_f388_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l899_c11_5691_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output,
 n16_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l902_c11_9aca_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_908d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_908d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_908d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_908d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_908d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_908d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l902_c7_908d_return_output,
 n16_MUX_uxn_opcodes_h_l902_c7_908d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l907_c11_80ba_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l907_c7_f212_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_f212_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_f212_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_f212_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_f212_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_f212_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l907_c7_f212_return_output,
 n16_MUX_uxn_opcodes_h_l907_c7_f212_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l910_c11_a7c3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l910_c7_047e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_047e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_047e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_047e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_047e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_047e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l910_c7_047e_return_output,
 n16_MUX_uxn_opcodes_h_l910_c7_047e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l911_c3_b6cc_return_output,
 BIN_OP_AND_uxn_opcodes_h_l914_c32_d2ce_return_output,
 BIN_OP_GT_uxn_opcodes_h_l914_c32_9ee3_return_output,
 MUX_uxn_opcodes_h_l914_c32_2fa8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l916_c11_a9ef_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_3184_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_3184_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_3184_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_3184_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l916_c7_3184_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l920_c24_8344_return_output,
 MUX_uxn_opcodes_h_l920_c24_9236_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l922_c11_15d8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_8425_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_8425_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l904_l889_DUPLICATE_e187_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l878_c1_f31a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l878_c1_f31a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l878_c1_f31a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l878_c1_f31a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l878_c2_695a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l878_c2_695a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l884_c7_b10e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l878_c2_695a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l878_c2_695a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c2_695a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c2_695a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_b10e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c2_695a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c2_695a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c2_695a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c2_695a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_b10e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c2_695a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c2_695a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c2_695a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c2_695a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_b10e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c2_695a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c2_695a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l878_c2_695a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l878_c2_695a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l884_c7_b10e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l878_c2_695a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l878_c2_695a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c2_695a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l881_c3_ba80 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c2_695a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_b10e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c2_695a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c2_695a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l878_c2_695a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l878_c2_695a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l884_c7_b10e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l878_c2_695a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l878_c2_695a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l878_c2_695a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l878_c2_695a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l884_c7_b10e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l878_c2_695a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l878_c2_695a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c2_695a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c2_695a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l884_c7_b10e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c2_695a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c2_695a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l879_c3_da05_uxn_opcodes_h_l879_c3_da05_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l884_c7_b10e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_b10e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_b10e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_b10e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l884_c7_b10e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l885_c3_2f08 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_b10e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l884_c7_b10e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l884_c7_b10e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l884_c7_b10e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l892_c7_b948_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l887_c7_c2d1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_b948_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_b948_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_c2d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_b948_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_c2d1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l892_c7_b948_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l890_c3_1c2d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_b948_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_c2d1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l892_c7_b948_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l887_c7_c2d1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l892_c7_b948_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l887_c7_c2d1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l892_c7_b948_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l887_c7_c2d1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l892_c7_b948_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l892_c7_b948_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l892_c7_b948_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_b948_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_b948_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_b948_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_b948_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_b948_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_b948_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_b948_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_b948_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_b948_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l892_c7_b948_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l892_c7_b948_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l892_c7_b948_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_b948_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l893_c3_750f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_b948_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_b948_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l892_c7_b948_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l892_c7_b948_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l892_c7_b948_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l892_c7_b948_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l892_c7_b948_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l892_c7_b948_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l892_c7_b948_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l892_c7_b948_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l892_c7_b948_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l895_c7_ef4e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_ef4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_ef4e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l897_c3_8028 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_ef4e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l895_c7_ef4e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l895_c7_ef4e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l895_c7_ef4e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l896_c3_f388_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l896_c3_f388_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l896_c3_f388_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5691_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5691_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5691_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_908d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_8ccd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_908d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_908d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_8ccd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_908d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_8ccd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_908d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l900_c3_aa9b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_908d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_8ccd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l902_c7_908d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_8ccd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l902_c7_908d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l899_c7_8ccd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_9aca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_9aca_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_9aca_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_908d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_908d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l907_c7_f212_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_908d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_908d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_908d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_f212_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_908d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_908d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_908d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_f212_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_908d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_908d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_908d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_f212_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_908d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_908d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_908d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_f212_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_908d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_908d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l905_c3_dfec : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_908d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_f212_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_908d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l902_c7_908d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l902_c7_908d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l907_c7_f212_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l902_c7_908d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l902_c7_908d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l902_c7_908d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l907_c7_f212_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l902_c7_908d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_80ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_80ba_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_80ba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l907_c7_f212_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l907_c7_f212_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l910_c7_047e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l907_c7_f212_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_f212_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_f212_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_047e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_f212_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_f212_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_f212_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_047e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_f212_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_f212_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_f212_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_047e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_f212_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_f212_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_f212_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_047e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_f212_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_f212_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l908_c3_4fc9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_f212_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_047e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_f212_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l907_c7_f212_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l907_c7_f212_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l910_c7_047e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l907_c7_f212_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l907_c7_f212_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l907_c7_f212_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l910_c7_047e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l907_c7_f212_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a7c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a7c3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a7c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l910_c7_047e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l910_c7_047e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l910_c7_047e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_047e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_047e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_047e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_047e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_047e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_3184_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_047e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_047e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_047e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_3184_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_047e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_047e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_047e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_3184_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_047e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_047e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_047e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_3184_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_047e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l910_c7_047e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l910_c7_047e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_3184_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l910_c7_047e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l910_c7_047e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l910_c7_047e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l910_c7_047e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l911_c3_b6cc_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l911_c3_b6cc_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l911_c3_b6cc_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l914_c32_2fa8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l914_c32_2fa8_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l914_c32_2fa8_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l914_c32_d2ce_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l914_c32_d2ce_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l914_c32_d2ce_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l914_c32_9ee3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l914_c32_9ee3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l914_c32_9ee3_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l914_c32_2fa8_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a9ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a9ef_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a9ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_3184_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_3184_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_8425_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_3184_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_3184_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_3184_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_8425_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_3184_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_3184_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_3184_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_3184_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_3184_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l919_c3_14b8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_3184_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_3184_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_3184_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_3184_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_3184_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l920_c24_9236_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l920_c24_9236_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l920_c24_9236_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c24_8344_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c24_8344_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c24_8344_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l920_c24_9236_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_15d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_15d8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_15d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_8425_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_8425_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_8425_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_8425_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_8425_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_8425_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l892_l887_DUPLICATE_e884_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l922_l892_l887_DUPLICATE_aaab_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l884_l907_l878_l902_l899_l895_l892_l916_l887_DUPLICATE_1494_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l892_l916_l887_DUPLICATE_b05b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l910_l884_l907_l902_l899_l895_l892_l887_DUPLICATE_1f4e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l910_l884_l907_l902_l899_l895_l922_l892_l916_l887_DUPLICATE_45a2_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l896_l911_l888_l903_DUPLICATE_96ec_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l904_l889_DUPLICATE_e187_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l904_l889_DUPLICATE_e187_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l910_l916_DUPLICATE_ef4b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l927_l874_DUPLICATE_cc7e_return_output : opcode_result_t;
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
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_047e_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_3184_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l914_c32_2fa8_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l914_c32_2fa8_iffalse := resize(to_signed(-3, 3), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c2_695a_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_3184_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l900_c3_aa9b := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l900_c3_aa9b;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l878_c2_695a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l885_c3_2f08 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l885_c3_2f08;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_9aca_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_15d8_right := to_unsigned(10, 4);
     VAR_MUX_uxn_opcodes_h_l920_c24_9236_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_AND_uxn_opcodes_h_l914_c32_d2ce_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l908_c3_4fc9 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_f212_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l908_c3_4fc9;
     VAR_MUX_uxn_opcodes_h_l920_c24_9236_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l914_c32_9ee3_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l881_c3_ba80 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c2_695a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l881_c3_ba80;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_8425_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l910_c7_047e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_8425_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l893_c3_750f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_b948_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l893_c3_750f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l919_c3_14b8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_3184_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l919_c3_14b8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_80ba_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a9ef_right := to_unsigned(9, 4);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l878_c1_f31a_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l905_c3_dfec := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_908d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l905_c3_dfec;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5691_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l897_c3_8028 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l897_c3_8028;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a7c3_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l890_c3_1c2d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l890_c3_1c2d;

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l878_c1_f31a_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l914_c32_d2ce_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c24_8344_left := n16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l911_c3_b6cc_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l878_c2_695a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l892_c7_b948_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l907_c7_f212_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l910_c7_047e_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5691_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_9aca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_80ba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a7c3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a9ef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_15d8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c24_8344_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l896_c3_f388_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l878_c2_695a_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l892_c7_b948_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l884_l907_l878_l902_l899_l895_l892_l916_l887_DUPLICATE_1494 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l884_l907_l878_l902_l899_l895_l892_l916_l887_DUPLICATE_1494_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l910_l916_DUPLICATE_ef4b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l910_l916_DUPLICATE_ef4b_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l878_c6_4e0c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c_left;
     BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c_return_output := BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l892_l887_DUPLICATE_e884 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l892_l887_DUPLICATE_e884_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l902_c11_9aca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l902_c11_9aca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_9aca_left;
     BIN_OP_EQ_uxn_opcodes_h_l902_c11_9aca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_9aca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_9aca_return_output := BIN_OP_EQ_uxn_opcodes_h_l902_c11_9aca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l887_c11_1a8d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d_left;
     BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d_return_output := BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l914_c32_d2ce] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l914_c32_d2ce_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l914_c32_d2ce_left;
     BIN_OP_AND_uxn_opcodes_h_l914_c32_d2ce_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l914_c32_d2ce_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l914_c32_d2ce_return_output := BIN_OP_AND_uxn_opcodes_h_l914_c32_d2ce_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l922_l892_l887_DUPLICATE_aaab LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l922_l892_l887_DUPLICATE_aaab_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l899_c11_5691] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l899_c11_5691_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5691_left;
     BIN_OP_EQ_uxn_opcodes_h_l899_c11_5691_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5691_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5691_return_output := BIN_OP_EQ_uxn_opcodes_h_l899_c11_5691_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l892_l916_l887_DUPLICATE_b05b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l892_l916_l887_DUPLICATE_b05b_return_output := result.stack_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l896_l911_l888_l903_DUPLICATE_96ec LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l896_l911_l888_l903_DUPLICATE_96ec_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l892_c11_4173] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173_left;
     BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173_return_output := BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l895_c11_77b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l916_c11_a9ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l916_c11_a9ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a9ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l916_c11_a9ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a9ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a9ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l916_c11_a9ef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l922_c11_15d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l922_c11_15d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_15d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l922_c11_15d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_15d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_15d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l922_c11_15d8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l907_c11_80ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l907_c11_80ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_80ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l907_c11_80ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_80ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_80ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l907_c11_80ba_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l884_c11_c962] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962_left;
     BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962_return_output := BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l920_c24_8344] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l920_c24_8344_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c24_8344_left;
     BIN_OP_EQ_uxn_opcodes_h_l920_c24_8344_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c24_8344_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c24_8344_return_output := BIN_OP_EQ_uxn_opcodes_h_l920_c24_8344_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l910_l884_l907_l902_l899_l895_l922_l892_l916_l887_DUPLICATE_45a2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l910_l884_l907_l902_l899_l895_l922_l892_l916_l887_DUPLICATE_45a2_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l910_l884_l907_l902_l899_l895_l892_l887_DUPLICATE_1f4e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l910_l884_l907_l902_l899_l895_l892_l887_DUPLICATE_1f4e_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l910_c11_a7c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l910_c11_a7c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a7c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l910_c11_a7c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a7c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a7c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l910_c11_a7c3_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l914_c32_9ee3_left := VAR_BIN_OP_AND_uxn_opcodes_h_l914_c32_d2ce_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l878_c1_f31a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l878_c2_695a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c2_695a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l878_c2_695a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l878_c2_695a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c2_695a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c2_695a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c2_695a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l878_c2_695a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l878_c2_695a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c6_4e0c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l884_c7_b10e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_b10e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l884_c7_b10e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l884_c7_b10e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_b10e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_b10e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_b10e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l884_c7_b10e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l884_c7_b10e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l884_c11_c962_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l887_c7_c2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_c2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l887_c7_c2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_c2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_c2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l887_c7_c2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l887_c7_c2d1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l887_c11_1a8d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l892_c7_b948_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_b948_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l892_c7_b948_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l892_c7_b948_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_b948_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_b948_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_b948_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l892_c7_b948_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l892_c7_b948_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l892_c11_4173_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l895_c7_ef4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_ef4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l895_c7_ef4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_ef4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_ef4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l895_c7_ef4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l895_c7_ef4e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l895_c11_77b6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l899_c7_8ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5691_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_8ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5691_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5691_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_8ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5691_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_8ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5691_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5691_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_8ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5691_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_8ccd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l899_c11_5691_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l902_c7_908d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_9aca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_908d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_9aca_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_908d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_9aca_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_908d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_9aca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_908d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_9aca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_908d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_9aca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_908d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_9aca_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l902_c7_908d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l902_c11_9aca_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l907_c7_f212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_80ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_f212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_80ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_f212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_80ba_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l907_c7_f212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_80ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_f212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_80ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_f212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_80ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_f212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_80ba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l907_c7_f212_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l907_c11_80ba_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l910_c7_047e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a7c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_047e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a7c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_047e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a7c3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l910_c7_047e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a7c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_047e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a7c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_047e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a7c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_047e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a7c3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l910_c7_047e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l910_c11_a7c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_3184_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a9ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_3184_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a9ef_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_3184_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a9ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_3184_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a9ef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_3184_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l916_c11_a9ef_return_output;
     VAR_MUX_uxn_opcodes_h_l920_c24_9236_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l920_c24_8344_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_8425_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_15d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_8425_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l922_c11_15d8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l896_c3_f388_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l896_l911_l888_l903_DUPLICATE_96ec_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l911_c3_b6cc_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l896_l911_l888_l903_DUPLICATE_96ec_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l904_l889_DUPLICATE_e187_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l896_l911_l888_l903_DUPLICATE_96ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c2_695a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l892_l887_DUPLICATE_e884_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l892_l887_DUPLICATE_e884_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l892_l887_DUPLICATE_e884_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_b948_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l892_l887_DUPLICATE_e884_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l892_l887_DUPLICATE_e884_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l892_l887_DUPLICATE_e884_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_908d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l892_l887_DUPLICATE_e884_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_f212_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l892_l887_DUPLICATE_e884_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_047e_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l892_l887_DUPLICATE_e884_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l910_l884_l907_l902_l899_l895_l922_l892_l916_l887_DUPLICATE_45a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l910_l884_l907_l902_l899_l895_l922_l892_l916_l887_DUPLICATE_45a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_b948_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l910_l884_l907_l902_l899_l895_l922_l892_l916_l887_DUPLICATE_45a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l910_l884_l907_l902_l899_l895_l922_l892_l916_l887_DUPLICATE_45a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l910_l884_l907_l902_l899_l895_l922_l892_l916_l887_DUPLICATE_45a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_908d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l910_l884_l907_l902_l899_l895_l922_l892_l916_l887_DUPLICATE_45a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_f212_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l910_l884_l907_l902_l899_l895_l922_l892_l916_l887_DUPLICATE_45a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_047e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l910_l884_l907_l902_l899_l895_l922_l892_l916_l887_DUPLICATE_45a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_3184_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l910_l884_l907_l902_l899_l895_l922_l892_l916_l887_DUPLICATE_45a2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_8425_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l910_l884_l907_l902_l899_l895_l922_l892_l916_l887_DUPLICATE_45a2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l878_c2_695a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l884_l907_l878_l902_l899_l895_l892_l916_l887_DUPLICATE_1494_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l884_l907_l878_l902_l899_l895_l892_l916_l887_DUPLICATE_1494_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l884_l907_l878_l902_l899_l895_l892_l916_l887_DUPLICATE_1494_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l892_c7_b948_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l884_l907_l878_l902_l899_l895_l892_l916_l887_DUPLICATE_1494_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l884_l907_l878_l902_l899_l895_l892_l916_l887_DUPLICATE_1494_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l884_l907_l878_l902_l899_l895_l892_l916_l887_DUPLICATE_1494_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_908d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l884_l907_l878_l902_l899_l895_l892_l916_l887_DUPLICATE_1494_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_f212_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l884_l907_l878_l902_l899_l895_l892_l916_l887_DUPLICATE_1494_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_3184_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l884_l907_l878_l902_l899_l895_l892_l916_l887_DUPLICATE_1494_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l910_l884_l907_l902_l899_l895_l892_l887_DUPLICATE_1f4e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l910_l884_l907_l902_l899_l895_l892_l887_DUPLICATE_1f4e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l892_c7_b948_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l910_l884_l907_l902_l899_l895_l892_l887_DUPLICATE_1f4e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l910_l884_l907_l902_l899_l895_l892_l887_DUPLICATE_1f4e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l910_l884_l907_l902_l899_l895_l892_l887_DUPLICATE_1f4e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_908d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l910_l884_l907_l902_l899_l895_l892_l887_DUPLICATE_1f4e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l907_c7_f212_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l910_l884_l907_l902_l899_l895_l892_l887_DUPLICATE_1f4e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l910_c7_047e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l910_l884_l907_l902_l899_l895_l892_l887_DUPLICATE_1f4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c2_695a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l922_l892_l887_DUPLICATE_aaab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l922_l892_l887_DUPLICATE_aaab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l922_l892_l887_DUPLICATE_aaab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_b948_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l922_l892_l887_DUPLICATE_aaab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l922_l892_l887_DUPLICATE_aaab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l922_l892_l887_DUPLICATE_aaab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_908d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l922_l892_l887_DUPLICATE_aaab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_f212_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l922_l892_l887_DUPLICATE_aaab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_047e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l922_l892_l887_DUPLICATE_aaab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_8425_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l922_l892_l887_DUPLICATE_aaab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_047e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l910_l916_DUPLICATE_ef4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_3184_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l910_l916_DUPLICATE_ef4b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l878_c2_695a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l892_l916_l887_DUPLICATE_b05b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l892_l916_l887_DUPLICATE_b05b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l892_l916_l887_DUPLICATE_b05b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l892_c7_b948_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l892_l916_l887_DUPLICATE_b05b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l892_l916_l887_DUPLICATE_b05b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l892_l916_l887_DUPLICATE_b05b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l902_c7_908d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l892_l916_l887_DUPLICATE_b05b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l907_c7_f212_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l892_l916_l887_DUPLICATE_b05b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l910_c7_047e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l892_l916_l887_DUPLICATE_b05b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_3184_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l910_l884_l907_l878_l902_l899_l895_l892_l916_l887_DUPLICATE_b05b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l922_c7_8425] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_8425_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_8425_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_8425_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_8425_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_8425_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_8425_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_8425_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_8425_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l896_c3_f388] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l896_c3_f388_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l896_c3_f388_left;
     BIN_OP_OR_uxn_opcodes_h_l896_c3_f388_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l896_c3_f388_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l896_c3_f388_return_output := BIN_OP_OR_uxn_opcodes_h_l896_c3_f388_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l904_l889_DUPLICATE_e187 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l904_l889_DUPLICATE_e187_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l904_l889_DUPLICATE_e187_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l904_l889_DUPLICATE_e187_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l904_l889_DUPLICATE_e187_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l911_c3_b6cc] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l911_c3_b6cc_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l911_c3_b6cc_left;
     BIN_OP_OR_uxn_opcodes_h_l911_c3_b6cc_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l911_c3_b6cc_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l911_c3_b6cc_return_output := BIN_OP_OR_uxn_opcodes_h_l911_c3_b6cc_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l910_c7_047e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l910_c7_047e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l910_c7_047e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l910_c7_047e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l910_c7_047e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l910_c7_047e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l910_c7_047e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l910_c7_047e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l910_c7_047e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l916_c7_3184] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_3184_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_3184_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_3184_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_3184_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_3184_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_3184_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_3184_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_3184_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l922_c7_8425] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_8425_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_8425_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_8425_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_8425_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_8425_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_8425_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_8425_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_8425_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l916_c7_3184] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_3184_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_3184_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_3184_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_3184_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_3184_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_3184_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_3184_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_3184_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l878_c1_f31a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l878_c1_f31a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l878_c1_f31a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l878_c1_f31a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l878_c1_f31a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l878_c1_f31a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l878_c1_f31a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l878_c1_f31a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l878_c1_f31a_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l914_c32_9ee3] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l914_c32_9ee3_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l914_c32_9ee3_left;
     BIN_OP_GT_uxn_opcodes_h_l914_c32_9ee3_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l914_c32_9ee3_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l914_c32_9ee3_return_output := BIN_OP_GT_uxn_opcodes_h_l914_c32_9ee3_return_output;

     -- MUX[uxn_opcodes_h_l920_c24_9236] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l920_c24_9236_cond <= VAR_MUX_uxn_opcodes_h_l920_c24_9236_cond;
     MUX_uxn_opcodes_h_l920_c24_9236_iftrue <= VAR_MUX_uxn_opcodes_h_l920_c24_9236_iftrue;
     MUX_uxn_opcodes_h_l920_c24_9236_iffalse <= VAR_MUX_uxn_opcodes_h_l920_c24_9236_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l920_c24_9236_return_output := MUX_uxn_opcodes_h_l920_c24_9236_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l914_c32_2fa8_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l914_c32_9ee3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l896_c3_f388_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l910_c7_047e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l911_c3_b6cc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l902_c7_908d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l904_l889_DUPLICATE_e187_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l904_l889_DUPLICATE_e187_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_3184_iftrue := VAR_MUX_uxn_opcodes_h_l920_c24_9236_return_output;
     VAR_printf_uxn_opcodes_h_l879_c3_da05_uxn_opcodes_h_l879_c3_da05_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l878_c1_f31a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_3184_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l922_c7_8425_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_047e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l916_c7_3184_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l907_c7_f212_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l910_c7_047e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_3184_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l922_c7_8425_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_047e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l916_c7_3184_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l910_c7_047e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_047e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_047e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_047e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_047e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_047e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_047e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_047e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_047e_return_output;

     -- printf_uxn_opcodes_h_l879_c3_da05[uxn_opcodes_h_l879_c3_da05] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l879_c3_da05_uxn_opcodes_h_l879_c3_da05_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l879_c3_da05_uxn_opcodes_h_l879_c3_da05_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l914_c32_2fa8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l914_c32_2fa8_cond <= VAR_MUX_uxn_opcodes_h_l914_c32_2fa8_cond;
     MUX_uxn_opcodes_h_l914_c32_2fa8_iftrue <= VAR_MUX_uxn_opcodes_h_l914_c32_2fa8_iftrue;
     MUX_uxn_opcodes_h_l914_c32_2fa8_iffalse <= VAR_MUX_uxn_opcodes_h_l914_c32_2fa8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l914_c32_2fa8_return_output := MUX_uxn_opcodes_h_l914_c32_2fa8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l916_c7_3184] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_3184_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_3184_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_3184_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_3184_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_3184_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_3184_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_3184_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_3184_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l916_c7_3184] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l916_c7_3184_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_3184_cond;
     result_stack_value_MUX_uxn_opcodes_h_l916_c7_3184_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_3184_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l916_c7_3184_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_3184_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_3184_return_output := result_stack_value_MUX_uxn_opcodes_h_l916_c7_3184_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l916_c7_3184] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_3184_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_3184_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_3184_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_3184_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_3184_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_3184_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_3184_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_3184_return_output;

     -- t16_MUX[uxn_opcodes_h_l895_c7_ef4e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l895_c7_ef4e_cond <= VAR_t16_MUX_uxn_opcodes_h_l895_c7_ef4e_cond;
     t16_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue;
     t16_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output := t16_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l907_c7_f212] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l907_c7_f212_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l907_c7_f212_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l907_c7_f212_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l907_c7_f212_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l907_c7_f212_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l907_c7_f212_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l907_c7_f212_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l907_c7_f212_return_output;

     -- n16_MUX[uxn_opcodes_h_l910_c7_047e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l910_c7_047e_cond <= VAR_n16_MUX_uxn_opcodes_h_l910_c7_047e_cond;
     n16_MUX_uxn_opcodes_h_l910_c7_047e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l910_c7_047e_iftrue;
     n16_MUX_uxn_opcodes_h_l910_c7_047e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l910_c7_047e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l910_c7_047e_return_output := n16_MUX_uxn_opcodes_h_l910_c7_047e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l910_c7_047e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_047e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_047e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_047e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_047e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_047e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_047e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_047e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_047e_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_047e_iftrue := VAR_MUX_uxn_opcodes_h_l914_c32_2fa8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l907_c7_f212_iffalse := VAR_n16_MUX_uxn_opcodes_h_l910_c7_047e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_047e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l916_c7_3184_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_f212_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l910_c7_047e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_908d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l907_c7_f212_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_047e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l916_c7_3184_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_f212_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l910_c7_047e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l910_c7_047e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l916_c7_3184_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l892_c7_b948_iffalse := VAR_t16_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l907_c7_f212] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_f212_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_f212_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_f212_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_f212_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_f212_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_f212_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_f212_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_f212_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l910_c7_047e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_047e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_047e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_047e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_047e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_047e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_047e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_047e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_047e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l902_c7_908d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_908d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_908d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_908d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_908d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_908d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_908d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_908d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_908d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l910_c7_047e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_047e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_047e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_047e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_047e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_047e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_047e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_047e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_047e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l910_c7_047e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_047e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_047e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_047e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_047e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_047e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_047e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_047e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_047e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l907_c7_f212] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_f212_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_f212_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_f212_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_f212_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_f212_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_f212_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_f212_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_f212_return_output;

     -- n16_MUX[uxn_opcodes_h_l907_c7_f212] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l907_c7_f212_cond <= VAR_n16_MUX_uxn_opcodes_h_l907_c7_f212_cond;
     n16_MUX_uxn_opcodes_h_l907_c7_f212_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l907_c7_f212_iftrue;
     n16_MUX_uxn_opcodes_h_l907_c7_f212_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l907_c7_f212_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l907_c7_f212_return_output := n16_MUX_uxn_opcodes_h_l907_c7_f212_return_output;

     -- t16_MUX[uxn_opcodes_h_l892_c7_b948] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l892_c7_b948_cond <= VAR_t16_MUX_uxn_opcodes_h_l892_c7_b948_cond;
     t16_MUX_uxn_opcodes_h_l892_c7_b948_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l892_c7_b948_iftrue;
     t16_MUX_uxn_opcodes_h_l892_c7_b948_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l892_c7_b948_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l892_c7_b948_return_output := t16_MUX_uxn_opcodes_h_l892_c7_b948_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l910_c7_047e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l910_c7_047e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l910_c7_047e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l910_c7_047e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l910_c7_047e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l910_c7_047e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l910_c7_047e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l910_c7_047e_return_output := result_stack_value_MUX_uxn_opcodes_h_l910_c7_047e_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l902_c7_908d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l907_c7_f212_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_f212_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l910_c7_047e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_908d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l907_c7_f212_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l902_c7_908d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_f212_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l910_c7_047e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_f212_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l910_c7_047e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_908d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l907_c7_f212_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l907_c7_f212_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l910_c7_047e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l892_c7_b948_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l907_c7_f212] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_f212_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_f212_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_f212_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_f212_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_f212_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_f212_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_f212_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_f212_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l899_c7_8ccd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_8ccd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_8ccd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l907_c7_f212] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_f212_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_f212_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_f212_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_f212_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_f212_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_f212_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_f212_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_f212_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l907_c7_f212] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_f212_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_f212_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_f212_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_f212_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_f212_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_f212_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_f212_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_f212_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l902_c7_908d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_908d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_908d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_908d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_908d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_908d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_908d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_908d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_908d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l907_c7_f212] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l907_c7_f212_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l907_c7_f212_cond;
     result_stack_value_MUX_uxn_opcodes_h_l907_c7_f212_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l907_c7_f212_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l907_c7_f212_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l907_c7_f212_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l907_c7_f212_return_output := result_stack_value_MUX_uxn_opcodes_h_l907_c7_f212_return_output;

     -- t16_MUX[uxn_opcodes_h_l887_c7_c2d1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l887_c7_c2d1_cond <= VAR_t16_MUX_uxn_opcodes_h_l887_c7_c2d1_cond;
     t16_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue;
     t16_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output := t16_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output;

     -- n16_MUX[uxn_opcodes_h_l902_c7_908d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l902_c7_908d_cond <= VAR_n16_MUX_uxn_opcodes_h_l902_c7_908d_cond;
     n16_MUX_uxn_opcodes_h_l902_c7_908d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l902_c7_908d_iftrue;
     n16_MUX_uxn_opcodes_h_l902_c7_908d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l902_c7_908d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l902_c7_908d_return_output := n16_MUX_uxn_opcodes_h_l902_c7_908d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l902_c7_908d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_908d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_908d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_908d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_908d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_908d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_908d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_908d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_908d_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l902_c7_908d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_908d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l907_c7_f212_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l902_c7_908d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_908d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l907_c7_f212_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_908d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l907_c7_f212_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l902_c7_908d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l902_c7_908d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l907_c7_f212_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l902_c7_908d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l902_c7_908d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l902_c7_908d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l902_c7_908d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l902_c7_908d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l902_c7_908d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l902_c7_908d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l902_c7_908d_return_output := result_stack_value_MUX_uxn_opcodes_h_l902_c7_908d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l902_c7_908d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_908d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_908d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_908d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_908d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_908d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_908d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_908d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_908d_return_output;

     -- n16_MUX[uxn_opcodes_h_l899_c7_8ccd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l899_c7_8ccd_cond <= VAR_n16_MUX_uxn_opcodes_h_l899_c7_8ccd_cond;
     n16_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue;
     n16_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output := n16_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l899_c7_8ccd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l895_c7_ef4e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l895_c7_ef4e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l895_c7_ef4e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l899_c7_8ccd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_8ccd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_8ccd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l902_c7_908d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_908d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_908d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_908d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_908d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_908d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_908d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_908d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_908d_return_output;

     -- t16_MUX[uxn_opcodes_h_l884_c7_b10e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l884_c7_b10e_cond <= VAR_t16_MUX_uxn_opcodes_h_l884_c7_b10e_cond;
     t16_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue;
     t16_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l884_c7_b10e_return_output := t16_MUX_uxn_opcodes_h_l884_c7_b10e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l902_c7_908d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_908d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_908d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_908d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_908d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_908d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_908d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_908d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_908d_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l902_c7_908d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l892_c7_b948_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l902_c7_908d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l902_c7_908d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l902_c7_908d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l878_c2_695a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l884_c7_b10e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l899_c7_8ccd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l895_c7_ef4e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l899_c7_8ccd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l899_c7_8ccd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_8ccd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output := result_stack_value_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l899_c7_8ccd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_8ccd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_8ccd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output;

     -- n16_MUX[uxn_opcodes_h_l895_c7_ef4e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l895_c7_ef4e_cond <= VAR_n16_MUX_uxn_opcodes_h_l895_c7_ef4e_cond;
     n16_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue;
     n16_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output := n16_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l895_c7_ef4e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_ef4e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_ef4e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output;

     -- t16_MUX[uxn_opcodes_h_l878_c2_695a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l878_c2_695a_cond <= VAR_t16_MUX_uxn_opcodes_h_l878_c2_695a_cond;
     t16_MUX_uxn_opcodes_h_l878_c2_695a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l878_c2_695a_iftrue;
     t16_MUX_uxn_opcodes_h_l878_c2_695a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l878_c2_695a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l878_c2_695a_return_output := t16_MUX_uxn_opcodes_h_l878_c2_695a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l899_c7_8ccd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_8ccd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_8ccd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_8ccd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_8ccd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l892_c7_b948] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l892_c7_b948_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l892_c7_b948_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l892_c7_b948_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l892_c7_b948_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l892_c7_b948_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l892_c7_b948_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l892_c7_b948_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l892_c7_b948_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l892_c7_b948_iffalse := VAR_n16_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l892_c7_b948_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l892_c7_b948_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_b948_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l899_c7_8ccd_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l878_c2_695a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l895_c7_ef4e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l892_c7_b948] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l892_c7_b948_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l892_c7_b948_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l892_c7_b948_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l892_c7_b948_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l892_c7_b948_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l892_c7_b948_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l892_c7_b948_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l892_c7_b948_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l895_c7_ef4e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_ef4e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_ef4e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l887_c7_c2d1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l887_c7_c2d1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l887_c7_c2d1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l895_c7_ef4e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_ef4e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_ef4e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l892_c7_b948] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_b948_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_b948_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_b948_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_b948_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_b948_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_b948_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_b948_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_b948_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l895_c7_ef4e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l895_c7_ef4e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l895_c7_ef4e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l895_c7_ef4e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l895_c7_ef4e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output := result_stack_value_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output;

     -- n16_MUX[uxn_opcodes_h_l892_c7_b948] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l892_c7_b948_cond <= VAR_n16_MUX_uxn_opcodes_h_l892_c7_b948_cond;
     n16_MUX_uxn_opcodes_h_l892_c7_b948_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l892_c7_b948_iftrue;
     n16_MUX_uxn_opcodes_h_l892_c7_b948_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l892_c7_b948_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l892_c7_b948_return_output := n16_MUX_uxn_opcodes_h_l892_c7_b948_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l892_c7_b948_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_b948_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l892_c7_b948_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_b948_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_b948_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l892_c7_b948_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l892_c7_b948_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l895_c7_ef4e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l887_c7_c2d1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l892_c7_b948] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_b948_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_b948_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_b948_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_b948_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_b948_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_b948_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_b948_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_b948_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l892_c7_b948] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l892_c7_b948_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l892_c7_b948_cond;
     result_stack_value_MUX_uxn_opcodes_h_l892_c7_b948_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l892_c7_b948_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l892_c7_b948_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l892_c7_b948_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l892_c7_b948_return_output := result_stack_value_MUX_uxn_opcodes_h_l892_c7_b948_return_output;

     -- n16_MUX[uxn_opcodes_h_l887_c7_c2d1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l887_c7_c2d1_cond <= VAR_n16_MUX_uxn_opcodes_h_l887_c7_c2d1_cond;
     n16_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue;
     n16_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output := n16_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l884_c7_b10e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l884_c7_b10e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l884_c7_b10e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l884_c7_b10e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l884_c7_b10e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l892_c7_b948] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_b948_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_b948_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_b948_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_b948_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_b948_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_b948_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_b948_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_b948_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l892_c7_b948] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_b948_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_b948_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_b948_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_b948_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_b948_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_b948_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_b948_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_b948_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l887_c7_c2d1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_c2d1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_c2d1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l892_c7_b948_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l878_c2_695a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l884_c7_b10e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l892_c7_b948_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l892_c7_b948_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l892_c7_b948_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l878_c2_695a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l878_c2_695a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l878_c2_695a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l878_c2_695a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l878_c2_695a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l878_c2_695a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l878_c2_695a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l878_c2_695a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l878_c2_695a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l884_c7_b10e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_b10e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_b10e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_b10e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_b10e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l887_c7_c2d1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_c2d1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_c2d1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output;

     -- n16_MUX[uxn_opcodes_h_l884_c7_b10e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l884_c7_b10e_cond <= VAR_n16_MUX_uxn_opcodes_h_l884_c7_b10e_cond;
     n16_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue;
     n16_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l884_c7_b10e_return_output := n16_MUX_uxn_opcodes_h_l884_c7_b10e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l887_c7_c2d1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l884_c7_b10e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l884_c7_b10e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l884_c7_b10e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l884_c7_b10e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l884_c7_b10e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l887_c7_c2d1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_c2d1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_c2d1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l887_c7_c2d1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l887_c7_c2d1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l887_c7_c2d1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l887_c7_c2d1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l887_c7_c2d1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output := result_stack_value_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l878_c2_695a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l884_c7_b10e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l878_c2_695a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l884_c7_b10e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c2_695a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l884_c7_b10e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l887_c7_c2d1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l884_c7_b10e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_b10e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_b10e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_b10e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_b10e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l878_c2_695a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l878_c2_695a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l878_c2_695a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l878_c2_695a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l878_c2_695a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l878_c2_695a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l878_c2_695a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l878_c2_695a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l878_c2_695a_return_output;

     -- n16_MUX[uxn_opcodes_h_l878_c2_695a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l878_c2_695a_cond <= VAR_n16_MUX_uxn_opcodes_h_l878_c2_695a_cond;
     n16_MUX_uxn_opcodes_h_l878_c2_695a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l878_c2_695a_iftrue;
     n16_MUX_uxn_opcodes_h_l878_c2_695a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l878_c2_695a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l878_c2_695a_return_output := n16_MUX_uxn_opcodes_h_l878_c2_695a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l884_c7_b10e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l884_c7_b10e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l884_c7_b10e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l884_c7_b10e_return_output := result_stack_value_MUX_uxn_opcodes_h_l884_c7_b10e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l884_c7_b10e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_b10e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_b10e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_b10e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_b10e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l878_c2_695a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c2_695a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c2_695a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c2_695a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c2_695a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c2_695a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c2_695a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c2_695a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c2_695a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l884_c7_b10e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_b10e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_b10e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_b10e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_b10e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_b10e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_b10e_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l878_c2_695a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c2_695a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l884_c7_b10e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c2_695a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l884_c7_b10e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c2_695a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l884_c7_b10e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l878_c2_695a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l884_c7_b10e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l878_c2_695a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c2_695a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c2_695a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c2_695a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c2_695a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c2_695a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c2_695a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c2_695a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c2_695a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l878_c2_695a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l878_c2_695a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c2_695a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l878_c2_695a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c2_695a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l878_c2_695a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c2_695a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c2_695a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l878_c2_695a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l878_c2_695a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l878_c2_695a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c2_695a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l878_c2_695a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c2_695a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l878_c2_695a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c2_695a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c2_695a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l878_c2_695a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l878_c2_695a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l878_c2_695a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l878_c2_695a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l878_c2_695a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l878_c2_695a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l878_c2_695a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l878_c2_695a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l878_c2_695a_return_output := result_stack_value_MUX_uxn_opcodes_h_l878_c2_695a_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l927_l874_DUPLICATE_cc7e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l927_l874_DUPLICATE_cc7e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_28d7(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l878_c2_695a_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c2_695a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c2_695a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c2_695a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l878_c2_695a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c2_695a_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l878_c2_695a_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l927_l874_DUPLICATE_cc7e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l927_l874_DUPLICATE_cc7e_return_output;
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
