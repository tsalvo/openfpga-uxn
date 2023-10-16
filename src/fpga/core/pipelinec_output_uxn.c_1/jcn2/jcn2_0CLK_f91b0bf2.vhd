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
-- Submodules: 75
entity jcn2_0CLK_f91b0bf2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jcn2_0CLK_f91b0bf2;
architecture arch of jcn2_0CLK_f91b0bf2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l721_c6_deeb]
signal BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l721_c1_1a03]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1a03_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1a03_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1a03_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1a03_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l721_c2_6d13]
signal n8_MUX_uxn_opcodes_h_l721_c2_6d13_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l721_c2_6d13_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l721_c2_6d13]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_6d13_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_6d13_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l721_c2_6d13]
signal result_u16_value_MUX_uxn_opcodes_h_l721_c2_6d13_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l721_c2_6d13_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l721_c2_6d13]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_6d13_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_6d13_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l721_c2_6d13]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_6d13_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_6d13_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l721_c2_6d13]
signal result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_6d13_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_6d13_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l721_c2_6d13]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_6d13_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_6d13_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l721_c2_6d13]
signal t16_MUX_uxn_opcodes_h_l721_c2_6d13_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l721_c2_6d13_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l722_c3_88e4[uxn_opcodes_h_l722_c3_88e4]
signal printf_uxn_opcodes_h_l722_c3_88e4_uxn_opcodes_h_l722_c3_88e4_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l726_c11_1c89]
signal BIN_OP_EQ_uxn_opcodes_h_l726_c11_1c89_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l726_c11_1c89_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l726_c11_1c89_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l726_c7_9487]
signal n8_MUX_uxn_opcodes_h_l726_c7_9487_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l726_c7_9487_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l726_c7_9487_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l726_c7_9487_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l726_c7_9487]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_9487_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_9487_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_9487_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_9487_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l726_c7_9487]
signal result_u16_value_MUX_uxn_opcodes_h_l726_c7_9487_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l726_c7_9487_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l726_c7_9487_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l726_c7_9487_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l726_c7_9487]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_9487_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_9487_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_9487_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_9487_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l726_c7_9487]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_9487_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_9487_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_9487_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_9487_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l726_c7_9487]
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_9487_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_9487_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_9487_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_9487_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l726_c7_9487]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_9487_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_9487_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_9487_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_9487_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l726_c7_9487]
signal t16_MUX_uxn_opcodes_h_l726_c7_9487_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l726_c7_9487_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l726_c7_9487_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l726_c7_9487_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l729_c11_e984]
signal BIN_OP_EQ_uxn_opcodes_h_l729_c11_e984_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l729_c11_e984_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l729_c11_e984_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l729_c7_2234]
signal n8_MUX_uxn_opcodes_h_l729_c7_2234_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l729_c7_2234_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l729_c7_2234_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l729_c7_2234_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l729_c7_2234]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_2234_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_2234_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_2234_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_2234_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l729_c7_2234]
signal result_u16_value_MUX_uxn_opcodes_h_l729_c7_2234_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l729_c7_2234_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l729_c7_2234_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l729_c7_2234_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l729_c7_2234]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_2234_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_2234_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_2234_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_2234_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l729_c7_2234]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_2234_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_2234_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_2234_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_2234_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l729_c7_2234]
signal result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_2234_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_2234_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_2234_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_2234_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l729_c7_2234]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_2234_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_2234_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_2234_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_2234_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l729_c7_2234]
signal t16_MUX_uxn_opcodes_h_l729_c7_2234_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l729_c7_2234_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l729_c7_2234_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l729_c7_2234_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l731_c3_f411]
signal CONST_SL_8_uxn_opcodes_h_l731_c3_f411_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l731_c3_f411_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l734_c11_c0f2]
signal BIN_OP_EQ_uxn_opcodes_h_l734_c11_c0f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l734_c11_c0f2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l734_c11_c0f2_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l734_c7_1b82]
signal n8_MUX_uxn_opcodes_h_l734_c7_1b82_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l734_c7_1b82_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l734_c7_1b82]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1b82_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1b82_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l734_c7_1b82]
signal result_u16_value_MUX_uxn_opcodes_h_l734_c7_1b82_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l734_c7_1b82_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l734_c7_1b82]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1b82_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1b82_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l734_c7_1b82]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1b82_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1b82_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l734_c7_1b82]
signal result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1b82_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1b82_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l734_c7_1b82]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1b82_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1b82_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l734_c7_1b82]
signal t16_MUX_uxn_opcodes_h_l734_c7_1b82_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l734_c7_1b82_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l737_c11_3d3a]
signal BIN_OP_EQ_uxn_opcodes_h_l737_c11_3d3a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l737_c11_3d3a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l737_c11_3d3a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l737_c7_7f8a]
signal n8_MUX_uxn_opcodes_h_l737_c7_7f8a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l737_c7_7f8a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l737_c7_7f8a]
signal result_u16_value_MUX_uxn_opcodes_h_l737_c7_7f8a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l737_c7_7f8a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7f8a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l737_c7_7f8a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l737_c7_7f8a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7f8a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l737_c7_7f8a]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7f8a_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l737_c7_7f8a]
signal t16_MUX_uxn_opcodes_h_l737_c7_7f8a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l738_c3_bd23]
signal BIN_OP_OR_uxn_opcodes_h_l738_c3_bd23_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l738_c3_bd23_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l738_c3_bd23_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l741_c11_cb3c]
signal BIN_OP_EQ_uxn_opcodes_h_l741_c11_cb3c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l741_c11_cb3c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l741_c11_cb3c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l741_c7_82f7]
signal n8_MUX_uxn_opcodes_h_l741_c7_82f7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l741_c7_82f7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l741_c7_82f7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_82f7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_82f7_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l741_c7_82f7]
signal result_u16_value_MUX_uxn_opcodes_h_l741_c7_82f7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l741_c7_82f7_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l741_c7_82f7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_82f7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_82f7_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l741_c7_82f7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_82f7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_82f7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l741_c7_82f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_82f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_82f7_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l741_c7_82f7]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_82f7_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_82f7_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l744_c11_928b]
signal BIN_OP_EQ_uxn_opcodes_h_l744_c11_928b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l744_c11_928b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l744_c11_928b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l744_c7_8dfb]
signal n8_MUX_uxn_opcodes_h_l744_c7_8dfb_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l744_c7_8dfb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l744_c7_8dfb]
signal result_u16_value_MUX_uxn_opcodes_h_l744_c7_8dfb_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l744_c7_8dfb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l744_c7_8dfb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_8dfb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l744_c7_8dfb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_8dfb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l747_c30_7329]
signal sp_relative_shift_uxn_opcodes_h_l747_c30_7329_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l747_c30_7329_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l747_c30_7329_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l747_c30_7329_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l748_c26_5159]
signal BIN_OP_EQ_uxn_opcodes_h_l748_c26_5159_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l748_c26_5159_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l748_c26_5159_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l748_c26_57a8]
signal MUX_uxn_opcodes_h_l748_c26_57a8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l748_c26_57a8_iftrue : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l748_c26_57a8_iffalse : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l748_c26_57a8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l749_c22_2380]
signal BIN_OP_EQ_uxn_opcodes_h_l749_c22_2380_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l749_c22_2380_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l749_c22_2380_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l749_c22_ba91]
signal MUX_uxn_opcodes_h_l749_c22_ba91_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l749_c22_ba91_iftrue : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l749_c22_ba91_iffalse : unsigned(15 downto 0);
signal MUX_uxn_opcodes_h_l749_c22_ba91_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l751_c11_69e4]
signal BIN_OP_EQ_uxn_opcodes_h_l751_c11_69e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l751_c11_69e4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l751_c11_69e4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l751_c7_99bb]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_99bb_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_99bb_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_99bb_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_99bb_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l751_c7_99bb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_99bb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_99bb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_99bb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_99bb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l751_c7_99bb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_99bb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_99bb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_99bb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_99bb_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_fc62( ref_toks_0 : opcode_result_t;
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
      base.u16_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_pc_updated := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb
BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb_left,
BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb_right,
BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1a03
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1a03 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1a03_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1a03_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1a03_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1a03_return_output);

