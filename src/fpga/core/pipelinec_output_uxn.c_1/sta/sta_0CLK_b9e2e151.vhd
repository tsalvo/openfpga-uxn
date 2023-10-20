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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 76
entity sta_0CLK_b9e2e151 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sta_0CLK_b9e2e151;
architecture arch of sta_0CLK_b9e2e151 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2440_c6_c098]
signal BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2440_c2_a2c9]
signal n8_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2440_c2_a2c9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2440_c2_a2c9]
signal result_u8_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2440_c2_a2c9]
signal result_u16_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2440_c2_a2c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2440_c2_a2c9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2440_c2_a2c9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2440_c2_a2c9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2440_c2_a2c9]
signal t16_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2445_c11_a61d]
signal BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2445_c7_51a1]
signal n8_MUX_uxn_opcodes_h_l2445_c7_51a1_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2445_c7_51a1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_51a1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2445_c7_51a1]
signal result_u8_value_MUX_uxn_opcodes_h_l2445_c7_51a1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2445_c7_51a1]
signal result_u16_value_MUX_uxn_opcodes_h_l2445_c7_51a1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2445_c7_51a1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_51a1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2445_c7_51a1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_51a1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2445_c7_51a1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2445_c7_51a1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2445_c7_51a1]
signal t16_MUX_uxn_opcodes_h_l2445_c7_51a1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2448_c11_88e8]
signal BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2448_c7_7319]
signal n8_MUX_uxn_opcodes_h_l2448_c7_7319_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2448_c7_7319_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2448_c7_7319]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c7_7319_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c7_7319_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2448_c7_7319]
signal result_u8_value_MUX_uxn_opcodes_h_l2448_c7_7319_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2448_c7_7319_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2448_c7_7319]
signal result_u16_value_MUX_uxn_opcodes_h_l2448_c7_7319_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2448_c7_7319_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2448_c7_7319]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2448_c7_7319_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2448_c7_7319_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2448_c7_7319]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2448_c7_7319_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2448_c7_7319_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2448_c7_7319]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c7_7319_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c7_7319_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2448_c7_7319]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c7_7319_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c7_7319_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2448_c7_7319]
signal t16_MUX_uxn_opcodes_h_l2448_c7_7319_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2448_c7_7319_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2450_c3_46a5]
signal CONST_SL_8_uxn_opcodes_h_l2450_c3_46a5_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2450_c3_46a5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2453_c11_3397]
signal BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2453_c7_b85e]
signal n8_MUX_uxn_opcodes_h_l2453_c7_b85e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2453_c7_b85e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_b85e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2453_c7_b85e]
signal result_u8_value_MUX_uxn_opcodes_h_l2453_c7_b85e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2453_c7_b85e]
signal result_u16_value_MUX_uxn_opcodes_h_l2453_c7_b85e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2453_c7_b85e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_b85e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2453_c7_b85e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_b85e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2453_c7_b85e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2453_c7_b85e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2453_c7_b85e]
signal t16_MUX_uxn_opcodes_h_l2453_c7_b85e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2456_c11_3ade]
signal BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2456_c7_ae59]
signal n8_MUX_uxn_opcodes_h_l2456_c7_ae59_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2456_c7_ae59]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_ae59_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2456_c7_ae59]
signal result_u8_value_MUX_uxn_opcodes_h_l2456_c7_ae59_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2456_c7_ae59]
signal result_u16_value_MUX_uxn_opcodes_h_l2456_c7_ae59_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2456_c7_ae59]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_ae59_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2456_c7_ae59]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2456_c7_ae59_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2456_c7_ae59]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2456_c7_ae59]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2456_c7_ae59]
signal t16_MUX_uxn_opcodes_h_l2456_c7_ae59_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2457_c3_1533]
signal BIN_OP_OR_uxn_opcodes_h_l2457_c3_1533_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2457_c3_1533_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2457_c3_1533_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2460_c11_8137]
signal BIN_OP_EQ_uxn_opcodes_h_l2460_c11_8137_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2460_c11_8137_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2460_c11_8137_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2460_c7_0639]
signal n8_MUX_uxn_opcodes_h_l2460_c7_0639_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2460_c7_0639_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2460_c7_0639]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_0639_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_0639_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2460_c7_0639]
signal result_u8_value_MUX_uxn_opcodes_h_l2460_c7_0639_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2460_c7_0639_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2460_c7_0639]
signal result_u16_value_MUX_uxn_opcodes_h_l2460_c7_0639_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2460_c7_0639_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2460_c7_0639]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_0639_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_0639_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2460_c7_0639]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_0639_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_0639_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2460_c7_0639]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_0639_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_0639_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2460_c7_0639]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_0639_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_0639_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2463_c11_e803]
signal BIN_OP_EQ_uxn_opcodes_h_l2463_c11_e803_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2463_c11_e803_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2463_c11_e803_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2463_c7_9073]
signal n8_MUX_uxn_opcodes_h_l2463_c7_9073_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2463_c7_9073_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l2463_c7_9073]
signal result_u16_value_MUX_uxn_opcodes_h_l2463_c7_9073_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l2463_c7_9073_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2463_c7_9073]
signal result_u8_value_MUX_uxn_opcodes_h_l2463_c7_9073_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2463_c7_9073_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2463_c7_9073]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_9073_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_9073_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2463_c7_9073]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2463_c7_9073_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2463_c7_9073_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2463_c7_9073]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_9073_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_9073_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2463_c7_9073]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_9073_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_9073_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2466_c30_5e38]
signal sp_relative_shift_uxn_opcodes_h_l2466_c30_5e38_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2466_c30_5e38_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2466_c30_5e38_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2466_c30_5e38_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2471_c11_5d89]
signal BIN_OP_EQ_uxn_opcodes_h_l2471_c11_5d89_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2471_c11_5d89_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2471_c11_5d89_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2471_c7_f211]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_f211_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_f211_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_f211_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_f211_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2471_c7_f211]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2471_c7_f211_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2471_c7_f211_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2471_c7_f211_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2471_c7_f211_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2471_c7_f211]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_f211_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_f211_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_f211_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_f211_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_sp_shift := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098
BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098_left,
BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098_right,
BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098_return_output);

