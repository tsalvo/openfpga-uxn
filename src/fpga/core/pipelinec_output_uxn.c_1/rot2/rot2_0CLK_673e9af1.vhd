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
-- Submodules: 170
entity rot2_0CLK_673e9af1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot2_0CLK_673e9af1;
architecture arch of rot2_0CLK_673e9af1 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal l16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_l16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2944_c6_e2d6]
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2944_c2_cb0b]
signal t16_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2944_c2_cb0b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2944_c2_cb0b]
signal result_stack_value_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2944_c2_cb0b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2944_c2_cb0b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2944_c2_cb0b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2944_c2_cb0b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2944_c2_cb0b]
signal l16_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2944_c2_cb0b]
signal n16_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2949_c11_6c7b]
signal BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2949_c7_7341]
signal t16_MUX_uxn_opcodes_h_l2949_c7_7341_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2949_c7_7341_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2949_c7_7341]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_7341_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_7341_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2949_c7_7341]
signal result_stack_value_MUX_uxn_opcodes_h_l2949_c7_7341_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2949_c7_7341_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2949_c7_7341]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_7341_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_7341_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2949_c7_7341]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_7341_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_7341_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2949_c7_7341]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_7341_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_7341_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2949_c7_7341]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_7341_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_7341_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2949_c7_7341]
signal l16_MUX_uxn_opcodes_h_l2949_c7_7341_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2949_c7_7341_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2949_c7_7341]
signal n16_MUX_uxn_opcodes_h_l2949_c7_7341_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2949_c7_7341_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2952_c11_a185]
signal BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2952_c7_17ec]
signal t16_MUX_uxn_opcodes_h_l2952_c7_17ec_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2952_c7_17ec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2952_c7_17ec]
signal result_stack_value_MUX_uxn_opcodes_h_l2952_c7_17ec_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2952_c7_17ec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_17ec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2952_c7_17ec]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2952_c7_17ec]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_17ec_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2952_c7_17ec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_17ec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2952_c7_17ec]
signal l16_MUX_uxn_opcodes_h_l2952_c7_17ec_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2952_c7_17ec]
signal n16_MUX_uxn_opcodes_h_l2952_c7_17ec_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2957_c11_8612]
signal BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2957_c7_bd38]
signal t16_MUX_uxn_opcodes_h_l2957_c7_bd38_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2957_c7_bd38]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2957_c7_bd38]
signal result_stack_value_MUX_uxn_opcodes_h_l2957_c7_bd38_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2957_c7_bd38]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_bd38_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2957_c7_bd38]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2957_c7_bd38]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_bd38_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2957_c7_bd38]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_bd38_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2957_c7_bd38]
signal l16_MUX_uxn_opcodes_h_l2957_c7_bd38_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2957_c7_bd38]
signal n16_MUX_uxn_opcodes_h_l2957_c7_bd38_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2960_c11_25a0]
signal BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2960_c7_a45f]
signal t16_MUX_uxn_opcodes_h_l2960_c7_a45f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2960_c7_a45f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2960_c7_a45f]
signal result_stack_value_MUX_uxn_opcodes_h_l2960_c7_a45f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2960_c7_a45f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_a45f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2960_c7_a45f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2960_c7_a45f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_a45f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2960_c7_a45f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_a45f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2960_c7_a45f]
signal l16_MUX_uxn_opcodes_h_l2960_c7_a45f_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2960_c7_a45f]
signal n16_MUX_uxn_opcodes_h_l2960_c7_a45f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2961_c3_c2cf]
signal BIN_OP_OR_uxn_opcodes_h_l2961_c3_c2cf_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2961_c3_c2cf_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2961_c3_c2cf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2964_c11_2e73]
signal BIN_OP_EQ_uxn_opcodes_h_l2964_c11_2e73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2964_c11_2e73_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2964_c11_2e73_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2964_c7_4bd0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2964_c7_4bd0]
signal result_stack_value_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2964_c7_4bd0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2964_c7_4bd0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2964_c7_4bd0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2964_c7_4bd0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2964_c7_4bd0]
signal l16_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2964_c7_4bd0]
signal n16_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2967_c11_d766]
signal BIN_OP_EQ_uxn_opcodes_h_l2967_c11_d766_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2967_c11_d766_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2967_c11_d766_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2967_c7_51e5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2967_c7_51e5]
signal result_stack_value_MUX_uxn_opcodes_h_l2967_c7_51e5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2967_c7_51e5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_51e5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2967_c7_51e5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2967_c7_51e5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_51e5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2967_c7_51e5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_51e5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2967_c7_51e5]
signal l16_MUX_uxn_opcodes_h_l2967_c7_51e5_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2967_c7_51e5]
signal n16_MUX_uxn_opcodes_h_l2967_c7_51e5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2972_c11_9bf7]
signal BIN_OP_EQ_uxn_opcodes_h_l2972_c11_9bf7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2972_c11_9bf7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2972_c11_9bf7_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2972_c7_2c40]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2972_c7_2c40]
signal result_stack_value_MUX_uxn_opcodes_h_l2972_c7_2c40_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2972_c7_2c40]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_2c40_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2972_c7_2c40]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2972_c7_2c40]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_2c40_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2972_c7_2c40]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_2c40_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2972_c7_2c40]
signal l16_MUX_uxn_opcodes_h_l2972_c7_2c40_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2972_c7_2c40]
signal n16_MUX_uxn_opcodes_h_l2972_c7_2c40_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2975_c11_748c]
signal BIN_OP_EQ_uxn_opcodes_h_l2975_c11_748c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2975_c11_748c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2975_c11_748c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2975_c7_ce7b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2975_c7_ce7b]
signal result_stack_value_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2975_c7_ce7b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2975_c7_ce7b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2975_c7_ce7b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2975_c7_ce7b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2975_c7_ce7b]
signal l16_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2975_c7_ce7b]
signal n16_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2976_c3_b907]
signal BIN_OP_OR_uxn_opcodes_h_l2976_c3_b907_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2976_c3_b907_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2976_c3_b907_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2979_c11_0ba4]
signal BIN_OP_EQ_uxn_opcodes_h_l2979_c11_0ba4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2979_c11_0ba4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2979_c11_0ba4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2979_c7_d4fd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2979_c7_d4fd]
signal result_stack_value_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2979_c7_d4fd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2979_c7_d4fd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2979_c7_d4fd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2979_c7_d4fd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2979_c7_d4fd]
signal l16_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2982_c11_af43]
signal BIN_OP_EQ_uxn_opcodes_h_l2982_c11_af43_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2982_c11_af43_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2982_c11_af43_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2982_c7_4dea]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2982_c7_4dea]
signal result_stack_value_MUX_uxn_opcodes_h_l2982_c7_4dea_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2982_c7_4dea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_4dea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2982_c7_4dea]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2982_c7_4dea]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_4dea_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2982_c7_4dea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_4dea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2982_c7_4dea]
signal l16_MUX_uxn_opcodes_h_l2982_c7_4dea_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2987_c11_9dfb]
signal BIN_OP_EQ_uxn_opcodes_h_l2987_c11_9dfb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2987_c11_9dfb_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2987_c11_9dfb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2987_c7_f8f5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2987_c7_f8f5]
signal result_stack_value_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2987_c7_f8f5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2987_c7_f8f5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2987_c7_f8f5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2987_c7_f8f5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2987_c7_f8f5]
signal l16_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2990_c11_c263]
signal BIN_OP_EQ_uxn_opcodes_h_l2990_c11_c263_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2990_c11_c263_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2990_c11_c263_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2990_c7_8b80]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2990_c7_8b80]
signal result_stack_value_MUX_uxn_opcodes_h_l2990_c7_8b80_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2990_c7_8b80]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_8b80_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2990_c7_8b80]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2990_c7_8b80]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_8b80_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2990_c7_8b80]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_8b80_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output : unsigned(0 downto 0);