-- n8_MUX_uxn_opcodes_h_l721_c2_6d13
n8_MUX_uxn_opcodes_h_l721_c2_6d13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l721_c2_6d13_cond,
n8_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue,
n8_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse,
n8_MUX_uxn_opcodes_h_l721_c2_6d13_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_6d13
result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_6d13 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_6d13_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_6d13_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l721_c2_6d13
result_u16_value_MUX_uxn_opcodes_h_l721_c2_6d13 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l721_c2_6d13_cond,
result_u16_value_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l721_c2_6d13_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_6d13
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_6d13 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_6d13_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_6d13_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_6d13
result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_6d13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_6d13_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_6d13_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_6d13
result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_6d13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_6d13_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_6d13_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_6d13
result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_6d13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_6d13_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_6d13_return_output);

-- t16_MUX_uxn_opcodes_h_l721_c2_6d13
t16_MUX_uxn_opcodes_h_l721_c2_6d13 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l721_c2_6d13_cond,
t16_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue,
t16_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse,
t16_MUX_uxn_opcodes_h_l721_c2_6d13_return_output);

-- printf_uxn_opcodes_h_l722_c3_88e4_uxn_opcodes_h_l722_c3_88e4
printf_uxn_opcodes_h_l722_c3_88e4_uxn_opcodes_h_l722_c3_88e4 : entity work.printf_uxn_opcodes_h_l722_c3_88e4_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l722_c3_88e4_uxn_opcodes_h_l722_c3_88e4_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l726_c11_1c89
BIN_OP_EQ_uxn_opcodes_h_l726_c11_1c89 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l726_c11_1c89_left,
BIN_OP_EQ_uxn_opcodes_h_l726_c11_1c89_right,
BIN_OP_EQ_uxn_opcodes_h_l726_c11_1c89_return_output);

-- n8_MUX_uxn_opcodes_h_l726_c7_9487
n8_MUX_uxn_opcodes_h_l726_c7_9487 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l726_c7_9487_cond,
n8_MUX_uxn_opcodes_h_l726_c7_9487_iftrue,
n8_MUX_uxn_opcodes_h_l726_c7_9487_iffalse,
n8_MUX_uxn_opcodes_h_l726_c7_9487_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_9487
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_9487 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_9487_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_9487_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_9487_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_9487_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l726_c7_9487
result_u16_value_MUX_uxn_opcodes_h_l726_c7_9487 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l726_c7_9487_cond,
result_u16_value_MUX_uxn_opcodes_h_l726_c7_9487_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l726_c7_9487_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l726_c7_9487_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_9487
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_9487 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_9487_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_9487_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_9487_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_9487_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_9487
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_9487 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_9487_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_9487_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_9487_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_9487_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_9487
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_9487 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_9487_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_9487_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_9487_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_9487_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_9487
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_9487 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_9487_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_9487_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_9487_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_9487_return_output);

-- t16_MUX_uxn_opcodes_h_l726_c7_9487
t16_MUX_uxn_opcodes_h_l726_c7_9487 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l726_c7_9487_cond,
t16_MUX_uxn_opcodes_h_l726_c7_9487_iftrue,
t16_MUX_uxn_opcodes_h_l726_c7_9487_iffalse,
t16_MUX_uxn_opcodes_h_l726_c7_9487_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l729_c11_e984
BIN_OP_EQ_uxn_opcodes_h_l729_c11_e984 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l729_c11_e984_left,
BIN_OP_EQ_uxn_opcodes_h_l729_c11_e984_right,
BIN_OP_EQ_uxn_opcodes_h_l729_c11_e984_return_output);

-- n8_MUX_uxn_opcodes_h_l729_c7_2234
n8_MUX_uxn_opcodes_h_l729_c7_2234 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l729_c7_2234_cond,
n8_MUX_uxn_opcodes_h_l729_c7_2234_iftrue,
n8_MUX_uxn_opcodes_h_l729_c7_2234_iffalse,
n8_MUX_uxn_opcodes_h_l729_c7_2234_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_2234
result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_2234 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_2234_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_2234_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_2234_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_2234_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l729_c7_2234
result_u16_value_MUX_uxn_opcodes_h_l729_c7_2234 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l729_c7_2234_cond,
result_u16_value_MUX_uxn_opcodes_h_l729_c7_2234_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l729_c7_2234_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l729_c7_2234_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_2234
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_2234 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_2234_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_2234_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_2234_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_2234_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_2234
result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_2234 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_2234_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_2234_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_2234_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_2234_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_2234
result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_2234 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_2234_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_2234_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_2234_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_2234_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_2234
result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_2234 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_2234_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_2234_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_2234_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_2234_return_output);