-- n8_MUX_uxn_opcodes_h_l2440_c2_a2c9
n8_MUX_uxn_opcodes_h_l2440_c2_a2c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond,
n8_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue,
n8_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse,
n8_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c2_a2c9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c2_a2c9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2440_c2_a2c9
result_u8_value_MUX_uxn_opcodes_h_l2440_c2_a2c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2440_c2_a2c9
result_u16_value_MUX_uxn_opcodes_h_l2440_c2_a2c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond,
result_u16_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2440_c2_a2c9
result_is_opc_done_MUX_uxn_opcodes_h_l2440_c2_a2c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2440_c2_a2c9
result_is_ram_write_MUX_uxn_opcodes_h_l2440_c2_a2c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9
result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output);

-- t16_MUX_uxn_opcodes_h_l2440_c2_a2c9
t16_MUX_uxn_opcodes_h_l2440_c2_a2c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond,
t16_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue,
t16_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse,
t16_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d
BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d_left,
BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d_right,
BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d_return_output);

-- n8_MUX_uxn_opcodes_h_l2445_c7_51a1
n8_MUX_uxn_opcodes_h_l2445_c7_51a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2445_c7_51a1_cond,
n8_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue,
n8_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse,
n8_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_51a1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_51a1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_51a1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2445_c7_51a1
result_u8_value_MUX_uxn_opcodes_h_l2445_c7_51a1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2445_c7_51a1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2445_c7_51a1
result_u16_value_MUX_uxn_opcodes_h_l2445_c7_51a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2445_c7_51a1_cond,
result_u16_value_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_51a1
result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_51a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_51a1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_51a1
result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_51a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_51a1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_51a1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_51a1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_51a1
result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_51a1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output);

-- t16_MUX_uxn_opcodes_h_l2445_c7_51a1
t16_MUX_uxn_opcodes_h_l2445_c7_51a1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2445_c7_51a1_cond,
t16_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue,
t16_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse,
t16_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8
BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8_left,
BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8_right,
BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8_return_output);

