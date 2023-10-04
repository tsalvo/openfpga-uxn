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
-- Submodules: 81
entity dup2_0CLK_8f02dccf is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dup2_0CLK_8f02dccf;
architecture arch of dup2_0CLK_8f02dccf is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2603_c6_a15e]
signal BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2603_c1_b205]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_b205_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_b205_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_b205_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_b205_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2603_c2_eedc]
signal t16_MUX_uxn_opcodes_h_l2603_c2_eedc_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2603_c2_eedc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2603_c2_eedc]
signal result_stack_value_MUX_uxn_opcodes_h_l2603_c2_eedc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2603_c2_eedc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2603_c2_eedc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_eedc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2603_c2_eedc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_eedc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2603_c2_eedc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_eedc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2603_c2_eedc]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2603_c2_eedc_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2604_c3_948f[uxn_opcodes_h_l2604_c3_948f]
signal printf_uxn_opcodes_h_l2604_c3_948f_uxn_opcodes_h_l2604_c3_948f_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2609_c11_7738]
signal BIN_OP_EQ_uxn_opcodes_h_l2609_c11_7738_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2609_c11_7738_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2609_c11_7738_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2609_c7_c180]
signal t16_MUX_uxn_opcodes_h_l2609_c7_c180_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2609_c7_c180_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2609_c7_c180]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_c180_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_c180_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2609_c7_c180]
signal result_stack_value_MUX_uxn_opcodes_h_l2609_c7_c180_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2609_c7_c180_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2609_c7_c180]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_c180_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_c180_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2609_c7_c180]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_c180_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_c180_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2609_c7_c180]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_c180_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_c180_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2609_c7_c180]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_c180_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_c180_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2609_c7_c180]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_c180_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_c180_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2612_c11_60ee]
signal BIN_OP_EQ_uxn_opcodes_h_l2612_c11_60ee_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2612_c11_60ee_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2612_c11_60ee_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2612_c7_4a36]
signal t16_MUX_uxn_opcodes_h_l2612_c7_4a36_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2612_c7_4a36]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2612_c7_4a36]
signal result_stack_value_MUX_uxn_opcodes_h_l2612_c7_4a36_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2612_c7_4a36]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2612_c7_4a36]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2612_c7_4a36_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2612_c7_4a36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2612_c7_4a36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2612_c7_4a36]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2612_c7_4a36_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2612_c7_4a36]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2612_c7_4a36_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2614_c3_4882]
signal CONST_SL_8_uxn_opcodes_h_l2614_c3_4882_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2614_c3_4882_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2617_c11_263f]
signal BIN_OP_EQ_uxn_opcodes_h_l2617_c11_263f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2617_c11_263f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2617_c11_263f_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2617_c7_443e]
signal t16_MUX_uxn_opcodes_h_l2617_c7_443e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2617_c7_443e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2617_c7_443e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_443e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_443e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2617_c7_443e]
signal result_stack_value_MUX_uxn_opcodes_h_l2617_c7_443e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2617_c7_443e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2617_c7_443e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_443e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_443e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2617_c7_443e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2617_c7_443e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2617_c7_443e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2617_c7_443e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_443e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_443e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2617_c7_443e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_443e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_443e_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2617_c7_443e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_443e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_443e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2620_c11_aaad]
signal BIN_OP_EQ_uxn_opcodes_h_l2620_c11_aaad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2620_c11_aaad_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2620_c11_aaad_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2620_c7_5e5d]
signal t16_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2620_c7_5e5d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2620_c7_5e5d]
signal result_stack_value_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2620_c7_5e5d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2620_c7_5e5d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2620_c7_5e5d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2620_c7_5e5d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2620_c7_5e5d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2621_c3_6f21]
signal BIN_OP_OR_uxn_opcodes_h_l2621_c3_6f21_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2621_c3_6f21_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2621_c3_6f21_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2624_c32_afb9]
signal BIN_OP_AND_uxn_opcodes_h_l2624_c32_afb9_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2624_c32_afb9_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2624_c32_afb9_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2624_c32_49ae]
signal BIN_OP_GT_uxn_opcodes_h_l2624_c32_49ae_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2624_c32_49ae_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2624_c32_49ae_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2624_c32_6260]
signal MUX_uxn_opcodes_h_l2624_c32_6260_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2624_c32_6260_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2624_c32_6260_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2624_c32_6260_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2626_c11_f7f6]
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f7f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f7f6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f7f6_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2626_c7_50ae]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_50ae_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2626_c7_50ae]
signal result_stack_value_MUX_uxn_opcodes_h_l2626_c7_50ae_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2626_c7_50ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_50ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2626_c7_50ae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_50ae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2626_c7_50ae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_50ae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2632_c11_47b0]
signal BIN_OP_EQ_uxn_opcodes_h_l2632_c11_47b0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2632_c11_47b0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2632_c11_47b0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2632_c7_7267]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_7267_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_7267_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_7267_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_7267_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2632_c7_7267]
signal result_stack_value_MUX_uxn_opcodes_h_l2632_c7_7267_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2632_c7_7267_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2632_c7_7267_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2632_c7_7267_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2632_c7_7267]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_7267_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_7267_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_7267_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_7267_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2632_c7_7267]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_7267_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_7267_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_7267_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_7267_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2636_c11_838e]
signal BIN_OP_EQ_uxn_opcodes_h_l2636_c11_838e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2636_c11_838e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2636_c11_838e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2636_c7_c0fb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_c0fb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_c0fb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_c0fb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_c0fb_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2636_c7_c0fb]
signal result_stack_value_MUX_uxn_opcodes_h_l2636_c7_c0fb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2636_c7_c0fb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2636_c7_c0fb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2636_c7_c0fb_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2636_c7_c0fb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_c0fb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_c0fb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_c0fb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_c0fb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2636_c7_c0fb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_c0fb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_c0fb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_c0fb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_c0fb_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2640_c11_5b2d]
signal BIN_OP_EQ_uxn_opcodes_h_l2640_c11_5b2d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2640_c11_5b2d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2640_c11_5b2d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2640_c7_6d64]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_6d64_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_6d64_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_6d64_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_6d64_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2640_c7_6d64]
signal result_stack_value_MUX_uxn_opcodes_h_l2640_c7_6d64_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2640_c7_6d64_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2640_c7_6d64_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2640_c7_6d64_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2640_c7_6d64]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_6d64_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_6d64_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_6d64_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_6d64_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2640_c7_6d64]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2640_c7_6d64_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2640_c7_6d64_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2640_c7_6d64_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2640_c7_6d64_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2644_c11_79e7]
signal BIN_OP_EQ_uxn_opcodes_h_l2644_c11_79e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2644_c11_79e7_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2644_c11_79e7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2644_c7_dad4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_dad4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_dad4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_dad4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_dad4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2644_c7_dad4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_dad4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_dad4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_dad4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_dad4_return_output : unsigned(0 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l2634_l2642_DUPLICATE_3244
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l2634_l2642_DUPLICATE_3244_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l2634_l2642_DUPLICATE_3244_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_e56b( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e
BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e_left,
BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e_right,
BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_b205
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_b205 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_b205_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_b205_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_b205_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_b205_return_output);

-- t16_MUX_uxn_opcodes_h_l2603_c2_eedc
t16_MUX_uxn_opcodes_h_l2603_c2_eedc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2603_c2_eedc_cond,
t16_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue,
t16_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse,
t16_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2603_c2_eedc
result_is_sp_shift_MUX_uxn_opcodes_h_l2603_c2_eedc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2603_c2_eedc
result_stack_value_MUX_uxn_opcodes_h_l2603_c2_eedc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2603_c2_eedc_cond,
result_stack_value_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_eedc
result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_eedc : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_eedc
result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_eedc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_eedc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_eedc
result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_eedc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_eedc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_eedc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_eedc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_eedc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2603_c2_eedc
result_is_stack_read_MUX_uxn_opcodes_h_l2603_c2_eedc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2603_c2_eedc_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output);