-- t16_MUX_uxn_opcodes_h_l729_c7_2234
t16_MUX_uxn_opcodes_h_l729_c7_2234 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l729_c7_2234_cond,
t16_MUX_uxn_opcodes_h_l729_c7_2234_iftrue,
t16_MUX_uxn_opcodes_h_l729_c7_2234_iffalse,
t16_MUX_uxn_opcodes_h_l729_c7_2234_return_output);

-- CONST_SL_8_uxn_opcodes_h_l731_c3_f411
CONST_SL_8_uxn_opcodes_h_l731_c3_f411 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l731_c3_f411_x,
CONST_SL_8_uxn_opcodes_h_l731_c3_f411_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l734_c11_c0f2
BIN_OP_EQ_uxn_opcodes_h_l734_c11_c0f2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l734_c11_c0f2_left,
BIN_OP_EQ_uxn_opcodes_h_l734_c11_c0f2_right,
BIN_OP_EQ_uxn_opcodes_h_l734_c11_c0f2_return_output);

-- n8_MUX_uxn_opcodes_h_l734_c7_1b82
n8_MUX_uxn_opcodes_h_l734_c7_1b82 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l734_c7_1b82_cond,
n8_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue,
n8_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse,
n8_MUX_uxn_opcodes_h_l734_c7_1b82_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1b82
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1b82 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1b82_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1b82_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l734_c7_1b82
result_u16_value_MUX_uxn_opcodes_h_l734_c7_1b82 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l734_c7_1b82_cond,
result_u16_value_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l734_c7_1b82_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1b82
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1b82 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1b82_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1b82_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1b82
result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1b82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1b82_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1b82_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1b82
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1b82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1b82_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1b82_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1b82
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1b82 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1b82_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1b82_return_output);

-- t16_MUX_uxn_opcodes_h_l734_c7_1b82
t16_MUX_uxn_opcodes_h_l734_c7_1b82 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l734_c7_1b82_cond,
t16_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue,
t16_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse,
t16_MUX_uxn_opcodes_h_l734_c7_1b82_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l737_c11_3d3a
BIN_OP_EQ_uxn_opcodes_h_l737_c11_3d3a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l737_c11_3d3a_left,
BIN_OP_EQ_uxn_opcodes_h_l737_c11_3d3a_right,
BIN_OP_EQ_uxn_opcodes_h_l737_c11_3d3a_return_output);

-- n8_MUX_uxn_opcodes_h_l737_c7_7f8a
n8_MUX_uxn_opcodes_h_l737_c7_7f8a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l737_c7_7f8a_cond,
n8_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue,
n8_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse,
n8_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7f8a
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7f8a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l737_c7_7f8a
result_u16_value_MUX_uxn_opcodes_h_l737_c7_7f8a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l737_c7_7f8a_cond,
result_u16_value_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7f8a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7f8a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7f8a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7f8a
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7f8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7f8a
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7f8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7f8a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7f8a
result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7f8a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7f8a_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output);

-- t16_MUX_uxn_opcodes_h_l737_c7_7f8a
t16_MUX_uxn_opcodes_h_l737_c7_7f8a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l737_c7_7f8a_cond,
t16_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue,
t16_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse,
t16_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l738_c3_bd23
BIN_OP_OR_uxn_opcodes_h_l738_c3_bd23 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l738_c3_bd23_left,
BIN_OP_OR_uxn_opcodes_h_l738_c3_bd23_right,
BIN_OP_OR_uxn_opcodes_h_l738_c3_bd23_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l741_c11_cb3c
BIN_OP_EQ_uxn_opcodes_h_l741_c11_cb3c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l741_c11_cb3c_left,
BIN_OP_EQ_uxn_opcodes_h_l741_c11_cb3c_right,
BIN_OP_EQ_uxn_opcodes_h_l741_c11_cb3c_return_output);

-- n8_MUX_uxn_opcodes_h_l741_c7_82f7
n8_MUX_uxn_opcodes_h_l741_c7_82f7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l741_c7_82f7_cond,
n8_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue,
n8_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse,
n8_MUX_uxn_opcodes_h_l741_c7_82f7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_82f7
result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_82f7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_82f7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_82f7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l741_c7_82f7
result_u16_value_MUX_uxn_opcodes_h_l741_c7_82f7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l741_c7_82f7_cond,
result_u16_value_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l741_c7_82f7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_82f7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_82f7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_82f7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_82f7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_82f7
result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_82f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_82f7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_82f7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_82f7
result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_82f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_82f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_82f7_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_82f7
result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_82f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_82f7_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_82f7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l744_c11_928b
BIN_OP_EQ_uxn_opcodes_h_l744_c11_928b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l744_c11_928b_left,
BIN_OP_EQ_uxn_opcodes_h_l744_c11_928b_right,
BIN_OP_EQ_uxn_opcodes_h_l744_c11_928b_return_output);

-- n8_MUX_uxn_opcodes_h_l744_c7_8dfb
n8_MUX_uxn_opcodes_h_l744_c7_8dfb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l744_c7_8dfb_cond,
n8_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue,
n8_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse,
n8_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_8dfb
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_8dfb : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l744_c7_8dfb
result_u16_value_MUX_uxn_opcodes_h_l744_c7_8dfb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l744_c7_8dfb_cond,
result_u16_value_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_8dfb
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_8dfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_8dfb
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_8dfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_8dfb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_8dfb
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_8dfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_8dfb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output);

-- sp_relative_shift_uxn_opcodes_h_l747_c30_7329
sp_relative_shift_uxn_opcodes_h_l747_c30_7329 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l747_c30_7329_ins,
sp_relative_shift_uxn_opcodes_h_l747_c30_7329_x,
sp_relative_shift_uxn_opcodes_h_l747_c30_7329_y,
sp_relative_shift_uxn_opcodes_h_l747_c30_7329_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l748_c26_5159
BIN_OP_EQ_uxn_opcodes_h_l748_c26_5159 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l748_c26_5159_left,
BIN_OP_EQ_uxn_opcodes_h_l748_c26_5159_right,
BIN_OP_EQ_uxn_opcodes_h_l748_c26_5159_return_output);