-- n8_MUX_uxn_opcodes_h_l2448_c7_7319
n8_MUX_uxn_opcodes_h_l2448_c7_7319 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2448_c7_7319_cond,
n8_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue,
n8_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse,
n8_MUX_uxn_opcodes_h_l2448_c7_7319_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c7_7319
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c7_7319 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c7_7319_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c7_7319_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2448_c7_7319
result_u8_value_MUX_uxn_opcodes_h_l2448_c7_7319 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2448_c7_7319_cond,
result_u8_value_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2448_c7_7319_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2448_c7_7319
result_u16_value_MUX_uxn_opcodes_h_l2448_c7_7319 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2448_c7_7319_cond,
result_u16_value_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2448_c7_7319_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2448_c7_7319
result_is_opc_done_MUX_uxn_opcodes_h_l2448_c7_7319 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2448_c7_7319_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2448_c7_7319_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2448_c7_7319
result_is_ram_write_MUX_uxn_opcodes_h_l2448_c7_7319 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2448_c7_7319_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2448_c7_7319_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c7_7319
result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c7_7319 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c7_7319_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c7_7319_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c7_7319
result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c7_7319 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c7_7319_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c7_7319_return_output);

-- t16_MUX_uxn_opcodes_h_l2448_c7_7319
t16_MUX_uxn_opcodes_h_l2448_c7_7319 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2448_c7_7319_cond,
t16_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue,
t16_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse,
t16_MUX_uxn_opcodes_h_l2448_c7_7319_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2450_c3_46a5
CONST_SL_8_uxn_opcodes_h_l2450_c3_46a5 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2450_c3_46a5_x,
CONST_SL_8_uxn_opcodes_h_l2450_c3_46a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397
BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397_left,
BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397_right,
BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397_return_output);

-- n8_MUX_uxn_opcodes_h_l2453_c7_b85e
n8_MUX_uxn_opcodes_h_l2453_c7_b85e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2453_c7_b85e_cond,
n8_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue,
n8_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse,
n8_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_b85e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_b85e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_b85e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2453_c7_b85e
result_u8_value_MUX_uxn_opcodes_h_l2453_c7_b85e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2453_c7_b85e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2453_c7_b85e
result_u16_value_MUX_uxn_opcodes_h_l2453_c7_b85e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2453_c7_b85e_cond,
result_u16_value_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_b85e
result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_b85e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_b85e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_b85e
result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_b85e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_b85e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_b85e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_b85e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_b85e
result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_b85e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output);

-- t16_MUX_uxn_opcodes_h_l2453_c7_b85e
t16_MUX_uxn_opcodes_h_l2453_c7_b85e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2453_c7_b85e_cond,
t16_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue,
t16_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse,
t16_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade
BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade_left,
BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade_right,
BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade_return_output);

-- n8_MUX_uxn_opcodes_h_l2456_c7_ae59
n8_MUX_uxn_opcodes_h_l2456_c7_ae59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2456_c7_ae59_cond,
n8_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue,
n8_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse,
n8_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_ae59
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_ae59 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_ae59_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2456_c7_ae59
result_u8_value_MUX_uxn_opcodes_h_l2456_c7_ae59 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2456_c7_ae59_cond,
result_u8_value_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2456_c7_ae59
result_u16_value_MUX_uxn_opcodes_h_l2456_c7_ae59 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2456_c7_ae59_cond,
result_u16_value_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_ae59
result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_ae59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_ae59_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2456_c7_ae59
result_is_ram_write_MUX_uxn_opcodes_h_l2456_c7_ae59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2456_c7_ae59_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_ae59
result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_ae59 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_ae59
result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_ae59 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output);

-- t16_MUX_uxn_opcodes_h_l2456_c7_ae59
t16_MUX_uxn_opcodes_h_l2456_c7_ae59 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2456_c7_ae59_cond,
t16_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue,
t16_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse,
t16_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2457_c3_1533
BIN_OP_OR_uxn_opcodes_h_l2457_c3_1533 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2457_c3_1533_left,
BIN_OP_OR_uxn_opcodes_h_l2457_c3_1533_right,
BIN_OP_OR_uxn_opcodes_h_l2457_c3_1533_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2460_c11_8137
BIN_OP_EQ_uxn_opcodes_h_l2460_c11_8137 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2460_c11_8137_left,
BIN_OP_EQ_uxn_opcodes_h_l2460_c11_8137_right,
BIN_OP_EQ_uxn_opcodes_h_l2460_c11_8137_return_output);

