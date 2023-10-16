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
-- Submodules: 70
entity dup2_0CLK_be266937 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dup2_0CLK_be266937;
architecture arch of dup2_0CLK_be266937 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2986_c6_2632]
signal BIN_OP_EQ_uxn_opcodes_h_l2986_c6_2632_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2986_c6_2632_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2986_c6_2632_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2986_c1_7c60]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_7c60_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_7c60_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_7c60_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_7c60_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2986_c2_80e5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2986_c2_80e5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_80e5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2986_c2_80e5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2986_c2_80e5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_80e5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2986_c2_80e5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_80e5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2986_c2_80e5]
signal result_u8_value_MUX_uxn_opcodes_h_l2986_c2_80e5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2986_c2_80e5]
signal t16_MUX_uxn_opcodes_h_l2986_c2_80e5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2987_c3_69c6[uxn_opcodes_h_l2987_c3_69c6]
signal printf_uxn_opcodes_h_l2987_c3_69c6_uxn_opcodes_h_l2987_c3_69c6_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2991_c11_fb38]
signal BIN_OP_EQ_uxn_opcodes_h_l2991_c11_fb38_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2991_c11_fb38_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2991_c11_fb38_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2991_c7_c103]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_c103_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_c103_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2991_c7_c103]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_c103_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_c103_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2991_c7_c103]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_c103_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_c103_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2991_c7_c103]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_c103_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_c103_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2991_c7_c103]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_c103_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_c103_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2991_c7_c103]
signal result_u8_value_MUX_uxn_opcodes_h_l2991_c7_c103_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2991_c7_c103_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2991_c7_c103]
signal t16_MUX_uxn_opcodes_h_l2991_c7_c103_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2991_c7_c103_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2994_c11_1c53]
signal BIN_OP_EQ_uxn_opcodes_h_l2994_c11_1c53_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2994_c11_1c53_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2994_c11_1c53_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2994_c7_5ea6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2994_c7_5ea6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2994_c7_5ea6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2994_c7_5ea6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2994_c7_5ea6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2994_c7_5ea6]
signal result_u8_value_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2994_c7_5ea6]
signal t16_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2996_c3_dbc5]
signal CONST_SL_8_uxn_opcodes_h_l2996_c3_dbc5_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2996_c3_dbc5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2999_c11_d4d6]
signal BIN_OP_EQ_uxn_opcodes_h_l2999_c11_d4d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2999_c11_d4d6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2999_c11_d4d6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2999_c7_214f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_214f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_214f_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2999_c7_214f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_214f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_214f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2999_c7_214f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_214f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_214f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2999_c7_214f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_214f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_214f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2999_c7_214f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_214f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_214f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2999_c7_214f]
signal result_u8_value_MUX_uxn_opcodes_h_l2999_c7_214f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2999_c7_214f_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l2999_c7_214f]
signal t16_MUX_uxn_opcodes_h_l2999_c7_214f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2999_c7_214f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3002_c11_c874]
signal BIN_OP_EQ_uxn_opcodes_h_l3002_c11_c874_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3002_c11_c874_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3002_c11_c874_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3002_c7_695c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_695c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_695c_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3002_c7_695c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_695c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_695c_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3002_c7_695c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_695c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_695c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3002_c7_695c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_695c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_695c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3002_c7_695c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_695c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_695c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l3002_c7_695c]
signal result_u8_value_MUX_uxn_opcodes_h_l3002_c7_695c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3002_c7_695c_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l3002_c7_695c]
signal t16_MUX_uxn_opcodes_h_l3002_c7_695c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3002_c7_695c_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l3003_c3_3142]
signal BIN_OP_OR_uxn_opcodes_h_l3003_c3_3142_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3003_c3_3142_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3003_c3_3142_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l3005_c30_d9b5]
signal sp_relative_shift_uxn_opcodes_h_l3005_c30_d9b5_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l3005_c30_d9b5_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l3005_c30_d9b5_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l3005_c30_d9b5_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3010_c11_dc95]
signal BIN_OP_EQ_uxn_opcodes_h_l3010_c11_dc95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3010_c11_dc95_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3010_c11_dc95_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3010_c7_db8a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_db8a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3010_c7_db8a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_db8a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3010_c7_db8a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_db8a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3010_c7_db8a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_db8a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l3010_c7_db8a]
signal result_u8_value_MUX_uxn_opcodes_h_l3010_c7_db8a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3015_c11_e6cb]
signal BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e6cb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e6cb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e6cb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3015_c7_aa92]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_aa92_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_aa92_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_aa92_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_aa92_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3015_c7_aa92]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_aa92_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_aa92_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_aa92_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_aa92_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3015_c7_aa92]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_aa92_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_aa92_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_aa92_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_aa92_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l3015_c7_aa92]
signal result_u8_value_MUX_uxn_opcodes_h_l3015_c7_aa92_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3015_c7_aa92_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3015_c7_aa92_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3015_c7_aa92_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3019_c11_cac5]
signal BIN_OP_EQ_uxn_opcodes_h_l3019_c11_cac5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3019_c11_cac5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3019_c11_cac5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3019_c7_7578]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_7578_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_7578_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_7578_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_7578_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3019_c7_7578]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_7578_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_7578_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_7578_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_7578_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3019_c7_7578]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_7578_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_7578_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_7578_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_7578_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l3019_c7_7578]
signal result_u8_value_MUX_uxn_opcodes_h_l3019_c7_7578_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3019_c7_7578_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3019_c7_7578_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l3019_c7_7578_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3023_c11_7c67]
signal BIN_OP_EQ_uxn_opcodes_h_l3023_c11_7c67_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3023_c11_7c67_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3023_c11_7c67_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3023_c7_cc55]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_cc55_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_cc55_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_cc55_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_cc55_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3023_c7_cc55]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_cc55_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_cc55_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_cc55_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_cc55_return_output : unsigned(0 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_4b16
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_4b16_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_4b16_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8cda( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2986_c6_2632
BIN_OP_EQ_uxn_opcodes_h_l2986_c6_2632 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2986_c6_2632_left,
BIN_OP_EQ_uxn_opcodes_h_l2986_c6_2632_right,
BIN_OP_EQ_uxn_opcodes_h_l2986_c6_2632_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_7c60
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_7c60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_7c60_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_7c60_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_7c60_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_7c60_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_80e5
result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_80e5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_80e5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_80e5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_80e5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_80e5
result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_80e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_80e5
result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_80e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_80e5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_80e5
result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_80e5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_80e5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2986_c2_80e5
result_u8_value_MUX_uxn_opcodes_h_l2986_c2_80e5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2986_c2_80e5_cond,
result_u8_value_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output);

-- t16_MUX_uxn_opcodes_h_l2986_c2_80e5
t16_MUX_uxn_opcodes_h_l2986_c2_80e5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2986_c2_80e5_cond,
t16_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue,
t16_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse,
t16_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output);