-- l16_MUX[uxn_opcodes_h_l2990_c7_8b80]
signal l16_MUX_uxn_opcodes_h_l2990_c7_8b80_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2991_c3_032b]
signal BIN_OP_OR_uxn_opcodes_h_l2991_c3_032b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2991_c3_032b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2991_c3_032b_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2993_c32_9576]
signal BIN_OP_AND_uxn_opcodes_h_l2993_c32_9576_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2993_c32_9576_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2993_c32_9576_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2993_c32_96c6]
signal BIN_OP_GT_uxn_opcodes_h_l2993_c32_96c6_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2993_c32_96c6_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2993_c32_96c6_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2993_c32_575d]
signal MUX_uxn_opcodes_h_l2993_c32_575d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2993_c32_575d_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2993_c32_575d_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2993_c32_575d_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2995_c11_fc43]
signal BIN_OP_EQ_uxn_opcodes_h_l2995_c11_fc43_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2995_c11_fc43_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2995_c11_fc43_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2995_c7_fa1c]
signal result_stack_value_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2995_c7_fa1c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2995_c7_fa1c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2995_c7_fa1c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2995_c7_fa1c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3001_c11_042e]
signal BIN_OP_EQ_uxn_opcodes_h_l3001_c11_042e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3001_c11_042e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3001_c11_042e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3001_c7_1ce3]
signal result_stack_value_MUX_uxn_opcodes_h_l3001_c7_1ce3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3001_c7_1ce3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3001_c7_1ce3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3001_c7_1ce3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3001_c7_1ce3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_1ce3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_1ce3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_1ce3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_1ce3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3001_c7_1ce3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_1ce3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_1ce3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_1ce3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_1ce3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3001_c7_1ce3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_1ce3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_1ce3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_1ce3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_1ce3_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l3003_c34_9f1c]
signal CONST_SR_8_uxn_opcodes_h_l3003_c34_9f1c_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l3003_c34_9f1c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3005_c11_fa58]
signal BIN_OP_EQ_uxn_opcodes_h_l3005_c11_fa58_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3005_c11_fa58_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3005_c11_fa58_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3005_c7_1c00]
signal result_stack_value_MUX_uxn_opcodes_h_l3005_c7_1c00_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3005_c7_1c00_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3005_c7_1c00_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3005_c7_1c00_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3005_c7_1c00]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_1c00_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_1c00_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_1c00_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_1c00_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3005_c7_1c00]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_1c00_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_1c00_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_1c00_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_1c00_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3005_c7_1c00]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_1c00_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_1c00_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_1c00_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_1c00_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3009_c11_9c46]
signal BIN_OP_EQ_uxn_opcodes_h_l3009_c11_9c46_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3009_c11_9c46_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3009_c11_9c46_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3009_c7_32c0]
signal result_stack_value_MUX_uxn_opcodes_h_l3009_c7_32c0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3009_c7_32c0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3009_c7_32c0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3009_c7_32c0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3009_c7_32c0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_32c0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_32c0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_32c0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_32c0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3009_c7_32c0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_32c0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_32c0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_32c0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_32c0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3009_c7_32c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_32c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_32c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_32c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_32c0_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l3011_c34_1b59]
signal CONST_SR_8_uxn_opcodes_h_l3011_c34_1b59_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l3011_c34_1b59_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3013_c11_ed0d]
signal BIN_OP_EQ_uxn_opcodes_h_l3013_c11_ed0d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3013_c11_ed0d_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3013_c11_ed0d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3013_c7_5593]
signal result_stack_value_MUX_uxn_opcodes_h_l3013_c7_5593_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3013_c7_5593_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3013_c7_5593_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3013_c7_5593_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3013_c7_5593]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_5593_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_5593_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_5593_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_5593_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3013_c7_5593]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_5593_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_5593_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_5593_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_5593_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3013_c7_5593]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_5593_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_5593_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_5593_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_5593_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3017_c11_64da]
signal BIN_OP_EQ_uxn_opcodes_h_l3017_c11_64da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3017_c11_64da_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3017_c11_64da_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3017_c7_b4b7]
signal result_stack_value_MUX_uxn_opcodes_h_l3017_c7_b4b7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3017_c7_b4b7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3017_c7_b4b7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3017_c7_b4b7_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3017_c7_b4b7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_b4b7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_b4b7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_b4b7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_b4b7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3017_c7_b4b7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_b4b7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_b4b7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_b4b7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_b4b7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3017_c7_b4b7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_b4b7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_b4b7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_b4b7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_b4b7_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l3019_c34_c94e]
signal CONST_SR_8_uxn_opcodes_h_l3019_c34_c94e_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l3019_c34_c94e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3021_c11_7100]
signal BIN_OP_EQ_uxn_opcodes_h_l3021_c11_7100_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3021_c11_7100_right : unsigned(4 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3021_c11_7100_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3021_c7_e39a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_e39a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_e39a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_e39a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_e39a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3021_c7_e39a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_e39a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_e39a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_e39a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_e39a_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2969_l2984_l2954_DUPLICATE_7c35
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2969_l2984_l2954_DUPLICATE_7c35_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2969_l2984_l2954_DUPLICATE_7c35_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6
BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6_left,
BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6_right,
BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6_return_output);

-- t16_MUX_uxn_opcodes_h_l2944_c2_cb0b
t16_MUX_uxn_opcodes_h_l2944_c2_cb0b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond,
t16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue,
t16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse,
t16_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2944_c2_cb0b
result_stack_value_MUX_uxn_opcodes_h_l2944_c2_cb0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_cb0b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_cb0b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b
result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_cb0b
result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_cb0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_cb0b
result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_cb0b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output);

-- l16_MUX_uxn_opcodes_h_l2944_c2_cb0b
l16_MUX_uxn_opcodes_h_l2944_c2_cb0b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond,
l16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue,
l16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse,
l16_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output);

-- n16_MUX_uxn_opcodes_h_l2944_c2_cb0b
n16_MUX_uxn_opcodes_h_l2944_c2_cb0b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond,
n16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue,
n16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse,
n16_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b
BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b_left,
BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b_right,
BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b_return_output);

-- t16_MUX_uxn_opcodes_h_l2949_c7_7341
t16_MUX_uxn_opcodes_h_l2949_c7_7341 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2949_c7_7341_cond,
t16_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue,
t16_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse,
t16_MUX_uxn_opcodes_h_l2949_c7_7341_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_7341
result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_7341 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_7341_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_7341_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2949_c7_7341
result_stack_value_MUX_uxn_opcodes_h_l2949_c7_7341 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2949_c7_7341_cond,
result_stack_value_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2949_c7_7341_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_7341
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_7341 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_7341_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_7341_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_7341
result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_7341 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_7341_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_7341_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_7341
result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_7341 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_7341_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_7341_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_7341
result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_7341 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_7341_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_7341_return_output);

-- l16_MUX_uxn_opcodes_h_l2949_c7_7341
l16_MUX_uxn_opcodes_h_l2949_c7_7341 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2949_c7_7341_cond,
l16_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue,
l16_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse,
l16_MUX_uxn_opcodes_h_l2949_c7_7341_return_output);

-- n16_MUX_uxn_opcodes_h_l2949_c7_7341
n16_MUX_uxn_opcodes_h_l2949_c7_7341 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2949_c7_7341_cond,
n16_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue,
n16_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse,
n16_MUX_uxn_opcodes_h_l2949_c7_7341_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185_left,
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185_right,
BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185_return_output);

-- t16_MUX_uxn_opcodes_h_l2952_c7_17ec
t16_MUX_uxn_opcodes_h_l2952_c7_17ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2952_c7_17ec_cond,
t16_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue,
t16_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse,
t16_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_17ec
result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_17ec : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2952_c7_17ec
result_stack_value_MUX_uxn_opcodes_h_l2952_c7_17ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2952_c7_17ec_cond,
result_stack_value_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_17ec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_17ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_17ec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_17ec
result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_17ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_17ec
result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_17ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_17ec_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_17ec
result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_17ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_17ec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output);

-- l16_MUX_uxn_opcodes_h_l2952_c7_17ec
l16_MUX_uxn_opcodes_h_l2952_c7_17ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2952_c7_17ec_cond,
l16_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue,
l16_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse,
l16_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output);

-- n16_MUX_uxn_opcodes_h_l2952_c7_17ec
n16_MUX_uxn_opcodes_h_l2952_c7_17ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2952_c7_17ec_cond,
n16_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue,
n16_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse,
n16_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612
BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612_left,
BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612_right,
BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612_return_output);

-- t16_MUX_uxn_opcodes_h_l2957_c7_bd38
t16_MUX_uxn_opcodes_h_l2957_c7_bd38 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2957_c7_bd38_cond,
t16_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue,
t16_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse,
t16_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_bd38
result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_bd38 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2957_c7_bd38
result_stack_value_MUX_uxn_opcodes_h_l2957_c7_bd38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2957_c7_bd38_cond,
result_stack_value_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_bd38
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_bd38 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_bd38_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_bd38
result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_bd38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_bd38
result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_bd38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_bd38_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_bd38
result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_bd38 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_bd38_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output);

-- l16_MUX_uxn_opcodes_h_l2957_c7_bd38
l16_MUX_uxn_opcodes_h_l2957_c7_bd38 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2957_c7_bd38_cond,
l16_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue,
l16_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse,
l16_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output);

-- n16_MUX_uxn_opcodes_h_l2957_c7_bd38
n16_MUX_uxn_opcodes_h_l2957_c7_bd38 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2957_c7_bd38_cond,
n16_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue,
n16_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse,
n16_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0
BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0_left,
BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0_right,
BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0_return_output);

-- t16_MUX_uxn_opcodes_h_l2960_c7_a45f
t16_MUX_uxn_opcodes_h_l2960_c7_a45f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2960_c7_a45f_cond,
t16_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue,
t16_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse,
t16_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_a45f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_a45f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2960_c7_a45f
result_stack_value_MUX_uxn_opcodes_h_l2960_c7_a45f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2960_c7_a45f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_a45f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_a45f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_a45f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_a45f
result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_a45f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_a45f
result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_a45f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_a45f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_a45f
result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_a45f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_a45f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output);

-- l16_MUX_uxn_opcodes_h_l2960_c7_a45f
l16_MUX_uxn_opcodes_h_l2960_c7_a45f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2960_c7_a45f_cond,
l16_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue,
l16_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse,
l16_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output);

-- n16_MUX_uxn_opcodes_h_l2960_c7_a45f
n16_MUX_uxn_opcodes_h_l2960_c7_a45f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2960_c7_a45f_cond,
n16_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue,
n16_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse,
n16_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2961_c3_c2cf
BIN_OP_OR_uxn_opcodes_h_l2961_c3_c2cf : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2961_c3_c2cf_left,
BIN_OP_OR_uxn_opcodes_h_l2961_c3_c2cf_right,
BIN_OP_OR_uxn_opcodes_h_l2961_c3_c2cf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2964_c11_2e73
BIN_OP_EQ_uxn_opcodes_h_l2964_c11_2e73 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2964_c11_2e73_left,
BIN_OP_EQ_uxn_opcodes_h_l2964_c11_2e73_right,
BIN_OP_EQ_uxn_opcodes_h_l2964_c11_2e73_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2964_c7_4bd0
result_stack_value_MUX_uxn_opcodes_h_l2964_c7_4bd0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_4bd0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_4bd0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0
result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_4bd0
result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_4bd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_4bd0
result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_4bd0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output);

-- l16_MUX_uxn_opcodes_h_l2964_c7_4bd0
l16_MUX_uxn_opcodes_h_l2964_c7_4bd0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond,
l16_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue,
l16_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse,
l16_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output);