-- MUX_uxn_opcodes_h_l748_c26_57a8
MUX_uxn_opcodes_h_l748_c26_57a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l748_c26_57a8_cond,
MUX_uxn_opcodes_h_l748_c26_57a8_iftrue,
MUX_uxn_opcodes_h_l748_c26_57a8_iffalse,
MUX_uxn_opcodes_h_l748_c26_57a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l749_c22_2380
BIN_OP_EQ_uxn_opcodes_h_l749_c22_2380 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l749_c22_2380_left,
BIN_OP_EQ_uxn_opcodes_h_l749_c22_2380_right,
BIN_OP_EQ_uxn_opcodes_h_l749_c22_2380_return_output);

-- MUX_uxn_opcodes_h_l749_c22_ba91
MUX_uxn_opcodes_h_l749_c22_ba91 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l749_c22_ba91_cond,
MUX_uxn_opcodes_h_l749_c22_ba91_iftrue,
MUX_uxn_opcodes_h_l749_c22_ba91_iffalse,
MUX_uxn_opcodes_h_l749_c22_ba91_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l751_c11_69e4
BIN_OP_EQ_uxn_opcodes_h_l751_c11_69e4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l751_c11_69e4_left,
BIN_OP_EQ_uxn_opcodes_h_l751_c11_69e4_right,
BIN_OP_EQ_uxn_opcodes_h_l751_c11_69e4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_99bb
result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_99bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_99bb_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_99bb_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_99bb_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_99bb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_99bb
result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_99bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_99bb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_99bb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_99bb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_99bb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_99bb
result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_99bb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_99bb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_99bb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_99bb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_99bb_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1a03_return_output,
 n8_MUX_uxn_opcodes_h_l721_c2_6d13_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_6d13_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l721_c2_6d13_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_6d13_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_6d13_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_6d13_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_6d13_return_output,
 t16_MUX_uxn_opcodes_h_l721_c2_6d13_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l726_c11_1c89_return_output,
 n8_MUX_uxn_opcodes_h_l726_c7_9487_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_9487_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l726_c7_9487_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_9487_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_9487_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_9487_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_9487_return_output,
 t16_MUX_uxn_opcodes_h_l726_c7_9487_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l729_c11_e984_return_output,
 n8_MUX_uxn_opcodes_h_l729_c7_2234_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_2234_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l729_c7_2234_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_2234_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_2234_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_2234_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_2234_return_output,
 t16_MUX_uxn_opcodes_h_l729_c7_2234_return_output,
 CONST_SL_8_uxn_opcodes_h_l731_c3_f411_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l734_c11_c0f2_return_output,
 n8_MUX_uxn_opcodes_h_l734_c7_1b82_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1b82_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l734_c7_1b82_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1b82_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1b82_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1b82_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1b82_return_output,
 t16_MUX_uxn_opcodes_h_l734_c7_1b82_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l737_c11_3d3a_return_output,
 n8_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output,
 t16_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output,
 BIN_OP_OR_uxn_opcodes_h_l738_c3_bd23_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l741_c11_cb3c_return_output,
 n8_MUX_uxn_opcodes_h_l741_c7_82f7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_82f7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l741_c7_82f7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_82f7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_82f7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_82f7_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_82f7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l744_c11_928b_return_output,
 n8_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output,
 sp_relative_shift_uxn_opcodes_h_l747_c30_7329_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l748_c26_5159_return_output,
 MUX_uxn_opcodes_h_l748_c26_57a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l749_c22_2380_return_output,
 MUX_uxn_opcodes_h_l749_c22_ba91_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l751_c11_69e4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_99bb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_99bb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_99bb_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1a03_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1a03_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1a03_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1a03_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l726_c7_9487_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l721_c2_6d13_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l721_c2_6d13_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_9487_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_6d13_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_6d13_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_9487_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l721_c2_6d13_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l721_c2_6d13_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l723_c3_c09c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_9487_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_6d13_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_6d13_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_9487_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_6d13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_6d13_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_9487_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_6d13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_6d13_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_9487_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_6d13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_6d13_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_9487_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l721_c2_6d13_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l721_c2_6d13_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l722_c3_88e4_uxn_opcodes_h_l722_c3_88e4_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_1c89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_1c89_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_1c89_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l726_c7_9487_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l726_c7_9487_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l729_c7_2234_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l726_c7_9487_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_9487_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_9487_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_2234_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_9487_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_9487_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_9487_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_2234_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_9487_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_9487_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l727_c3_e27e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_9487_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_2234_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_9487_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_9487_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_9487_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_2234_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_9487_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_9487_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_9487_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_2234_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_9487_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_9487_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_9487_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_2234_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_9487_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_9487_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_9487_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l729_c7_2234_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l726_c7_9487_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_e984_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_e984_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_e984_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l729_c7_2234_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l729_c7_2234_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l734_c7_1b82_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l729_c7_2234_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_2234_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_2234_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1b82_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_2234_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_2234_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_2234_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_1b82_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_2234_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_2234_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l732_c3_86df : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_2234_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1b82_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_2234_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_2234_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_2234_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1b82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_2234_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_2234_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_2234_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1b82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_2234_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_2234_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_2234_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1b82_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_2234_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l729_c7_2234_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l729_c7_2234_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l734_c7_1b82_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l729_c7_2234_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l731_c3_f411_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l731_c3_f411_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_c0f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_c0f2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_c0f2_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l734_c7_1b82_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1b82_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_1b82_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l735_c3_fd1d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1b82_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1b82_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1b82_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1b82_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l734_c7_1b82_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_3d3a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_3d3a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_3d3a_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l741_c7_82f7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l737_c7_7f8a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_82f7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l741_c7_82f7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_7f8a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l739_c3_c721 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_82f7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7f8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_82f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_82f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7f8a_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_82f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7f8a_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l737_c7_7f8a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l738_c3_bd23_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l738_c3_bd23_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l738_c3_bd23_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_cb3c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_cb3c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_cb3c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l741_c7_82f7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_82f7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l741_c7_82f7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l742_c3_1330 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l741_c7_82f7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_82f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_82f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_82f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_82f7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_928b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_928b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_928b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l744_c7_8dfb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_8dfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_99bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_99bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_8dfb_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_99bb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_8dfb_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l747_c30_7329_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l747_c30_7329_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l747_c30_7329_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l747_c30_7329_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l748_c26_57a8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l748_c26_57a8_iftrue : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l748_c26_57a8_iffalse : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c26_5159_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c26_5159_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c26_5159_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l748_c26_57a8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l749_c22_ba91_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l749_c22_ba91_iftrue : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l749_c22_ba91_iffalse : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c22_2380_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c22_2380_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c22_2380_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l749_c22_ba91_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_69e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_69e4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_69e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_99bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_99bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_99bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_99bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_99bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_99bb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_99bb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_99bb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_99bb_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l734_l729_l721_l726_l741_l744_l737_DUPLICATE_71cf_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l734_l729_l721_l726_l741_l744_l737_DUPLICATE_61ed_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l734_l729_l751_l721_l726_l741_l737_DUPLICATE_8ceb_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l734_l729_l751_l721_l726_l741_l737_DUPLICATE_6876_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l734_l729_l751_l726_l741_l744_l737_DUPLICATE_37a8_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l730_l738_DUPLICATE_ab46_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fc62_uxn_opcodes_h_l757_l716_DUPLICATE_1edf_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l748_c26_57a8_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l739_c3_c721 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l739_c3_c721;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_cb3c_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_99bb_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l747_c30_7329_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_99bb_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_928b_right := to_unsigned(6, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_99bb_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l723_c3_c09c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l723_c3_c09c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l732_c3_86df := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_2234_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l732_c3_86df;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l742_c3_1330 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l742_c3_1330;
     VAR_sp_relative_shift_uxn_opcodes_h_l747_c30_7329_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l727_c3_e27e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_9487_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l727_c3_e27e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_1c89_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c22_2380_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l735_c3_fd1d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l735_c3_fd1d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_e984_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1a03_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c26_5159_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_3d3a_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l748_c26_57a8_iffalse := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_69e4_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_c0f2_right := to_unsigned(3, 2);
     VAR_MUX_uxn_opcodes_h_l749_c22_ba91_iftrue := resize(to_unsigned(0, 1), 16);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1a03_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l747_c30_7329_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l726_c7_9487_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l729_c7_2234_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_1c89_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_e984_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_c0f2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_3d3a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_cb3c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_928b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_69e4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c26_5159_left := VAR_previous_stack_read;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c22_2380_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l738_c3_bd23_left := t16;
     VAR_MUX_uxn_opcodes_h_l749_c22_ba91_iffalse := t16;
     VAR_t16_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_9487_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l734_l729_l751_l721_l726_l741_l737_DUPLICATE_6876 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l734_l729_l751_l721_l726_l741_l737_DUPLICATE_6876_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l734_l729_l721_l726_l741_l744_l737_DUPLICATE_61ed LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l734_l729_l721_l726_l741_l744_l737_DUPLICATE_61ed_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l748_c26_5159] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l748_c26_5159_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c26_5159_left;
     BIN_OP_EQ_uxn_opcodes_h_l748_c26_5159_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c26_5159_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c26_5159_return_output := BIN_OP_EQ_uxn_opcodes_h_l748_c26_5159_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l751_c11_69e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l751_c11_69e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_69e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l751_c11_69e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_69e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_69e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l751_c11_69e4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l734_l729_l751_l721_l726_l741_l737_DUPLICATE_8ceb LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l734_l729_l751_l721_l726_l741_l737_DUPLICATE_8ceb_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l734_l729_l721_l726_l741_l744_l737_DUPLICATE_71cf LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l734_l729_l721_l726_l741_l744_l737_DUPLICATE_71cf_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l744_c11_928b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l744_c11_928b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_928b_left;
     BIN_OP_EQ_uxn_opcodes_h_l744_c11_928b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_928b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_928b_return_output := BIN_OP_EQ_uxn_opcodes_h_l744_c11_928b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l734_l729_l751_l726_l741_l744_l737_DUPLICATE_37a8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l734_l729_l751_l726_l741_l744_l737_DUPLICATE_37a8_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l741_c7_82f7] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l741_c7_82f7_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l730_l738_DUPLICATE_ab46 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l730_l738_DUPLICATE_ab46_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l729_c11_e984] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l729_c11_e984_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_e984_left;
     BIN_OP_EQ_uxn_opcodes_h_l729_c11_e984_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_e984_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_e984_return_output := BIN_OP_EQ_uxn_opcodes_h_l729_c11_e984_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l741_c11_cb3c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l741_c11_cb3c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_cb3c_left;
     BIN_OP_EQ_uxn_opcodes_h_l741_c11_cb3c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_cb3c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_cb3c_return_output := BIN_OP_EQ_uxn_opcodes_h_l741_c11_cb3c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l734_c11_c0f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l734_c11_c0f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_c0f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l734_c11_c0f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_c0f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_c0f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l734_c11_c0f2_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l747_c30_7329] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l747_c30_7329_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l747_c30_7329_ins;
     sp_relative_shift_uxn_opcodes_h_l747_c30_7329_x <= VAR_sp_relative_shift_uxn_opcodes_h_l747_c30_7329_x;
     sp_relative_shift_uxn_opcodes_h_l747_c30_7329_y <= VAR_sp_relative_shift_uxn_opcodes_h_l747_c30_7329_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l747_c30_7329_return_output := sp_relative_shift_uxn_opcodes_h_l747_c30_7329_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l737_c11_3d3a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l737_c11_3d3a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_3d3a_left;
     BIN_OP_EQ_uxn_opcodes_h_l737_c11_3d3a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_3d3a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_3d3a_return_output := BIN_OP_EQ_uxn_opcodes_h_l737_c11_3d3a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l749_c22_2380] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l749_c22_2380_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c22_2380_left;
     BIN_OP_EQ_uxn_opcodes_h_l749_c22_2380_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c22_2380_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c22_2380_return_output := BIN_OP_EQ_uxn_opcodes_h_l749_c22_2380_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l726_c11_1c89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l726_c11_1c89_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_1c89_left;
     BIN_OP_EQ_uxn_opcodes_h_l726_c11_1c89_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_1c89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_1c89_return_output := BIN_OP_EQ_uxn_opcodes_h_l726_c11_1c89_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l721_c6_deeb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb_left;
     BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb_return_output := BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1a03_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l721_c2_6d13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_6d13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_6d13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_6d13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_6d13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_6d13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l721_c2_6d13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l721_c2_6d13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c6_deeb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l726_c7_9487_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_1c89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_9487_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_1c89_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_9487_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_1c89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_9487_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_1c89_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_9487_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_1c89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_9487_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_1c89_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_9487_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_1c89_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_9487_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l726_c11_1c89_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l729_c7_2234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_e984_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_2234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_e984_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_2234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_e984_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_2234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_e984_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_2234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_e984_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_2234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_e984_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_2234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_e984_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l729_c7_2234_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l729_c11_e984_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l734_c7_1b82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_c0f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1b82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_c0f2_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1b82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_c0f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1b82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_c0f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1b82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_c0f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1b82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_c0f2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_1b82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_c0f2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l734_c7_1b82_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l734_c11_c0f2_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l737_c7_7f8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_3d3a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7f8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_3d3a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7f8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_3d3a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_3d3a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_3d3a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7f8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_3d3a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_7f8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_3d3a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l737_c7_7f8a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l737_c11_3d3a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l741_c7_82f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_cb3c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_82f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_cb3c_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_82f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_cb3c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_82f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_cb3c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_82f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_cb3c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_82f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_cb3c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l741_c7_82f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l741_c11_cb3c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l744_c7_8dfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_928b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_8dfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_928b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_8dfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_928b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_928b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_928b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_8dfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l744_c11_928b_return_output;
     VAR_MUX_uxn_opcodes_h_l748_c26_57a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l748_c26_5159_return_output;
     VAR_MUX_uxn_opcodes_h_l749_c22_ba91_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l749_c22_2380_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_99bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_69e4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_99bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_69e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_99bb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l751_c11_69e4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l738_c3_bd23_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l730_l738_DUPLICATE_ab46_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l731_c3_f411_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l730_l738_DUPLICATE_ab46_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l734_l729_l721_l726_l741_l744_l737_DUPLICATE_71cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_9487_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l734_l729_l721_l726_l741_l744_l737_DUPLICATE_71cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_2234_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l734_l729_l721_l726_l741_l744_l737_DUPLICATE_71cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l734_l729_l721_l726_l741_l744_l737_DUPLICATE_71cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l734_l729_l721_l726_l741_l744_l737_DUPLICATE_71cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l734_l729_l721_l726_l741_l744_l737_DUPLICATE_71cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l734_l729_l721_l726_l741_l744_l737_DUPLICATE_71cf_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l734_l729_l721_l726_l741_l744_l737_DUPLICATE_61ed_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_9487_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l734_l729_l721_l726_l741_l744_l737_DUPLICATE_61ed_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_2234_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l734_l729_l721_l726_l741_l744_l737_DUPLICATE_61ed_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l734_l729_l721_l726_l741_l744_l737_DUPLICATE_61ed_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l734_l729_l721_l726_l741_l744_l737_DUPLICATE_61ed_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l734_l729_l721_l726_l741_l744_l737_DUPLICATE_61ed_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l734_l729_l721_l726_l741_l744_l737_DUPLICATE_61ed_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_9487_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l734_l729_l751_l726_l741_l744_l737_DUPLICATE_37a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_2234_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l734_l729_l751_l726_l741_l744_l737_DUPLICATE_37a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l734_l729_l751_l726_l741_l744_l737_DUPLICATE_37a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l734_l729_l751_l726_l741_l744_l737_DUPLICATE_37a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l734_l729_l751_l726_l741_l744_l737_DUPLICATE_37a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l734_l729_l751_l726_l741_l744_l737_DUPLICATE_37a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_99bb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l734_l729_l751_l726_l741_l744_l737_DUPLICATE_37a8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l734_l729_l751_l721_l726_l741_l737_DUPLICATE_6876_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_9487_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l734_l729_l751_l721_l726_l741_l737_DUPLICATE_6876_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_2234_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l734_l729_l751_l721_l726_l741_l737_DUPLICATE_6876_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l734_l729_l751_l721_l726_l741_l737_DUPLICATE_6876_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l734_l729_l751_l721_l726_l741_l737_DUPLICATE_6876_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l734_l729_l751_l721_l726_l741_l737_DUPLICATE_6876_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_99bb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l734_l729_l751_l721_l726_l741_l737_DUPLICATE_6876_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l734_l729_l751_l721_l726_l741_l737_DUPLICATE_8ceb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_9487_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l734_l729_l751_l721_l726_l741_l737_DUPLICATE_8ceb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_2234_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l734_l729_l751_l721_l726_l741_l737_DUPLICATE_8ceb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l734_l729_l751_l721_l726_l741_l737_DUPLICATE_8ceb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l734_l729_l751_l721_l726_l741_l737_DUPLICATE_8ceb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l734_l729_l751_l721_l726_l741_l737_DUPLICATE_8ceb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_99bb_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l734_l729_l751_l721_l726_l741_l737_DUPLICATE_8ceb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l741_c7_82f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l747_c30_7329_return_output;
     -- MUX[uxn_opcodes_h_l749_c22_ba91] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l749_c22_ba91_cond <= VAR_MUX_uxn_opcodes_h_l749_c22_ba91_cond;
     MUX_uxn_opcodes_h_l749_c22_ba91_iftrue <= VAR_MUX_uxn_opcodes_h_l749_c22_ba91_iftrue;
     MUX_uxn_opcodes_h_l749_c22_ba91_iffalse <= VAR_MUX_uxn_opcodes_h_l749_c22_ba91_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l749_c22_ba91_return_output := MUX_uxn_opcodes_h_l749_c22_ba91_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l744_c7_8dfb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l731_c3_f411] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l731_c3_f411_x <= VAR_CONST_SL_8_uxn_opcodes_h_l731_c3_f411_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l731_c3_f411_return_output := CONST_SL_8_uxn_opcodes_h_l731_c3_f411_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l751_c7_99bb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_99bb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_99bb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_99bb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_99bb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_99bb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_99bb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_99bb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_99bb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l751_c7_99bb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_99bb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_99bb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_99bb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_99bb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_99bb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_99bb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_99bb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_99bb_return_output;

     -- n8_MUX[uxn_opcodes_h_l744_c7_8dfb] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l744_c7_8dfb_cond <= VAR_n8_MUX_uxn_opcodes_h_l744_c7_8dfb_cond;
     n8_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue;
     n8_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output := n8_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l738_c3_bd23] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l738_c3_bd23_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l738_c3_bd23_left;
     BIN_OP_OR_uxn_opcodes_h_l738_c3_bd23_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l738_c3_bd23_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l738_c3_bd23_return_output := BIN_OP_OR_uxn_opcodes_h_l738_c3_bd23_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l721_c1_1a03] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1a03_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1a03_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1a03_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1a03_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1a03_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1a03_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1a03_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1a03_return_output;

     -- MUX[uxn_opcodes_h_l748_c26_57a8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l748_c26_57a8_cond <= VAR_MUX_uxn_opcodes_h_l748_c26_57a8_cond;
     MUX_uxn_opcodes_h_l748_c26_57a8_iftrue <= VAR_MUX_uxn_opcodes_h_l748_c26_57a8_iftrue;
     MUX_uxn_opcodes_h_l748_c26_57a8_iffalse <= VAR_MUX_uxn_opcodes_h_l748_c26_57a8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l748_c26_57a8_return_output := MUX_uxn_opcodes_h_l748_c26_57a8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l751_c7_99bb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_99bb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_99bb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_99bb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_99bb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_99bb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_99bb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_99bb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_99bb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l741_c7_82f7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_82f7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_82f7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_82f7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_82f7_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l738_c3_bd23_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l729_c7_2234_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l731_c3_f411_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue := VAR_MUX_uxn_opcodes_h_l748_c26_57a8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue := VAR_MUX_uxn_opcodes_h_l749_c22_ba91_return_output;
     VAR_printf_uxn_opcodes_h_l722_c3_88e4_uxn_opcodes_h_l722_c3_88e4_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l721_c1_1a03_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse := VAR_n8_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l751_c7_99bb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l751_c7_99bb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l751_c7_99bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l741_c7_82f7_return_output;
     -- printf_uxn_opcodes_h_l722_c3_88e4[uxn_opcodes_h_l722_c3_88e4] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l722_c3_88e4_uxn_opcodes_h_l722_c3_88e4_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l722_c3_88e4_uxn_opcodes_h_l722_c3_88e4_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l737_c7_7f8a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l737_c7_7f8a_cond <= VAR_t16_MUX_uxn_opcodes_h_l737_c7_7f8a_cond;
     t16_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue;
     t16_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output := t16_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l744_c7_8dfb] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l744_c7_8dfb_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_8dfb_cond;
     result_u16_value_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output := result_u16_value_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output;

     -- n8_MUX[uxn_opcodes_h_l741_c7_82f7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l741_c7_82f7_cond <= VAR_n8_MUX_uxn_opcodes_h_l741_c7_82f7_cond;
     n8_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue;
     n8_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l741_c7_82f7_return_output := n8_MUX_uxn_opcodes_h_l741_c7_82f7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l737_c7_7f8a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7f8a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7f8a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l744_c7_8dfb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_8dfb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_8dfb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l741_c7_82f7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_82f7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_82f7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_82f7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_82f7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l744_c7_8dfb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l744_c7_8dfb] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_8dfb_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_8dfb_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_8dfb_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_8dfb_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l741_c7_82f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l741_c7_82f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l744_c7_8dfb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse := VAR_t16_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l737_c7_7f8a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output;

     -- t16_MUX[uxn_opcodes_h_l734_c7_1b82] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l734_c7_1b82_cond <= VAR_t16_MUX_uxn_opcodes_h_l734_c7_1b82_cond;
     t16_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue;
     t16_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l734_c7_1b82_return_output := t16_MUX_uxn_opcodes_h_l734_c7_1b82_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l734_c7_1b82] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1b82_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1b82_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1b82_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1b82_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l741_c7_82f7] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_82f7_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_82f7_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_82f7_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_82f7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l741_c7_82f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_82f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_82f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_82f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_82f7_return_output;

     -- n8_MUX[uxn_opcodes_h_l737_c7_7f8a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l737_c7_7f8a_cond <= VAR_n8_MUX_uxn_opcodes_h_l737_c7_7f8a_cond;
     n8_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue;
     n8_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output := n8_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l741_c7_82f7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l741_c7_82f7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l741_c7_82f7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l741_c7_82f7_return_output := result_u16_value_MUX_uxn_opcodes_h_l741_c7_82f7_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l741_c7_82f7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_82f7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_82f7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_82f7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_82f7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_82f7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_82f7_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse := VAR_n8_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l741_c7_82f7_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l741_c7_82f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l741_c7_82f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_2234_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l734_c7_1b82_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l741_c7_82f7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l729_c7_2234_iffalse := VAR_t16_MUX_uxn_opcodes_h_l734_c7_1b82_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l729_c7_2234] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_2234_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_2234_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_2234_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_2234_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_2234_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_2234_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_2234_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_2234_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l737_c7_7f8a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7f8a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7f8a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l737_c7_7f8a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l734_c7_1b82] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1b82_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1b82_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1b82_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1b82_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l737_c7_7f8a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l737_c7_7f8a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_7f8a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output := result_u16_value_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output;

     -- t16_MUX[uxn_opcodes_h_l729_c7_2234] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l729_c7_2234_cond <= VAR_t16_MUX_uxn_opcodes_h_l729_c7_2234_cond;
     t16_MUX_uxn_opcodes_h_l729_c7_2234_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l729_c7_2234_iftrue;
     t16_MUX_uxn_opcodes_h_l729_c7_2234_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l729_c7_2234_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l729_c7_2234_return_output := t16_MUX_uxn_opcodes_h_l729_c7_2234_return_output;

     -- n8_MUX[uxn_opcodes_h_l734_c7_1b82] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l734_c7_1b82_cond <= VAR_n8_MUX_uxn_opcodes_h_l734_c7_1b82_cond;
     n8_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue;
     n8_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l734_c7_1b82_return_output := n8_MUX_uxn_opcodes_h_l734_c7_1b82_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l737_c7_7f8a] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7f8a_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7f8a_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7f8a_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7f8a_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l729_c7_2234_iffalse := VAR_n8_MUX_uxn_opcodes_h_l734_c7_1b82_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_2234_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l734_c7_1b82_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_9487_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l729_c7_2234_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l737_c7_7f8a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_9487_iffalse := VAR_t16_MUX_uxn_opcodes_h_l729_c7_2234_return_output;
     -- n8_MUX[uxn_opcodes_h_l729_c7_2234] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l729_c7_2234_cond <= VAR_n8_MUX_uxn_opcodes_h_l729_c7_2234_cond;
     n8_MUX_uxn_opcodes_h_l729_c7_2234_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l729_c7_2234_iftrue;
     n8_MUX_uxn_opcodes_h_l729_c7_2234_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l729_c7_2234_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l729_c7_2234_return_output := n8_MUX_uxn_opcodes_h_l729_c7_2234_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l726_c7_9487] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_9487_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_9487_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_9487_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_9487_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_9487_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_9487_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_9487_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_9487_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l734_c7_1b82] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1b82_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1b82_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1b82_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1b82_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l729_c7_2234] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_2234_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_2234_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_2234_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_2234_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_2234_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_2234_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_2234_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_2234_return_output;

     -- t16_MUX[uxn_opcodes_h_l726_c7_9487] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l726_c7_9487_cond <= VAR_t16_MUX_uxn_opcodes_h_l726_c7_9487_cond;
     t16_MUX_uxn_opcodes_h_l726_c7_9487_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l726_c7_9487_iftrue;
     t16_MUX_uxn_opcodes_h_l726_c7_9487_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l726_c7_9487_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l726_c7_9487_return_output := t16_MUX_uxn_opcodes_h_l726_c7_9487_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l734_c7_1b82] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l734_c7_1b82_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_1b82_cond;
     result_u16_value_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_1b82_return_output := result_u16_value_MUX_uxn_opcodes_h_l734_c7_1b82_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l734_c7_1b82] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1b82_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1b82_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1b82_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1b82_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l734_c7_1b82] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1b82_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1b82_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1b82_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1b82_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1b82_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1b82_return_output;

     -- Submodule level 6
     VAR_n8_MUX_uxn_opcodes_h_l726_c7_9487_iffalse := VAR_n8_MUX_uxn_opcodes_h_l729_c7_2234_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_2234_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l734_c7_1b82_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_2234_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l734_c7_1b82_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_2234_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l734_c7_1b82_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_9487_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l729_c7_2234_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l726_c7_9487_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_2234_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l734_c7_1b82_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse := VAR_t16_MUX_uxn_opcodes_h_l726_c7_9487_return_output;
     -- t16_MUX[uxn_opcodes_h_l721_c2_6d13] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l721_c2_6d13_cond <= VAR_t16_MUX_uxn_opcodes_h_l721_c2_6d13_cond;
     t16_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue;
     t16_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l721_c2_6d13_return_output := t16_MUX_uxn_opcodes_h_l721_c2_6d13_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l729_c7_2234] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_2234_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_2234_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_2234_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_2234_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_2234_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_2234_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_2234_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_2234_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l729_c7_2234] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_2234_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_2234_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_2234_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_2234_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_2234_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_2234_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_2234_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_2234_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l721_c2_6d13] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_6d13_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_6d13_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_6d13_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_6d13_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l726_c7_9487] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_9487_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_9487_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_9487_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_9487_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_9487_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_9487_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_9487_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_9487_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l729_c7_2234] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_2234_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_2234_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_2234_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_2234_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_2234_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_2234_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_2234_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_2234_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l729_c7_2234] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l729_c7_2234_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_2234_cond;
     result_u16_value_MUX_uxn_opcodes_h_l729_c7_2234_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_2234_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l729_c7_2234_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_2234_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_2234_return_output := result_u16_value_MUX_uxn_opcodes_h_l729_c7_2234_return_output;

     -- n8_MUX[uxn_opcodes_h_l726_c7_9487] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l726_c7_9487_cond <= VAR_n8_MUX_uxn_opcodes_h_l726_c7_9487_cond;
     n8_MUX_uxn_opcodes_h_l726_c7_9487_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l726_c7_9487_iftrue;
     n8_MUX_uxn_opcodes_h_l726_c7_9487_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l726_c7_9487_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l726_c7_9487_return_output := n8_MUX_uxn_opcodes_h_l726_c7_9487_return_output;

     -- Submodule level 7
     VAR_n8_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse := VAR_n8_MUX_uxn_opcodes_h_l726_c7_9487_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_9487_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l729_c7_2234_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_9487_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l729_c7_2234_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_9487_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l729_c7_2234_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l726_c7_9487_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_9487_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l729_c7_2234_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l721_c2_6d13_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l726_c7_9487] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_9487_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_9487_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_9487_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_9487_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_9487_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_9487_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_9487_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_9487_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l726_c7_9487] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_9487_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_9487_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_9487_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_9487_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_9487_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_9487_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_9487_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_9487_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l726_c7_9487] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l726_c7_9487_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_9487_cond;
     result_u16_value_MUX_uxn_opcodes_h_l726_c7_9487_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_9487_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l726_c7_9487_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_9487_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_9487_return_output := result_u16_value_MUX_uxn_opcodes_h_l726_c7_9487_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l721_c2_6d13] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_6d13_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_6d13_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_6d13_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_6d13_return_output;

     -- n8_MUX[uxn_opcodes_h_l721_c2_6d13] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l721_c2_6d13_cond <= VAR_n8_MUX_uxn_opcodes_h_l721_c2_6d13_cond;
     n8_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue;
     n8_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l721_c2_6d13_return_output := n8_MUX_uxn_opcodes_h_l721_c2_6d13_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l726_c7_9487] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_9487_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_9487_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_9487_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_9487_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_9487_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_9487_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_9487_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_9487_return_output;

     -- Submodule level 8
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l721_c2_6d13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l726_c7_9487_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l726_c7_9487_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l726_c7_9487_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l726_c7_9487_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l721_c2_6d13] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_6d13_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_6d13_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_6d13_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_6d13_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l721_c2_6d13] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_6d13_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_6d13_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_6d13_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_6d13_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l721_c2_6d13] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_6d13_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_6d13_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_6d13_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_6d13_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l721_c2_6d13] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l721_c2_6d13_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l721_c2_6d13_cond;
     result_u16_value_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l721_c2_6d13_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l721_c2_6d13_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l721_c2_6d13_return_output := result_u16_value_MUX_uxn_opcodes_h_l721_c2_6d13_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_fc62_uxn_opcodes_h_l757_l716_DUPLICATE_1edf LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fc62_uxn_opcodes_h_l757_l716_DUPLICATE_1edf_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_fc62(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l721_c2_6d13_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l721_c2_6d13_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c2_6d13_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l721_c2_6d13_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c2_6d13_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l721_c2_6d13_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fc62_uxn_opcodes_h_l757_l716_DUPLICATE_1edf_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_fc62_uxn_opcodes_h_l757_l716_DUPLICATE_1edf_return_output;
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
