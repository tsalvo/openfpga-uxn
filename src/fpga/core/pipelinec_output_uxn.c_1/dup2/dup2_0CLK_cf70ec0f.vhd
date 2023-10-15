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
-- Submodules: 74
entity dup2_0CLK_cf70ec0f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dup2_0CLK_cf70ec0f;
architecture arch of dup2_0CLK_cf70ec0f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l3068_c6_2638]
signal BIN_OP_EQ_uxn_opcodes_h_l3068_c6_2638_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3068_c6_2638_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3068_c6_2638_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3068_c2_4cd6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3068_c2_4cd6]
signal result_stack_value_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3068_c2_4cd6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3068_c2_4cd6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3068_c2_4cd6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3068_c2_4cd6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3068_c2_4cd6]
signal t16_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3073_c11_f988]
signal BIN_OP_EQ_uxn_opcodes_h_l3073_c11_f988_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3073_c11_f988_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3073_c11_f988_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3073_c7_2922]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_2922_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_2922_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3073_c7_2922]
signal result_stack_value_MUX_uxn_opcodes_h_l3073_c7_2922_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3073_c7_2922_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3073_c7_2922]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_2922_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_2922_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3073_c7_2922]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_2922_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_2922_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3073_c7_2922]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_2922_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_2922_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3073_c7_2922]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_2922_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_2922_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3073_c7_2922]
signal t16_MUX_uxn_opcodes_h_l3073_c7_2922_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3073_c7_2922_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3076_c11_fe08]
signal BIN_OP_EQ_uxn_opcodes_h_l3076_c11_fe08_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3076_c11_fe08_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3076_c11_fe08_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3076_c7_9818]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_9818_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_9818_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3076_c7_9818]
signal result_stack_value_MUX_uxn_opcodes_h_l3076_c7_9818_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3076_c7_9818_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3076_c7_9818]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_9818_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_9818_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3076_c7_9818]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_9818_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_9818_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3076_c7_9818]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_9818_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_9818_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3076_c7_9818]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_9818_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_9818_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3076_c7_9818]
signal t16_MUX_uxn_opcodes_h_l3076_c7_9818_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3076_c7_9818_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l3078_c3_2efb]
signal CONST_SL_8_uxn_opcodes_h_l3078_c3_2efb_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l3078_c3_2efb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3081_c11_a8d5]
signal BIN_OP_EQ_uxn_opcodes_h_l3081_c11_a8d5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3081_c11_a8d5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3081_c11_a8d5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3081_c7_690f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_690f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_690f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3081_c7_690f]
signal result_stack_value_MUX_uxn_opcodes_h_l3081_c7_690f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3081_c7_690f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3081_c7_690f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_690f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_690f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3081_c7_690f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_690f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_690f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3081_c7_690f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_690f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_690f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3081_c7_690f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_690f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_690f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3081_c7_690f]
signal t16_MUX_uxn_opcodes_h_l3081_c7_690f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3081_c7_690f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3084_c11_e26e]
signal BIN_OP_EQ_uxn_opcodes_h_l3084_c11_e26e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3084_c11_e26e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3084_c11_e26e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3084_c7_014e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_014e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_014e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3084_c7_014e]
signal result_stack_value_MUX_uxn_opcodes_h_l3084_c7_014e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3084_c7_014e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3084_c7_014e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_014e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_014e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3084_c7_014e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_014e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_014e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3084_c7_014e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_014e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_014e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3084_c7_014e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_014e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_014e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3084_c7_014e]
signal t16_MUX_uxn_opcodes_h_l3084_c7_014e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3084_c7_014e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l3085_c3_630b]
signal BIN_OP_OR_uxn_opcodes_h_l3085_c3_630b_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3085_c3_630b_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3085_c3_630b_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3087_c32_1e06]
signal BIN_OP_AND_uxn_opcodes_h_l3087_c32_1e06_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3087_c32_1e06_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3087_c32_1e06_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3087_c32_09a4]
signal BIN_OP_GT_uxn_opcodes_h_l3087_c32_09a4_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3087_c32_09a4_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3087_c32_09a4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l3087_c32_4a1a]
signal MUX_uxn_opcodes_h_l3087_c32_4a1a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3087_c32_4a1a_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l3087_c32_4a1a_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l3087_c32_4a1a_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3089_c11_7b82]
signal BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7b82_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7b82_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7b82_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3089_c7_d31c]
signal result_stack_value_MUX_uxn_opcodes_h_l3089_c7_d31c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3089_c7_d31c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_d31c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3089_c7_d31c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_d31c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3089_c7_d31c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_d31c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3089_c7_d31c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_d31c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3095_c11_c368]
signal BIN_OP_EQ_uxn_opcodes_h_l3095_c11_c368_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3095_c11_c368_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3095_c11_c368_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3095_c7_345f]
signal result_stack_value_MUX_uxn_opcodes_h_l3095_c7_345f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3095_c7_345f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3095_c7_345f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3095_c7_345f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3095_c7_345f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_345f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_345f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_345f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_345f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3095_c7_345f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_345f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_345f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_345f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_345f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3095_c7_345f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_345f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_345f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_345f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_345f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3099_c11_6b9a]
signal BIN_OP_EQ_uxn_opcodes_h_l3099_c11_6b9a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3099_c11_6b9a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3099_c11_6b9a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3099_c7_9431]
signal result_stack_value_MUX_uxn_opcodes_h_l3099_c7_9431_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3099_c7_9431_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3099_c7_9431_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3099_c7_9431_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3099_c7_9431]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_9431_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_9431_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_9431_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_9431_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3099_c7_9431]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_9431_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_9431_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_9431_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_9431_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3099_c7_9431]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_9431_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_9431_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_9431_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_9431_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3103_c11_ea31]
signal BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ea31_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ea31_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ea31_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3103_c7_ef28]
signal result_stack_value_MUX_uxn_opcodes_h_l3103_c7_ef28_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3103_c7_ef28_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3103_c7_ef28_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3103_c7_ef28_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3103_c7_ef28]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_ef28_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_ef28_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_ef28_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_ef28_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3103_c7_ef28]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_ef28_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_ef28_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_ef28_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_ef28_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3103_c7_ef28]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_ef28_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_ef28_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_ef28_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_ef28_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3107_c11_f55d]
signal BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f55d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f55d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f55d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3107_c7_6519]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_6519_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_6519_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_6519_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_6519_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3107_c7_6519]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_6519_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_6519_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_6519_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_6519_return_output : unsigned(0 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l3097_l3105_DUPLICATE_d7a3
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l3097_l3105_DUPLICATE_d7a3_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l3097_l3105_DUPLICATE_d7a3_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
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
-- BIN_OP_EQ_uxn_opcodes_h_l3068_c6_2638
BIN_OP_EQ_uxn_opcodes_h_l3068_c6_2638 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3068_c6_2638_left,
BIN_OP_EQ_uxn_opcodes_h_l3068_c6_2638_right,
BIN_OP_EQ_uxn_opcodes_h_l3068_c6_2638_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6
result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3068_c2_4cd6
result_stack_value_MUX_uxn_opcodes_h_l3068_c2_4cd6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond,
result_stack_value_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_4cd6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_4cd6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6
result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_4cd6
result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_4cd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_4cd6
result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_4cd6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output);