-- printf_uxn_opcodes_h_l2987_c3_69c6_uxn_opcodes_h_l2987_c3_69c6
printf_uxn_opcodes_h_l2987_c3_69c6_uxn_opcodes_h_l2987_c3_69c6 : entity work.printf_uxn_opcodes_h_l2987_c3_69c6_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2987_c3_69c6_uxn_opcodes_h_l2987_c3_69c6_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2991_c11_fb38
BIN_OP_EQ_uxn_opcodes_h_l2991_c11_fb38 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2991_c11_fb38_left,
BIN_OP_EQ_uxn_opcodes_h_l2991_c11_fb38_right,
BIN_OP_EQ_uxn_opcodes_h_l2991_c11_fb38_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_c103
result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_c103 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_c103_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_c103_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_c103
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_c103 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_c103_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_c103_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_c103
result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_c103 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_c103_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_c103_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_c103
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_c103 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_c103_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_c103_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_c103
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_c103 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_c103_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_c103_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2991_c7_c103
result_u8_value_MUX_uxn_opcodes_h_l2991_c7_c103 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2991_c7_c103_cond,
result_u8_value_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2991_c7_c103_return_output);

-- t16_MUX_uxn_opcodes_h_l2991_c7_c103
t16_MUX_uxn_opcodes_h_l2991_c7_c103 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2991_c7_c103_cond,
t16_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue,
t16_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse,
t16_MUX_uxn_opcodes_h_l2991_c7_c103_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2994_c11_1c53
BIN_OP_EQ_uxn_opcodes_h_l2994_c11_1c53 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2994_c11_1c53_left,
BIN_OP_EQ_uxn_opcodes_h_l2994_c11_1c53_right,
BIN_OP_EQ_uxn_opcodes_h_l2994_c11_1c53_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_5ea6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_5ea6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6
result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_5ea6
result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_5ea6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_5ea6
result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_5ea6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2994_c7_5ea6
result_u8_value_MUX_uxn_opcodes_h_l2994_c7_5ea6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output);

