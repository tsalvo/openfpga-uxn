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
-- Submodules: 76
entity dup2_0CLK_ad7496ca is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end dup2_0CLK_ad7496ca;
architecture arch of dup2_0CLK_ad7496ca is
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
-- BIN_OP_EQ[uxn_opcodes_h_l3068_c6_0b4c]
signal BIN_OP_EQ_uxn_opcodes_h_l3068_c6_0b4c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3068_c6_0b4c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3068_c6_0b4c_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3068_c1_875c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_875c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_875c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_875c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_875c_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3068_c2_c142]
signal t16_MUX_uxn_opcodes_h_l3068_c2_c142_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3068_c2_c142_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3068_c2_c142]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_c142_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_c142_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3068_c2_c142]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_c142_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_c142_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3068_c2_c142]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_c142_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_c142_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3068_c2_c142]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_c142_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_c142_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3068_c2_c142]
signal result_stack_value_MUX_uxn_opcodes_h_l3068_c2_c142_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3068_c2_c142_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3068_c2_c142]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_c142_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_c142_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l3069_c3_8e11[uxn_opcodes_h_l3069_c3_8e11]
signal printf_uxn_opcodes_h_l3069_c3_8e11_uxn_opcodes_h_l3069_c3_8e11_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3073_c11_99b8]
signal BIN_OP_EQ_uxn_opcodes_h_l3073_c11_99b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3073_c11_99b8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3073_c11_99b8_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3073_c7_5892]
signal t16_MUX_uxn_opcodes_h_l3073_c7_5892_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3073_c7_5892_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3073_c7_5892]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_5892_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_5892_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3073_c7_5892]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_5892_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_5892_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3073_c7_5892]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_5892_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_5892_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3073_c7_5892]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_5892_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_5892_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3073_c7_5892]
signal result_stack_value_MUX_uxn_opcodes_h_l3073_c7_5892_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3073_c7_5892_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3073_c7_5892]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_5892_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_5892_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3076_c11_2721]
signal BIN_OP_EQ_uxn_opcodes_h_l3076_c11_2721_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3076_c11_2721_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3076_c11_2721_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3076_c7_c8e8]
signal t16_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3076_c7_c8e8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3076_c7_c8e8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3076_c7_c8e8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3076_c7_c8e8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3076_c7_c8e8]
signal result_stack_value_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3076_c7_c8e8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l3078_c3_6b4d]
signal CONST_SL_8_uxn_opcodes_h_l3078_c3_6b4d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l3078_c3_6b4d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3081_c11_4c02]
signal BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4c02_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4c02_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4c02_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3081_c7_20e0]
signal t16_MUX_uxn_opcodes_h_l3081_c7_20e0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3081_c7_20e0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_20e0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3081_c7_20e0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3081_c7_20e0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_20e0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3081_c7_20e0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3081_c7_20e0]
signal result_stack_value_MUX_uxn_opcodes_h_l3081_c7_20e0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3081_c7_20e0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_20e0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3084_c11_38af]
signal BIN_OP_EQ_uxn_opcodes_h_l3084_c11_38af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3084_c11_38af_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3084_c11_38af_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l3084_c7_f726]
signal t16_MUX_uxn_opcodes_h_l3084_c7_f726_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l3084_c7_f726_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3084_c7_f726]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_f726_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_f726_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3084_c7_f726]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_f726_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_f726_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3084_c7_f726]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_f726_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_f726_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3084_c7_f726]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_f726_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_f726_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3084_c7_f726]
signal result_stack_value_MUX_uxn_opcodes_h_l3084_c7_f726_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3084_c7_f726_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3084_c7_f726]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_f726_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_f726_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l3085_c3_73c8]
signal BIN_OP_OR_uxn_opcodes_h_l3085_c3_73c8_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3085_c3_73c8_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l3085_c3_73c8_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3087_c32_d1e4]
signal BIN_OP_AND_uxn_opcodes_h_l3087_c32_d1e4_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3087_c32_d1e4_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3087_c32_d1e4_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3087_c32_70a7]
signal BIN_OP_GT_uxn_opcodes_h_l3087_c32_70a7_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3087_c32_70a7_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3087_c32_70a7_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l3087_c32_2ab8]
signal MUX_uxn_opcodes_h_l3087_c32_2ab8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3087_c32_2ab8_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l3087_c32_2ab8_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l3087_c32_2ab8_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3089_c11_7d46]
signal BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7d46_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7d46_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7d46_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3089_c7_101c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_101c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_101c_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3089_c7_101c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_101c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_101c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3089_c7_101c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_101c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_101c_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3089_c7_101c]
signal result_stack_value_MUX_uxn_opcodes_h_l3089_c7_101c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3089_c7_101c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3089_c7_101c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_101c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_101c_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3095_c11_cba0]
signal BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cba0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cba0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cba0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3095_c7_2f5a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_2f5a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_2f5a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_2f5a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_2f5a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3095_c7_2f5a]
signal result_stack_value_MUX_uxn_opcodes_h_l3095_c7_2f5a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3095_c7_2f5a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3095_c7_2f5a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3095_c7_2f5a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3095_c7_2f5a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_2f5a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_2f5a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_2f5a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_2f5a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3095_c7_2f5a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_2f5a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_2f5a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_2f5a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_2f5a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3099_c11_7b75]
signal BIN_OP_EQ_uxn_opcodes_h_l3099_c11_7b75_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3099_c11_7b75_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3099_c11_7b75_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3099_c7_c691]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_c691_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_c691_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_c691_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_c691_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3099_c7_c691]
signal result_stack_value_MUX_uxn_opcodes_h_l3099_c7_c691_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3099_c7_c691_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3099_c7_c691_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3099_c7_c691_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3099_c7_c691]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_c691_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_c691_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_c691_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_c691_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3099_c7_c691]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_c691_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_c691_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_c691_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_c691_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3103_c11_aae3]
signal BIN_OP_EQ_uxn_opcodes_h_l3103_c11_aae3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3103_c11_aae3_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3103_c11_aae3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3103_c7_7312]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_7312_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_7312_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_7312_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_7312_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3103_c7_7312]
signal result_stack_value_MUX_uxn_opcodes_h_l3103_c7_7312_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3103_c7_7312_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3103_c7_7312_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3103_c7_7312_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3103_c7_7312]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_7312_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_7312_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_7312_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_7312_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3103_c7_7312]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_7312_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_7312_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_7312_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_7312_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3107_c11_b08f]
signal BIN_OP_EQ_uxn_opcodes_h_l3107_c11_b08f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3107_c11_b08f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3107_c11_b08f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3107_c7_4c7e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_4c7e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_4c7e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_4c7e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_4c7e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3107_c7_4c7e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_4c7e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_4c7e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_4c7e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_4c7e_return_output : unsigned(0 downto 0);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l3105_l3097_DUPLICATE_63cf
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l3105_l3097_DUPLICATE_63cf_x : unsigned(15 downto 0);
signal CONST_SR_8_uint16_t_uxn_opcodes_h_l3105_l3097_DUPLICATE_63cf_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_09c5( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_opc_done := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l3068_c6_0b4c
BIN_OP_EQ_uxn_opcodes_h_l3068_c6_0b4c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3068_c6_0b4c_left,
BIN_OP_EQ_uxn_opcodes_h_l3068_c6_0b4c_right,
BIN_OP_EQ_uxn_opcodes_h_l3068_c6_0b4c_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_875c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_875c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_875c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_875c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_875c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_875c_return_output);