-- t16_MUX_uxn_opcodes_h_l3068_c2_4cd6
t16_MUX_uxn_opcodes_h_l3068_c2_4cd6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond,
t16_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue,
t16_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse,
t16_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3073_c11_f988
BIN_OP_EQ_uxn_opcodes_h_l3073_c11_f988 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3073_c11_f988_left,
BIN_OP_EQ_uxn_opcodes_h_l3073_c11_f988_right,
BIN_OP_EQ_uxn_opcodes_h_l3073_c11_f988_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_2922
result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_2922 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_2922_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_2922_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3073_c7_2922
result_stack_value_MUX_uxn_opcodes_h_l3073_c7_2922 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3073_c7_2922_cond,
result_stack_value_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3073_c7_2922_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_2922
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_2922 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_2922_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_2922_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_2922
result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_2922 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_2922_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_2922_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_2922
result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_2922 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_2922_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_2922_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_2922
result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_2922 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_2922_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_2922_return_output);

-- t16_MUX_uxn_opcodes_h_l3073_c7_2922
t16_MUX_uxn_opcodes_h_l3073_c7_2922 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3073_c7_2922_cond,
t16_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue,
t16_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse,
t16_MUX_uxn_opcodes_h_l3073_c7_2922_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3076_c11_fe08
BIN_OP_EQ_uxn_opcodes_h_l3076_c11_fe08 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3076_c11_fe08_left,
BIN_OP_EQ_uxn_opcodes_h_l3076_c11_fe08_right,
BIN_OP_EQ_uxn_opcodes_h_l3076_c11_fe08_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_9818
result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_9818 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_9818_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_9818_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3076_c7_9818
result_stack_value_MUX_uxn_opcodes_h_l3076_c7_9818 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3076_c7_9818_cond,
result_stack_value_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3076_c7_9818_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_9818
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_9818 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_9818_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_9818_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_9818
result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_9818 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_9818_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_9818_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_9818
result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_9818 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_9818_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_9818_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_9818
result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_9818 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_9818_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_9818_return_output);

-- t16_MUX_uxn_opcodes_h_l3076_c7_9818
t16_MUX_uxn_opcodes_h_l3076_c7_9818 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3076_c7_9818_cond,
t16_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue,
t16_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse,
t16_MUX_uxn_opcodes_h_l3076_c7_9818_return_output);

-- CONST_SL_8_uxn_opcodes_h_l3078_c3_2efb
CONST_SL_8_uxn_opcodes_h_l3078_c3_2efb : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l3078_c3_2efb_x,
CONST_SL_8_uxn_opcodes_h_l3078_c3_2efb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3081_c11_a8d5
BIN_OP_EQ_uxn_opcodes_h_l3081_c11_a8d5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3081_c11_a8d5_left,
BIN_OP_EQ_uxn_opcodes_h_l3081_c11_a8d5_right,
BIN_OP_EQ_uxn_opcodes_h_l3081_c11_a8d5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_690f
result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_690f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_690f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_690f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3081_c7_690f
result_stack_value_MUX_uxn_opcodes_h_l3081_c7_690f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3081_c7_690f_cond,
result_stack_value_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3081_c7_690f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_690f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_690f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_690f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_690f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_690f
result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_690f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_690f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_690f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_690f
result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_690f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_690f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_690f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_690f
result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_690f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_690f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_690f_return_output);