-- printf_uxn_opcodes_h_l2604_c3_948f_uxn_opcodes_h_l2604_c3_948f
printf_uxn_opcodes_h_l2604_c3_948f_uxn_opcodes_h_l2604_c3_948f : entity work.printf_uxn_opcodes_h_l2604_c3_948f_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2604_c3_948f_uxn_opcodes_h_l2604_c3_948f_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2609_c11_7738
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_7738 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_7738_left,
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_7738_right,
BIN_OP_EQ_uxn_opcodes_h_l2609_c11_7738_return_output);

-- t16_MUX_uxn_opcodes_h_l2609_c7_c180
t16_MUX_uxn_opcodes_h_l2609_c7_c180 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2609_c7_c180_cond,
t16_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue,
t16_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse,
t16_MUX_uxn_opcodes_h_l2609_c7_c180_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_c180
result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_c180 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_c180_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_c180_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2609_c7_c180
result_stack_value_MUX_uxn_opcodes_h_l2609_c7_c180 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2609_c7_c180_cond,
result_stack_value_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2609_c7_c180_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_c180
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_c180 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_c180_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_c180_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_c180
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_c180 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_c180_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_c180_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_c180
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_c180 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_c180_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_c180_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_c180
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_c180 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_c180_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_c180_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_c180
result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_c180 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_c180_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_c180_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2612_c11_60ee
BIN_OP_EQ_uxn_opcodes_h_l2612_c11_60ee : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2612_c11_60ee_left,
BIN_OP_EQ_uxn_opcodes_h_l2612_c11_60ee_right,
BIN_OP_EQ_uxn_opcodes_h_l2612_c11_60ee_return_output);

-- t16_MUX_uxn_opcodes_h_l2612_c7_4a36
t16_MUX_uxn_opcodes_h_l2612_c7_4a36 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2612_c7_4a36_cond,
t16_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue,
t16_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse,
t16_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2612_c7_4a36
result_is_sp_shift_MUX_uxn_opcodes_h_l2612_c7_4a36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2612_c7_4a36
result_stack_value_MUX_uxn_opcodes_h_l2612_c7_4a36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2612_c7_4a36_cond,
result_stack_value_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2612_c7_4a36
result_sp_relative_shift_MUX_uxn_opcodes_h_l2612_c7_4a36 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2612_c7_4a36
result_is_stack_write_MUX_uxn_opcodes_h_l2612_c7_4a36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2612_c7_4a36_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2612_c7_4a36
result_is_opc_done_MUX_uxn_opcodes_h_l2612_c7_4a36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2612_c7_4a36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2612_c7_4a36
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2612_c7_4a36 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2612_c7_4a36_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2612_c7_4a36
result_is_stack_read_MUX_uxn_opcodes_h_l2612_c7_4a36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2612_c7_4a36_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2614_c3_4882
CONST_SL_8_uxn_opcodes_h_l2614_c3_4882 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2614_c3_4882_x,
CONST_SL_8_uxn_opcodes_h_l2614_c3_4882_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2617_c11_263f
BIN_OP_EQ_uxn_opcodes_h_l2617_c11_263f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2617_c11_263f_left,
BIN_OP_EQ_uxn_opcodes_h_l2617_c11_263f_right,
BIN_OP_EQ_uxn_opcodes_h_l2617_c11_263f_return_output);