-- t16_MUX_uxn_opcodes_h_l2994_c7_5ea6
t16_MUX_uxn_opcodes_h_l2994_c7_5ea6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond,
t16_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue,
t16_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse,
t16_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2996_c3_dbc5
CONST_SL_8_uxn_opcodes_h_l2996_c3_dbc5 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2996_c3_dbc5_x,
CONST_SL_8_uxn_opcodes_h_l2996_c3_dbc5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2999_c11_d4d6
BIN_OP_EQ_uxn_opcodes_h_l2999_c11_d4d6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2999_c11_d4d6_left,
BIN_OP_EQ_uxn_opcodes_h_l2999_c11_d4d6_right,
BIN_OP_EQ_uxn_opcodes_h_l2999_c11_d4d6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_214f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_214f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_214f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_214f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_214f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_214f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_214f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_214f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_214f
result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_214f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_214f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_214f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_214f
result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_214f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_214f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_214f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_214f
result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_214f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_214f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_214f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2999_c7_214f
result_u8_value_MUX_uxn_opcodes_h_l2999_c7_214f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2999_c7_214f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2999_c7_214f_return_output);

-- t16_MUX_uxn_opcodes_h_l2999_c7_214f
t16_MUX_uxn_opcodes_h_l2999_c7_214f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2999_c7_214f_cond,
t16_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue,
t16_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse,
t16_MUX_uxn_opcodes_h_l2999_c7_214f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3002_c11_c874
BIN_OP_EQ_uxn_opcodes_h_l3002_c11_c874 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3002_c11_c874_left,
BIN_OP_EQ_uxn_opcodes_h_l3002_c11_c874_right,
BIN_OP_EQ_uxn_opcodes_h_l3002_c11_c874_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_695c
result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_695c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_695c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_695c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_695c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_695c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_695c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_695c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_695c
result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_695c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_695c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_695c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_695c
result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_695c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_695c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_695c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_695c
result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_695c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_695c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_695c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l3002_c7_695c
result_u8_value_MUX_uxn_opcodes_h_l3002_c7_695c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l3002_c7_695c_cond,
result_u8_value_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l3002_c7_695c_return_output);

-- t16_MUX_uxn_opcodes_h_l3002_c7_695c
t16_MUX_uxn_opcodes_h_l3002_c7_695c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3002_c7_695c_cond,
t16_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue,
t16_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse,
t16_MUX_uxn_opcodes_h_l3002_c7_695c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l3003_c3_3142
BIN_OP_OR_uxn_opcodes_h_l3003_c3_3142 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l3003_c3_3142_left,
BIN_OP_OR_uxn_opcodes_h_l3003_c3_3142_right,
BIN_OP_OR_uxn_opcodes_h_l3003_c3_3142_return_output);