-- t16_MUX_uxn_opcodes_h_l3081_c7_690f
t16_MUX_uxn_opcodes_h_l3081_c7_690f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3081_c7_690f_cond,
t16_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue,
t16_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse,
t16_MUX_uxn_opcodes_h_l3081_c7_690f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3084_c11_e26e
BIN_OP_EQ_uxn_opcodes_h_l3084_c11_e26e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3084_c11_e26e_left,
BIN_OP_EQ_uxn_opcodes_h_l3084_c11_e26e_right,
BIN_OP_EQ_uxn_opcodes_h_l3084_c11_e26e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_014e
result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_014e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_014e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_014e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3084_c7_014e
result_stack_value_MUX_uxn_opcodes_h_l3084_c7_014e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3084_c7_014e_cond,
result_stack_value_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3084_c7_014e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_014e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_014e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_014e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_014e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_014e
result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_014e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_014e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_014e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_014e
result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_014e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_014e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_014e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_014e
result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_014e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_014e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_014e_return_output);

-- t16_MUX_uxn_opcodes_h_l3084_c7_014e
t16_MUX_uxn_opcodes_h_l3084_c7_014e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3084_c7_014e_cond,
t16_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue,
t16_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse,
t16_MUX_uxn_opcodes_h_l3084_c7_014e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l3085_c3_630b
BIN_OP_OR_uxn_opcodes_h_l3085_c3_630b : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l3085_c3_630b_left,
BIN_OP_OR_uxn_opcodes_h_l3085_c3_630b_right,
BIN_OP_OR_uxn_opcodes_h_l3085_c3_630b_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3087_c32_1e06
BIN_OP_AND_uxn_opcodes_h_l3087_c32_1e06 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3087_c32_1e06_left,
BIN_OP_AND_uxn_opcodes_h_l3087_c32_1e06_right,
BIN_OP_AND_uxn_opcodes_h_l3087_c32_1e06_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3087_c32_09a4
BIN_OP_GT_uxn_opcodes_h_l3087_c32_09a4 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3087_c32_09a4_left,
BIN_OP_GT_uxn_opcodes_h_l3087_c32_09a4_right,
BIN_OP_GT_uxn_opcodes_h_l3087_c32_09a4_return_output);