-- t16_MUX_uxn_opcodes_h_l3068_c2_c142
t16_MUX_uxn_opcodes_h_l3068_c2_c142 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3068_c2_c142_cond,
t16_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue,
t16_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse,
t16_MUX_uxn_opcodes_h_l3068_c2_c142_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_c142
result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_c142 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_c142_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_c142_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_c142
result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_c142 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_c142_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_c142_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_c142
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_c142 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_c142_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_c142_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_c142
result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_c142 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_c142_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_c142_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3068_c2_c142
result_stack_value_MUX_uxn_opcodes_h_l3068_c2_c142 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3068_c2_c142_cond,
result_stack_value_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3068_c2_c142_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_c142
result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_c142 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_c142_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_c142_return_output);

-- printf_uxn_opcodes_h_l3069_c3_8e11_uxn_opcodes_h_l3069_c3_8e11
printf_uxn_opcodes_h_l3069_c3_8e11_uxn_opcodes_h_l3069_c3_8e11 : entity work.printf_uxn_opcodes_h_l3069_c3_8e11_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3069_c3_8e11_uxn_opcodes_h_l3069_c3_8e11_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l3073_c11_99b8
BIN_OP_EQ_uxn_opcodes_h_l3073_c11_99b8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3073_c11_99b8_left,
BIN_OP_EQ_uxn_opcodes_h_l3073_c11_99b8_right,
BIN_OP_EQ_uxn_opcodes_h_l3073_c11_99b8_return_output);

-- t16_MUX_uxn_opcodes_h_l3073_c7_5892
t16_MUX_uxn_opcodes_h_l3073_c7_5892 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3073_c7_5892_cond,
t16_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue,
t16_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse,
t16_MUX_uxn_opcodes_h_l3073_c7_5892_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_5892
result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_5892 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_5892_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_5892_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_5892
result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_5892 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_5892_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_5892_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_5892
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_5892 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_5892_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_5892_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_5892
result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_5892 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_5892_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_5892_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3073_c7_5892
result_stack_value_MUX_uxn_opcodes_h_l3073_c7_5892 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3073_c7_5892_cond,
result_stack_value_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3073_c7_5892_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_5892
result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_5892 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_5892_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_5892_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3076_c11_2721
BIN_OP_EQ_uxn_opcodes_h_l3076_c11_2721 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3076_c11_2721_left,
BIN_OP_EQ_uxn_opcodes_h_l3076_c11_2721_right,
BIN_OP_EQ_uxn_opcodes_h_l3076_c11_2721_return_output);

-- t16_MUX_uxn_opcodes_h_l3076_c7_c8e8
t16_MUX_uxn_opcodes_h_l3076_c7_c8e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond,
t16_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue,
t16_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse,
t16_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_c8e8
result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_c8e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8
result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_c8e8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_c8e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8
result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3076_c7_c8e8
result_stack_value_MUX_uxn_opcodes_h_l3076_c7_c8e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond,
result_stack_value_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_c8e8
result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_c8e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output);

-- CONST_SL_8_uxn_opcodes_h_l3078_c3_6b4d
CONST_SL_8_uxn_opcodes_h_l3078_c3_6b4d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l3078_c3_6b4d_x,
CONST_SL_8_uxn_opcodes_h_l3078_c3_6b4d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4c02
BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4c02 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4c02_left,
BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4c02_right,
BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4c02_return_output);