-- sp_relative_shift_uxn_opcodes_h_l3005_c30_d9b5
sp_relative_shift_uxn_opcodes_h_l3005_c30_d9b5 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l3005_c30_d9b5_ins,
sp_relative_shift_uxn_opcodes_h_l3005_c30_d9b5_x,
sp_relative_shift_uxn_opcodes_h_l3005_c30_d9b5_y,
sp_relative_shift_uxn_opcodes_h_l3005_c30_d9b5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3010_c11_dc95
BIN_OP_EQ_uxn_opcodes_h_l3010_c11_dc95 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3010_c11_dc95_left,
BIN_OP_EQ_uxn_opcodes_h_l3010_c11_dc95_right,
BIN_OP_EQ_uxn_opcodes_h_l3010_c11_dc95_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_db8a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_db8a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_db8a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_db8a
result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_db8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_db8a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_db8a
result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_db8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_db8a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_db8a
result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_db8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_db8a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l3010_c7_db8a
result_u8_value_MUX_uxn_opcodes_h_l3010_c7_db8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l3010_c7_db8a_cond,
result_u8_value_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e6cb
BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e6cb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e6cb_left,
BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e6cb_right,
BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e6cb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_aa92
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_aa92 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_aa92_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_aa92_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_aa92_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_aa92_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_aa92
result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_aa92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_aa92_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_aa92_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_aa92_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_aa92_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_aa92
result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_aa92 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_aa92_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_aa92_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_aa92_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_aa92_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l3015_c7_aa92
result_u8_value_MUX_uxn_opcodes_h_l3015_c7_aa92 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l3015_c7_aa92_cond,
result_u8_value_MUX_uxn_opcodes_h_l3015_c7_aa92_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l3015_c7_aa92_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l3015_c7_aa92_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3019_c11_cac5
BIN_OP_EQ_uxn_opcodes_h_l3019_c11_cac5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3019_c11_cac5_left,
BIN_OP_EQ_uxn_opcodes_h_l3019_c11_cac5_right,
BIN_OP_EQ_uxn_opcodes_h_l3019_c11_cac5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_7578
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_7578 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_7578_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_7578_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_7578_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_7578_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_7578
result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_7578 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_7578_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_7578_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_7578_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_7578_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_7578
result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_7578 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_7578_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_7578_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_7578_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_7578_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l3019_c7_7578
result_u8_value_MUX_uxn_opcodes_h_l3019_c7_7578 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l3019_c7_7578_cond,
result_u8_value_MUX_uxn_opcodes_h_l3019_c7_7578_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l3019_c7_7578_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l3019_c7_7578_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3023_c11_7c67
BIN_OP_EQ_uxn_opcodes_h_l3023_c11_7c67 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3023_c11_7c67_left,
BIN_OP_EQ_uxn_opcodes_h_l3023_c11_7c67_right,
BIN_OP_EQ_uxn_opcodes_h_l3023_c11_7c67_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_cc55
result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_cc55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_cc55_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_cc55_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_cc55_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_cc55_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_cc55
result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_cc55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_cc55_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_cc55_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_cc55_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_cc55_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_4b16
CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_4b16 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_4b16_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_4b16_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2986_c6_2632_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_7c60_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output,
 t16_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2991_c11_fb38_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_c103_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_c103_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_c103_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_c103_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_c103_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2991_c7_c103_return_output,
 t16_MUX_uxn_opcodes_h_l2991_c7_c103_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2994_c11_1c53_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output,
 t16_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output,
 CONST_SL_8_uxn_opcodes_h_l2996_c3_dbc5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2999_c11_d4d6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_214f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_214f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_214f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_214f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_214f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2999_c7_214f_return_output,
 t16_MUX_uxn_opcodes_h_l2999_c7_214f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3002_c11_c874_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_695c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_695c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_695c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_695c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_695c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l3002_c7_695c_return_output,
 t16_MUX_uxn_opcodes_h_l3002_c7_695c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l3003_c3_3142_return_output,
 sp_relative_shift_uxn_opcodes_h_l3005_c30_d9b5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3010_c11_dc95_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e6cb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_aa92_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_aa92_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_aa92_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l3015_c7_aa92_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3019_c11_cac5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_7578_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_7578_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_7578_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l3019_c7_7578_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3023_c11_7c67_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_cc55_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_cc55_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_4b16_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_2632_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_2632_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_2632_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_7c60_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_7c60_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_7c60_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_7c60_iffalse : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_c103_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2988_c3_3526 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_c103_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_80e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_c103_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_c103_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_80e5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_c103_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_80e5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c7_c103_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2986_c2_80e5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2991_c7_c103_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2986_c2_80e5_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2987_c3_69c6_uxn_opcodes_h_l2987_c3_69c6_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_fb38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_fb38_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_fb38_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_c103_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2992_c3_3094 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_c103_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_c103_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_c103_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_c103_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c7_c103_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2991_c7_c103_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_1c53_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_1c53_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_1c53_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_214f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2997_c3_5a6b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_214f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_214f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_214f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_214f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_214f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2999_c7_214f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2996_c3_dbc5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2996_c3_dbc5_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_d4d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_d4d6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_d4d6_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_695c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_214f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3000_c3_b177 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_695c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_214f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_695c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_214f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_695c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_214f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_695c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_214f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_695c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_214f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3002_c7_695c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2999_c7_214f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_c874_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_c874_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_c874_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_695c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3007_c3_8609 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_695c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_695c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_695c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_695c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_695c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3002_c7_695c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3003_c3_3142_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3003_c3_3142_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3003_c3_3142_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l3005_c30_d9b5_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l3005_c30_d9b5_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l3005_c30_d9b5_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l3005_c30_d9b5_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3008_c21_640d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_dc95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_dc95_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_dc95_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3012_c3_8261 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_aa92_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_db8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_db8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_aa92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_db8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_aa92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_db8a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_aa92_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3010_c7_db8a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e6cb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e6cb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e6cb_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_aa92_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3016_c3_f684 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_aa92_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_7578_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_aa92_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_aa92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_aa92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_7578_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_aa92_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_aa92_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_aa92_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_7578_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_aa92_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_aa92_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_aa92_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3019_c7_7578_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_aa92_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3017_c21_ae0d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_cac5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_cac5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_cac5_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_7578_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3020_c3_abc3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_7578_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3019_c7_7578_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_7578_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_7578_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_7578_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_cc55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_7578_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_7578_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_7578_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_cc55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_7578_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3019_c7_7578_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3019_c7_7578_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l3019_c7_7578_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_7c67_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_7c67_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_7c67_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_cc55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_cc55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_cc55_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_cc55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_cc55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_cc55_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2986_l3002_l2999_l2994_l2991_DUPLICATE_252d_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2986_l3010_l2999_l2994_l2991_DUPLICATE_c07c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2986_l3015_l3010_l2999_l2994_l3023_l2991_l3019_DUPLICATE_0f43_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2986_l2999_l2994_l2991_l3019_DUPLICATE_8e20_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3015_l3010_l3002_l2999_l2994_l3023_l2991_l3019_DUPLICATE_e7b5_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2995_l3003_DUPLICATE_bc81_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_4b16_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_4b16_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_555e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l3028_l2982_DUPLICATE_7298_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_1c53_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3020_c3_abc3 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_7578_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3020_c3_abc3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_d4d6_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3012_c3_8261 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3012_c3_8261;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_cc55_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e6cb_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2988_c3_3526 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2988_c3_3526;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_7c67_right := to_unsigned(8, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_2632_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_fb38_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_c874_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_dc95_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_7c60_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3016_c3_f684 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_aa92_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3016_c3_f684;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3007_c3_8609 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3007_c3_8609;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_cc55_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3000_c3_b177 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3000_c3_b177;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_cac5_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2992_c3_3094 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2992_c3_3094;
     VAR_sp_relative_shift_uxn_opcodes_h_l3005_c30_d9b5_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2997_c3_5a6b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2997_c3_5a6b;
     VAR_sp_relative_shift_uxn_opcodes_h_l3005_c30_d9b5_y := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_7c60_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l3005_c30_d9b5_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_2632_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_fb38_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_1c53_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_d4d6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_c874_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_dc95_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e6cb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_cac5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_7c67_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3003_c3_3142_left := t16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_4b16_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3015_l3010_l3002_l2999_l2994_l3023_l2991_l3019_DUPLICATE_e7b5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3015_l3010_l3002_l2999_l2994_l3023_l2991_l3019_DUPLICATE_e7b5_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l3002_c11_c874] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3002_c11_c874_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_c874_left;
     BIN_OP_EQ_uxn_opcodes_h_l3002_c11_c874_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_c874_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_c874_return_output := BIN_OP_EQ_uxn_opcodes_h_l3002_c11_c874_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l3019_c7_7578] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3019_c7_7578_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l3019_c11_cac5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3019_c11_cac5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_cac5_left;
     BIN_OP_EQ_uxn_opcodes_h_l3019_c11_cac5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_cac5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_cac5_return_output := BIN_OP_EQ_uxn_opcodes_h_l3019_c11_cac5_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2995_l3003_DUPLICATE_bc81 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2995_l3003_DUPLICATE_bc81_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_4b16 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_4b16_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_4b16_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_4b16_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_4b16_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l3017_c21_ae0d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3017_c21_ae0d_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- sp_relative_shift[uxn_opcodes_h_l3005_c30_d9b5] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l3005_c30_d9b5_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l3005_c30_d9b5_ins;
     sp_relative_shift_uxn_opcodes_h_l3005_c30_d9b5_x <= VAR_sp_relative_shift_uxn_opcodes_h_l3005_c30_d9b5_x;
     sp_relative_shift_uxn_opcodes_h_l3005_c30_d9b5_y <= VAR_sp_relative_shift_uxn_opcodes_h_l3005_c30_d9b5_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l3005_c30_d9b5_return_output := sp_relative_shift_uxn_opcodes_h_l3005_c30_d9b5_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2986_l2999_l2994_l2991_l3019_DUPLICATE_8e20 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2986_l2999_l2994_l2991_l3019_DUPLICATE_8e20_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2986_l3015_l3010_l2999_l2994_l3023_l2991_l3019_DUPLICATE_0f43 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2986_l3015_l3010_l2999_l2994_l3023_l2991_l3019_DUPLICATE_0f43_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2999_c11_d4d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2999_c11_d4d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_d4d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2999_c11_d4d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_d4d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_d4d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2999_c11_d4d6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3015_c11_e6cb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e6cb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e6cb_left;
     BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e6cb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e6cb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e6cb_return_output := BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e6cb_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2986_l3002_l2999_l2994_l2991_DUPLICATE_252d LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2986_l3002_l2999_l2994_l2991_DUPLICATE_252d_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l3023_c11_7c67] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3023_c11_7c67_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_7c67_left;
     BIN_OP_EQ_uxn_opcodes_h_l3023_c11_7c67_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_7c67_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_7c67_return_output := BIN_OP_EQ_uxn_opcodes_h_l3023_c11_7c67_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2986_l3010_l2999_l2994_l2991_DUPLICATE_c07c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2986_l3010_l2999_l2994_l2991_DUPLICATE_c07c_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2986_c6_2632] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2986_c6_2632_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_2632_left;
     BIN_OP_EQ_uxn_opcodes_h_l2986_c6_2632_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_2632_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_2632_return_output := BIN_OP_EQ_uxn_opcodes_h_l2986_c6_2632_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3010_c11_dc95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3010_c11_dc95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_dc95_left;
     BIN_OP_EQ_uxn_opcodes_h_l3010_c11_dc95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_dc95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_dc95_return_output := BIN_OP_EQ_uxn_opcodes_h_l3010_c11_dc95_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2994_c11_1c53] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2994_c11_1c53_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_1c53_left;
     BIN_OP_EQ_uxn_opcodes_h_l2994_c11_1c53_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_1c53_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_1c53_return_output := BIN_OP_EQ_uxn_opcodes_h_l2994_c11_1c53_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2991_c11_fb38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2991_c11_fb38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_fb38_left;
     BIN_OP_EQ_uxn_opcodes_h_l2991_c11_fb38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_fb38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_fb38_return_output := BIN_OP_EQ_uxn_opcodes_h_l2991_c11_fb38_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_7c60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_2632_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_80e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_2632_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_2632_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_80e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_2632_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_2632_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_80e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_2632_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2986_c2_80e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_2632_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2986_c2_80e5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2986_c6_2632_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_c103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_fb38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_c103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_fb38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_c103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_fb38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_c103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_fb38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_c103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_fb38_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c7_c103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_fb38_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2991_c7_c103_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2991_c11_fb38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_1c53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_1c53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_1c53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_1c53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_1c53_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_1c53_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2994_c11_1c53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_214f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_d4d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_214f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_d4d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_214f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_d4d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_214f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_d4d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_214f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_d4d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_214f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_d4d6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2999_c7_214f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2999_c11_d4d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_695c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_c874_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_695c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_c874_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_695c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_c874_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_695c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_c874_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_695c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_c874_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_695c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_c874_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3002_c7_695c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3002_c11_c874_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_db8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_dc95_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_db8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_dc95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_db8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_dc95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_db8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_dc95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3010_c7_db8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3010_c11_dc95_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_aa92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e6cb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_aa92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e6cb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_aa92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e6cb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_aa92_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3015_c11_e6cb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_7578_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_cac5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_7578_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_cac5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_7578_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_cac5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3019_c7_7578_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3019_c11_cac5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_cc55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_7c67_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_cc55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3023_c11_7c67_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3003_c3_3142_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2995_l3003_DUPLICATE_bc81_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2996_c3_dbc5_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2995_l3003_DUPLICATE_bc81_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_aa92_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3017_c21_ae0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2986_l3002_l2999_l2994_l2991_DUPLICATE_252d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2986_l3002_l2999_l2994_l2991_DUPLICATE_252d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2986_l3002_l2999_l2994_l2991_DUPLICATE_252d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2986_l3002_l2999_l2994_l2991_DUPLICATE_252d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2986_l3002_l2999_l2994_l2991_DUPLICATE_252d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3015_l3010_l3002_l2999_l2994_l3023_l2991_l3019_DUPLICATE_e7b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3015_l3010_l3002_l2999_l2994_l3023_l2991_l3019_DUPLICATE_e7b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3015_l3010_l3002_l2999_l2994_l3023_l2991_l3019_DUPLICATE_e7b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3015_l3010_l3002_l2999_l2994_l3023_l2991_l3019_DUPLICATE_e7b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3015_l3010_l3002_l2999_l2994_l3023_l2991_l3019_DUPLICATE_e7b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_aa92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3015_l3010_l3002_l2999_l2994_l3023_l2991_l3019_DUPLICATE_e7b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_7578_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3015_l3010_l3002_l2999_l2994_l3023_l2991_l3019_DUPLICATE_e7b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_cc55_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3015_l3010_l3002_l2999_l2994_l3023_l2991_l3019_DUPLICATE_e7b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2986_l3010_l2999_l2994_l2991_DUPLICATE_c07c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2986_l3010_l2999_l2994_l2991_DUPLICATE_c07c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2986_l3010_l2999_l2994_l2991_DUPLICATE_c07c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2986_l3010_l2999_l2994_l2991_DUPLICATE_c07c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2986_l3010_l2999_l2994_l2991_DUPLICATE_c07c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2986_l3015_l3010_l2999_l2994_l3023_l2991_l3019_DUPLICATE_0f43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2986_l3015_l3010_l2999_l2994_l3023_l2991_l3019_DUPLICATE_0f43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2986_l3015_l3010_l2999_l2994_l3023_l2991_l3019_DUPLICATE_0f43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2986_l3015_l3010_l2999_l2994_l3023_l2991_l3019_DUPLICATE_0f43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2986_l3015_l3010_l2999_l2994_l3023_l2991_l3019_DUPLICATE_0f43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_aa92_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2986_l3015_l3010_l2999_l2994_l3023_l2991_l3019_DUPLICATE_0f43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_7578_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2986_l3015_l3010_l2999_l2994_l3023_l2991_l3019_DUPLICATE_0f43_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_cc55_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2986_l3015_l3010_l2999_l2994_l3023_l2991_l3019_DUPLICATE_0f43_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2986_l2999_l2994_l2991_l3019_DUPLICATE_8e20_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2986_l2999_l2994_l2991_l3019_DUPLICATE_8e20_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2986_l2999_l2994_l2991_l3019_DUPLICATE_8e20_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2986_l2999_l2994_l2991_l3019_DUPLICATE_8e20_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3019_c7_7578_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2986_l2999_l2994_l2991_l3019_DUPLICATE_8e20_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_7578_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3019_c7_7578_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l3005_c30_d9b5_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3002_c7_695c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_695c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_695c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_695c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_695c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l3003_c3_3142] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l3003_c3_3142_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l3003_c3_3142_left;
     BIN_OP_OR_uxn_opcodes_h_l3003_c3_3142_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l3003_c3_3142_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l3003_c3_3142_return_output := BIN_OP_OR_uxn_opcodes_h_l3003_c3_3142_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3023_c7_cc55] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_cc55_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_cc55_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_cc55_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_cc55_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_cc55_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_cc55_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_cc55_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_cc55_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3023_c7_cc55] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_cc55_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_cc55_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_cc55_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_cc55_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_cc55_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_cc55_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_cc55_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_cc55_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2986_c1_7c60] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_7c60_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_7c60_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_7c60_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_7c60_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_7c60_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_7c60_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_7c60_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_7c60_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3010_c7_db8a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_db8a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_db8a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3019_c7_7578] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_7578_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_7578_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_7578_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_7578_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_7578_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_7578_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_7578_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_7578_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_555e LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_555e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_4b16_return_output);

     -- CONST_SL_8[uxn_opcodes_h_l2996_c3_dbc5] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2996_c3_dbc5_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2996_c3_dbc5_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2996_c3_dbc5_return_output := CONST_SL_8_uxn_opcodes_h_l2996_c3_dbc5_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l3003_c3_3142_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_555e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3019_c7_7578_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3013_l3021_DUPLICATE_555e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2996_c3_dbc5_return_output;
     VAR_printf_uxn_opcodes_h_l2987_c3_69c6_uxn_opcodes_h_l2987_c3_69c6_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2986_c1_7c60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_7578_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3023_c7_cc55_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_7578_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3023_c7_cc55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3002_c7_695c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_aa92_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3019_c7_7578_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l3008_c21_640d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3008_c21_640d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l3003_c3_3142_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3019_c7_7578] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_7578_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_7578_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_7578_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_7578_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_7578_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_7578_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_7578_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_7578_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l3019_c7_7578] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l3019_c7_7578_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3019_c7_7578_cond;
     result_u8_value_MUX_uxn_opcodes_h_l3019_c7_7578_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3019_c7_7578_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l3019_c7_7578_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3019_c7_7578_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3019_c7_7578_return_output := result_u8_value_MUX_uxn_opcodes_h_l3019_c7_7578_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2999_c7_214f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_214f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_214f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_214f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_214f_return_output;

     -- t16_MUX[uxn_opcodes_h_l3002_c7_695c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3002_c7_695c_cond <= VAR_t16_MUX_uxn_opcodes_h_l3002_c7_695c_cond;
     t16_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue;
     t16_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3002_c7_695c_return_output := t16_MUX_uxn_opcodes_h_l3002_c7_695c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3002_c7_695c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_695c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_695c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_695c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_695c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3015_c7_aa92] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_aa92_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_aa92_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_aa92_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_aa92_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_aa92_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_aa92_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_aa92_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_aa92_return_output;

     -- printf_uxn_opcodes_h_l2987_c3_69c6[uxn_opcodes_h_l2987_c3_69c6] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2987_c3_69c6_uxn_opcodes_h_l2987_c3_69c6_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2987_c3_69c6_uxn_opcodes_h_l2987_c3_69c6_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3019_c7_7578] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_7578_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_7578_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_7578_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_7578_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_7578_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_7578_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_7578_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_7578_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l3008_c21_640d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_aa92_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3019_c7_7578_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3002_c7_695c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_aa92_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3019_c7_7578_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2999_c7_214f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3015_c7_aa92_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_aa92_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l3019_c7_7578_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3002_c7_695c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l3015_c7_aa92] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l3015_c7_aa92_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_aa92_cond;
     result_u8_value_MUX_uxn_opcodes_h_l3015_c7_aa92_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_aa92_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l3015_c7_aa92_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_aa92_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_aa92_return_output := result_u8_value_MUX_uxn_opcodes_h_l3015_c7_aa92_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3010_c7_db8a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_db8a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_db8a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2999_c7_214f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_214f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_214f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_214f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_214f_return_output;

     -- t16_MUX[uxn_opcodes_h_l2999_c7_214f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2999_c7_214f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2999_c7_214f_cond;
     t16_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue;
     t16_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2999_c7_214f_return_output := t16_MUX_uxn_opcodes_h_l2999_c7_214f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2994_c7_5ea6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3015_c7_aa92] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_aa92_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_aa92_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_aa92_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_aa92_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_aa92_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_aa92_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_aa92_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_aa92_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3015_c7_aa92] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_aa92_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_aa92_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_aa92_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_aa92_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_aa92_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_aa92_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_aa92_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_aa92_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3015_c7_aa92_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2999_c7_214f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3015_c7_aa92_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l3015_c7_aa92_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2999_c7_214f_return_output;
     -- t16_MUX[uxn_opcodes_h_l2994_c7_5ea6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond;
     t16_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue;
     t16_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output := t16_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3010_c7_db8a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_db8a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_db8a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2994_c7_5ea6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l3010_c7_db8a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l3010_c7_db8a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3010_c7_db8a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output := result_u8_value_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3002_c7_695c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_695c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_695c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_695c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_695c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2991_c7_c103] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_c103_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_c103_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_c103_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_c103_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3010_c7_db8a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_db8a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_db8a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_db8a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_db8a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2991_c7_c103_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3002_c7_695c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l3010_c7_db8a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3002_c7_695c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_695c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_695c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_695c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_695c_return_output;

     -- t16_MUX[uxn_opcodes_h_l2991_c7_c103] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2991_c7_c103_cond <= VAR_t16_MUX_uxn_opcodes_h_l2991_c7_c103_cond;
     t16_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue;
     t16_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2991_c7_c103_return_output := t16_MUX_uxn_opcodes_h_l2991_c7_c103_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l3002_c7_695c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l3002_c7_695c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_695c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_695c_return_output := result_u8_value_MUX_uxn_opcodes_h_l3002_c7_695c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2991_c7_c103] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_c103_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_c103_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_c103_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_c103_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2986_c2_80e5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2999_c7_214f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_214f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_214f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_214f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_214f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3002_c7_695c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_695c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_695c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_695c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_695c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_695c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_695c_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3002_c7_695c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2991_c7_c103_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3002_c7_695c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2999_c7_214f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l3002_c7_695c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2991_c7_c103_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2994_c7_5ea6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output;

     -- t16_MUX[uxn_opcodes_h_l2986_c2_80e5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2986_c2_80e5_cond <= VAR_t16_MUX_uxn_opcodes_h_l2986_c2_80e5_cond;
     t16_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue;
     t16_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output := t16_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2986_c2_80e5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2999_c7_214f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_214f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_214f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_214f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_214f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2999_c7_214f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_214f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_214f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_214f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_214f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2999_c7_214f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2999_c7_214f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_214f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_214f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_214f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_214f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2999_c7_214f_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2999_c7_214f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2999_c7_214f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2999_c7_214f_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2994_c7_5ea6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2994_c7_5ea6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2991_c7_c103] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_c103_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_c103_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_c103_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_c103_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2994_c7_5ea6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_5ea6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_5ea6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_5ea6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2991_c7_c103_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2994_c7_5ea6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2991_c7_c103] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2991_c7_c103_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c7_c103_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c7_c103_return_output := result_u8_value_MUX_uxn_opcodes_h_l2991_c7_c103_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2991_c7_c103] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_c103_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_c103_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_c103_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_c103_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2986_c2_80e5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_80e5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_80e5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2991_c7_c103] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_c103_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_c103_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_c103_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_c103_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_c103_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_c103_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2991_c7_c103_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2991_c7_c103_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2991_c7_c103_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2986_c2_80e5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_80e5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_80e5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2986_c2_80e5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2986_c2_80e5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2986_c2_80e5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output := result_u8_value_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2986_c2_80e5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_80e5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_80e5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_80e5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_80e5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l3028_l2982_DUPLICATE_7298 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l3028_l2982_DUPLICATE_7298_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8cda(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2986_c2_80e5_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l3028_l2982_DUPLICATE_7298_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l3028_l2982_DUPLICATE_7298_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