-- n16_MUX_uxn_opcodes_h_l2964_c7_4bd0
n16_MUX_uxn_opcodes_h_l2964_c7_4bd0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond,
n16_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue,
n16_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse,
n16_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2967_c11_d766
BIN_OP_EQ_uxn_opcodes_h_l2967_c11_d766 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2967_c11_d766_left,
BIN_OP_EQ_uxn_opcodes_h_l2967_c11_d766_right,
BIN_OP_EQ_uxn_opcodes_h_l2967_c11_d766_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_51e5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_51e5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2967_c7_51e5
result_stack_value_MUX_uxn_opcodes_h_l2967_c7_51e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2967_c7_51e5_cond,
result_stack_value_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_51e5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_51e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_51e5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_51e5
result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_51e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_51e5
result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_51e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_51e5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_51e5
result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_51e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_51e5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output);

-- l16_MUX_uxn_opcodes_h_l2967_c7_51e5
l16_MUX_uxn_opcodes_h_l2967_c7_51e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2967_c7_51e5_cond,
l16_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue,
l16_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse,
l16_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output);

-- n16_MUX_uxn_opcodes_h_l2967_c7_51e5
n16_MUX_uxn_opcodes_h_l2967_c7_51e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2967_c7_51e5_cond,
n16_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue,
n16_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse,
n16_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2972_c11_9bf7
BIN_OP_EQ_uxn_opcodes_h_l2972_c11_9bf7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2972_c11_9bf7_left,
BIN_OP_EQ_uxn_opcodes_h_l2972_c11_9bf7_right,
BIN_OP_EQ_uxn_opcodes_h_l2972_c11_9bf7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_2c40
result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_2c40 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2972_c7_2c40
result_stack_value_MUX_uxn_opcodes_h_l2972_c7_2c40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2972_c7_2c40_cond,
result_stack_value_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_2c40
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_2c40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_2c40_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_2c40
result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_2c40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_2c40
result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_2c40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_2c40_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_2c40
result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_2c40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_2c40_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output);

-- l16_MUX_uxn_opcodes_h_l2972_c7_2c40
l16_MUX_uxn_opcodes_h_l2972_c7_2c40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2972_c7_2c40_cond,
l16_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue,
l16_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse,
l16_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output);

-- n16_MUX_uxn_opcodes_h_l2972_c7_2c40
n16_MUX_uxn_opcodes_h_l2972_c7_2c40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2972_c7_2c40_cond,
n16_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue,
n16_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse,
n16_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2975_c11_748c
BIN_OP_EQ_uxn_opcodes_h_l2975_c11_748c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2975_c11_748c_left,
BIN_OP_EQ_uxn_opcodes_h_l2975_c11_748c_right,
BIN_OP_EQ_uxn_opcodes_h_l2975_c11_748c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2975_c7_ce7b
result_stack_value_MUX_uxn_opcodes_h_l2975_c7_ce7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond,
result_stack_value_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_ce7b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_ce7b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b
result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_ce7b
result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_ce7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_ce7b
result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_ce7b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output);

-- l16_MUX_uxn_opcodes_h_l2975_c7_ce7b
l16_MUX_uxn_opcodes_h_l2975_c7_ce7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond,
l16_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue,
l16_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse,
l16_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output);

-- n16_MUX_uxn_opcodes_h_l2975_c7_ce7b
n16_MUX_uxn_opcodes_h_l2975_c7_ce7b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond,
n16_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue,
n16_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse,
n16_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2976_c3_b907
BIN_OP_OR_uxn_opcodes_h_l2976_c3_b907 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2976_c3_b907_left,
BIN_OP_OR_uxn_opcodes_h_l2976_c3_b907_right,
BIN_OP_OR_uxn_opcodes_h_l2976_c3_b907_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2979_c11_0ba4
BIN_OP_EQ_uxn_opcodes_h_l2979_c11_0ba4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2979_c11_0ba4_left,
BIN_OP_EQ_uxn_opcodes_h_l2979_c11_0ba4_right,
BIN_OP_EQ_uxn_opcodes_h_l2979_c11_0ba4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2979_c7_d4fd
result_stack_value_MUX_uxn_opcodes_h_l2979_c7_d4fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond,
result_stack_value_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_d4fd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_d4fd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd
result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_d4fd
result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_d4fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_d4fd
result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_d4fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output);

-- l16_MUX_uxn_opcodes_h_l2979_c7_d4fd
l16_MUX_uxn_opcodes_h_l2979_c7_d4fd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond,
l16_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue,
l16_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse,
l16_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2982_c11_af43
BIN_OP_EQ_uxn_opcodes_h_l2982_c11_af43 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2982_c11_af43_left,
BIN_OP_EQ_uxn_opcodes_h_l2982_c11_af43_right,
BIN_OP_EQ_uxn_opcodes_h_l2982_c11_af43_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_4dea
result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_4dea : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2982_c7_4dea
result_stack_value_MUX_uxn_opcodes_h_l2982_c7_4dea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2982_c7_4dea_cond,
result_stack_value_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_4dea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_4dea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_4dea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_4dea
result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_4dea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_4dea
result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_4dea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_4dea_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_4dea
result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_4dea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_4dea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output);

-- l16_MUX_uxn_opcodes_h_l2982_c7_4dea
l16_MUX_uxn_opcodes_h_l2982_c7_4dea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2982_c7_4dea_cond,
l16_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue,
l16_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse,
l16_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2987_c11_9dfb
BIN_OP_EQ_uxn_opcodes_h_l2987_c11_9dfb : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2987_c11_9dfb_left,
BIN_OP_EQ_uxn_opcodes_h_l2987_c11_9dfb_right,
BIN_OP_EQ_uxn_opcodes_h_l2987_c11_9dfb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2987_c7_f8f5
result_stack_value_MUX_uxn_opcodes_h_l2987_c7_f8f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond,
result_stack_value_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_f8f5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_f8f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5
result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_f8f5
result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_f8f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_f8f5
result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_f8f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output);

-- l16_MUX_uxn_opcodes_h_l2987_c7_f8f5
l16_MUX_uxn_opcodes_h_l2987_c7_f8f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond,
l16_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue,
l16_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse,
l16_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2990_c11_c263
BIN_OP_EQ_uxn_opcodes_h_l2990_c11_c263 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2990_c11_c263_left,
BIN_OP_EQ_uxn_opcodes_h_l2990_c11_c263_right,
BIN_OP_EQ_uxn_opcodes_h_l2990_c11_c263_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_8b80
result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_8b80 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2990_c7_8b80
result_stack_value_MUX_uxn_opcodes_h_l2990_c7_8b80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2990_c7_8b80_cond,
result_stack_value_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_8b80
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_8b80 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_8b80_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_8b80
result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_8b80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_8b80
result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_8b80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_8b80_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_8b80
result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_8b80 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_8b80_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output);

-- l16_MUX_uxn_opcodes_h_l2990_c7_8b80
l16_MUX_uxn_opcodes_h_l2990_c7_8b80 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2990_c7_8b80_cond,
l16_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue,
l16_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse,
l16_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2991_c3_032b
BIN_OP_OR_uxn_opcodes_h_l2991_c3_032b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2991_c3_032b_left,
BIN_OP_OR_uxn_opcodes_h_l2991_c3_032b_right,
BIN_OP_OR_uxn_opcodes_h_l2991_c3_032b_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2993_c32_9576
BIN_OP_AND_uxn_opcodes_h_l2993_c32_9576 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2993_c32_9576_left,
BIN_OP_AND_uxn_opcodes_h_l2993_c32_9576_right,
BIN_OP_AND_uxn_opcodes_h_l2993_c32_9576_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2993_c32_96c6
BIN_OP_GT_uxn_opcodes_h_l2993_c32_96c6 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2993_c32_96c6_left,
BIN_OP_GT_uxn_opcodes_h_l2993_c32_96c6_right,
BIN_OP_GT_uxn_opcodes_h_l2993_c32_96c6_return_output);

-- MUX_uxn_opcodes_h_l2993_c32_575d
MUX_uxn_opcodes_h_l2993_c32_575d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2993_c32_575d_cond,
MUX_uxn_opcodes_h_l2993_c32_575d_iftrue,
MUX_uxn_opcodes_h_l2993_c32_575d_iffalse,
MUX_uxn_opcodes_h_l2993_c32_575d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2995_c11_fc43
BIN_OP_EQ_uxn_opcodes_h_l2995_c11_fc43 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2995_c11_fc43_left,
BIN_OP_EQ_uxn_opcodes_h_l2995_c11_fc43_right,
BIN_OP_EQ_uxn_opcodes_h_l2995_c11_fc43_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2995_c7_fa1c
result_stack_value_MUX_uxn_opcodes_h_l2995_c7_fa1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_fa1c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_fa1c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_fa1c
result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_fa1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_fa1c
result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_fa1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_fa1c
result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_fa1c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3001_c11_042e
BIN_OP_EQ_uxn_opcodes_h_l3001_c11_042e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3001_c11_042e_left,
BIN_OP_EQ_uxn_opcodes_h_l3001_c11_042e_right,
BIN_OP_EQ_uxn_opcodes_h_l3001_c11_042e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3001_c7_1ce3
result_stack_value_MUX_uxn_opcodes_h_l3001_c7_1ce3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3001_c7_1ce3_cond,
result_stack_value_MUX_uxn_opcodes_h_l3001_c7_1ce3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3001_c7_1ce3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3001_c7_1ce3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_1ce3
result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_1ce3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_1ce3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_1ce3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_1ce3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_1ce3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_1ce3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_1ce3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_1ce3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_1ce3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_1ce3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_1ce3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_1ce3
result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_1ce3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_1ce3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_1ce3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_1ce3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_1ce3_return_output);