-- t16_MUX_uxn_opcodes_h_l2617_c7_443e
t16_MUX_uxn_opcodes_h_l2617_c7_443e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2617_c7_443e_cond,
t16_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue,
t16_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse,
t16_MUX_uxn_opcodes_h_l2617_c7_443e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_443e
result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_443e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_443e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_443e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2617_c7_443e
result_stack_value_MUX_uxn_opcodes_h_l2617_c7_443e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2617_c7_443e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2617_c7_443e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_443e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_443e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_443e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_443e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2617_c7_443e
result_is_stack_write_MUX_uxn_opcodes_h_l2617_c7_443e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2617_c7_443e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2617_c7_443e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_443e
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_443e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_443e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_443e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_443e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_443e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_443e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_443e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_443e
result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_443e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_443e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_443e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2620_c11_aaad
BIN_OP_EQ_uxn_opcodes_h_l2620_c11_aaad : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2620_c11_aaad_left,
BIN_OP_EQ_uxn_opcodes_h_l2620_c11_aaad_right,
BIN_OP_EQ_uxn_opcodes_h_l2620_c11_aaad_return_output);

-- t16_MUX_uxn_opcodes_h_l2620_c7_5e5d
t16_MUX_uxn_opcodes_h_l2620_c7_5e5d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond,
t16_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue,
t16_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse,
t16_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d
result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2620_c7_5e5d
result_stack_value_MUX_uxn_opcodes_h_l2620_c7_5e5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2620_c7_5e5d
result_is_stack_write_MUX_uxn_opcodes_h_l2620_c7_5e5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2620_c7_5e5d
result_is_opc_done_MUX_uxn_opcodes_h_l2620_c7_5e5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c7_5e5d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c7_5e5d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2620_c7_5e5d
result_is_stack_read_MUX_uxn_opcodes_h_l2620_c7_5e5d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2621_c3_6f21
BIN_OP_OR_uxn_opcodes_h_l2621_c3_6f21 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2621_c3_6f21_left,
BIN_OP_OR_uxn_opcodes_h_l2621_c3_6f21_right,
BIN_OP_OR_uxn_opcodes_h_l2621_c3_6f21_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2624_c32_afb9
BIN_OP_AND_uxn_opcodes_h_l2624_c32_afb9 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2624_c32_afb9_left,
BIN_OP_AND_uxn_opcodes_h_l2624_c32_afb9_right,
BIN_OP_AND_uxn_opcodes_h_l2624_c32_afb9_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2624_c32_49ae
BIN_OP_GT_uxn_opcodes_h_l2624_c32_49ae : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2624_c32_49ae_left,
BIN_OP_GT_uxn_opcodes_h_l2624_c32_49ae_right,
BIN_OP_GT_uxn_opcodes_h_l2624_c32_49ae_return_output);