-- t16_MUX_uxn_opcodes_h_l3081_c7_20e0
t16_MUX_uxn_opcodes_h_l3081_c7_20e0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3081_c7_20e0_cond,
t16_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue,
t16_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse,
t16_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_20e0
result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_20e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_20e0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_20e0
result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_20e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_20e0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_20e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_20e0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_20e0
result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_20e0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3081_c7_20e0
result_stack_value_MUX_uxn_opcodes_h_l3081_c7_20e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3081_c7_20e0_cond,
result_stack_value_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_20e0
result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_20e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_20e0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3084_c11_38af
BIN_OP_EQ_uxn_opcodes_h_l3084_c11_38af : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3084_c11_38af_left,
BIN_OP_EQ_uxn_opcodes_h_l3084_c11_38af_right,
BIN_OP_EQ_uxn_opcodes_h_l3084_c11_38af_return_output);

-- t16_MUX_uxn_opcodes_h_l3084_c7_f726
t16_MUX_uxn_opcodes_h_l3084_c7_f726 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l3084_c7_f726_cond,
t16_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue,
t16_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse,
t16_MUX_uxn_opcodes_h_l3084_c7_f726_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_f726
result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_f726 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_f726_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_f726_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_f726
result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_f726 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_f726_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_f726_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_f726
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_f726 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_f726_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_f726_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_f726
result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_f726 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_f726_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_f726_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3084_c7_f726
result_stack_value_MUX_uxn_opcodes_h_l3084_c7_f726 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3084_c7_f726_cond,
result_stack_value_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3084_c7_f726_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_f726
result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_f726 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_f726_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_f726_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l3085_c3_73c8
BIN_OP_OR_uxn_opcodes_h_l3085_c3_73c8 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l3085_c3_73c8_left,
BIN_OP_OR_uxn_opcodes_h_l3085_c3_73c8_right,
BIN_OP_OR_uxn_opcodes_h_l3085_c3_73c8_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3087_c32_d1e4
BIN_OP_AND_uxn_opcodes_h_l3087_c32_d1e4 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3087_c32_d1e4_left,
BIN_OP_AND_uxn_opcodes_h_l3087_c32_d1e4_right,
BIN_OP_AND_uxn_opcodes_h_l3087_c32_d1e4_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3087_c32_70a7
BIN_OP_GT_uxn_opcodes_h_l3087_c32_70a7 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3087_c32_70a7_left,
BIN_OP_GT_uxn_opcodes_h_l3087_c32_70a7_right,
BIN_OP_GT_uxn_opcodes_h_l3087_c32_70a7_return_output);

-- MUX_uxn_opcodes_h_l3087_c32_2ab8
MUX_uxn_opcodes_h_l3087_c32_2ab8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3087_c32_2ab8_cond,
MUX_uxn_opcodes_h_l3087_c32_2ab8_iftrue,
MUX_uxn_opcodes_h_l3087_c32_2ab8_iffalse,
MUX_uxn_opcodes_h_l3087_c32_2ab8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7d46
BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7d46 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7d46_left,
BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7d46_right,
BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7d46_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_101c
result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_101c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_101c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_101c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_101c
result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_101c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_101c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_101c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_101c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_101c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_101c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_101c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3089_c7_101c
result_stack_value_MUX_uxn_opcodes_h_l3089_c7_101c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3089_c7_101c_cond,
result_stack_value_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3089_c7_101c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_101c
result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_101c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_101c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_101c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cba0
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cba0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cba0_left,
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cba0_right,
BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cba0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_2f5a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_2f5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_2f5a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_2f5a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_2f5a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_2f5a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3095_c7_2f5a
result_stack_value_MUX_uxn_opcodes_h_l3095_c7_2f5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3095_c7_2f5a_cond,
result_stack_value_MUX_uxn_opcodes_h_l3095_c7_2f5a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3095_c7_2f5a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3095_c7_2f5a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_2f5a
result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_2f5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_2f5a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_2f5a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_2f5a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_2f5a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_2f5a
result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_2f5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_2f5a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_2f5a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_2f5a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_2f5a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3099_c11_7b75
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_7b75 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_7b75_left,
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_7b75_right,
BIN_OP_EQ_uxn_opcodes_h_l3099_c11_7b75_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_c691
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_c691 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_c691_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_c691_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_c691_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_c691_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3099_c7_c691
result_stack_value_MUX_uxn_opcodes_h_l3099_c7_c691 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3099_c7_c691_cond,
result_stack_value_MUX_uxn_opcodes_h_l3099_c7_c691_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3099_c7_c691_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3099_c7_c691_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_c691
result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_c691 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_c691_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_c691_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_c691_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_c691_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_c691
result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_c691 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_c691_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_c691_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_c691_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_c691_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3103_c11_aae3
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_aae3 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_aae3_left,
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_aae3_right,
BIN_OP_EQ_uxn_opcodes_h_l3103_c11_aae3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_7312
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_7312 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_7312_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_7312_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_7312_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_7312_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3103_c7_7312
result_stack_value_MUX_uxn_opcodes_h_l3103_c7_7312 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3103_c7_7312_cond,
result_stack_value_MUX_uxn_opcodes_h_l3103_c7_7312_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3103_c7_7312_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3103_c7_7312_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_7312
result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_7312 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_7312_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_7312_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_7312_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_7312_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_7312
result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_7312 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_7312_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_7312_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_7312_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_7312_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3107_c11_b08f
BIN_OP_EQ_uxn_opcodes_h_l3107_c11_b08f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3107_c11_b08f_left,
BIN_OP_EQ_uxn_opcodes_h_l3107_c11_b08f_right,
BIN_OP_EQ_uxn_opcodes_h_l3107_c11_b08f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_4c7e
result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_4c7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_4c7e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_4c7e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_4c7e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_4c7e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_4c7e
result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_4c7e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_4c7e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_4c7e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_4c7e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_4c7e_return_output);