-- CONST_SR_8_uxn_opcodes_h_l3003_c34_9f1c
CONST_SR_8_uxn_opcodes_h_l3003_c34_9f1c : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l3003_c34_9f1c_x,
CONST_SR_8_uxn_opcodes_h_l3003_c34_9f1c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3005_c11_fa58
BIN_OP_EQ_uxn_opcodes_h_l3005_c11_fa58 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3005_c11_fa58_left,
BIN_OP_EQ_uxn_opcodes_h_l3005_c11_fa58_right,
BIN_OP_EQ_uxn_opcodes_h_l3005_c11_fa58_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3005_c7_1c00
result_stack_value_MUX_uxn_opcodes_h_l3005_c7_1c00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3005_c7_1c00_cond,
result_stack_value_MUX_uxn_opcodes_h_l3005_c7_1c00_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3005_c7_1c00_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3005_c7_1c00_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_1c00
result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_1c00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_1c00_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_1c00_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_1c00_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_1c00_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_1c00
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_1c00 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_1c00_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_1c00_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_1c00_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_1c00_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_1c00
result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_1c00 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_1c00_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_1c00_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_1c00_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_1c00_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3009_c11_9c46
BIN_OP_EQ_uxn_opcodes_h_l3009_c11_9c46 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3009_c11_9c46_left,
BIN_OP_EQ_uxn_opcodes_h_l3009_c11_9c46_right,
BIN_OP_EQ_uxn_opcodes_h_l3009_c11_9c46_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3009_c7_32c0
result_stack_value_MUX_uxn_opcodes_h_l3009_c7_32c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3009_c7_32c0_cond,
result_stack_value_MUX_uxn_opcodes_h_l3009_c7_32c0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3009_c7_32c0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3009_c7_32c0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_32c0
result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_32c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_32c0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_32c0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_32c0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_32c0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_32c0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_32c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_32c0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_32c0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_32c0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_32c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_32c0
result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_32c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_32c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_32c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_32c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_32c0_return_output);

-- CONST_SR_8_uxn_opcodes_h_l3011_c34_1b59
CONST_SR_8_uxn_opcodes_h_l3011_c34_1b59 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l3011_c34_1b59_x,
CONST_SR_8_uxn_opcodes_h_l3011_c34_1b59_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3013_c11_ed0d
BIN_OP_EQ_uxn_opcodes_h_l3013_c11_ed0d : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3013_c11_ed0d_left,
BIN_OP_EQ_uxn_opcodes_h_l3013_c11_ed0d_right,
BIN_OP_EQ_uxn_opcodes_h_l3013_c11_ed0d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3013_c7_5593
result_stack_value_MUX_uxn_opcodes_h_l3013_c7_5593 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3013_c7_5593_cond,
result_stack_value_MUX_uxn_opcodes_h_l3013_c7_5593_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3013_c7_5593_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3013_c7_5593_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_5593
result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_5593 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_5593_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_5593_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_5593_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_5593_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_5593
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_5593 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_5593_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_5593_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_5593_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_5593_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_5593
result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_5593 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_5593_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_5593_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_5593_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_5593_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3017_c11_64da
BIN_OP_EQ_uxn_opcodes_h_l3017_c11_64da : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3017_c11_64da_left,
BIN_OP_EQ_uxn_opcodes_h_l3017_c11_64da_right,
BIN_OP_EQ_uxn_opcodes_h_l3017_c11_64da_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3017_c7_b4b7
result_stack_value_MUX_uxn_opcodes_h_l3017_c7_b4b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3017_c7_b4b7_cond,
result_stack_value_MUX_uxn_opcodes_h_l3017_c7_b4b7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3017_c7_b4b7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3017_c7_b4b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_b4b7
result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_b4b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_b4b7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_b4b7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_b4b7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_b4b7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_b4b7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_b4b7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_b4b7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_b4b7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_b4b7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_b4b7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_b4b7
result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_b4b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_b4b7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_b4b7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_b4b7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_b4b7_return_output);