-- MUX_uxn_opcodes_h_l3087_c32_4a1a
MUX_uxn_opcodes_h_l3087_c32_4a1a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3087_c32_4a1a_cond,
MUX_uxn_opcodes_h_l3087_c32_4a1a_iftrue,
MUX_uxn_opcodes_h_l3087_c32_4a1a_iffalse,
MUX_uxn_opcodes_h_l3087_c32_4a1a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7b82
BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7b82 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7b82_left,
BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7b82_right,
BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7b82_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3089_c7_d31c
result_stack_value_MUX_uxn_opcodes_h_l3089_c7_d31c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3089_c7_d31c_cond,
result_stack_value_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_d31c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_d31c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_d31c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_d31c
result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_d31c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_d31c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_d31c
result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_d31c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_d31c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_d31c
result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_d31c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_d31c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3095_c11_c368
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_c368 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_c368_left,
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_c368_right,
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_c368_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3095_c7_345f
result_stack_value_MUX_uxn_opcodes_h_l3095_c7_345f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3095_c7_345f_cond,
result_stack_value_MUX_uxn_opcodes_h_l3095_c7_345f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3095_c7_345f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3095_c7_345f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_345f
result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_345f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_345f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_345f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_345f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_345f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_345f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_345f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_345f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_345f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_345f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_345f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_345f
result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_345f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_345f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_345f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_345f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_345f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3099_c11_6b9a
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_6b9a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_6b9a_left,
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_6b9a_right,
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_6b9a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3099_c7_9431
result_stack_value_MUX_uxn_opcodes_h_l3099_c7_9431 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3099_c7_9431_cond,
result_stack_value_MUX_uxn_opcodes_h_l3099_c7_9431_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3099_c7_9431_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3099_c7_9431_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_9431
result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_9431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_9431_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_9431_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_9431_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_9431_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_9431
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_9431 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_9431_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_9431_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_9431_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_9431_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_9431
result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_9431 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_9431_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_9431_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_9431_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_9431_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ea31
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ea31 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ea31_left,
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ea31_right,
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ea31_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3103_c7_ef28
result_stack_value_MUX_uxn_opcodes_h_l3103_c7_ef28 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3103_c7_ef28_cond,
result_stack_value_MUX_uxn_opcodes_h_l3103_c7_ef28_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3103_c7_ef28_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3103_c7_ef28_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_ef28
result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_ef28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_ef28_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_ef28_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_ef28_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_ef28_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_ef28
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_ef28 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_ef28_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_ef28_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_ef28_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_ef28_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_ef28
result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_ef28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_ef28_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_ef28_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_ef28_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_ef28_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f55d
BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f55d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f55d_left,
BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f55d_right,
BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f55d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_6519
result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_6519 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_6519_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_6519_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_6519_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_6519_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_6519
result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_6519 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_6519_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_6519_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_6519_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_6519_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l3097_l3105_DUPLICATE_d7a3
CONST_SR_8_uint16_t_uxn_opcodes_h_l3097_l3105_DUPLICATE_d7a3 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l3097_l3105_DUPLICATE_d7a3_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l3097_l3105_DUPLICATE_d7a3_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l3068_c6_2638_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output,
 t16_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3073_c11_f988_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_2922_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3073_c7_2922_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_2922_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_2922_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_2922_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_2922_return_output,
 t16_MUX_uxn_opcodes_h_l3073_c7_2922_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3076_c11_fe08_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_9818_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3076_c7_9818_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_9818_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_9818_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_9818_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_9818_return_output,
 t16_MUX_uxn_opcodes_h_l3076_c7_9818_return_output,
 CONST_SL_8_uxn_opcodes_h_l3078_c3_2efb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3081_c11_a8d5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_690f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3081_c7_690f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_690f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_690f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_690f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_690f_return_output,
 t16_MUX_uxn_opcodes_h_l3081_c7_690f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3084_c11_e26e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_014e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3084_c7_014e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_014e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_014e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_014e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_014e_return_output,
 t16_MUX_uxn_opcodes_h_l3084_c7_014e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l3085_c3_630b_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3087_c32_1e06_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3087_c32_09a4_return_output,
 MUX_uxn_opcodes_h_l3087_c32_4a1a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7b82_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3095_c11_c368_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3095_c7_345f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_345f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_345f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_345f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3099_c11_6b9a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3099_c7_9431_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_9431_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_9431_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_9431_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ea31_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3103_c7_ef28_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_ef28_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_ef28_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_ef28_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f55d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_6519_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_6519_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l3097_l3105_DUPLICATE_d7a3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_2638_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_2638_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_2638_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_2922_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3073_c7_2922_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3070_c3_98c6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_2922_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_2922_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_2922_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_2922_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3073_c7_2922_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_f988_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_f988_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_f988_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_9818_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_2922_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_9818_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3073_c7_2922_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3074_c3_142a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_9818_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_2922_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_9818_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_2922_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_9818_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_2922_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_9818_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_2922_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3076_c7_9818_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3073_c7_2922_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_fe08_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_fe08_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_fe08_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_690f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_9818_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3081_c7_690f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_9818_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3079_c3_b3b8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_690f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_9818_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_690f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_9818_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_690f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_9818_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_690f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_9818_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3081_c7_690f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3076_c7_9818_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l3078_c3_2efb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l3078_c3_2efb_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_a8d5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_a8d5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_a8d5_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_014e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_690f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3084_c7_014e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3081_c7_690f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3082_c3_b607 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_014e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_690f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_014e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_690f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_014e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_690f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_014e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_690f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3084_c7_014e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3081_c7_690f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_e26e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_e26e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_e26e_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_014e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3084_c7_014e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_014e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_014e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_014e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_014e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3084_c7_014e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3085_c3_630b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3085_c3_630b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3085_c3_630b_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3087_c32_4a1a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3087_c32_4a1a_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3087_c32_4a1a_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3087_c32_1e06_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3087_c32_1e06_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3087_c32_1e06_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3087_c32_09a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3087_c32_09a4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3087_c32_09a4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3087_c32_4a1a_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7b82_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7b82_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7b82_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_345f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3089_c7_d31c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3092_c3_5c88 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_345f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_d31c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_d31c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_345f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_d31c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_345f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_d31c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_c368_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_c368_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_c368_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_345f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_345f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_9431_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_345f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_345f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_345f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_9431_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_345f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_345f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3096_c3_ae0a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_345f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_9431_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_345f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_345f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_345f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_9431_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_345f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_6b9a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_6b9a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_6b9a_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_9431_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_9431_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_ef28_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_9431_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_9431_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_9431_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_ef28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_9431_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_9431_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3100_c3_6ca2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_9431_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_ef28_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_9431_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_9431_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_9431_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_ef28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_9431_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ea31_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ea31_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ea31_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_ef28_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_ef28_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_ef28_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_ef28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_ef28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_6519_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_ef28_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_ef28_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3104_c3_9b4a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_ef28_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_ef28_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_ef28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_ef28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_6519_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_ef28_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f55d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f55d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f55d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_6519_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_6519_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_6519_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_6519_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_6519_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_6519_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3084_l3081_l3076_l3073_l3068_DUPLICATE_6144_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3084_l3081_l3076_l3103_l3073_l3068_DUPLICATE_ee44_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3081_l3076_l3073_l3068_l3089_DUPLICATE_b19a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3084_l3081_l3107_l3076_l3103_l3073_l3099_l3068_l3095_DUPLICATE_8c0b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3084_l3081_l3107_l3076_l3103_l3073_l3099_l3095_l3089_DUPLICATE_1459_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3077_l3085_DUPLICATE_812f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3084_l3103_DUPLICATE_4833_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3101_l3093_DUPLICATE_f60f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3097_l3105_DUPLICATE_d7a3_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3097_l3105_DUPLICATE_d7a3_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3097_l3105_DUPLICATE_9333_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l3112_l3064_DUPLICATE_85d1_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3079_c3_b3b8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3079_c3_b3b8;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_6b9a_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_fe08_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ea31_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l3087_c32_4a1a_iffalse := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3092_c3_5c88 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3092_c3_5c88;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f55d_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_c368_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3074_c3_142a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3074_c3_142a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_e26e_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3096_c3_ae0a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_345f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3096_c3_ae0a;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_6519_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3087_c32_09a4_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3104_c3_9b4a := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_ef28_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3104_c3_9b4a;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3087_c32_1e06_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_6519_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_2638_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_a8d5_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l3087_c32_4a1a_iftrue := signed(std_logic_vector(resize(to_unsigned(4, 3), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3082_c3_b607 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3082_c3_b607;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7b82_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3070_c3_98c6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3070_c3_98c6;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3100_c3_6ca2 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_9431_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3100_c3_6ca2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_f988_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue := to_unsigned(0, 1);

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
     VAR_BIN_OP_AND_uxn_opcodes_h_l3087_c32_1e06_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_2638_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_f988_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_fe08_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_a8d5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_e26e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7b82_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_c368_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_6b9a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ea31_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f55d_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3085_c3_630b_left := t16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3097_l3105_DUPLICATE_d7a3_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse := t16;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3077_l3085_DUPLICATE_812f LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3077_l3085_DUPLICATE_812f_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l3099_c11_6b9a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3099_c11_6b9a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_6b9a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3099_c11_6b9a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_6b9a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_6b9a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3099_c11_6b9a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3107_c11_f55d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f55d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f55d_left;
     BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f55d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f55d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f55d_return_output := BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f55d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3076_c11_fe08] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3076_c11_fe08_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_fe08_left;
     BIN_OP_EQ_uxn_opcodes_h_l3076_c11_fe08_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_fe08_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_fe08_return_output := BIN_OP_EQ_uxn_opcodes_h_l3076_c11_fe08_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3084_l3081_l3107_l3076_l3103_l3073_l3099_l3095_l3089_DUPLICATE_1459 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3084_l3081_l3107_l3076_l3103_l3073_l3099_l3095_l3089_DUPLICATE_1459_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3084_l3081_l3076_l3103_l3073_l3068_DUPLICATE_ee44 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3084_l3081_l3076_l3103_l3073_l3068_DUPLICATE_ee44_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l3081_c11_a8d5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3081_c11_a8d5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_a8d5_left;
     BIN_OP_EQ_uxn_opcodes_h_l3081_c11_a8d5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_a8d5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_a8d5_return_output := BIN_OP_EQ_uxn_opcodes_h_l3081_c11_a8d5_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3101_l3093_DUPLICATE_f60f LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3101_l3093_DUPLICATE_f60f_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3081_l3076_l3073_l3068_l3089_DUPLICATE_b19a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3081_l3076_l3073_l3068_l3089_DUPLICATE_b19a_return_output := result.is_sp_shift;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l3097_l3105_DUPLICATE_d7a3 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l3097_l3105_DUPLICATE_d7a3_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3097_l3105_DUPLICATE_d7a3_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3097_l3105_DUPLICATE_d7a3_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l3097_l3105_DUPLICATE_d7a3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3084_c11_e26e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3084_c11_e26e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_e26e_left;
     BIN_OP_EQ_uxn_opcodes_h_l3084_c11_e26e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_e26e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_e26e_return_output := BIN_OP_EQ_uxn_opcodes_h_l3084_c11_e26e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3084_l3103_DUPLICATE_4833 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3084_l3103_DUPLICATE_4833_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l3089_c11_7b82] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7b82_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7b82_left;
     BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7b82_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7b82_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7b82_return_output := BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7b82_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3095_c11_c368] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3095_c11_c368_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_c368_left;
     BIN_OP_EQ_uxn_opcodes_h_l3095_c11_c368_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_c368_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_c368_return_output := BIN_OP_EQ_uxn_opcodes_h_l3095_c11_c368_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3103_c11_ea31] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ea31_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ea31_left;
     BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ea31_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ea31_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ea31_return_output := BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ea31_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3073_c11_f988] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3073_c11_f988_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_f988_left;
     BIN_OP_EQ_uxn_opcodes_h_l3073_c11_f988_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_f988_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_f988_return_output := BIN_OP_EQ_uxn_opcodes_h_l3073_c11_f988_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l3087_c32_1e06] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3087_c32_1e06_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3087_c32_1e06_left;
     BIN_OP_AND_uxn_opcodes_h_l3087_c32_1e06_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3087_c32_1e06_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3087_c32_1e06_return_output := BIN_OP_AND_uxn_opcodes_h_l3087_c32_1e06_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3084_l3081_l3107_l3076_l3103_l3073_l3099_l3068_l3095_DUPLICATE_8c0b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3084_l3081_l3107_l3076_l3103_l3073_l3099_l3068_l3095_DUPLICATE_8c0b_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l3068_c6_2638] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3068_c6_2638_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_2638_left;
     BIN_OP_EQ_uxn_opcodes_h_l3068_c6_2638_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_2638_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_2638_return_output := BIN_OP_EQ_uxn_opcodes_h_l3068_c6_2638_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3084_l3081_l3076_l3073_l3068_DUPLICATE_6144 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3084_l3081_l3076_l3073_l3068_DUPLICATE_6144_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l3087_c32_09a4_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3087_c32_1e06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_2638_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_2638_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_2638_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_2638_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_2638_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_2638_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_2638_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_2922_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_f988_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_2922_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_f988_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_2922_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_f988_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_2922_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_f988_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_2922_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_f988_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3073_c7_2922_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_f988_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3073_c7_2922_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_f988_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_9818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_fe08_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_9818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_fe08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_9818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_fe08_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_9818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_fe08_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_9818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_fe08_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_9818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_fe08_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3076_c7_9818_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_fe08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_690f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_a8d5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_690f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_a8d5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_690f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_a8d5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_690f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_a8d5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_690f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_a8d5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3081_c7_690f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_a8d5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3081_c7_690f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_a8d5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_014e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_e26e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_014e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_e26e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_014e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_e26e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_014e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_e26e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_014e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_e26e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3084_c7_014e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_e26e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3084_c7_014e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_e26e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_d31c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7b82_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_d31c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7b82_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_d31c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7b82_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_d31c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7b82_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3089_c7_d31c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7b82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_345f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_c368_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_345f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_c368_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_345f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_c368_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_345f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_c368_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_9431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_6b9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_9431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_6b9a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_9431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_6b9a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_9431_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_6b9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_ef28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ea31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_ef28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ea31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_ef28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ea31_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_ef28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_ea31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_6519_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f55d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_6519_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_f55d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3085_c3_630b_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3077_l3085_DUPLICATE_812f_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l3078_c3_2efb_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3077_l3085_DUPLICATE_812f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3101_l3093_DUPLICATE_f60f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_9431_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3101_l3093_DUPLICATE_f60f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3084_l3081_l3076_l3073_l3068_DUPLICATE_6144_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3084_l3081_l3076_l3073_l3068_DUPLICATE_6144_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3084_l3081_l3076_l3073_l3068_DUPLICATE_6144_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3084_l3081_l3076_l3073_l3068_DUPLICATE_6144_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3084_l3081_l3076_l3073_l3068_DUPLICATE_6144_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3084_l3081_l3107_l3076_l3103_l3073_l3099_l3095_l3089_DUPLICATE_1459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3084_l3081_l3107_l3076_l3103_l3073_l3099_l3095_l3089_DUPLICATE_1459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3084_l3081_l3107_l3076_l3103_l3073_l3099_l3095_l3089_DUPLICATE_1459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3084_l3081_l3107_l3076_l3103_l3073_l3099_l3095_l3089_DUPLICATE_1459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3084_l3081_l3107_l3076_l3103_l3073_l3099_l3095_l3089_DUPLICATE_1459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_345f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3084_l3081_l3107_l3076_l3103_l3073_l3099_l3095_l3089_DUPLICATE_1459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_9431_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3084_l3081_l3107_l3076_l3103_l3073_l3099_l3095_l3089_DUPLICATE_1459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_ef28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3084_l3081_l3107_l3076_l3103_l3073_l3099_l3095_l3089_DUPLICATE_1459_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_6519_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3084_l3081_l3107_l3076_l3103_l3073_l3099_l3095_l3089_DUPLICATE_1459_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3081_l3076_l3073_l3068_l3089_DUPLICATE_b19a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3081_l3076_l3073_l3068_l3089_DUPLICATE_b19a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3081_l3076_l3073_l3068_l3089_DUPLICATE_b19a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3081_l3076_l3073_l3068_l3089_DUPLICATE_b19a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3081_l3076_l3073_l3068_l3089_DUPLICATE_b19a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3084_l3081_l3107_l3076_l3103_l3073_l3099_l3068_l3095_DUPLICATE_8c0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3084_l3081_l3107_l3076_l3103_l3073_l3099_l3068_l3095_DUPLICATE_8c0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3084_l3081_l3107_l3076_l3103_l3073_l3099_l3068_l3095_DUPLICATE_8c0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3084_l3081_l3107_l3076_l3103_l3073_l3099_l3068_l3095_DUPLICATE_8c0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3084_l3081_l3107_l3076_l3103_l3073_l3099_l3068_l3095_DUPLICATE_8c0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_345f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3084_l3081_l3107_l3076_l3103_l3073_l3099_l3068_l3095_DUPLICATE_8c0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_9431_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3084_l3081_l3107_l3076_l3103_l3073_l3099_l3068_l3095_DUPLICATE_8c0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_ef28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3084_l3081_l3107_l3076_l3103_l3073_l3099_l3068_l3095_DUPLICATE_8c0b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_6519_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3084_l3081_l3107_l3076_l3103_l3073_l3099_l3068_l3095_DUPLICATE_8c0b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3084_l3103_DUPLICATE_4833_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_ef28_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3084_l3103_DUPLICATE_4833_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3084_l3081_l3076_l3103_l3073_l3068_DUPLICATE_ee44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3084_l3081_l3076_l3103_l3073_l3068_DUPLICATE_ee44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3084_l3081_l3076_l3103_l3073_l3068_DUPLICATE_ee44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3084_l3081_l3076_l3103_l3073_l3068_DUPLICATE_ee44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3084_l3081_l3076_l3103_l3073_l3068_DUPLICATE_ee44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_ef28_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3084_l3081_l3076_l3103_l3073_l3068_DUPLICATE_ee44_return_output;
     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3097_l3105_DUPLICATE_9333 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3097_l3105_DUPLICATE_9333_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3097_l3105_DUPLICATE_d7a3_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3089_c7_d31c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_d31c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_d31c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3107_c7_6519] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_6519_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_6519_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_6519_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_6519_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_6519_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_6519_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_6519_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_6519_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l3085_c3_630b] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l3085_c3_630b_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l3085_c3_630b_left;
     BIN_OP_OR_uxn_opcodes_h_l3085_c3_630b_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l3085_c3_630b_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l3085_c3_630b_return_output := BIN_OP_OR_uxn_opcodes_h_l3085_c3_630b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3103_c7_ef28] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_ef28_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_ef28_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_ef28_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_ef28_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_ef28_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_ef28_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_ef28_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_ef28_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l3078_c3_2efb] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l3078_c3_2efb_x <= VAR_CONST_SL_8_uxn_opcodes_h_l3078_c3_2efb_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l3078_c3_2efb_return_output := CONST_SL_8_uxn_opcodes_h_l3078_c3_2efb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3107_c7_6519] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_6519_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_6519_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_6519_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_6519_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_6519_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_6519_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_6519_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_6519_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l3087_c32_09a4] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3087_c32_09a4_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3087_c32_09a4_left;
     BIN_OP_GT_uxn_opcodes_h_l3087_c32_09a4_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3087_c32_09a4_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3087_c32_09a4_return_output := BIN_OP_GT_uxn_opcodes_h_l3087_c32_09a4_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l3087_c32_4a1a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3087_c32_09a4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l3085_c3_630b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_345f_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3097_l3105_DUPLICATE_9333_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_ef28_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3097_l3105_DUPLICATE_9333_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l3078_c3_2efb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_ef28_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_6519_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_ef28_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_6519_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_9431_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_ef28_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l3103_c7_ef28] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3103_c7_ef28_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_ef28_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3103_c7_ef28_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_ef28_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3103_c7_ef28_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_ef28_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_ef28_return_output := result_stack_value_MUX_uxn_opcodes_h_l3103_c7_ef28_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3103_c7_ef28] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_ef28_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_ef28_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_ef28_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_ef28_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_ef28_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_ef28_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_ef28_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_ef28_return_output;

     -- MUX[uxn_opcodes_h_l3087_c32_4a1a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3087_c32_4a1a_cond <= VAR_MUX_uxn_opcodes_h_l3087_c32_4a1a_cond;
     MUX_uxn_opcodes_h_l3087_c32_4a1a_iftrue <= VAR_MUX_uxn_opcodes_h_l3087_c32_4a1a_iftrue;
     MUX_uxn_opcodes_h_l3087_c32_4a1a_iffalse <= VAR_MUX_uxn_opcodes_h_l3087_c32_4a1a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3087_c32_4a1a_return_output := MUX_uxn_opcodes_h_l3087_c32_4a1a_return_output;

     -- t16_MUX[uxn_opcodes_h_l3084_c7_014e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3084_c7_014e_cond <= VAR_t16_MUX_uxn_opcodes_h_l3084_c7_014e_cond;
     t16_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue;
     t16_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3084_c7_014e_return_output := t16_MUX_uxn_opcodes_h_l3084_c7_014e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3084_c7_014e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_014e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_014e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_014e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_014e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3103_c7_ef28] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_ef28_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_ef28_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_ef28_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_ef28_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_ef28_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_ef28_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_ef28_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_ef28_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3099_c7_9431] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_9431_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_9431_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_9431_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_9431_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_9431_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_9431_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_9431_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_9431_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue := VAR_MUX_uxn_opcodes_h_l3087_c32_4a1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_9431_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_ef28_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_014e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_9431_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_ef28_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_345f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_9431_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_9431_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_ef28_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3084_c7_014e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3099_c7_9431] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_9431_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_9431_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_9431_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_9431_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_9431_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_9431_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_9431_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_9431_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3099_c7_9431] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_9431_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_9431_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_9431_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_9431_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_9431_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_9431_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_9431_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_9431_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3081_c7_690f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_690f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_690f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_690f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_690f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3084_c7_014e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_014e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_014e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_014e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_014e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3095_c7_345f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_345f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_345f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_345f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_345f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_345f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_345f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_345f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_345f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3099_c7_9431] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3099_c7_9431_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_9431_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3099_c7_9431_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_9431_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3099_c7_9431_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_9431_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_9431_return_output := result_stack_value_MUX_uxn_opcodes_h_l3099_c7_9431_return_output;

     -- t16_MUX[uxn_opcodes_h_l3081_c7_690f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3081_c7_690f_cond <= VAR_t16_MUX_uxn_opcodes_h_l3081_c7_690f_cond;
     t16_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue;
     t16_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3081_c7_690f_return_output := t16_MUX_uxn_opcodes_h_l3081_c7_690f_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_345f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_9431_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_690f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_345f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_9431_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_014e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_345f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_345f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_9431_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3081_c7_690f_return_output;
     -- t16_MUX[uxn_opcodes_h_l3076_c7_9818] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3076_c7_9818_cond <= VAR_t16_MUX_uxn_opcodes_h_l3076_c7_9818_cond;
     t16_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue;
     t16_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3076_c7_9818_return_output := t16_MUX_uxn_opcodes_h_l3076_c7_9818_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3095_c7_345f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_345f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_345f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_345f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_345f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_345f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_345f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_345f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_345f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3081_c7_690f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_690f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_690f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_690f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_690f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3095_c7_345f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_345f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_345f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_345f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_345f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_345f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_345f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_345f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_345f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3076_c7_9818] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_9818_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_9818_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_9818_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_9818_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3095_c7_345f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3095_c7_345f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_345f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3095_c7_345f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_345f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3095_c7_345f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_345f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_345f_return_output := result_stack_value_MUX_uxn_opcodes_h_l3095_c7_345f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3089_c7_d31c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_d31c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_d31c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_345f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_9818_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_345f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_690f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_345f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3076_c7_9818_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3084_c7_014e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_014e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_014e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_014e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_014e_return_output;

     -- t16_MUX[uxn_opcodes_h_l3073_c7_2922] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3073_c7_2922_cond <= VAR_t16_MUX_uxn_opcodes_h_l3073_c7_2922_cond;
     t16_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue;
     t16_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3073_c7_2922_return_output := t16_MUX_uxn_opcodes_h_l3073_c7_2922_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3089_c7_d31c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_d31c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_d31c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3089_c7_d31c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_d31c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_d31c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3089_c7_d31c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3089_c7_d31c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3089_c7_d31c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3089_c7_d31c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3089_c7_d31c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output := result_stack_value_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3076_c7_9818] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_9818_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_9818_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_9818_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_9818_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3073_c7_2922] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_2922_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_2922_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_2922_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_2922_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_2922_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_9818_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_014e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3089_c7_d31c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3073_c7_2922_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l3084_c7_014e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3084_c7_014e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3084_c7_014e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3084_c7_014e_return_output := result_stack_value_MUX_uxn_opcodes_h_l3084_c7_014e_return_output;

     -- t16_MUX[uxn_opcodes_h_l3068_c2_4cd6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond <= VAR_t16_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond;
     t16_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue;
     t16_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output := t16_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3068_c2_4cd6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3084_c7_014e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_014e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_014e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_014e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_014e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3081_c7_690f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_690f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_690f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_690f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_690f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3084_c7_014e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_014e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_014e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_014e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_014e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_014e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_014e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3073_c7_2922] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_2922_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_2922_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_2922_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_2922_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_014e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_014e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_2922_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_690f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3084_c7_014e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3081_c7_690f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_690f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_690f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_690f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_690f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3081_c7_690f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_690f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_690f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_690f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_690f_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3081_c7_690f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3081_c7_690f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3081_c7_690f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3081_c7_690f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3081_c7_690f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3081_c7_690f_return_output := result_stack_value_MUX_uxn_opcodes_h_l3081_c7_690f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3068_c2_4cd6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3076_c7_9818] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_9818_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_9818_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_9818_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_9818_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_690f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_690f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_9818_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3081_c7_690f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3073_c7_2922] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_2922_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_2922_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_2922_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_2922_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3076_c7_9818] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3076_c7_9818_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_9818_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_9818_return_output := result_stack_value_MUX_uxn_opcodes_h_l3076_c7_9818_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3076_c7_9818] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_9818_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_9818_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_9818_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_9818_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3076_c7_9818] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_9818_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_9818_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_9818_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_9818_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_9818_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_9818_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_9818_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_9818_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_2922_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_9818_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3073_c7_2922] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_2922_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_2922_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_2922_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_2922_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3073_c7_2922] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3073_c7_2922_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3073_c7_2922_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3073_c7_2922_return_output := result_stack_value_MUX_uxn_opcodes_h_l3073_c7_2922_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3068_c2_4cd6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3073_c7_2922] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_2922_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_2922_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_2922_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_2922_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_2922_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_2922_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_2922_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_2922_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3073_c7_2922_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3068_c2_4cd6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3068_c2_4cd6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3068_c2_4cd6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c2_4cd6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c2_4cd6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c2_4cd6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output := result_stack_value_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l3112_l3064_DUPLICATE_85d1 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l3112_l3064_DUPLICATE_85d1_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_4cd6_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l3112_l3064_DUPLICATE_85d1_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_d2e5_uxn_opcodes_h_l3112_l3064_DUPLICATE_85d1_return_output;
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