-- MUX_uxn_opcodes_h_l2624_c32_6260
MUX_uxn_opcodes_h_l2624_c32_6260 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2624_c32_6260_cond,
MUX_uxn_opcodes_h_l2624_c32_6260_iftrue,
MUX_uxn_opcodes_h_l2624_c32_6260_iffalse,
MUX_uxn_opcodes_h_l2624_c32_6260_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f7f6
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f7f6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f7f6_left,
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f7f6_right,
BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f7f6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_50ae
result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_50ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_50ae_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2626_c7_50ae
result_stack_value_MUX_uxn_opcodes_h_l2626_c7_50ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2626_c7_50ae_cond,
result_stack_value_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_50ae
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_50ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_50ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_50ae
result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_50ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_50ae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_50ae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_50ae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_50ae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2632_c11_47b0
BIN_OP_EQ_uxn_opcodes_h_l2632_c11_47b0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2632_c11_47b0_left,
BIN_OP_EQ_uxn_opcodes_h_l2632_c11_47b0_right,
BIN_OP_EQ_uxn_opcodes_h_l2632_c11_47b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_7267
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_7267 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_7267_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_7267_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_7267_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_7267_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2632_c7_7267
result_stack_value_MUX_uxn_opcodes_h_l2632_c7_7267 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2632_c7_7267_cond,
result_stack_value_MUX_uxn_opcodes_h_l2632_c7_7267_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2632_c7_7267_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2632_c7_7267_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_7267
result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_7267 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_7267_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_7267_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_7267_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_7267_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_7267
result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_7267 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_7267_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_7267_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_7267_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_7267_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2636_c11_838e
BIN_OP_EQ_uxn_opcodes_h_l2636_c11_838e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2636_c11_838e_left,
BIN_OP_EQ_uxn_opcodes_h_l2636_c11_838e_right,
BIN_OP_EQ_uxn_opcodes_h_l2636_c11_838e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_c0fb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_c0fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_c0fb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_c0fb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_c0fb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_c0fb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2636_c7_c0fb
result_stack_value_MUX_uxn_opcodes_h_l2636_c7_c0fb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2636_c7_c0fb_cond,
result_stack_value_MUX_uxn_opcodes_h_l2636_c7_c0fb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2636_c7_c0fb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2636_c7_c0fb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_c0fb
result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_c0fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_c0fb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_c0fb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_c0fb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_c0fb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_c0fb
result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_c0fb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_c0fb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_c0fb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_c0fb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_c0fb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2640_c11_5b2d
BIN_OP_EQ_uxn_opcodes_h_l2640_c11_5b2d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2640_c11_5b2d_left,
BIN_OP_EQ_uxn_opcodes_h_l2640_c11_5b2d_right,
BIN_OP_EQ_uxn_opcodes_h_l2640_c11_5b2d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_6d64
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_6d64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_6d64_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_6d64_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_6d64_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_6d64_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2640_c7_6d64
result_stack_value_MUX_uxn_opcodes_h_l2640_c7_6d64 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2640_c7_6d64_cond,
result_stack_value_MUX_uxn_opcodes_h_l2640_c7_6d64_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2640_c7_6d64_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2640_c7_6d64_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_6d64
result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_6d64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_6d64_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_6d64_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_6d64_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_6d64_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2640_c7_6d64
result_is_stack_write_MUX_uxn_opcodes_h_l2640_c7_6d64 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2640_c7_6d64_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2640_c7_6d64_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2640_c7_6d64_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2640_c7_6d64_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2644_c11_79e7
BIN_OP_EQ_uxn_opcodes_h_l2644_c11_79e7 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2644_c11_79e7_left,
BIN_OP_EQ_uxn_opcodes_h_l2644_c11_79e7_right,
BIN_OP_EQ_uxn_opcodes_h_l2644_c11_79e7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_dad4
result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_dad4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_dad4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_dad4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_dad4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_dad4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_dad4
result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_dad4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_dad4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_dad4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_dad4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_dad4_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l2634_l2642_DUPLICATE_3244
CONST_SR_8_uint16_t_uxn_opcodes_h_l2634_l2642_DUPLICATE_3244 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l2634_l2642_DUPLICATE_3244_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l2634_l2642_DUPLICATE_3244_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_b205_return_output,
 t16_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2609_c11_7738_return_output,
 t16_MUX_uxn_opcodes_h_l2609_c7_c180_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_c180_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2609_c7_c180_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_c180_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_c180_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_c180_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_c180_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_c180_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2612_c11_60ee_return_output,
 t16_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output,
 CONST_SL_8_uxn_opcodes_h_l2614_c3_4882_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2617_c11_263f_return_output,
 t16_MUX_uxn_opcodes_h_l2617_c7_443e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_443e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2617_c7_443e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_443e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2617_c7_443e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_443e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_443e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_443e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2620_c11_aaad_return_output,
 t16_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2621_c3_6f21_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2624_c32_afb9_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2624_c32_49ae_return_output,
 MUX_uxn_opcodes_h_l2624_c32_6260_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f7f6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2632_c11_47b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_7267_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2632_c7_7267_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_7267_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_7267_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2636_c11_838e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_c0fb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2636_c7_c0fb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_c0fb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_c0fb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2640_c11_5b2d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_6d64_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2640_c7_6d64_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_6d64_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2640_c7_6d64_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2644_c11_79e7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_dad4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_dad4_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l2634_l2642_DUPLICATE_3244_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_b205_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_b205_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_b205_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_b205_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2609_c7_c180_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2603_c2_eedc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_c180_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2609_c7_c180_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2603_c2_eedc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_c180_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_c180_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_eedc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_c180_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_eedc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2606_c3_0cf8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_c180_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_eedc_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_c180_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2603_c2_eedc_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2604_c3_948f_uxn_opcodes_h_l2604_c3_948f_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_7738_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_7738_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_7738_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2609_c7_c180_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_c180_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2609_c7_c180_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_c180_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_c180_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_c180_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2610_c3_3304 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_c180_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_c180_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2612_c11_60ee_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2612_c11_60ee_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2612_c11_60ee_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2617_c7_443e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2612_c7_4a36_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_443e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2617_c7_443e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2612_c7_4a36_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_443e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2617_c7_443e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2612_c7_4a36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_443e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2612_c7_4a36_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2615_c3_008b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_443e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2612_c7_4a36_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_443e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2612_c7_4a36_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2614_c3_4882_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2614_c3_4882_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_263f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_263f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_263f_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2617_c7_443e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_443e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2617_c7_443e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_443e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2617_c7_443e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_443e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2618_c3_edbd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_443e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_443e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c11_aaad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c11_aaad_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c11_aaad_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2621_c3_6f21_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2621_c3_6f21_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2621_c3_6f21_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2624_c32_6260_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2624_c32_6260_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2624_c32_6260_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2624_c32_afb9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2624_c32_afb9_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2624_c32_afb9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2624_c32_49ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2624_c32_49ae_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2624_c32_49ae_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2624_c32_6260_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f7f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f7f6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f7f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_50ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2632_c7_7267_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2626_c7_50ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_7267_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_50ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_7267_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_50ae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2629_c3_59f9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_7267_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_50ae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2632_c11_47b0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2632_c11_47b0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2632_c11_47b0_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_7267_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2633_c3_5276 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_7267_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_c0fb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_7267_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2632_c7_7267_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2632_c7_7267_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2636_c7_c0fb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2632_c7_7267_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_7267_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_7267_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_c0fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_7267_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_7267_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_7267_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_c0fb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_7267_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_838e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_838e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_838e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_c0fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2637_c3_3c12 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_c0fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_6d64_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_c0fb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2636_c7_c0fb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2636_c7_c0fb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2640_c7_6d64_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2636_c7_c0fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_c0fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_c0fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_6d64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_c0fb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_c0fb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_c0fb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2640_c7_6d64_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_c0fb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2640_c11_5b2d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2640_c11_5b2d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2640_c11_5b2d_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_6d64_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2641_c3_b10e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_6d64_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_6d64_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2640_c7_6d64_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2640_c7_6d64_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2640_c7_6d64_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_6d64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_6d64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_dad4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_6d64_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2640_c7_6d64_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2640_c7_6d64_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_dad4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2640_c7_6d64_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_79e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_79e7_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_79e7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_dad4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_dad4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_dad4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_dad4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_dad4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_dad4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2626_l2617_l2612_l2609_l2603_DUPLICATE_f453_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2620_l2617_l2612_l2640_l2609_l2603_DUPLICATE_d98c_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2620_l2617_l2612_l2609_l2603_DUPLICATE_be11_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2620_l2617_l2644_l2612_l2640_l2609_l2636_l2603_l2632_DUPLICATE_f723_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2620_l2617_l2644_l2612_l2640_l2609_l2636_l2632_DUPLICATE_61b5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2609_l2620_l2612_l2617_DUPLICATE_0f37_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2613_l2621_DUPLICATE_4c97_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2620_l2640_DUPLICATE_64a3_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2630_l2638_DUPLICATE_e523_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2634_l2642_DUPLICATE_3244_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2634_l2642_DUPLICATE_3244_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2642_l2634_DUPLICATE_f908_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2649_l2599_DUPLICATE_0a20_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_dad4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2629_c3_59f9 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2629_c3_59f9;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2624_c32_49ae_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2624_c32_afb9_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l2624_c32_6260_iffalse := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c11_aaad_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_838e_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2641_c3_b10e := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_6d64_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2641_c3_b10e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2633_c3_5276 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_7267_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2633_c3_5276;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_dad4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2606_c3_0cf8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2606_c3_0cf8;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2612_c11_60ee_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_b205_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2618_c3_edbd := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2618_c3_edbd;
     VAR_MUX_uxn_opcodes_h_l2624_c32_6260_iftrue := signed(std_logic_vector(resize(to_unsigned(4, 3), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2610_c3_3304 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2610_c3_3304;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_79e7_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_7738_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2640_c11_5b2d_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2637_c3_3c12 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_c0fb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2637_c3_3c12;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f7f6_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_263f_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2632_c11_47b0_right := to_unsigned(6, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2615_c3_008b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2615_c3_008b;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_b205_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2624_c32_afb9_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_7738_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2612_c11_60ee_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_263f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c11_aaad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f7f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2632_c11_47b0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_838e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2640_c11_5b2d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_79e7_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2621_c3_6f21_left := t16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2634_l2642_DUPLICATE_3244_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2640_c11_5b2d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2640_c11_5b2d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2640_c11_5b2d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2640_c11_5b2d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2640_c11_5b2d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2640_c11_5b2d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2640_c11_5b2d_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2630_l2638_DUPLICATE_e523 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2630_l2638_DUPLICATE_e523_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2613_l2621_DUPLICATE_4c97 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2613_l2621_DUPLICATE_4c97_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2617_c11_263f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2617_c11_263f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_263f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2617_c11_263f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_263f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_263f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2617_c11_263f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2626_c11_f7f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f7f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f7f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f7f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f7f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f7f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f7f6_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2624_c32_afb9] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2624_c32_afb9_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2624_c32_afb9_left;
     BIN_OP_AND_uxn_opcodes_h_l2624_c32_afb9_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2624_c32_afb9_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2624_c32_afb9_return_output := BIN_OP_AND_uxn_opcodes_h_l2624_c32_afb9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2632_c11_47b0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2632_c11_47b0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2632_c11_47b0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2632_c11_47b0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2632_c11_47b0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2632_c11_47b0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2632_c11_47b0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2612_c11_60ee] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2612_c11_60ee_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2612_c11_60ee_left;
     BIN_OP_EQ_uxn_opcodes_h_l2612_c11_60ee_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2612_c11_60ee_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2612_c11_60ee_return_output := BIN_OP_EQ_uxn_opcodes_h_l2612_c11_60ee_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2620_l2617_l2644_l2612_l2640_l2609_l2636_l2632_DUPLICATE_61b5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2620_l2617_l2644_l2612_l2640_l2609_l2636_l2632_DUPLICATE_61b5_return_output := result.is_opc_done;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2620_l2617_l2612_l2609_l2603_DUPLICATE_be11 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2620_l2617_l2612_l2609_l2603_DUPLICATE_be11_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2620_l2640_DUPLICATE_64a3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2620_l2640_DUPLICATE_64a3_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2609_l2620_l2612_l2617_DUPLICATE_0f37 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2609_l2620_l2612_l2617_DUPLICATE_0f37_return_output := result.is_stack_read;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l2634_l2642_DUPLICATE_3244 LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l2634_l2642_DUPLICATE_3244_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2634_l2642_DUPLICATE_3244_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2634_l2642_DUPLICATE_3244_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l2634_l2642_DUPLICATE_3244_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2620_l2617_l2612_l2640_l2609_l2603_DUPLICATE_d98c LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2620_l2617_l2612_l2640_l2609_l2603_DUPLICATE_d98c_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2609_c11_7738] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2609_c11_7738_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_7738_left;
     BIN_OP_EQ_uxn_opcodes_h_l2609_c11_7738_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_7738_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_7738_return_output := BIN_OP_EQ_uxn_opcodes_h_l2609_c11_7738_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2636_c11_838e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2636_c11_838e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_838e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2636_c11_838e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_838e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_838e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2636_c11_838e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2620_c11_aaad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2620_c11_aaad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c11_aaad_left;
     BIN_OP_EQ_uxn_opcodes_h_l2620_c11_aaad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c11_aaad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c11_aaad_return_output := BIN_OP_EQ_uxn_opcodes_h_l2620_c11_aaad_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2620_l2617_l2644_l2612_l2640_l2609_l2636_l2603_l2632_DUPLICATE_f723 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2620_l2617_l2644_l2612_l2640_l2609_l2636_l2603_l2632_DUPLICATE_f723_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2603_c6_a15e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2644_c11_79e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2644_c11_79e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_79e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2644_c11_79e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_79e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_79e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2644_c11_79e7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2626_l2617_l2612_l2609_l2603_DUPLICATE_f453 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2626_l2617_l2612_l2609_l2603_DUPLICATE_f453_return_output := result.is_sp_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2624_c32_49ae_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2624_c32_afb9_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_b205_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_eedc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2603_c2_eedc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_eedc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_eedc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2603_c2_eedc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2603_c2_eedc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2603_c6_a15e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_c180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_7738_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_c180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_7738_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_c180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_7738_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_c180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_7738_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_c180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_7738_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_c180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_7738_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2609_c7_c180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_7738_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2609_c7_c180_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2609_c11_7738_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2612_c7_4a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2612_c11_60ee_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2612_c11_60ee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2612_c7_4a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2612_c11_60ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2612_c7_4a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2612_c11_60ee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2612_c11_60ee_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2612_c7_4a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2612_c11_60ee_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2612_c7_4a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2612_c11_60ee_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2612_c7_4a36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2612_c11_60ee_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_443e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_263f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_443e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_263f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_443e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_263f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2617_c7_443e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_263f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_443e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_263f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_443e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_263f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2617_c7_443e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_263f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2617_c7_443e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2617_c11_263f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c11_aaad_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c11_aaad_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c11_aaad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c11_aaad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c11_aaad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c11_aaad_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c11_aaad_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2620_c11_aaad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_50ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f7f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_50ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f7f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_50ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f7f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_50ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f7f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2626_c7_50ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2626_c11_f7f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_7267_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2632_c11_47b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_7267_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2632_c11_47b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_7267_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2632_c11_47b0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2632_c7_7267_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2632_c11_47b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_c0fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_838e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_c0fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_838e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_c0fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_838e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2636_c7_c0fb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2636_c11_838e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_6d64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2640_c11_5b2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2640_c7_6d64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2640_c11_5b2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_6d64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2640_c11_5b2d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2640_c7_6d64_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2640_c11_5b2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_dad4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_79e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_dad4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2644_c11_79e7_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2621_c3_6f21_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2613_l2621_DUPLICATE_4c97_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2614_c3_4882_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2613_l2621_DUPLICATE_4c97_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2630_l2638_DUPLICATE_e523_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2636_c7_c0fb_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2630_l2638_DUPLICATE_e523_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2620_l2617_l2612_l2609_l2603_DUPLICATE_be11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2620_l2617_l2612_l2609_l2603_DUPLICATE_be11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2620_l2617_l2612_l2609_l2603_DUPLICATE_be11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2620_l2617_l2612_l2609_l2603_DUPLICATE_be11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2620_l2617_l2612_l2609_l2603_DUPLICATE_be11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2620_l2617_l2644_l2612_l2640_l2609_l2636_l2632_DUPLICATE_61b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2620_l2617_l2644_l2612_l2640_l2609_l2636_l2632_DUPLICATE_61b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2620_l2617_l2644_l2612_l2640_l2609_l2636_l2632_DUPLICATE_61b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2620_l2617_l2644_l2612_l2640_l2609_l2636_l2632_DUPLICATE_61b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2620_l2617_l2644_l2612_l2640_l2609_l2636_l2632_DUPLICATE_61b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_7267_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2620_l2617_l2644_l2612_l2640_l2609_l2636_l2632_DUPLICATE_61b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_c0fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2620_l2617_l2644_l2612_l2640_l2609_l2636_l2632_DUPLICATE_61b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_6d64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2620_l2617_l2644_l2612_l2640_l2609_l2636_l2632_DUPLICATE_61b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_dad4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2626_l2620_l2617_l2644_l2612_l2640_l2609_l2636_l2632_DUPLICATE_61b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2626_l2617_l2612_l2609_l2603_DUPLICATE_f453_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2626_l2617_l2612_l2609_l2603_DUPLICATE_f453_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2626_l2617_l2612_l2609_l2603_DUPLICATE_f453_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2626_l2617_l2612_l2609_l2603_DUPLICATE_f453_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2626_l2617_l2612_l2609_l2603_DUPLICATE_f453_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2609_l2620_l2612_l2617_DUPLICATE_0f37_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2609_l2620_l2612_l2617_DUPLICATE_0f37_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2609_l2620_l2612_l2617_DUPLICATE_0f37_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2609_l2620_l2612_l2617_DUPLICATE_0f37_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2620_l2617_l2644_l2612_l2640_l2609_l2636_l2603_l2632_DUPLICATE_f723_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2620_l2617_l2644_l2612_l2640_l2609_l2636_l2603_l2632_DUPLICATE_f723_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2620_l2617_l2644_l2612_l2640_l2609_l2636_l2603_l2632_DUPLICATE_f723_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2620_l2617_l2644_l2612_l2640_l2609_l2636_l2603_l2632_DUPLICATE_f723_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2620_l2617_l2644_l2612_l2640_l2609_l2636_l2603_l2632_DUPLICATE_f723_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_7267_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2620_l2617_l2644_l2612_l2640_l2609_l2636_l2603_l2632_DUPLICATE_f723_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_c0fb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2620_l2617_l2644_l2612_l2640_l2609_l2636_l2603_l2632_DUPLICATE_f723_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2640_c7_6d64_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2620_l2617_l2644_l2612_l2640_l2609_l2636_l2603_l2632_DUPLICATE_f723_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_dad4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2620_l2617_l2644_l2612_l2640_l2609_l2636_l2603_l2632_DUPLICATE_f723_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2620_l2640_DUPLICATE_64a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_6d64_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2620_l2640_DUPLICATE_64a3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2620_l2617_l2612_l2640_l2609_l2603_DUPLICATE_d98c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2620_l2617_l2612_l2640_l2609_l2603_DUPLICATE_d98c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2620_l2617_l2612_l2640_l2609_l2603_DUPLICATE_d98c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2620_l2617_l2612_l2640_l2609_l2603_DUPLICATE_d98c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2620_l2617_l2612_l2640_l2609_l2603_DUPLICATE_d98c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2640_c7_6d64_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2620_l2617_l2612_l2640_l2609_l2603_DUPLICATE_d98c_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2626_c7_50ae] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_50ae_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_50ae_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2644_c7_dad4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_dad4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_dad4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_dad4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_dad4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_dad4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_dad4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_dad4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_dad4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2620_c7_5e5d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2621_c3_6f21] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2621_c3_6f21_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2621_c3_6f21_left;
     BIN_OP_OR_uxn_opcodes_h_l2621_c3_6f21_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2621_c3_6f21_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2621_c3_6f21_return_output := BIN_OP_OR_uxn_opcodes_h_l2621_c3_6f21_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2624_c32_49ae] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2624_c32_49ae_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2624_c32_49ae_left;
     BIN_OP_GT_uxn_opcodes_h_l2624_c32_49ae_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2624_c32_49ae_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2624_c32_49ae_return_output := BIN_OP_GT_uxn_opcodes_h_l2624_c32_49ae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2644_c7_dad4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_dad4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_dad4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_dad4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_dad4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_dad4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_dad4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_dad4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_dad4_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2614_c3_4882] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2614_c3_4882_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2614_c3_4882_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2614_c3_4882_return_output := CONST_SL_8_uxn_opcodes_h_l2614_c3_4882_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2642_l2634_DUPLICATE_f908 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2642_l2634_DUPLICATE_f908_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l2634_l2642_DUPLICATE_3244_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2603_c1_b205] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_b205_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_b205_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_b205_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_b205_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_b205_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_b205_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_b205_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_b205_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2640_c7_6d64] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_6d64_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_6d64_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_6d64_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_6d64_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_6d64_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_6d64_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_6d64_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_6d64_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2624_c32_6260_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2624_c32_49ae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2621_c3_6f21_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2632_c7_7267_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2642_l2634_DUPLICATE_f908_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2640_c7_6d64_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l2642_l2634_DUPLICATE_f908_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2614_c3_4882_return_output;
     VAR_printf_uxn_opcodes_h_l2604_c3_948f_uxn_opcodes_h_l2604_c3_948f_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2603_c1_b205_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_6d64_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2644_c7_dad4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2640_c7_6d64_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2644_c7_dad4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_c0fb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2640_c7_6d64_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2620_c7_5e5d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2620_c7_5e5d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond;
     t16_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue;
     t16_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output := t16_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2636_c7_c0fb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_c0fb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_c0fb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_c0fb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_c0fb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_c0fb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_c0fb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_c0fb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_c0fb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2640_c7_6d64] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_6d64_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_6d64_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_6d64_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_6d64_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_6d64_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_6d64_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_6d64_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_6d64_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2617_c7_443e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_443e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_443e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_443e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_443e_return_output;

     -- printf_uxn_opcodes_h_l2604_c3_948f[uxn_opcodes_h_l2604_c3_948f] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2604_c3_948f_uxn_opcodes_h_l2604_c3_948f_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2604_c3_948f_uxn_opcodes_h_l2604_c3_948f_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2640_c7_6d64] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2640_c7_6d64_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2640_c7_6d64_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2640_c7_6d64_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2640_c7_6d64_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2640_c7_6d64_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2640_c7_6d64_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2640_c7_6d64_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2640_c7_6d64_return_output;

     -- MUX[uxn_opcodes_h_l2624_c32_6260] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2624_c32_6260_cond <= VAR_MUX_uxn_opcodes_h_l2624_c32_6260_cond;
     MUX_uxn_opcodes_h_l2624_c32_6260_iftrue <= VAR_MUX_uxn_opcodes_h_l2624_c32_6260_iftrue;
     MUX_uxn_opcodes_h_l2624_c32_6260_iffalse <= VAR_MUX_uxn_opcodes_h_l2624_c32_6260_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2624_c32_6260_return_output := MUX_uxn_opcodes_h_l2624_c32_6260_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2640_c7_6d64] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2640_c7_6d64_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2640_c7_6d64_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2640_c7_6d64_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2640_c7_6d64_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2640_c7_6d64_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2640_c7_6d64_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2640_c7_6d64_return_output := result_stack_value_MUX_uxn_opcodes_h_l2640_c7_6d64_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue := VAR_MUX_uxn_opcodes_h_l2624_c32_6260_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_c0fb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2640_c7_6d64_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2617_c7_443e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_c0fb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2640_c7_6d64_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_7267_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2636_c7_c0fb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2636_c7_c0fb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2640_c7_6d64_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2636_c7_c0fb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_c0fb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_c0fb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_c0fb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_c0fb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_c0fb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_c0fb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_c0fb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_c0fb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2617_c7_443e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_443e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_443e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_443e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_443e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2636_c7_c0fb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_c0fb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_c0fb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_c0fb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_c0fb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_c0fb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_c0fb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_c0fb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_c0fb_return_output;

     -- t16_MUX[uxn_opcodes_h_l2617_c7_443e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2617_c7_443e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2617_c7_443e_cond;
     t16_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue;
     t16_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2617_c7_443e_return_output := t16_MUX_uxn_opcodes_h_l2617_c7_443e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2612_c7_4a36] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2612_c7_4a36_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2612_c7_4a36_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2632_c7_7267] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_7267_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_7267_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_7267_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_7267_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_7267_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_7267_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_7267_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_7267_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2620_c7_5e5d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2636_c7_c0fb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2636_c7_c0fb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2636_c7_c0fb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2636_c7_c0fb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2636_c7_c0fb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2636_c7_c0fb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2636_c7_c0fb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2636_c7_c0fb_return_output := result_stack_value_MUX_uxn_opcodes_h_l2636_c7_c0fb_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_7267_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2636_c7_c0fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2617_c7_443e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_7267_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2636_c7_c0fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2632_c7_7267_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2632_c7_7267_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2636_c7_c0fb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2617_c7_443e_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2632_c7_7267] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2632_c7_7267_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2632_c7_7267_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2632_c7_7267_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2632_c7_7267_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2632_c7_7267_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2632_c7_7267_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2632_c7_7267_return_output := result_stack_value_MUX_uxn_opcodes_h_l2632_c7_7267_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2617_c7_443e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_443e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_443e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_443e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_443e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2609_c7_c180] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_c180_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_c180_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_c180_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_c180_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2612_c7_4a36] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2626_c7_50ae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_50ae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_50ae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2632_c7_7267] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_7267_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_7267_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_7267_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_7267_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_7267_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_7267_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_7267_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_7267_return_output;

     -- t16_MUX[uxn_opcodes_h_l2612_c7_4a36] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2612_c7_4a36_cond <= VAR_t16_MUX_uxn_opcodes_h_l2612_c7_4a36_cond;
     t16_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue;
     t16_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output := t16_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2632_c7_7267] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_7267_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_7267_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_7267_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_7267_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_7267_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_7267_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_7267_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_7267_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2632_c7_7267_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2609_c7_c180_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2632_c7_7267_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2617_c7_443e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2632_c7_7267_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2609_c7_c180] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_c180_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_c180_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_c180_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_c180_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2603_c2_eedc] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2603_c2_eedc_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2603_c2_eedc_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2626_c7_50ae] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2626_c7_50ae_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2626_c7_50ae_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output := result_stack_value_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output;

     -- t16_MUX[uxn_opcodes_h_l2609_c7_c180] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2609_c7_c180_cond <= VAR_t16_MUX_uxn_opcodes_h_l2609_c7_c180_cond;
     t16_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue;
     t16_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2609_c7_c180_return_output := t16_MUX_uxn_opcodes_h_l2609_c7_c180_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2620_c7_5e5d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2626_c7_50ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_50ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_50ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2612_c7_4a36] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2626_c7_50ae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_50ae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_50ae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_50ae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_50ae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2609_c7_c180_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2626_c7_50ae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2609_c7_c180_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2609_c7_c180] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_c180_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_c180_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_c180_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_c180_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2620_c7_5e5d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output;

     -- t16_MUX[uxn_opcodes_h_l2603_c2_eedc] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2603_c2_eedc_cond <= VAR_t16_MUX_uxn_opcodes_h_l2603_c2_eedc_cond;
     t16_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue;
     t16_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output := t16_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2603_c2_eedc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2620_c7_5e5d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2620_c7_5e5d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2620_c7_5e5d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2620_c7_5e5d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2620_c7_5e5d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2617_c7_443e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_443e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_443e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_443e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_443e_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2609_c7_c180_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2617_c7_443e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2620_c7_5e5d_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2617_c7_443e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2617_c7_443e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2617_c7_443e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2617_c7_443e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2617_c7_443e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2617_c7_443e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2617_c7_443e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2617_c7_443e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2617_c7_443e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2617_c7_443e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2612_c7_4a36] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2612_c7_4a36_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2612_c7_4a36_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2617_c7_443e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_443e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_443e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_443e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_443e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_443e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_443e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2603_c2_eedc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2617_c7_443e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2617_c7_443e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2617_c7_443e_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2612_c7_4a36] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2612_c7_4a36_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2612_c7_4a36_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output := result_stack_value_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2612_c7_4a36] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2612_c7_4a36_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2612_c7_4a36_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2609_c7_c180] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_c180_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_c180_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_c180_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_c180_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2612_c7_4a36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2612_c7_4a36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2612_c7_4a36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2612_c7_4a36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2612_c7_4a36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2609_c7_c180_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2612_c7_4a36_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2609_c7_c180] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2609_c7_c180_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2609_c7_c180_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2609_c7_c180_return_output := result_stack_value_MUX_uxn_opcodes_h_l2609_c7_c180_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2609_c7_c180] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_c180_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_c180_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_c180_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_c180_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2609_c7_c180] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_c180_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_c180_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_c180_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_c180_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_c180_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_c180_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2603_c2_eedc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_eedc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_eedc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2609_c7_c180_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2609_c7_c180_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2609_c7_c180_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2603_c2_eedc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2603_c2_eedc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2603_c2_eedc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output := result_stack_value_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2603_c2_eedc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_eedc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_eedc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2603_c2_eedc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_eedc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_eedc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_eedc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_eedc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2649_l2599_DUPLICATE_0a20 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2649_l2599_DUPLICATE_0a20_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_e56b(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2603_c2_eedc_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2649_l2599_DUPLICATE_0a20_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_e56b_uxn_opcodes_h_l2649_l2599_DUPLICATE_0a20_return_output;
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