-- CONST_SR_8_uxn_opcodes_h_l3019_c34_c94e
CONST_SR_8_uxn_opcodes_h_l3019_c34_c94e : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l3019_c34_c94e_x,
CONST_SR_8_uxn_opcodes_h_l3019_c34_c94e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3021_c11_7100
BIN_OP_EQ_uxn_opcodes_h_l3021_c11_7100 : entity work.BIN_OP_EQ_uint8_t_uint5_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3021_c11_7100_left,
BIN_OP_EQ_uxn_opcodes_h_l3021_c11_7100_right,
BIN_OP_EQ_uxn_opcodes_h_l3021_c11_7100_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_e39a
result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_e39a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_e39a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_e39a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_e39a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_e39a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_e39a
result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_e39a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_e39a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_e39a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_e39a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_e39a_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2969_l2984_l2954_DUPLICATE_7c35
CONST_SL_8_uint16_t_uxn_opcodes_h_l2969_l2984_l2954_DUPLICATE_7c35 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2969_l2984_l2954_DUPLICATE_7c35_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2969_l2984_l2954_DUPLICATE_7c35_return_output);



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
 l16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6_return_output,
 t16_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output,
 l16_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output,
 n16_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b_return_output,
 t16_MUX_uxn_opcodes_h_l2949_c7_7341_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_7341_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2949_c7_7341_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_7341_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_7341_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_7341_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_7341_return_output,
 l16_MUX_uxn_opcodes_h_l2949_c7_7341_return_output,
 n16_MUX_uxn_opcodes_h_l2949_c7_7341_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185_return_output,
 t16_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output,
 l16_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output,
 n16_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612_return_output,
 t16_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output,
 l16_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output,
 n16_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0_return_output,
 t16_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output,
 l16_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output,
 n16_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2961_c3_c2cf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2964_c11_2e73_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output,
 l16_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output,
 n16_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2967_c11_d766_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output,
 l16_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output,
 n16_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2972_c11_9bf7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output,
 l16_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output,
 n16_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2975_c11_748c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output,
 l16_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output,
 n16_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2976_c3_b907_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2979_c11_0ba4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output,
 l16_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2982_c11_af43_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output,
 l16_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2987_c11_9dfb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output,
 l16_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2990_c11_c263_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output,
 l16_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2991_c3_032b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2993_c32_9576_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2993_c32_96c6_return_output,
 MUX_uxn_opcodes_h_l2993_c32_575d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2995_c11_fc43_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3001_c11_042e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3001_c7_1ce3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_1ce3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_1ce3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_1ce3_return_output,
 CONST_SR_8_uxn_opcodes_h_l3003_c34_9f1c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3005_c11_fa58_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3005_c7_1c00_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_1c00_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_1c00_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_1c00_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3009_c11_9c46_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3009_c7_32c0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_32c0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_32c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_32c0_return_output,
 CONST_SR_8_uxn_opcodes_h_l3011_c34_1b59_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3013_c11_ed0d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3013_c7_5593_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_5593_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_5593_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_5593_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3017_c11_64da_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3017_c7_b4b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_b4b7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_b4b7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_b4b7_return_output,
 CONST_SR_8_uxn_opcodes_h_l3019_c34_c94e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3021_c11_7100_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_e39a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_e39a_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2969_l2984_l2954_DUPLICATE_7c35_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2949_c7_7341_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_7341_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2949_c7_7341_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2946_c3_a441 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_7341_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_7341_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_7341_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_7341_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2949_c7_7341_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2949_c7_7341_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2949_c7_7341_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_7341_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2949_c7_7341_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2950_c3_2f67 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_7341_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_7341_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_7341_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_7341_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2949_c7_7341_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2949_c7_7341_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2952_c7_17ec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_17ec_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2955_c3_c2ab : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_17ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_17ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_17ec_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2952_c7_17ec_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2952_c7_17ec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2957_c7_bd38_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2957_c7_bd38_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2958_c3_86ab : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_bd38_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_bd38_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_bd38_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2957_c7_bd38_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2957_c7_bd38_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2960_c7_a45f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_a45f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2962_c3_dec1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_a45f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_a45f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_a45f_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2960_c7_a45f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2960_c7_a45f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2961_c3_c2cf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2961_c3_c2cf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2961_c3_c2cf_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_2e73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_2e73_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_2e73_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2965_c3_262b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_d766_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_d766_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_d766_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_51e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2970_c3_a37f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_51e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_51e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_51e5_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2967_c7_51e5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2967_c7_51e5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_9bf7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_9bf7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_9bf7_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_2c40_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2973_c3_6529 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_2c40_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_2c40_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_2c40_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2972_c7_2c40_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2972_c7_2c40_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_748c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_748c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_748c_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2977_c3_855f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2976_c3_b907_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2976_c3_b907_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2976_c3_b907_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_0ba4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_0ba4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_0ba4_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2980_c3_266d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_af43_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_af43_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_af43_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_4dea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2985_c3_d235 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_4dea_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_4dea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_4dea_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2982_c7_4dea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_9dfb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_9dfb_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_9dfb_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2988_c3_17ac : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_c263_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_c263_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_c263_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2990_c7_8b80_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_8b80_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_8b80_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_8b80_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2990_c7_8b80_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2991_c3_032b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2991_c3_032b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2991_c3_032b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2993_c32_575d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2993_c32_575d_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2993_c32_575d_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2993_c32_9576_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2993_c32_9576_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2993_c32_9576_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2993_c32_96c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2993_c32_96c6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2993_c32_96c6_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2993_c32_575d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_fc43_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_fc43_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_fc43_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_1ce3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2998_c3_8a55 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_1ce3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_1ce3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_1ce3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2999_c24_9682_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_042e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_042e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_042e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_1ce3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_1ce3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_1c00_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_1ce3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_1ce3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_1ce3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_1c00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_1ce3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_1ce3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3002_c3_ece7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_1ce3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_1c00_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_1ce3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_1ce3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_1ce3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_1c00_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_1ce3_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3003_c34_9f1c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3003_c34_9f1c_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3003_c24_914e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_fa58_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_fa58_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_fa58_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_1c00_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_1c00_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_32c0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_1c00_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_1c00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_1c00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_32c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_1c00_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_1c00_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3006_c3_2ab9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_1c00_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_32c0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_1c00_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_1c00_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_1c00_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_32c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_1c00_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3007_c24_e71a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_9c46_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_9c46_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_9c46_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_32c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_32c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_5593_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_32c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_32c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_32c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_5593_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_32c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_32c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3010_c3_34d5 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_32c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_5593_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_32c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_32c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_32c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_5593_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_32c0_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3011_c34_1b59_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3011_c34_1b59_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3011_c24_ba93_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_ed0d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_ed0d_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_ed0d_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_5593_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_5593_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3017_c7_b4b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_5593_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_5593_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_5593_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_b4b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_5593_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_5593_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3014_c3_0830 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_5593_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_b4b7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_5593_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_5593_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_5593_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_b4b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_5593_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3015_c24_4ddd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_64da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_64da_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_64da_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3017_c7_b4b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3017_c7_b4b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3017_c7_b4b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_b4b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_b4b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_e39a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_b4b7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_b4b7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3018_c3_9da3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_b4b7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_b4b7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_b4b7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_b4b7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_e39a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_b4b7_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3019_c34_c94e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l3019_c34_c94e_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3019_c24_e244_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3021_c11_7100_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3021_c11_7100_right : unsigned(4 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3021_c11_7100_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_e39a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_e39a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_e39a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_e39a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_e39a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_e39a_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l2964_l2987_DUPLICATE_5907_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_DUPLICATE_5bc2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2995_l2944_l2967_l2964_l2987_DUPLICATE_fafe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_l3001_l2990_l2987_DUPLICATE_415a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_l3001_l2995_l2990_l2987_DUPLICATE_9ffe_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2953_l2991_l2961_l2976_l2968_l2983_DUPLICATE_1ce9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2969_l2984_l2954_DUPLICATE_7c35_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2969_l2984_l2954_DUPLICATE_7c35_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2990_l3017_DUPLICATE_548d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l3026_l2940_DUPLICATE_c025_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_l16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_l16 := l16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_opcodes_h_l2993_c32_9576_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2970_c3_a37f := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2970_c3_a37f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2955_c3_c2ab := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2955_c3_c2ab;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_0ba4_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3010_c3_34d5 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_32c0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3010_c3_34d5;
     VAR_MUX_uxn_opcodes_h_l2993_c32_575d_iftrue := signed(std_logic_vector(resize(to_unsigned(6, 3), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_042e_right := to_unsigned(14, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_748c_right := to_unsigned(8, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_e39a_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2973_c3_6529 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2973_c3_6529;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2998_c3_8a55 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2998_c3_8a55;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_ed0d_right := to_unsigned(17, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_9c46_right := to_unsigned(16, 5);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2958_c3_86ab := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2958_c3_86ab;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_64da_right := to_unsigned(18, 5);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2985_c3_d235 := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2985_c3_d235;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_fc43_right := to_unsigned(13, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3018_c3_9da3 := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_b4b7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3018_c3_9da3;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_fa58_right := to_unsigned(15, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_c263_right := to_unsigned(12, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_e39a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3014_c3_0830 := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_5593_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3014_c3_0830;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2965_c3_262b := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2965_c3_262b;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2950_c3_2f67 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2950_c3_2f67;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_9bf7_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_9dfb_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3002_c3_ece7 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_1ce3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3002_c3_ece7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3021_c11_7100_right := to_unsigned(19, 5);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185_right := to_unsigned(2, 2);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2993_c32_96c6_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2980_c3_266d := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2980_c3_266d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_af43_right := to_unsigned(10, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2988_c3_17ac := resize(to_unsigned(5, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2988_c3_17ac;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_d766_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2946_c3_a441 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2946_c3_a441;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2977_c3_855f := resize(to_unsigned(6, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2977_c3_855f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2962_c3_dec1 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2962_c3_dec1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_2e73_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3006_c3_2ab9 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_1c00_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3006_c3_2ab9;
     VAR_MUX_uxn_opcodes_h_l2993_c32_575d_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l2993_c32_9576_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2991_c3_032b_left := l16;
     VAR_CONST_SR_8_uxn_opcodes_h_l3003_c34_9f1c_x := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse := l16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2976_c3_b907_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l3019_c34_c94e_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_2e73_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_d766_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_9bf7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_748c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_0ba4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_af43_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_9dfb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_c263_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_fc43_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_042e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_fa58_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_9c46_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_ed0d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_64da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3021_c11_7100_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2961_c3_c2cf_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l3011_c34_1b59_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2990_c11_c263] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2990_c11_c263_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_c263_left;
     BIN_OP_EQ_uxn_opcodes_h_l2990_c11_c263_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_c263_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_c263_return_output := BIN_OP_EQ_uxn_opcodes_h_l2990_c11_c263_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2960_c11_25a0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2990_l3017_DUPLICATE_548d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2990_l3017_DUPLICATE_548d_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2949_c11_6c7b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2967_c11_d766] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2967_c11_d766_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_d766_left;
     BIN_OP_EQ_uxn_opcodes_h_l2967_c11_d766_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_d766_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_d766_return_output := BIN_OP_EQ_uxn_opcodes_h_l2967_c11_d766_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l3011_c34_1b59] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l3011_c34_1b59_x <= VAR_CONST_SR_8_uxn_opcodes_h_l3011_c34_1b59_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l3011_c34_1b59_return_output := CONST_SR_8_uxn_opcodes_h_l3011_c34_1b59_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_l3001_l2995_l2990_l2987_DUPLICATE_9ffe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_l3001_l2995_l2990_l2987_DUPLICATE_9ffe_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2944_c6_e2d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3001_c11_042e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3001_c11_042e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_042e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3001_c11_042e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_042e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_042e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3001_c11_042e_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2953_l2991_l2961_l2976_l2968_l2983_DUPLICATE_1ce9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2953_l2991_l2961_l2976_l2968_l2983_DUPLICATE_1ce9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2957_c11_8612] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612_left;
     BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612_return_output := BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2995_l2944_l2967_l2964_l2987_DUPLICATE_fafe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2995_l2944_l2967_l2964_l2987_DUPLICATE_fafe_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l3005_c11_fa58] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3005_c11_fa58_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_fa58_left;
     BIN_OP_EQ_uxn_opcodes_h_l3005_c11_fa58_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_fa58_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_fa58_return_output := BIN_OP_EQ_uxn_opcodes_h_l3005_c11_fa58_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2964_c11_2e73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2964_c11_2e73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_2e73_left;
     BIN_OP_EQ_uxn_opcodes_h_l2964_c11_2e73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_2e73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_2e73_return_output := BIN_OP_EQ_uxn_opcodes_h_l2964_c11_2e73_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3007_c24_e71a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3007_c24_e71a_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l3013_c11_ed0d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3013_c11_ed0d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_ed0d_left;
     BIN_OP_EQ_uxn_opcodes_h_l3013_c11_ed0d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_ed0d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_ed0d_return_output := BIN_OP_EQ_uxn_opcodes_h_l3013_c11_ed0d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2975_c11_748c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2975_c11_748c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_748c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2975_c11_748c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_748c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_748c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2975_c11_748c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3015_c24_4ddd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3015_c24_4ddd_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CONST_SR_8[uxn_opcodes_h_l3019_c34_c94e] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l3019_c34_c94e_x <= VAR_CONST_SR_8_uxn_opcodes_h_l3019_c34_c94e_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l3019_c34_c94e_return_output := CONST_SR_8_uxn_opcodes_h_l3019_c34_c94e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2987_c11_9dfb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2987_c11_9dfb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_9dfb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2987_c11_9dfb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_9dfb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_9dfb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2987_c11_9dfb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3017_c11_64da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3017_c11_64da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_64da_left;
     BIN_OP_EQ_uxn_opcodes_h_l3017_c11_64da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_64da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_64da_return_output := BIN_OP_EQ_uxn_opcodes_h_l3017_c11_64da_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_l3001_l2990_l2987_DUPLICATE_415a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_l3001_l2990_l2987_DUPLICATE_415a_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2979_c11_0ba4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2979_c11_0ba4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_0ba4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2979_c11_0ba4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_0ba4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_0ba4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2979_c11_0ba4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2995_c11_fc43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2995_c11_fc43_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_fc43_left;
     BIN_OP_EQ_uxn_opcodes_h_l2995_c11_fc43_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_fc43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_fc43_return_output := BIN_OP_EQ_uxn_opcodes_h_l2995_c11_fc43_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_DUPLICATE_5bc2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_DUPLICATE_5bc2_return_output := result.stack_value;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l2964_l2987_DUPLICATE_5907 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l2964_l2987_DUPLICATE_5907_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2972_c11_9bf7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2972_c11_9bf7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_9bf7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2972_c11_9bf7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_9bf7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_9bf7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2972_c11_9bf7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3009_c11_9c46] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3009_c11_9c46_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_9c46_left;
     BIN_OP_EQ_uxn_opcodes_h_l3009_c11_9c46_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_9c46_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_9c46_return_output := BIN_OP_EQ_uxn_opcodes_h_l3009_c11_9c46_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2952_c11_a185] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185_left;
     BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185_return_output := BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2993_c32_9576] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2993_c32_9576_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2993_c32_9576_left;
     BIN_OP_AND_uxn_opcodes_h_l2993_c32_9576_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2993_c32_9576_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2993_c32_9576_return_output := BIN_OP_AND_uxn_opcodes_h_l2993_c32_9576_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l3003_c34_9f1c] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l3003_c34_9f1c_x <= VAR_CONST_SR_8_uxn_opcodes_h_l3003_c34_9f1c_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l3003_c34_9f1c_return_output := CONST_SR_8_uxn_opcodes_h_l3003_c34_9f1c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2982_c11_af43] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2982_c11_af43_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_af43_left;
     BIN_OP_EQ_uxn_opcodes_h_l2982_c11_af43_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_af43_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_af43_return_output := BIN_OP_EQ_uxn_opcodes_h_l2982_c11_af43_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2999_c24_9682] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2999_c24_9682_return_output := CAST_TO_uint8_t_uint16_t(
     l16);

     -- BIN_OP_EQ[uxn_opcodes_h_l3021_c11_7100] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3021_c11_7100_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3021_c11_7100_left;
     BIN_OP_EQ_uxn_opcodes_h_l3021_c11_7100_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3021_c11_7100_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3021_c11_7100_return_output := BIN_OP_EQ_uxn_opcodes_h_l3021_c11_7100_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2993_c32_96c6_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2993_c32_9576_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2944_c6_e2d6_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2949_c7_7341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2949_c7_7341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_7341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_7341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_7341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_7341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_7341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2949_c7_7341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2949_c7_7341_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2949_c11_6c7b_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2952_c7_17ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2952_c7_17ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_17ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_17ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_17ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_17ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2952_c7_17ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2952_c11_a185_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2957_c7_bd38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2957_c7_bd38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_bd38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_bd38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_bd38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2957_c7_bd38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2957_c7_bd38_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2957_c11_8612_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2960_c7_a45f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2960_c7_a45f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_a45f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_a45f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_a45f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_a45f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2960_c7_a45f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2960_c11_25a0_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_2e73_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_2e73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_2e73_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_2e73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_2e73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_2e73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_2e73_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2964_c11_2e73_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2967_c7_51e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_d766_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2967_c7_51e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_d766_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_51e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_d766_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_d766_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_51e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_d766_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_d766_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_51e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_d766_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_51e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2967_c11_d766_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2972_c7_2c40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_9bf7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2972_c7_2c40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_9bf7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_2c40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_9bf7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_9bf7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_2c40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_9bf7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_9bf7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_2c40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_9bf7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_2c40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2972_c11_9bf7_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_748c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_748c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_748c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_748c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_748c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_748c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_748c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2975_c11_748c_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_0ba4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_0ba4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_0ba4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_0ba4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_0ba4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_0ba4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2979_c11_0ba4_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2982_c7_4dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_af43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_4dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_af43_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_af43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_4dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_af43_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_af43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_4dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_af43_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_4dea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2982_c11_af43_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_9dfb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_9dfb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_9dfb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_9dfb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_9dfb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_9dfb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2987_c11_9dfb_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2990_c7_8b80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_c263_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_8b80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_c263_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_c263_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_8b80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_c263_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_c263_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_8b80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_c263_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2990_c7_8b80_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2990_c11_c263_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_fc43_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_fc43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_fc43_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_fc43_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2995_c11_fc43_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_1ce3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_042e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_1ce3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_042e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_1ce3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_042e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_1ce3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3001_c11_042e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_1c00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_fa58_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_1c00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_fa58_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_1c00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_fa58_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_1c00_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3005_c11_fa58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_32c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_9c46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_32c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_9c46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_32c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_9c46_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_32c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3009_c11_9c46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_5593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_ed0d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_5593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_ed0d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_5593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_ed0d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_5593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3013_c11_ed0d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_b4b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_64da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_b4b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_64da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_b4b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_64da_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3017_c7_b4b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3017_c11_64da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_e39a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3021_c11_7100_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_e39a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3021_c11_7100_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2961_c3_c2cf_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2953_l2991_l2961_l2976_l2968_l2983_DUPLICATE_1ce9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2976_c3_b907_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2953_l2991_l2961_l2976_l2968_l2983_DUPLICATE_1ce9_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2991_c3_032b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2953_l2991_l2961_l2976_l2968_l2983_DUPLICATE_1ce9_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2969_l2984_l2954_DUPLICATE_7c35_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2953_l2991_l2961_l2976_l2968_l2983_DUPLICATE_1ce9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2999_c24_9682_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_1c00_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3007_c24_e71a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_5593_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3015_c24_4ddd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l2964_l2987_DUPLICATE_5907_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l2964_l2987_DUPLICATE_5907_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l2964_l2987_DUPLICATE_5907_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l2964_l2987_DUPLICATE_5907_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l2964_l2987_DUPLICATE_5907_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l2964_l2987_DUPLICATE_5907_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l2964_l2987_DUPLICATE_5907_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l2964_l2987_DUPLICATE_5907_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l2964_l2987_DUPLICATE_5907_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l2964_l2987_DUPLICATE_5907_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l2964_l2987_DUPLICATE_5907_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l2964_l2987_DUPLICATE_5907_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l2964_l2987_DUPLICATE_5907_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_l3001_l2995_l2990_l2987_DUPLICATE_9ffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_l3001_l2995_l2990_l2987_DUPLICATE_9ffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_l3001_l2995_l2990_l2987_DUPLICATE_9ffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_l3001_l2995_l2990_l2987_DUPLICATE_9ffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_l3001_l2995_l2990_l2987_DUPLICATE_9ffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_l3001_l2995_l2990_l2987_DUPLICATE_9ffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_l3001_l2995_l2990_l2987_DUPLICATE_9ffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_l3001_l2995_l2990_l2987_DUPLICATE_9ffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_l3001_l2995_l2990_l2987_DUPLICATE_9ffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_l3001_l2995_l2990_l2987_DUPLICATE_9ffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_l3001_l2995_l2990_l2987_DUPLICATE_9ffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_l3001_l2995_l2990_l2987_DUPLICATE_9ffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_l3001_l2995_l2990_l2987_DUPLICATE_9ffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_1ce3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_l3001_l2995_l2990_l2987_DUPLICATE_9ffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_1c00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_l3001_l2995_l2990_l2987_DUPLICATE_9ffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_32c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_l3001_l2995_l2990_l2987_DUPLICATE_9ffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_5593_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_l3001_l2995_l2990_l2987_DUPLICATE_9ffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_b4b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_l3001_l2995_l2990_l2987_DUPLICATE_9ffe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_e39a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l3021_l3017_l3013_l3009_l3005_l3001_l2995_l2990_l2987_DUPLICATE_9ffe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2995_l2944_l2967_l2964_l2987_DUPLICATE_fafe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2995_l2944_l2967_l2964_l2987_DUPLICATE_fafe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2995_l2944_l2967_l2964_l2987_DUPLICATE_fafe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2995_l2944_l2967_l2964_l2987_DUPLICATE_fafe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2995_l2944_l2967_l2964_l2987_DUPLICATE_fafe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2995_l2944_l2967_l2964_l2987_DUPLICATE_fafe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2995_l2944_l2967_l2964_l2987_DUPLICATE_fafe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2995_l2944_l2967_l2964_l2987_DUPLICATE_fafe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2995_l2944_l2967_l2964_l2987_DUPLICATE_fafe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2995_l2944_l2967_l2964_l2987_DUPLICATE_fafe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2995_l2944_l2967_l2964_l2987_DUPLICATE_fafe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2995_l2944_l2967_l2964_l2987_DUPLICATE_fafe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2995_l2944_l2967_l2964_l2987_DUPLICATE_fafe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_l3001_l2990_l2987_DUPLICATE_415a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_l3001_l2990_l2987_DUPLICATE_415a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_l3001_l2990_l2987_DUPLICATE_415a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_l3001_l2990_l2987_DUPLICATE_415a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_l3001_l2990_l2987_DUPLICATE_415a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_l3001_l2990_l2987_DUPLICATE_415a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_l3001_l2990_l2987_DUPLICATE_415a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_l3001_l2990_l2987_DUPLICATE_415a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_l3001_l2990_l2987_DUPLICATE_415a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_l3001_l2990_l2987_DUPLICATE_415a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_l3001_l2990_l2987_DUPLICATE_415a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_l3001_l2990_l2987_DUPLICATE_415a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_l3001_l2990_l2987_DUPLICATE_415a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_1ce3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_l3001_l2990_l2987_DUPLICATE_415a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_1c00_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_l3001_l2990_l2987_DUPLICATE_415a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_32c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_l3001_l2990_l2987_DUPLICATE_415a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_5593_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_l3001_l2990_l2987_DUPLICATE_415a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_b4b7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_l3001_l2990_l2987_DUPLICATE_415a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_e39a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2982_l2979_l2975_l2972_l2967_l2964_l2960_l2957_l2952_l2949_l2944_l3021_l3017_l3013_l3009_l3005_l3001_l2990_l2987_DUPLICATE_415a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2990_l3017_DUPLICATE_548d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_b4b7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2990_l3017_DUPLICATE_548d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_DUPLICATE_5bc2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_DUPLICATE_5bc2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_DUPLICATE_5bc2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_DUPLICATE_5bc2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_DUPLICATE_5bc2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_DUPLICATE_5bc2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_DUPLICATE_5bc2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_DUPLICATE_5bc2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_DUPLICATE_5bc2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_DUPLICATE_5bc2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_DUPLICATE_5bc2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_DUPLICATE_5bc2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_DUPLICATE_5bc2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3017_c7_b4b7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2960_l2982_l2957_l2979_l2952_l2975_l2949_l2972_l2944_l2967_l2990_l3017_l2964_l2987_DUPLICATE_5bc2_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2969_l2984_l2954_DUPLICATE_7c35 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2969_l2984_l2954_DUPLICATE_7c35_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2969_l2984_l2954_DUPLICATE_7c35_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2969_l2984_l2954_DUPLICATE_7c35_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2969_l2984_l2954_DUPLICATE_7c35_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2961_c3_c2cf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2961_c3_c2cf_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2961_c3_c2cf_left;
     BIN_OP_OR_uxn_opcodes_h_l2961_c3_c2cf_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2961_c3_c2cf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2961_c3_c2cf_return_output := BIN_OP_OR_uxn_opcodes_h_l2961_c3_c2cf_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2976_c3_b907] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2976_c3_b907_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2976_c3_b907_left;
     BIN_OP_OR_uxn_opcodes_h_l2976_c3_b907_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2976_c3_b907_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2976_c3_b907_return_output := BIN_OP_OR_uxn_opcodes_h_l2976_c3_b907_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3021_c7_e39a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_e39a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_e39a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_e39a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_e39a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_e39a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_e39a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_e39a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_e39a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3021_c7_e39a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_e39a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_e39a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_e39a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_e39a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_e39a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_e39a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_e39a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_e39a_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2991_c3_032b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2991_c3_032b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2991_c3_032b_left;
     BIN_OP_OR_uxn_opcodes_h_l2991_c3_032b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2991_c3_032b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2991_c3_032b_return_output := BIN_OP_OR_uxn_opcodes_h_l2991_c3_032b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3011_c24_ba93] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3011_c24_ba93_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l3011_c34_1b59_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3017_c7_b4b7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_b4b7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_b4b7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_b4b7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_b4b7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_b4b7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_b4b7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_b4b7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_b4b7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2995_c7_fa1c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3003_c24_914e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3003_c24_914e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l3003_c34_9f1c_return_output);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3019_c24_e244] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3019_c24_e244_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l3019_c34_c94e_return_output);

     -- BIN_OP_GT[uxn_opcodes_h_l2993_c32_96c6] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2993_c32_96c6_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2993_c32_96c6_left;
     BIN_OP_GT_uxn_opcodes_h_l2993_c32_96c6_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2993_c32_96c6_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2993_c32_96c6_return_output := BIN_OP_GT_uxn_opcodes_h_l2993_c32_96c6_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2993_c32_575d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2993_c32_96c6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2961_c3_c2cf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2976_c3_b907_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2991_c3_032b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_1ce3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3003_c24_914e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_32c0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3011_c24_ba93_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3017_c7_b4b7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3019_c24_e244_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2969_l2984_l2954_DUPLICATE_7c35_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2969_l2984_l2954_DUPLICATE_7c35_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2969_l2984_l2954_DUPLICATE_7c35_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_b4b7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3021_c7_e39a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_b4b7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3021_c7_e39a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_5593_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3017_c7_b4b7_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l3017_c7_b4b7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3017_c7_b4b7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3017_c7_b4b7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3017_c7_b4b7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3017_c7_b4b7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3017_c7_b4b7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3017_c7_b4b7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3017_c7_b4b7_return_output := result_stack_value_MUX_uxn_opcodes_h_l3017_c7_b4b7_return_output;

     -- MUX[uxn_opcodes_h_l2993_c32_575d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2993_c32_575d_cond <= VAR_MUX_uxn_opcodes_h_l2993_c32_575d_cond;
     MUX_uxn_opcodes_h_l2993_c32_575d_iftrue <= VAR_MUX_uxn_opcodes_h_l2993_c32_575d_iftrue;
     MUX_uxn_opcodes_h_l2993_c32_575d_iffalse <= VAR_MUX_uxn_opcodes_h_l2993_c32_575d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2993_c32_575d_return_output := MUX_uxn_opcodes_h_l2993_c32_575d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2990_c7_8b80] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3017_c7_b4b7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_b4b7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_b4b7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_b4b7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_b4b7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_b4b7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_b4b7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_b4b7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_b4b7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3017_c7_b4b7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_b4b7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_b4b7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_b4b7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_b4b7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_b4b7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_b4b7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_b4b7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_b4b7_return_output;

     -- t16_MUX[uxn_opcodes_h_l2960_c7_a45f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2960_c7_a45f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2960_c7_a45f_cond;
     t16_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue;
     t16_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output := t16_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3013_c7_5593] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_5593_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_5593_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_5593_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_5593_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_5593_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_5593_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_5593_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_5593_return_output;

     -- n16_MUX[uxn_opcodes_h_l2975_c7_ce7b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond;
     n16_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue;
     n16_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output := n16_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output;

     -- l16_MUX[uxn_opcodes_h_l2990_c7_8b80] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2990_c7_8b80_cond <= VAR_l16_MUX_uxn_opcodes_h_l2990_c7_8b80_cond;
     l16_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue;
     l16_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output := l16_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue := VAR_MUX_uxn_opcodes_h_l2993_c32_575d_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_5593_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3017_c7_b4b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_5593_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3017_c7_b4b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_32c0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3013_c7_5593_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_5593_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3017_c7_b4b7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output;
     -- l16_MUX[uxn_opcodes_h_l2987_c7_f8f5] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond <= VAR_l16_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond;
     l16_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue;
     l16_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output := l16_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2987_c7_f8f5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output;

     -- n16_MUX[uxn_opcodes_h_l2972_c7_2c40] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2972_c7_2c40_cond <= VAR_n16_MUX_uxn_opcodes_h_l2972_c7_2c40_cond;
     n16_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue;
     n16_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output := n16_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2990_c7_8b80] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3009_c7_32c0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_32c0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_32c0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_32c0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_32c0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_32c0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_32c0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_32c0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_32c0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3013_c7_5593] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_5593_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_5593_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_5593_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_5593_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_5593_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_5593_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_5593_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_5593_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3013_c7_5593] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_5593_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_5593_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_5593_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_5593_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_5593_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_5593_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_5593_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_5593_return_output;

     -- t16_MUX[uxn_opcodes_h_l2957_c7_bd38] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2957_c7_bd38_cond <= VAR_t16_MUX_uxn_opcodes_h_l2957_c7_bd38_cond;
     t16_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue;
     t16_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output := t16_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3013_c7_5593] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3013_c7_5593_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_5593_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3013_c7_5593_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_5593_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3013_c7_5593_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_5593_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_5593_return_output := result_stack_value_MUX_uxn_opcodes_h_l3013_c7_5593_return_output;

     -- Submodule level 4
     VAR_l16_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_32c0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3013_c7_5593_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_32c0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3013_c7_5593_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_1c00_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3009_c7_32c0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_32c0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3013_c7_5593_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2982_c7_4dea] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3009_c7_32c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_32c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_32c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_32c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_32c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_32c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_32c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_32c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_32c0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3005_c7_1c00] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_1c00_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_1c00_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_1c00_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_1c00_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_1c00_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_1c00_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_1c00_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_1c00_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3009_c7_32c0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_32c0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_32c0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_32c0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_32c0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_32c0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_32c0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_32c0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_32c0_return_output;

     -- t16_MUX[uxn_opcodes_h_l2952_c7_17ec] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2952_c7_17ec_cond <= VAR_t16_MUX_uxn_opcodes_h_l2952_c7_17ec_cond;
     t16_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue;
     t16_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output := t16_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output;

     -- n16_MUX[uxn_opcodes_h_l2967_c7_51e5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2967_c7_51e5_cond <= VAR_n16_MUX_uxn_opcodes_h_l2967_c7_51e5_cond;
     n16_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue;
     n16_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output := n16_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output;

     -- l16_MUX[uxn_opcodes_h_l2982_c7_4dea] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2982_c7_4dea_cond <= VAR_l16_MUX_uxn_opcodes_h_l2982_c7_4dea_cond;
     l16_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue;
     l16_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output := l16_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3009_c7_32c0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3009_c7_32c0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_32c0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3009_c7_32c0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_32c0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3009_c7_32c0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_32c0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_32c0_return_output := result_stack_value_MUX_uxn_opcodes_h_l3009_c7_32c0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2987_c7_f8f5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output;

     -- Submodule level 5
     VAR_l16_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_1c00_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3009_c7_32c0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_1c00_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3009_c7_32c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_1ce3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3005_c7_1c00_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_1c00_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3009_c7_32c0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l3005_c7_1c00] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3005_c7_1c00_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_1c00_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3005_c7_1c00_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_1c00_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3005_c7_1c00_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_1c00_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_1c00_return_output := result_stack_value_MUX_uxn_opcodes_h_l3005_c7_1c00_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3005_c7_1c00] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_1c00_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_1c00_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_1c00_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_1c00_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_1c00_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_1c00_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_1c00_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_1c00_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3001_c7_1ce3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_1ce3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_1ce3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_1ce3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_1ce3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_1ce3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_1ce3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_1ce3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_1ce3_return_output;

     -- l16_MUX[uxn_opcodes_h_l2979_c7_d4fd] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond <= VAR_l16_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond;
     l16_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue;
     l16_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output := l16_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output;

     -- n16_MUX[uxn_opcodes_h_l2964_c7_4bd0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond <= VAR_n16_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond;
     n16_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue;
     n16_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output := n16_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3005_c7_1c00] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_1c00_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_1c00_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_1c00_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_1c00_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_1c00_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_1c00_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_1c00_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_1c00_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2982_c7_4dea] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2979_c7_d4fd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output;

     -- t16_MUX[uxn_opcodes_h_l2949_c7_7341] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2949_c7_7341_cond <= VAR_t16_MUX_uxn_opcodes_h_l2949_c7_7341_cond;
     t16_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue;
     t16_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2949_c7_7341_return_output := t16_MUX_uxn_opcodes_h_l2949_c7_7341_return_output;

     -- Submodule level 6
     VAR_l16_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_1ce3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3005_c7_1c00_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_1ce3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3005_c7_1c00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3001_c7_1ce3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_1ce3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3005_c7_1c00_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2949_c7_7341_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3001_c7_1ce3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_1ce3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_1ce3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_1ce3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_1ce3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_1ce3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_1ce3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_1ce3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_1ce3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2979_c7_d4fd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2995_c7_fa1c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output;

     -- l16_MUX[uxn_opcodes_h_l2975_c7_ce7b] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond <= VAR_l16_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond;
     l16_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue;
     l16_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output := l16_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output;

     -- t16_MUX[uxn_opcodes_h_l2944_c2_cb0b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond;
     t16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue;
     t16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output := t16_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output;

     -- n16_MUX[uxn_opcodes_h_l2960_c7_a45f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2960_c7_a45f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2960_c7_a45f_cond;
     n16_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue;
     n16_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output := n16_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2975_c7_ce7b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3001_c7_1ce3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_1ce3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_1ce3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_1ce3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_1ce3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_1ce3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_1ce3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_1ce3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_1ce3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3001_c7_1ce3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3001_c7_1ce3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_1ce3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3001_c7_1ce3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_1ce3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3001_c7_1ce3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_1ce3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_1ce3_return_output := result_stack_value_MUX_uxn_opcodes_h_l3001_c7_1ce3_return_output;

     -- Submodule level 7
     VAR_l16_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3001_c7_1ce3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3001_c7_1ce3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3001_c7_1ce3_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2995_c7_fa1c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2990_c7_8b80] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_8b80_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_8b80_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2975_c7_ce7b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2995_c7_fa1c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2972_c7_2c40] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2995_c7_fa1c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2995_c7_fa1c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2995_c7_fa1c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2995_c7_fa1c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output;

     -- l16_MUX[uxn_opcodes_h_l2972_c7_2c40] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2972_c7_2c40_cond <= VAR_l16_MUX_uxn_opcodes_h_l2972_c7_2c40_cond;
     l16_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue;
     l16_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output := l16_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output;

     -- n16_MUX[uxn_opcodes_h_l2957_c7_bd38] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2957_c7_bd38_cond <= VAR_n16_MUX_uxn_opcodes_h_l2957_c7_bd38_cond;
     n16_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue;
     n16_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output := n16_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output;

     -- Submodule level 8
     VAR_l16_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2995_c7_fa1c_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2972_c7_2c40] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2987_c7_f8f5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2967_c7_51e5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2990_c7_8b80] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_8b80_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_8b80_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output;

     -- n16_MUX[uxn_opcodes_h_l2952_c7_17ec] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2952_c7_17ec_cond <= VAR_n16_MUX_uxn_opcodes_h_l2952_c7_17ec_cond;
     n16_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue;
     n16_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output := n16_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2990_c7_8b80] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_8b80_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_8b80_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output;

     -- l16_MUX[uxn_opcodes_h_l2967_c7_51e5] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2967_c7_51e5_cond <= VAR_l16_MUX_uxn_opcodes_h_l2967_c7_51e5_cond;
     l16_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue;
     l16_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output := l16_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2990_c7_8b80] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2990_c7_8b80_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2990_c7_8b80_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2990_c7_8b80_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2990_c7_8b80_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output := result_stack_value_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output;

     -- Submodule level 9
     VAR_l16_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2990_c7_8b80_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2982_c7_4dea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_4dea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_4dea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output;

     -- l16_MUX[uxn_opcodes_h_l2964_c7_4bd0] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond <= VAR_l16_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond;
     l16_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue;
     l16_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output := l16_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2964_c7_4bd0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2967_c7_51e5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2987_c7_f8f5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2987_c7_f8f5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output := result_stack_value_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2987_c7_f8f5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_f8f5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_f8f5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_f8f5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output;

     -- n16_MUX[uxn_opcodes_h_l2949_c7_7341] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2949_c7_7341_cond <= VAR_n16_MUX_uxn_opcodes_h_l2949_c7_7341_cond;
     n16_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue;
     n16_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2949_c7_7341_return_output := n16_MUX_uxn_opcodes_h_l2949_c7_7341_return_output;

     -- Submodule level 10
     VAR_l16_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2949_c7_7341_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2987_c7_f8f5_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2982_c7_4dea] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2982_c7_4dea_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_4dea_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output := result_stack_value_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output;

     -- n16_MUX[uxn_opcodes_h_l2944_c2_cb0b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond;
     n16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue;
     n16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output := n16_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2979_c7_d4fd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output;

     -- l16_MUX[uxn_opcodes_h_l2960_c7_a45f] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2960_c7_a45f_cond <= VAR_l16_MUX_uxn_opcodes_h_l2960_c7_a45f_cond;
     l16_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue;
     l16_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output := l16_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2960_c7_a45f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2982_c7_4dea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_4dea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_4dea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2982_c7_4dea] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_4dea_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_4dea_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_4dea_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_4dea_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2964_c7_4bd0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output;

     -- Submodule level 11
     VAR_l16_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output;
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2982_c7_4dea_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2979_c7_d4fd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output;

     -- l16_MUX[uxn_opcodes_h_l2957_c7_bd38] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2957_c7_bd38_cond <= VAR_l16_MUX_uxn_opcodes_h_l2957_c7_bd38_cond;
     l16_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue;
     l16_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output := l16_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2957_c7_bd38] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2979_c7_d4fd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output := result_stack_value_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2975_c7_ce7b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2979_c7_d4fd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_d4fd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_d4fd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_d4fd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2960_c7_a45f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output;

     -- Submodule level 12
     VAR_l16_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2979_c7_d4fd_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2952_c7_17ec] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2957_c7_bd38] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2972_c7_2c40] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_2c40_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_2c40_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output;

     -- l16_MUX[uxn_opcodes_h_l2952_c7_17ec] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2952_c7_17ec_cond <= VAR_l16_MUX_uxn_opcodes_h_l2952_c7_17ec_cond;
     l16_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue;
     l16_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output := l16_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2975_c7_ce7b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2975_c7_ce7b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2975_c7_ce7b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_ce7b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_ce7b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_ce7b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output;

     -- Submodule level 13
     VAR_l16_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2975_c7_ce7b_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2949_c7_7341] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_7341_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_7341_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_7341_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_7341_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2972_c7_2c40] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2972_c7_2c40_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_2c40_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output := result_stack_value_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2967_c7_51e5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_51e5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_51e5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2972_c7_2c40] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_2c40_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_2c40_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2952_c7_17ec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output;

     -- l16_MUX[uxn_opcodes_h_l2949_c7_7341] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2949_c7_7341_cond <= VAR_l16_MUX_uxn_opcodes_h_l2949_c7_7341_cond;
     l16_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue;
     l16_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2949_c7_7341_return_output := l16_MUX_uxn_opcodes_h_l2949_c7_7341_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2972_c7_2c40] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_2c40_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_2c40_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_2c40_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_2c40_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output;

     -- Submodule level 14
     VAR_l16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2949_c7_7341_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2949_c7_7341_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2972_c7_2c40_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2967_c7_51e5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_51e5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_51e5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2967_c7_51e5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_51e5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_51e5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output;

     -- l16_MUX[uxn_opcodes_h_l2944_c2_cb0b] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond <= VAR_l16_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond;
     l16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue;
     l16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output := l16_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2967_c7_51e5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2967_c7_51e5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_51e5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_51e5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_51e5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output := result_stack_value_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2949_c7_7341] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_7341_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_7341_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_7341_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_7341_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2944_c2_cb0b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2964_c7_4bd0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output;

     -- Submodule level 15
     REG_VAR_l16 := VAR_l16_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2949_c7_7341_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2967_c7_51e5_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2944_c2_cb0b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2964_c7_4bd0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2964_c7_4bd0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2960_c7_a45f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_a45f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_a45f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2964_c7_4bd0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_4bd0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_4bd0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_4bd0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output;

     -- Submodule level 16
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2964_c7_4bd0_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2957_c7_bd38] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_bd38_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_bd38_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2960_c7_a45f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_a45f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_a45f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2960_c7_a45f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2960_c7_a45f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_a45f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2960_c7_a45f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_a45f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_a45f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_a45f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_a45f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output;

     -- Submodule level 17
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2960_c7_a45f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2957_c7_bd38] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_bd38_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_bd38_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2957_c7_bd38] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_bd38_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_bd38_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2957_c7_bd38] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2957_c7_bd38_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2957_c7_bd38_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2957_c7_bd38_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2957_c7_bd38_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output := result_stack_value_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2952_c7_17ec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_17ec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_17ec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output;

     -- Submodule level 18
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2957_c7_bd38_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2949_c7_7341] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_7341_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_7341_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_7341_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_7341_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2952_c7_17ec] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_17ec_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_17ec_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2952_c7_17ec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_17ec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_17ec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2952_c7_17ec] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2952_c7_17ec_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_17ec_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_17ec_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_17ec_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output := result_stack_value_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output;

     -- Submodule level 19
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2949_c7_7341_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2952_c7_17ec_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2949_c7_7341] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_7341_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_7341_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_7341_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_7341_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2944_c2_cb0b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2949_c7_7341] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2949_c7_7341_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2949_c7_7341_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2949_c7_7341_return_output := result_stack_value_MUX_uxn_opcodes_h_l2949_c7_7341_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2949_c7_7341] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_7341_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_7341_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_7341_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_7341_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_7341_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_7341_return_output;

     -- Submodule level 20
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2949_c7_7341_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2949_c7_7341_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2949_c7_7341_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2944_c2_cb0b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2944_c2_cb0b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output := result_stack_value_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2944_c2_cb0b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_cb0b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_cb0b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_cb0b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output;

     -- Submodule level 21
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l3026_l2940_DUPLICATE_c025 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l3026_l2940_DUPLICATE_c025_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2944_c2_cb0b_return_output);

     -- Submodule level 22
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l3026_l2940_DUPLICATE_c025_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l3026_l2940_DUPLICATE_c025_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_l16 <= REG_VAR_l16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     l16 <= REG_COMB_l16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