-- CONST_SR_8_uint16_t_uxn_opcodes_h_l3105_l3097_DUPLICATE_63cf
CONST_SR_8_uint16_t_uxn_opcodes_h_l3105_l3097_DUPLICATE_63cf : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uint16_t_uxn_opcodes_h_l3105_l3097_DUPLICATE_63cf_x,
CONST_SR_8_uint16_t_uxn_opcodes_h_l3105_l3097_DUPLICATE_63cf_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l3068_c6_0b4c_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_875c_return_output,
 t16_MUX_uxn_opcodes_h_l3068_c2_c142_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_c142_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_c142_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_c142_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_c142_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3068_c2_c142_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_c142_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3073_c11_99b8_return_output,
 t16_MUX_uxn_opcodes_h_l3073_c7_5892_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_5892_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_5892_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_5892_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_5892_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3073_c7_5892_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_5892_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3076_c11_2721_return_output,
 t16_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output,
 CONST_SL_8_uxn_opcodes_h_l3078_c3_6b4d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4c02_return_output,
 t16_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3084_c11_38af_return_output,
 t16_MUX_uxn_opcodes_h_l3084_c7_f726_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_f726_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_f726_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_f726_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_f726_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3084_c7_f726_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_f726_return_output,
 BIN_OP_OR_uxn_opcodes_h_l3085_c3_73c8_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3087_c32_d1e4_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3087_c32_70a7_return_output,
 MUX_uxn_opcodes_h_l3087_c32_2ab8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7d46_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_101c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_101c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_101c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3089_c7_101c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_101c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cba0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_2f5a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3095_c7_2f5a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_2f5a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_2f5a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3099_c11_7b75_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_c691_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3099_c7_c691_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_c691_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_c691_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3103_c11_aae3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_7312_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3103_c7_7312_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_7312_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_7312_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3107_c11_b08f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_4c7e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_4c7e_return_output,
 CONST_SR_8_uint16_t_uxn_opcodes_h_l3105_l3097_DUPLICATE_63cf_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_0b4c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_0b4c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_0b4c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_875c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_875c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_875c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_875c_iffalse : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3073_c7_5892_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3068_c2_c142_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3068_c2_c142_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_5892_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_c142_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_c142_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_5892_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_c142_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_c142_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3070_c3_5df6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_5892_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_c142_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_c142_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_5892_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_c142_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_c142_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3073_c7_5892_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c2_c142_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c2_c142_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_5892_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_c142_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_c142_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3069_c3_8e11_uxn_opcodes_h_l3069_c3_8e11_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_99b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_99b8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_99b8_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3073_c7_5892_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_5892_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_5892_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3074_c3_b645 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_5892_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_5892_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3073_c7_5892_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_5892_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_2721_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_2721_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_2721_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3079_c3_7891 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l3078_c3_6b4d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l3078_c3_6b4d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4c02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4c02_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4c02_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3084_c7_f726_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3081_c7_20e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_f726_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_20e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_f726_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3082_c3_3e65 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_f726_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_20e0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_f726_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3084_c7_f726_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3081_c7_20e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_f726_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_20e0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_38af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_38af_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_38af_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l3084_c7_f726_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_101c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_f726_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_101c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_f726_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_101c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_f726_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_f726_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3089_c7_101c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3084_c7_f726_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_101c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_f726_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3085_c3_73c8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3085_c3_73c8_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l3085_c3_73c8_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3087_c32_2ab8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3087_c32_2ab8_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3087_c32_2ab8_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3087_c32_d1e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3087_c32_d1e4_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3087_c32_d1e4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3087_c32_70a7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3087_c32_70a7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3087_c32_70a7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3087_c32_2ab8_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7d46_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7d46_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7d46_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_2f5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_101c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_101c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3092_c3_1706 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_2f5a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_101c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_2f5a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3089_c7_101c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_2f5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_101c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cba0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cba0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cba0_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_2f5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3096_c3_d640 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_2f5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_c691_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_2f5a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_2f5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_2f5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_c691_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_2f5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_2f5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_2f5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_c691_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_2f5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_2f5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_2f5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_c691_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_2f5a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_7b75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_7b75_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_7b75_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_c691_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3100_c3_7fb9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_c691_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_7312_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_c691_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_c691_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_c691_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_7312_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_c691_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_c691_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_c691_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_7312_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_c691_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_c691_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_c691_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_7312_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_c691_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_aae3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_aae3_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_aae3_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_7312_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3104_c3_a898 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_7312_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_7312_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_7312_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_7312_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_7312_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_7312_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_7312_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_4c7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_7312_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_7312_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_7312_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_4c7e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_7312_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_b08f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_b08f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_b08f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_4c7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_4c7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_4c7e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_4c7e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_4c7e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_4c7e_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3103_l3073_l3099_l3068_l3095_l3084_l3081_l3107_l3076_DUPLICATE_3c56_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3073_l3068_l3089_l3081_l3076_DUPLICATE_6b9f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3073_l3068_l3084_l3081_l3076_DUPLICATE_a5ab_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3103_l3073_l3068_l3084_l3081_l3076_DUPLICATE_e72e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3103_l3073_l3099_l3095_l3089_l3084_l3081_l3107_l3076_DUPLICATE_9488_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3077_l3085_DUPLICATE_8463_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3103_l3084_DUPLICATE_7ae9_return_output : unsigned(7 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3093_l3101_DUPLICATE_67fa_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3105_l3097_DUPLICATE_63cf_x : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3105_l3097_DUPLICATE_63cf_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3105_l3097_DUPLICATE_97c6_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l3112_l3064_DUPLICATE_eaeb_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_0b4c_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_4c7e_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_99b8_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_38af_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3100_c3_7fb9 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_c691_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3100_c3_7fb9;
     VAR_MUX_uxn_opcodes_h_l3087_c32_2ab8_iffalse := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_4c7e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3087_c32_70a7_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3087_c32_d1e4_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4c02_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_aae3_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7d46_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_2721_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3092_c3_1706 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3092_c3_1706;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_7b75_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_b08f_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3070_c3_5df6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3070_c3_5df6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cba0_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3104_c3_a898 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_7312_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3104_c3_a898;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3079_c3_7891 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3079_c3_7891;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3074_c3_b645 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3074_c3_b645;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l3087_c32_2ab8_iftrue := signed(std_logic_vector(resize(to_unsigned(4, 3), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3096_c3_d640 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_2f5a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3096_c3_d640;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_875c_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3082_c3_3e65 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3082_c3_3e65;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_875c_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3087_c32_d1e4_left := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_0b4c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_99b8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_2721_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4c02_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_38af_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7d46_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cba0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_7b75_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_aae3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_b08f_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3085_c3_73c8_left := t16;
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3105_l3097_DUPLICATE_63cf_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3103_l3073_l3099_l3068_l3095_l3084_l3081_l3107_l3076_DUPLICATE_3c56 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3103_l3073_l3099_l3068_l3095_l3084_l3081_l3107_l3076_DUPLICATE_3c56_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3103_l3073_l3099_l3095_l3089_l3084_l3081_l3107_l3076_DUPLICATE_9488 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3103_l3073_l3099_l3095_l3089_l3084_l3081_l3107_l3076_DUPLICATE_9488_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l3081_c11_4c02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4c02_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4c02_left;
     BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4c02_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4c02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4c02_return_output := BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4c02_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3099_c11_7b75] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3099_c11_7b75_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_7b75_left;
     BIN_OP_EQ_uxn_opcodes_h_l3099_c11_7b75_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_7b75_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_7b75_return_output := BIN_OP_EQ_uxn_opcodes_h_l3099_c11_7b75_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3103_c11_aae3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3103_c11_aae3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_aae3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3103_c11_aae3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_aae3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_aae3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3103_c11_aae3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3084_c11_38af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3084_c11_38af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_38af_left;
     BIN_OP_EQ_uxn_opcodes_h_l3084_c11_38af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_38af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_38af_return_output := BIN_OP_EQ_uxn_opcodes_h_l3084_c11_38af_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3073_l3068_l3089_l3081_l3076_DUPLICATE_6b9f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3073_l3068_l3089_l3081_l3076_DUPLICATE_6b9f_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l3087_c32_d1e4] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3087_c32_d1e4_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3087_c32_d1e4_left;
     BIN_OP_AND_uxn_opcodes_h_l3087_c32_d1e4_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3087_c32_d1e4_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3087_c32_d1e4_return_output := BIN_OP_AND_uxn_opcodes_h_l3087_c32_d1e4_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3103_l3084_DUPLICATE_7ae9 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3103_l3084_DUPLICATE_7ae9_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l3068_c6_0b4c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3068_c6_0b4c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_0b4c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3068_c6_0b4c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_0b4c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_0b4c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3068_c6_0b4c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3107_c11_b08f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3107_c11_b08f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_b08f_left;
     BIN_OP_EQ_uxn_opcodes_h_l3107_c11_b08f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_b08f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_b08f_return_output := BIN_OP_EQ_uxn_opcodes_h_l3107_c11_b08f_return_output;

     -- CONST_SR_8_uint16_t_uxn_opcodes_h_l3105_l3097_DUPLICATE_63cf LATENCY=0
     -- Inputs
     CONST_SR_8_uint16_t_uxn_opcodes_h_l3105_l3097_DUPLICATE_63cf_x <= VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3105_l3097_DUPLICATE_63cf_x;
     -- Outputs
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3105_l3097_DUPLICATE_63cf_return_output := CONST_SR_8_uint16_t_uxn_opcodes_h_l3105_l3097_DUPLICATE_63cf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3089_c11_7d46] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7d46_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7d46_left;
     BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7d46_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7d46_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7d46_return_output := BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7d46_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3093_l3101_DUPLICATE_67fa LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3093_l3101_DUPLICATE_67fa_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l3095_c11_cba0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cba0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cba0_left;
     BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cba0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cba0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cba0_return_output := BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cba0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3076_c11_2721] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3076_c11_2721_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_2721_left;
     BIN_OP_EQ_uxn_opcodes_h_l3076_c11_2721_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_2721_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_2721_return_output := BIN_OP_EQ_uxn_opcodes_h_l3076_c11_2721_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3077_l3085_DUPLICATE_8463 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3077_l3085_DUPLICATE_8463_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l3073_c11_99b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3073_c11_99b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_99b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l3073_c11_99b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_99b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_99b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l3073_c11_99b8_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3103_l3073_l3068_l3084_l3081_l3076_DUPLICATE_e72e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3103_l3073_l3068_l3084_l3081_l3076_DUPLICATE_e72e_return_output := result.stack_value;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3073_l3068_l3084_l3081_l3076_DUPLICATE_a5ab LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3073_l3068_l3084_l3081_l3076_DUPLICATE_a5ab_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l3087_c32_70a7_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3087_c32_d1e4_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_875c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_0b4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_c142_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_0b4c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_c142_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_0b4c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_c142_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_0b4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_c142_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_0b4c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_c142_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_0b4c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c2_c142_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_0b4c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3068_c2_c142_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3068_c6_0b4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_5892_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_99b8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_5892_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_99b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_5892_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_99b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_5892_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_99b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_5892_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_99b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3073_c7_5892_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_99b8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3073_c7_5892_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3073_c11_99b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_2721_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_2721_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_2721_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_2721_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_2721_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_2721_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3076_c11_2721_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_20e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4c02_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4c02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_20e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4c02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4c02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_20e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4c02_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3081_c7_20e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4c02_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3081_c7_20e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3081_c11_4c02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_f726_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_38af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_f726_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_38af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_f726_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_38af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_f726_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_38af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_f726_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_38af_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3084_c7_f726_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_38af_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3084_c7_f726_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3084_c11_38af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_101c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7d46_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_101c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7d46_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_101c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7d46_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_101c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7d46_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3089_c7_101c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3089_c11_7d46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_2f5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cba0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_2f5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cba0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_2f5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cba0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_2f5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3095_c11_cba0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_c691_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_7b75_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_c691_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_7b75_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_c691_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_7b75_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_c691_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3099_c11_7b75_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_7312_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_aae3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_7312_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_aae3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_7312_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_aae3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_7312_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3103_c11_aae3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_4c7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_b08f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_4c7e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3107_c11_b08f_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l3085_c3_73c8_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3077_l3085_DUPLICATE_8463_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l3078_c3_6b4d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l3077_l3085_DUPLICATE_8463_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3093_l3101_DUPLICATE_67fa_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_c691_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3093_l3101_DUPLICATE_67fa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3073_l3068_l3084_l3081_l3076_DUPLICATE_a5ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3073_l3068_l3084_l3081_l3076_DUPLICATE_a5ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3073_l3068_l3084_l3081_l3076_DUPLICATE_a5ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3073_l3068_l3084_l3081_l3076_DUPLICATE_a5ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3073_l3068_l3084_l3081_l3076_DUPLICATE_a5ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3103_l3073_l3099_l3095_l3089_l3084_l3081_l3107_l3076_DUPLICATE_9488_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3103_l3073_l3099_l3095_l3089_l3084_l3081_l3107_l3076_DUPLICATE_9488_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3103_l3073_l3099_l3095_l3089_l3084_l3081_l3107_l3076_DUPLICATE_9488_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3103_l3073_l3099_l3095_l3089_l3084_l3081_l3107_l3076_DUPLICATE_9488_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3103_l3073_l3099_l3095_l3089_l3084_l3081_l3107_l3076_DUPLICATE_9488_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_2f5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3103_l3073_l3099_l3095_l3089_l3084_l3081_l3107_l3076_DUPLICATE_9488_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_c691_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3103_l3073_l3099_l3095_l3089_l3084_l3081_l3107_l3076_DUPLICATE_9488_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_7312_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3103_l3073_l3099_l3095_l3089_l3084_l3081_l3107_l3076_DUPLICATE_9488_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_4c7e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3103_l3073_l3099_l3095_l3089_l3084_l3081_l3107_l3076_DUPLICATE_9488_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3073_l3068_l3089_l3081_l3076_DUPLICATE_6b9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3073_l3068_l3089_l3081_l3076_DUPLICATE_6b9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3073_l3068_l3089_l3081_l3076_DUPLICATE_6b9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3073_l3068_l3089_l3081_l3076_DUPLICATE_6b9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3073_l3068_l3089_l3081_l3076_DUPLICATE_6b9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3103_l3073_l3099_l3068_l3095_l3084_l3081_l3107_l3076_DUPLICATE_3c56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3103_l3073_l3099_l3068_l3095_l3084_l3081_l3107_l3076_DUPLICATE_3c56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3103_l3073_l3099_l3068_l3095_l3084_l3081_l3107_l3076_DUPLICATE_3c56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3103_l3073_l3099_l3068_l3095_l3084_l3081_l3107_l3076_DUPLICATE_3c56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3103_l3073_l3099_l3068_l3095_l3084_l3081_l3107_l3076_DUPLICATE_3c56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_2f5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3103_l3073_l3099_l3068_l3095_l3084_l3081_l3107_l3076_DUPLICATE_3c56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_c691_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3103_l3073_l3099_l3068_l3095_l3084_l3081_l3107_l3076_DUPLICATE_3c56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_7312_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3103_l3073_l3099_l3068_l3095_l3084_l3081_l3107_l3076_DUPLICATE_3c56_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_4c7e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3103_l3073_l3099_l3068_l3095_l3084_l3081_l3107_l3076_DUPLICATE_3c56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3103_l3084_DUPLICATE_7ae9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_7312_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3103_l3084_DUPLICATE_7ae9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3103_l3073_l3068_l3084_l3081_l3076_DUPLICATE_e72e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3103_l3073_l3068_l3084_l3081_l3076_DUPLICATE_e72e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3103_l3073_l3068_l3084_l3081_l3076_DUPLICATE_e72e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3103_l3073_l3068_l3084_l3081_l3076_DUPLICATE_e72e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3103_l3073_l3068_l3084_l3081_l3076_DUPLICATE_e72e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_7312_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3103_l3073_l3068_l3084_l3081_l3076_DUPLICATE_e72e_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l3087_c32_70a7] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3087_c32_70a7_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3087_c32_70a7_left;
     BIN_OP_GT_uxn_opcodes_h_l3087_c32_70a7_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3087_c32_70a7_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3087_c32_70a7_return_output := BIN_OP_GT_uxn_opcodes_h_l3087_c32_70a7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3103_c7_7312] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_7312_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_7312_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_7312_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_7312_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_7312_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_7312_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_7312_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_7312_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3107_c7_4c7e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_4c7e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_4c7e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_4c7e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_4c7e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_4c7e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_4c7e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_4c7e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_4c7e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3107_c7_4c7e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_4c7e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_4c7e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_4c7e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_4c7e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_4c7e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_4c7e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_4c7e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_4c7e_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l3078_c3_6b4d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l3078_c3_6b4d_x <= VAR_CONST_SL_8_uxn_opcodes_h_l3078_c3_6b4d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l3078_c3_6b4d_return_output := CONST_SL_8_uxn_opcodes_h_l3078_c3_6b4d_return_output;

     -- CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3105_l3097_DUPLICATE_97c6 LATENCY=0
     VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3105_l3097_DUPLICATE_97c6_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uint16_t_uxn_opcodes_h_l3105_l3097_DUPLICATE_63cf_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3068_c1_875c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_875c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_875c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_875c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_875c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_875c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_875c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_875c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_875c_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l3085_c3_73c8] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l3085_c3_73c8_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l3085_c3_73c8_left;
     BIN_OP_OR_uxn_opcodes_h_l3085_c3_73c8_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l3085_c3_73c8_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l3085_c3_73c8_return_output := BIN_OP_OR_uxn_opcodes_h_l3085_c3_73c8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3089_c7_101c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_101c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_101c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_101c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_101c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l3087_c32_2ab8_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3087_c32_70a7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l3085_c3_73c8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_2f5a_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3105_l3097_DUPLICATE_97c6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_7312_iftrue := VAR_CAST_TO_uint8_t_uint16_t_uxn_opcodes_h_l3105_l3097_DUPLICATE_97c6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l3078_c3_6b4d_return_output;
     VAR_printf_uxn_opcodes_h_l3069_c3_8e11_uxn_opcodes_h_l3069_c3_8e11_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3068_c1_875c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_7312_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3107_c7_4c7e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3089_c7_101c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_7312_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3107_c7_4c7e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_c691_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3103_c7_7312_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3103_c7_7312] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_7312_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_7312_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_7312_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_7312_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_7312_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_7312_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_7312_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_7312_return_output;

     -- printf_uxn_opcodes_h_l3069_c3_8e11[uxn_opcodes_h_l3069_c3_8e11] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3069_c3_8e11_uxn_opcodes_h_l3069_c3_8e11_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3069_c3_8e11_uxn_opcodes_h_l3069_c3_8e11_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3099_c7_c691] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_c691_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_c691_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_c691_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_c691_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_c691_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_c691_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_c691_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_c691_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3103_c7_7312] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3103_c7_7312_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_7312_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3103_c7_7312_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_7312_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3103_c7_7312_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_7312_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_7312_return_output := result_stack_value_MUX_uxn_opcodes_h_l3103_c7_7312_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3103_c7_7312] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_7312_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_7312_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_7312_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_7312_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_7312_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_7312_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_7312_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_7312_return_output;

     -- MUX[uxn_opcodes_h_l3087_c32_2ab8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3087_c32_2ab8_cond <= VAR_MUX_uxn_opcodes_h_l3087_c32_2ab8_cond;
     MUX_uxn_opcodes_h_l3087_c32_2ab8_iftrue <= VAR_MUX_uxn_opcodes_h_l3087_c32_2ab8_iftrue;
     MUX_uxn_opcodes_h_l3087_c32_2ab8_iffalse <= VAR_MUX_uxn_opcodes_h_l3087_c32_2ab8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3087_c32_2ab8_return_output := MUX_uxn_opcodes_h_l3087_c32_2ab8_return_output;

     -- t16_MUX[uxn_opcodes_h_l3084_c7_f726] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3084_c7_f726_cond <= VAR_t16_MUX_uxn_opcodes_h_l3084_c7_f726_cond;
     t16_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue;
     t16_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3084_c7_f726_return_output := t16_MUX_uxn_opcodes_h_l3084_c7_f726_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3084_c7_f726] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_f726_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_f726_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_f726_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_f726_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue := VAR_MUX_uxn_opcodes_h_l3087_c32_2ab8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_c691_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3103_c7_7312_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3084_c7_f726_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_c691_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3103_c7_7312_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_2f5a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3099_c7_c691_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_c691_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3103_c7_7312_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3084_c7_f726_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3099_c7_c691] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_c691_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_c691_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_c691_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_c691_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_c691_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_c691_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_c691_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_c691_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3095_c7_2f5a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_2f5a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_2f5a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_2f5a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_2f5a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_2f5a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_2f5a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_2f5a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_2f5a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3084_c7_f726] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_f726_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_f726_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_f726_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_f726_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3099_c7_c691] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3099_c7_c691_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_c691_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3099_c7_c691_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_c691_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3099_c7_c691_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_c691_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_c691_return_output := result_stack_value_MUX_uxn_opcodes_h_l3099_c7_c691_return_output;

     -- t16_MUX[uxn_opcodes_h_l3081_c7_20e0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3081_c7_20e0_cond <= VAR_t16_MUX_uxn_opcodes_h_l3081_c7_20e0_cond;
     t16_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue;
     t16_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output := t16_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3099_c7_c691] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_c691_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_c691_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_c691_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_c691_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_c691_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_c691_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_c691_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_c691_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3081_c7_20e0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_2f5a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3099_c7_c691_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_2f5a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3099_c7_c691_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3084_c7_f726_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3095_c7_2f5a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_2f5a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3099_c7_c691_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3095_c7_2f5a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_2f5a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_2f5a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_2f5a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_2f5a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_2f5a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_2f5a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_2f5a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_2f5a_return_output;

     -- t16_MUX[uxn_opcodes_h_l3076_c7_c8e8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond <= VAR_t16_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond;
     t16_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue;
     t16_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output := t16_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3089_c7_101c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_101c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_101c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_101c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_101c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3076_c7_c8e8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3095_c7_2f5a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_2f5a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_2f5a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_2f5a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_2f5a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_2f5a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_2f5a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_2f5a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_2f5a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3095_c7_2f5a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3095_c7_2f5a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_2f5a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3095_c7_2f5a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_2f5a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3095_c7_2f5a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_2f5a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_2f5a_return_output := result_stack_value_MUX_uxn_opcodes_h_l3095_c7_2f5a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3081_c7_20e0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3095_c7_2f5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3095_c7_2f5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3089_c7_101c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3095_c7_2f5a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l3089_c7_101c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3089_c7_101c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3089_c7_101c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3089_c7_101c_return_output := result_stack_value_MUX_uxn_opcodes_h_l3089_c7_101c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3084_c7_f726] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_f726_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_f726_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_f726_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_f726_return_output;

     -- t16_MUX[uxn_opcodes_h_l3073_c7_5892] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3073_c7_5892_cond <= VAR_t16_MUX_uxn_opcodes_h_l3073_c7_5892_cond;
     t16_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue;
     t16_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3073_c7_5892_return_output := t16_MUX_uxn_opcodes_h_l3073_c7_5892_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3076_c7_c8e8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3089_c7_101c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_101c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_101c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_101c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_101c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3089_c7_101c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_101c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_101c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_101c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_101c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_101c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_101c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3073_c7_5892] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_5892_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_5892_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_5892_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_5892_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3089_c7_101c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3073_c7_5892_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3089_c7_101c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3084_c7_f726_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3089_c7_101c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse := VAR_t16_MUX_uxn_opcodes_h_l3073_c7_5892_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l3084_c7_f726] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3084_c7_f726_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3084_c7_f726_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3084_c7_f726_return_output := result_stack_value_MUX_uxn_opcodes_h_l3084_c7_f726_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3084_c7_f726] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_f726_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_f726_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_f726_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_f726_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3081_c7_20e0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_20e0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_20e0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3084_c7_f726] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_f726_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_f726_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_f726_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_f726_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_f726_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_f726_return_output;

     -- t16_MUX[uxn_opcodes_h_l3068_c2_c142] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l3068_c2_c142_cond <= VAR_t16_MUX_uxn_opcodes_h_l3068_c2_c142_cond;
     t16_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue;
     t16_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l3068_c2_c142_return_output := t16_MUX_uxn_opcodes_h_l3068_c2_c142_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3068_c2_c142] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_c142_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_c142_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_c142_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_c142_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3073_c7_5892] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_5892_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_5892_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_5892_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_5892_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3084_c7_f726_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3084_c7_f726_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3073_c7_5892_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3084_c7_f726_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l3068_c2_c142_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3068_c2_c142] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_c142_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_c142_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_c142_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_c142_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3081_c7_20e0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_20e0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_20e0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3076_c7_c8e8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3081_c7_20e0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3081_c7_20e0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3081_c7_20e0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output := result_stack_value_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3081_c7_20e0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_20e0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_20e0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_20e0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_20e0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3081_c7_20e0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3076_c7_c8e8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3076_c7_c8e8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output := result_stack_value_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3073_c7_5892] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_5892_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_5892_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_5892_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_5892_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3076_c7_c8e8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_c8e8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_c8e8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_c8e8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3073_c7_5892_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3076_c7_c8e8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3068_c2_c142] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_c142_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_c142_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_c142_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_c142_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3073_c7_5892] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3073_c7_5892_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3073_c7_5892_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3073_c7_5892_return_output := result_stack_value_MUX_uxn_opcodes_h_l3073_c7_5892_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3073_c7_5892] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_5892_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_5892_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_5892_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_5892_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3073_c7_5892] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_5892_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_5892_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_5892_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_5892_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_5892_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_5892_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3073_c7_5892_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3073_c7_5892_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3073_c7_5892_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3068_c2_c142] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_c142_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_c142_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_c142_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_c142_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3068_c2_c142] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_c142_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_c142_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_c142_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_c142_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3068_c2_c142] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3068_c2_c142_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c2_c142_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c2_c142_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c2_c142_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c2_c142_return_output := result_stack_value_MUX_uxn_opcodes_h_l3068_c2_c142_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l3112_l3064_DUPLICATE_eaeb LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l3112_l3064_DUPLICATE_eaeb_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3068_c2_c142_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3068_c2_c142_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3068_c2_c142_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3068_c2_c142_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3068_c2_c142_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3068_c2_c142_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l3112_l3064_DUPLICATE_eaeb_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l3112_l3064_DUPLICATE_eaeb_return_output;
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