-- n8_MUX_uxn_opcodes_h_l2460_c7_0639
n8_MUX_uxn_opcodes_h_l2460_c7_0639 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2460_c7_0639_cond,
n8_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue,
n8_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse,
n8_MUX_uxn_opcodes_h_l2460_c7_0639_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_0639
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_0639 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_0639_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_0639_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2460_c7_0639
result_u8_value_MUX_uxn_opcodes_h_l2460_c7_0639 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2460_c7_0639_cond,
result_u8_value_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2460_c7_0639_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2460_c7_0639
result_u16_value_MUX_uxn_opcodes_h_l2460_c7_0639 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2460_c7_0639_cond,
result_u16_value_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2460_c7_0639_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_0639
result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_0639 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_0639_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_0639_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_0639
result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_0639 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_0639_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_0639_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_0639
result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_0639 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_0639_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_0639_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_0639
result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_0639 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_0639_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_0639_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2463_c11_e803
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_e803 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_e803_left,
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_e803_right,
BIN_OP_EQ_uxn_opcodes_h_l2463_c11_e803_return_output);

-- n8_MUX_uxn_opcodes_h_l2463_c7_9073
n8_MUX_uxn_opcodes_h_l2463_c7_9073 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2463_c7_9073_cond,
n8_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue,
n8_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse,
n8_MUX_uxn_opcodes_h_l2463_c7_9073_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l2463_c7_9073
result_u16_value_MUX_uxn_opcodes_h_l2463_c7_9073 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l2463_c7_9073_cond,
result_u16_value_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l2463_c7_9073_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2463_c7_9073
result_u8_value_MUX_uxn_opcodes_h_l2463_c7_9073 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2463_c7_9073_cond,
result_u8_value_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2463_c7_9073_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_9073
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_9073 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_9073_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_9073_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2463_c7_9073
result_is_ram_write_MUX_uxn_opcodes_h_l2463_c7_9073 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2463_c7_9073_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2463_c7_9073_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_9073
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_9073 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_9073_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_9073_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_9073
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_9073 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_9073_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_9073_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2466_c30_5e38
sp_relative_shift_uxn_opcodes_h_l2466_c30_5e38 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2466_c30_5e38_ins,
sp_relative_shift_uxn_opcodes_h_l2466_c30_5e38_x,
sp_relative_shift_uxn_opcodes_h_l2466_c30_5e38_y,
sp_relative_shift_uxn_opcodes_h_l2466_c30_5e38_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2471_c11_5d89
BIN_OP_EQ_uxn_opcodes_h_l2471_c11_5d89 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2471_c11_5d89_left,
BIN_OP_EQ_uxn_opcodes_h_l2471_c11_5d89_right,
BIN_OP_EQ_uxn_opcodes_h_l2471_c11_5d89_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_f211
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_f211 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_f211_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_f211_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_f211_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_f211_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2471_c7_f211
result_is_ram_write_MUX_uxn_opcodes_h_l2471_c7_f211 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2471_c7_f211_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2471_c7_f211_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2471_c7_f211_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2471_c7_f211_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_f211
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_f211 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_f211_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_f211_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_f211_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_f211_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098_return_output,
 n8_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output,
 t16_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d_return_output,
 n8_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output,
 t16_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8_return_output,
 n8_MUX_uxn_opcodes_h_l2448_c7_7319_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c7_7319_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2448_c7_7319_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2448_c7_7319_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2448_c7_7319_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2448_c7_7319_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c7_7319_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c7_7319_return_output,
 t16_MUX_uxn_opcodes_h_l2448_c7_7319_return_output,
 CONST_SL_8_uxn_opcodes_h_l2450_c3_46a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397_return_output,
 n8_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output,
 t16_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade_return_output,
 n8_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output,
 t16_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2457_c3_1533_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2460_c11_8137_return_output,
 n8_MUX_uxn_opcodes_h_l2460_c7_0639_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_0639_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2460_c7_0639_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2460_c7_0639_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_0639_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_0639_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_0639_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_0639_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2463_c11_e803_return_output,
 n8_MUX_uxn_opcodes_h_l2463_c7_9073_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l2463_c7_9073_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2463_c7_9073_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_9073_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2463_c7_9073_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_9073_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_9073_return_output,
 sp_relative_shift_uxn_opcodes_h_l2466_c30_5e38_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2471_c11_5d89_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_f211_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2471_c7_f211_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_f211_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2442_c3_3e23 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2448_c7_7319_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2445_c7_51a1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2446_c3_eb2d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c7_7319_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_51a1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2448_c7_7319_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_51a1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2448_c7_7319_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_51a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c7_7319_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_51a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2448_c7_7319_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_51a1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c7_7319_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c7_7319_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2448_c7_7319_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2445_c7_51a1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2448_c7_7319_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2451_c3_985c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c7_7319_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2448_c7_7319_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2448_c7_7319_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c7_7319_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2448_c7_7319_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c7_7319_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c7_7319_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2448_c7_7319_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2450_c3_46a5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2450_c3_46a5_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2453_c7_b85e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2454_c3_e6c8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_b85e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_b85e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_b85e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_b85e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_b85e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2453_c7_b85e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2460_c7_0639_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2456_c7_ae59_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2458_c3_ab18 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_0639_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_ae59_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_0639_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2456_c7_ae59_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_0639_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2456_c7_ae59_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_0639_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_ae59_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_0639_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2456_c7_ae59_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_0639_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_0639_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2456_c7_ae59_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2457_c3_1533_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2457_c3_1533_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2457_c3_1533_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_8137_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_8137_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_8137_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2463_c7_9073_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2460_c7_0639_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2461_c3_3538 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2460_c7_0639_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_0639_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_9073_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_0639_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2463_c7_9073_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_0639_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_9073_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_0639_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2463_c7_9073_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_0639_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_9073_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_0639_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_9073_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_0639_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_e803_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_e803_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_e803_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2463_c7_9073_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l2463_c7_9073_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_9073_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_f211_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_9073_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2471_c7_f211_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2463_c7_9073_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_9073_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_f211_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_9073_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2466_c30_5e38_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2466_c30_5e38_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2466_c30_5e38_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2466_c30_5e38_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_5d89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_5d89_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_5d89_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_f211_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_f211_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_f211_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2471_c7_f211_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2471_c7_f211_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2471_c7_f211_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_f211_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_f211_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_f211_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_a6f8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_9301_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2471_l2440_l2460_l2456_l2453_l2448_l2445_DUPLICATE_f007_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_bc4b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2471_l2440_l2460_l2456_l2453_l2448_l2445_DUPLICATE_e360_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_14e3_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2457_l2449_DUPLICATE_52fe_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l2477_l2435_DUPLICATE_30a5_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2446_c3_eb2d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2446_c3_eb2d;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_f211_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2451_c3_985c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2451_c3_985c;
     VAR_sp_relative_shift_uxn_opcodes_h_l2466_c30_5e38_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_5d89_right := to_unsigned(7, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2454_c3_e6c8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2454_c3_e6c8;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_f211_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_8137_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2471_c7_f211_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2458_c3_ab18 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2458_c3_ab18;
     VAR_sp_relative_shift_uxn_opcodes_h_l2466_c30_5e38_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2442_c3_3e23 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2442_c3_3e23;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2461_c3_3538 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2461_c3_3538;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_e803_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098_right := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2466_c30_5e38_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_8137_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_e803_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_5d89_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2457_c3_1533_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse := t16;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_bc4b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_bc4b_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_14e3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_14e3_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2456_c11_3ade] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade_left;
     BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade_return_output := BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2471_l2440_l2460_l2456_l2453_l2448_l2445_DUPLICATE_f007 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2471_l2440_l2460_l2456_l2453_l2448_l2445_DUPLICATE_f007_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2471_l2440_l2460_l2456_l2453_l2448_l2445_DUPLICATE_e360 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2471_l2440_l2460_l2456_l2453_l2448_l2445_DUPLICATE_e360_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2457_l2449_DUPLICATE_52fe LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2457_l2449_DUPLICATE_52fe_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2463_c11_e803] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2463_c11_e803_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_e803_left;
     BIN_OP_EQ_uxn_opcodes_h_l2463_c11_e803_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_e803_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_e803_return_output := BIN_OP_EQ_uxn_opcodes_h_l2463_c11_e803_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2466_c30_5e38] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2466_c30_5e38_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2466_c30_5e38_ins;
     sp_relative_shift_uxn_opcodes_h_l2466_c30_5e38_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2466_c30_5e38_x;
     sp_relative_shift_uxn_opcodes_h_l2466_c30_5e38_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2466_c30_5e38_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2466_c30_5e38_return_output := sp_relative_shift_uxn_opcodes_h_l2466_c30_5e38_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2460_c11_8137] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2460_c11_8137_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_8137_left;
     BIN_OP_EQ_uxn_opcodes_h_l2460_c11_8137_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_8137_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_8137_return_output := BIN_OP_EQ_uxn_opcodes_h_l2460_c11_8137_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_9301 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_9301_return_output := result.u16_value;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2460_c7_0639] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2460_c7_0639_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2440_c6_c098] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098_left;
     BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098_return_output := BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2471_c11_5d89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2471_c11_5d89_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_5d89_left;
     BIN_OP_EQ_uxn_opcodes_h_l2471_c11_5d89_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_5d89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_5d89_return_output := BIN_OP_EQ_uxn_opcodes_h_l2471_c11_5d89_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2445_c11_a61d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2448_c11_88e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2453_c11_3397] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397_left;
     BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397_return_output := BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_a6f8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_a6f8_return_output := result.u8_value;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2440_c6_c098_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2445_c7_51a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_51a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_51a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_51a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_51a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_51a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2445_c7_51a1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2445_c11_a61d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2448_c7_7319_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c7_7319_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2448_c7_7319_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c7_7319_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c7_7319_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c7_7319_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2448_c7_7319_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2448_c7_7319_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2448_c7_7319_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2448_c11_88e8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2453_c7_b85e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_b85e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_b85e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_b85e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_b85e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_b85e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2453_c7_b85e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2453_c11_3397_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2456_c7_ae59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_ae59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2456_c7_ae59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_ae59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2456_c7_ae59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2456_c7_ae59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2456_c7_ae59_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2456_c11_3ade_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2460_c7_0639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_8137_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_0639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_8137_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_0639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_8137_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_0639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_8137_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_0639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_8137_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_0639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_8137_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_0639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_8137_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_0639_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2460_c11_8137_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2463_c7_9073_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_e803_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_9073_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_e803_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2463_c7_9073_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_e803_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_9073_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_e803_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_9073_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_e803_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2463_c7_9073_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_e803_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_9073_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2463_c11_e803_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_f211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_5d89_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2471_c7_f211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_5d89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_f211_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2471_c11_5d89_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2457_c3_1533_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2457_l2449_DUPLICATE_52fe_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2450_c3_46a5_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2457_l2449_DUPLICATE_52fe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_bc4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_bc4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_bc4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_bc4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_bc4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_bc4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_bc4b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_9301_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_9301_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_9301_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_9301_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_9301_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_9301_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_9301_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_14e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_14e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_14e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_14e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_14e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_14e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_f211_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2471_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_14e3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2471_l2440_l2460_l2456_l2453_l2448_l2445_DUPLICATE_f007_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2471_l2440_l2460_l2456_l2453_l2448_l2445_DUPLICATE_f007_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2471_l2440_l2460_l2456_l2453_l2448_l2445_DUPLICATE_f007_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2471_l2440_l2460_l2456_l2453_l2448_l2445_DUPLICATE_f007_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2471_l2440_l2460_l2456_l2453_l2448_l2445_DUPLICATE_f007_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2471_l2440_l2460_l2456_l2453_l2448_l2445_DUPLICATE_f007_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2471_c7_f211_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2471_l2440_l2460_l2456_l2453_l2448_l2445_DUPLICATE_f007_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2471_l2440_l2460_l2456_l2453_l2448_l2445_DUPLICATE_e360_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2471_l2440_l2460_l2456_l2453_l2448_l2445_DUPLICATE_e360_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2471_l2440_l2460_l2456_l2453_l2448_l2445_DUPLICATE_e360_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2471_l2440_l2460_l2456_l2453_l2448_l2445_DUPLICATE_e360_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2471_l2440_l2460_l2456_l2453_l2448_l2445_DUPLICATE_e360_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2471_l2440_l2460_l2456_l2453_l2448_l2445_DUPLICATE_e360_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_f211_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2471_l2440_l2460_l2456_l2453_l2448_l2445_DUPLICATE_e360_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_a6f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_a6f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_a6f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_a6f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_a6f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_a6f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2440_l2463_l2460_l2456_l2453_l2448_l2445_DUPLICATE_a6f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2460_c7_0639_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2466_c30_5e38_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2463_c7_9073] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2463_c7_9073_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_9073_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_9073_return_output := result_u8_value_MUX_uxn_opcodes_h_l2463_c7_9073_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2471_c7_f211] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_f211_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_f211_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_f211_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_f211_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_f211_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_f211_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_f211_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_f211_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2471_c7_f211] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2471_c7_f211_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2471_c7_f211_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2471_c7_f211_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2471_c7_f211_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2471_c7_f211_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2471_c7_f211_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2471_c7_f211_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2471_c7_f211_return_output;

     -- n8_MUX[uxn_opcodes_h_l2463_c7_9073] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2463_c7_9073_cond <= VAR_n8_MUX_uxn_opcodes_h_l2463_c7_9073_cond;
     n8_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue;
     n8_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2463_c7_9073_return_output := n8_MUX_uxn_opcodes_h_l2463_c7_9073_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2463_c7_9073] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2463_c7_9073_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2463_c7_9073_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2463_c7_9073_return_output := result_u16_value_MUX_uxn_opcodes_h_l2463_c7_9073_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2460_c7_0639] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_0639_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_0639_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_0639_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_0639_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2450_c3_46a5] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2450_c3_46a5_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2450_c3_46a5_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2450_c3_46a5_return_output := CONST_SL_8_uxn_opcodes_h_l2450_c3_46a5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2471_c7_f211] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_f211_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_f211_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_f211_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_f211_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_f211_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_f211_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_f211_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_f211_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2457_c3_1533] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2457_c3_1533_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2457_c3_1533_left;
     BIN_OP_OR_uxn_opcodes_h_l2457_c3_1533_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2457_c3_1533_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2457_c3_1533_return_output := BIN_OP_OR_uxn_opcodes_h_l2457_c3_1533_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2463_c7_9073] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_9073_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_9073_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_9073_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_9073_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2457_c3_1533_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2450_c3_46a5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2463_c7_9073_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2471_c7_f211_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2471_c7_f211_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2471_c7_f211_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2463_c7_9073_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2460_c7_0639_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2463_c7_9073_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2463_c7_9073_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2460_c7_0639] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2460_c7_0639_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_0639_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_0639_return_output := result_u8_value_MUX_uxn_opcodes_h_l2460_c7_0639_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2463_c7_9073] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_9073_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_9073_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_9073_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_9073_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2456_c7_ae59] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_ae59_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_ae59_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2460_c7_0639] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_0639_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_0639_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_0639_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_0639_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2463_c7_9073] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_9073_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_9073_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_9073_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_9073_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2460_c7_0639] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2460_c7_0639_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_0639_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_0639_return_output := result_u16_value_MUX_uxn_opcodes_h_l2460_c7_0639_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2463_c7_9073] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2463_c7_9073_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2463_c7_9073_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2463_c7_9073_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2463_c7_9073_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2463_c7_9073_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2463_c7_9073_return_output;

     -- n8_MUX[uxn_opcodes_h_l2460_c7_0639] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2460_c7_0639_cond <= VAR_n8_MUX_uxn_opcodes_h_l2460_c7_0639_cond;
     n8_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue;
     n8_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2460_c7_0639_return_output := n8_MUX_uxn_opcodes_h_l2460_c7_0639_return_output;

     -- t16_MUX[uxn_opcodes_h_l2456_c7_ae59] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2456_c7_ae59_cond <= VAR_t16_MUX_uxn_opcodes_h_l2456_c7_ae59_cond;
     t16_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue;
     t16_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output := t16_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2460_c7_0639_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2463_c7_9073_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2463_c7_9073_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2463_c7_9073_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2460_c7_0639_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2460_c7_0639_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2460_c7_0639_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output;
     -- t16_MUX[uxn_opcodes_h_l2453_c7_b85e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2453_c7_b85e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2453_c7_b85e_cond;
     t16_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue;
     t16_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output := t16_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2456_c7_ae59] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2456_c7_ae59] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2456_c7_ae59_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2456_c7_ae59_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output := result_u16_value_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2460_c7_0639] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_0639_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_0639_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_0639_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_0639_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2460_c7_0639] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_0639_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_0639_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_0639_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_0639_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2460_c7_0639] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_0639_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_0639_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_0639_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_0639_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_0639_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_0639_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2453_c7_b85e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_b85e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_b85e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2456_c7_ae59] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2456_c7_ae59_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2456_c7_ae59_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output := result_u8_value_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output;

     -- n8_MUX[uxn_opcodes_h_l2456_c7_ae59] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2456_c7_ae59_cond <= VAR_n8_MUX_uxn_opcodes_h_l2456_c7_ae59_cond;
     n8_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue;
     n8_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output := n8_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2460_c7_0639_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2460_c7_0639_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2460_c7_0639_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output;
     -- n8_MUX[uxn_opcodes_h_l2453_c7_b85e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2453_c7_b85e_cond <= VAR_n8_MUX_uxn_opcodes_h_l2453_c7_b85e_cond;
     n8_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue;
     n8_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output := n8_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2456_c7_ae59] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2453_c7_b85e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2453_c7_b85e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_b85e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2456_c7_ae59] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_ae59_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_ae59_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2453_c7_b85e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2453_c7_b85e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_b85e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output := result_u16_value_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2453_c7_b85e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2456_c7_ae59] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2456_c7_ae59_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2456_c7_ae59_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2456_c7_ae59_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2456_c7_ae59_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2448_c7_7319] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c7_7319_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c7_7319_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c7_7319_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c7_7319_return_output;

     -- t16_MUX[uxn_opcodes_h_l2448_c7_7319] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2448_c7_7319_cond <= VAR_t16_MUX_uxn_opcodes_h_l2448_c7_7319_cond;
     t16_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue;
     t16_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2448_c7_7319_return_output := t16_MUX_uxn_opcodes_h_l2448_c7_7319_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2456_c7_ae59_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2448_c7_7319_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2448_c7_7319_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2445_c7_51a1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_51a1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_51a1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2453_c7_b85e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2448_c7_7319] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2448_c7_7319_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2448_c7_7319_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2448_c7_7319_return_output := result_u8_value_MUX_uxn_opcodes_h_l2448_c7_7319_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2448_c7_7319] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c7_7319_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c7_7319_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c7_7319_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c7_7319_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2448_c7_7319] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2448_c7_7319_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2448_c7_7319_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2448_c7_7319_return_output := result_u16_value_MUX_uxn_opcodes_h_l2448_c7_7319_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2453_c7_b85e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_b85e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_b85e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output;

     -- n8_MUX[uxn_opcodes_h_l2448_c7_7319] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2448_c7_7319_cond <= VAR_n8_MUX_uxn_opcodes_h_l2448_c7_7319_cond;
     n8_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue;
     n8_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2448_c7_7319_return_output := n8_MUX_uxn_opcodes_h_l2448_c7_7319_return_output;

     -- t16_MUX[uxn_opcodes_h_l2445_c7_51a1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2445_c7_51a1_cond <= VAR_t16_MUX_uxn_opcodes_h_l2445_c7_51a1_cond;
     t16_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue;
     t16_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output := t16_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2453_c7_b85e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_b85e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_b85e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_b85e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_b85e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output;

     -- Submodule level 6
     VAR_n8_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2448_c7_7319_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2453_c7_b85e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2448_c7_7319_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2448_c7_7319_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2448_c7_7319_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2448_c7_7319] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c7_7319_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c7_7319_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c7_7319_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c7_7319_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2440_c2_a2c9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2448_c7_7319] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2448_c7_7319_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c7_7319_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c7_7319_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2448_c7_7319_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2445_c7_51a1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output;

     -- t16_MUX[uxn_opcodes_h_l2440_c2_a2c9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond <= VAR_t16_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond;
     t16_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue;
     t16_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output := t16_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2448_c7_7319] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2448_c7_7319_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2448_c7_7319_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2448_c7_7319_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2448_c7_7319_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2448_c7_7319_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2448_c7_7319_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2445_c7_51a1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2445_c7_51a1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_51a1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output;

     -- n8_MUX[uxn_opcodes_h_l2445_c7_51a1] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2445_c7_51a1_cond <= VAR_n8_MUX_uxn_opcodes_h_l2445_c7_51a1_cond;
     n8_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue;
     n8_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output := n8_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2445_c7_51a1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2445_c7_51a1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_51a1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output := result_u16_value_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output;

     -- Submodule level 7
     VAR_n8_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2448_c7_7319_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2448_c7_7319_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2448_c7_7319_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output;
     -- n8_MUX[uxn_opcodes_h_l2440_c2_a2c9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond <= VAR_n8_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond;
     n8_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue;
     n8_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output := n8_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2445_c7_51a1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2440_c2_a2c9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2440_c2_a2c9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2445_c7_51a1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_51a1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_51a1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2445_c7_51a1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_51a1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_51a1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_51a1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_51a1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l2440_c2_a2c9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output := result_u16_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output;

     -- Submodule level 8
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2445_c7_51a1_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2440_c2_a2c9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2440_c2_a2c9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2440_c2_a2c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c2_a2c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c2_a2c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c2_a2c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l2477_l2435_DUPLICATE_30a5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l2477_l2435_DUPLICATE_30a5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2440_c2_a2c9_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l2477_l2435_DUPLICATE_30a5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fdc2_uxn_opcodes_h_l2477_l2435_DUPLICATE_30a5_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
