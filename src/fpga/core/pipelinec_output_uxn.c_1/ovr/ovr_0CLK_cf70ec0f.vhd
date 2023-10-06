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
-- Submodules: 73
entity ovr_0CLK_cf70ec0f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr_0CLK_cf70ec0f;
architecture arch of ovr_0CLK_cf70ec0f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l330_c6_84f4]
signal BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l330_c1_60a0]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_60a0_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_60a0_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_60a0_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_60a0_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l330_c2_cc33]
signal t8_MUX_uxn_opcodes_h_l330_c2_cc33_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l330_c2_cc33_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l330_c2_cc33]
signal n8_MUX_uxn_opcodes_h_l330_c2_cc33_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l330_c2_cc33_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l330_c2_cc33]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_cc33_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_cc33_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l330_c2_cc33]
signal result_stack_value_MUX_uxn_opcodes_h_l330_c2_cc33_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l330_c2_cc33_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l330_c2_cc33]
signal result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_cc33_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_cc33_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l330_c2_cc33]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_cc33_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_cc33_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l330_c2_cc33]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_cc33_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_cc33_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l330_c2_cc33]
signal result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_cc33_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_cc33_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l330_c2_cc33]
signal result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_cc33_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_cc33_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l331_c3_b92d[uxn_opcodes_h_l331_c3_b92d]
signal printf_uxn_opcodes_h_l331_c3_b92d_uxn_opcodes_h_l331_c3_b92d_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l336_c11_103c]
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l336_c7_62ac]
signal t8_MUX_uxn_opcodes_h_l336_c7_62ac_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l336_c7_62ac_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l336_c7_62ac]
signal n8_MUX_uxn_opcodes_h_l336_c7_62ac_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l336_c7_62ac_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l336_c7_62ac]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_62ac_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_62ac_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l336_c7_62ac]
signal result_stack_value_MUX_uxn_opcodes_h_l336_c7_62ac_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l336_c7_62ac_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l336_c7_62ac]
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_62ac_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_62ac_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l336_c7_62ac]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_62ac_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_62ac_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l336_c7_62ac]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_62ac_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_62ac_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l336_c7_62ac]
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_62ac_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_62ac_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l336_c7_62ac]
signal result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_62ac_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_62ac_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l339_c11_f561]
signal BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l339_c7_2940]
signal t8_MUX_uxn_opcodes_h_l339_c7_2940_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l339_c7_2940_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l339_c7_2940_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l339_c7_2940_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l339_c7_2940]
signal n8_MUX_uxn_opcodes_h_l339_c7_2940_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l339_c7_2940_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l339_c7_2940_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l339_c7_2940_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l339_c7_2940]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_2940_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_2940_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_2940_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_2940_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l339_c7_2940]
signal result_stack_value_MUX_uxn_opcodes_h_l339_c7_2940_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l339_c7_2940_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l339_c7_2940_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l339_c7_2940_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l339_c7_2940]
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_2940_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_2940_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_2940_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_2940_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c7_2940]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_2940_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_2940_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_2940_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_2940_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c7_2940]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_2940_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_2940_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_2940_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_2940_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l339_c7_2940]
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_2940_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_2940_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_2940_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_2940_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l339_c7_2940]
signal result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_2940_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_2940_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_2940_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_2940_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l343_c11_015d]
signal BIN_OP_EQ_uxn_opcodes_h_l343_c11_015d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l343_c11_015d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l343_c11_015d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l343_c7_9015]
signal n8_MUX_uxn_opcodes_h_l343_c7_9015_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l343_c7_9015_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l343_c7_9015_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l343_c7_9015_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l343_c7_9015]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_9015_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_9015_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_9015_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_9015_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l343_c7_9015]
signal result_stack_value_MUX_uxn_opcodes_h_l343_c7_9015_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l343_c7_9015_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l343_c7_9015_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l343_c7_9015_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l343_c7_9015]
signal result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_9015_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_9015_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_9015_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_9015_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l343_c7_9015]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_9015_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_9015_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_9015_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_9015_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l343_c7_9015]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_9015_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_9015_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_9015_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_9015_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l343_c7_9015]
signal result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_9015_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_9015_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_9015_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_9015_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l343_c7_9015]
signal result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_9015_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_9015_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_9015_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_9015_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l346_c11_27e2]
signal BIN_OP_EQ_uxn_opcodes_h_l346_c11_27e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l346_c11_27e2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l346_c11_27e2_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l346_c7_c4d9]
signal n8_MUX_uxn_opcodes_h_l346_c7_c4d9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l346_c7_c4d9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l346_c7_c4d9]
signal result_stack_value_MUX_uxn_opcodes_h_l346_c7_c4d9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l346_c7_c4d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_c4d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l346_c7_c4d9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l346_c7_c4d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_c4d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l346_c7_c4d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_c4d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l346_c7_c4d9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_c4d9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l350_c32_dc0e]
signal BIN_OP_AND_uxn_opcodes_h_l350_c32_dc0e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l350_c32_dc0e_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l350_c32_dc0e_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l350_c32_3267]
signal BIN_OP_GT_uxn_opcodes_h_l350_c32_3267_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l350_c32_3267_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l350_c32_3267_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l350_c32_bb49]
signal MUX_uxn_opcodes_h_l350_c32_bb49_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l350_c32_bb49_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l350_c32_bb49_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l350_c32_bb49_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l352_c11_47f2]
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_47f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_47f2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l352_c11_47f2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l352_c7_efbd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_efbd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_efbd_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l352_c7_efbd]
signal result_stack_value_MUX_uxn_opcodes_h_l352_c7_efbd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l352_c7_efbd_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_efbd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_efbd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_efbd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_efbd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_efbd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_efbd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_efbd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_efbd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_efbd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l358_c11_c589]
signal BIN_OP_EQ_uxn_opcodes_h_l358_c11_c589_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l358_c11_c589_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l358_c11_c589_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l358_c7_1d44]
signal result_stack_value_MUX_uxn_opcodes_h_l358_c7_1d44_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l358_c7_1d44_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l358_c7_1d44_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l358_c7_1d44_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l358_c7_1d44]
signal result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_1d44_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_1d44_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_1d44_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_1d44_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l358_c7_1d44]
signal result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_1d44_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_1d44_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_1d44_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_1d44_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l358_c7_1d44]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_1d44_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_1d44_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_1d44_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_1d44_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l362_c11_73a8]
signal BIN_OP_EQ_uxn_opcodes_h_l362_c11_73a8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l362_c11_73a8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l362_c11_73a8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l362_c7_9165]
signal result_stack_value_MUX_uxn_opcodes_h_l362_c7_9165_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l362_c7_9165_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l362_c7_9165_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l362_c7_9165_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l362_c7_9165]
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_9165_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_9165_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_9165_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_9165_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l362_c7_9165]
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_9165_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_9165_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_9165_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_9165_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l362_c7_9165]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_9165_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_9165_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_9165_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_9165_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l366_c11_eb95]
signal BIN_OP_EQ_uxn_opcodes_h_l366_c11_eb95_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l366_c11_eb95_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l366_c11_eb95_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l366_c7_4d68]
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_4d68_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_4d68_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_4d68_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_4d68_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l366_c7_4d68]
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_4d68_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_4d68_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_4d68_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_4d68_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_287e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : signed;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_sp_shift := ref_toks_1;
      base.stack_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.sp_relative_shift := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_stack_read := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4
BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4_left,
BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4_right,
BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_60a0
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_60a0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_60a0_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_60a0_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_60a0_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_60a0_return_output);

-- t8_MUX_uxn_opcodes_h_l330_c2_cc33
t8_MUX_uxn_opcodes_h_l330_c2_cc33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l330_c2_cc33_cond,
t8_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue,
t8_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse,
t8_MUX_uxn_opcodes_h_l330_c2_cc33_return_output);

-- n8_MUX_uxn_opcodes_h_l330_c2_cc33
n8_MUX_uxn_opcodes_h_l330_c2_cc33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l330_c2_cc33_cond,
n8_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue,
n8_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse,
n8_MUX_uxn_opcodes_h_l330_c2_cc33_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_cc33
result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_cc33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_cc33_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_cc33_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l330_c2_cc33
result_stack_value_MUX_uxn_opcodes_h_l330_c2_cc33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l330_c2_cc33_cond,
result_stack_value_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l330_c2_cc33_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_cc33
result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_cc33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_cc33_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_cc33_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_cc33
result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_cc33 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_cc33_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_cc33_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_cc33
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_cc33 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_cc33_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_cc33_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_cc33
result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_cc33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_cc33_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_cc33_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_cc33
result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_cc33 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_cc33_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_cc33_return_output);

-- printf_uxn_opcodes_h_l331_c3_b92d_uxn_opcodes_h_l331_c3_b92d
printf_uxn_opcodes_h_l331_c3_b92d_uxn_opcodes_h_l331_c3_b92d : entity work.printf_uxn_opcodes_h_l331_c3_b92d_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l331_c3_b92d_uxn_opcodes_h_l331_c3_b92d_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c
BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c_left,
BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c_right,
BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c_return_output);

-- t8_MUX_uxn_opcodes_h_l336_c7_62ac
t8_MUX_uxn_opcodes_h_l336_c7_62ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l336_c7_62ac_cond,
t8_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue,
t8_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse,
t8_MUX_uxn_opcodes_h_l336_c7_62ac_return_output);

-- n8_MUX_uxn_opcodes_h_l336_c7_62ac
n8_MUX_uxn_opcodes_h_l336_c7_62ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l336_c7_62ac_cond,
n8_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue,
n8_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse,
n8_MUX_uxn_opcodes_h_l336_c7_62ac_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_62ac
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_62ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_62ac_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_62ac_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l336_c7_62ac
result_stack_value_MUX_uxn_opcodes_h_l336_c7_62ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l336_c7_62ac_cond,
result_stack_value_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l336_c7_62ac_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_62ac
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_62ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_62ac_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_62ac_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_62ac
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_62ac : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_62ac_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_62ac_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_62ac
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_62ac : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_62ac_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_62ac_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_62ac
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_62ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_62ac_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_62ac_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_62ac
result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_62ac : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_62ac_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_62ac_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561
BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561_left,
BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561_right,
BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561_return_output);

-- t8_MUX_uxn_opcodes_h_l339_c7_2940
t8_MUX_uxn_opcodes_h_l339_c7_2940 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l339_c7_2940_cond,
t8_MUX_uxn_opcodes_h_l339_c7_2940_iftrue,
t8_MUX_uxn_opcodes_h_l339_c7_2940_iffalse,
t8_MUX_uxn_opcodes_h_l339_c7_2940_return_output);

-- n8_MUX_uxn_opcodes_h_l339_c7_2940
n8_MUX_uxn_opcodes_h_l339_c7_2940 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l339_c7_2940_cond,
n8_MUX_uxn_opcodes_h_l339_c7_2940_iftrue,
n8_MUX_uxn_opcodes_h_l339_c7_2940_iffalse,
n8_MUX_uxn_opcodes_h_l339_c7_2940_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_2940
result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_2940 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_2940_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_2940_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_2940_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_2940_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l339_c7_2940
result_stack_value_MUX_uxn_opcodes_h_l339_c7_2940 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l339_c7_2940_cond,
result_stack_value_MUX_uxn_opcodes_h_l339_c7_2940_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l339_c7_2940_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l339_c7_2940_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_2940
result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_2940 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_2940_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_2940_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_2940_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_2940_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_2940
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_2940 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_2940_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_2940_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_2940_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_2940_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_2940
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_2940 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_2940_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_2940_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_2940_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_2940_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_2940
result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_2940 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_2940_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_2940_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_2940_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_2940_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_2940
result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_2940 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_2940_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_2940_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_2940_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_2940_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l343_c11_015d
BIN_OP_EQ_uxn_opcodes_h_l343_c11_015d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l343_c11_015d_left,
BIN_OP_EQ_uxn_opcodes_h_l343_c11_015d_right,
BIN_OP_EQ_uxn_opcodes_h_l343_c11_015d_return_output);

-- n8_MUX_uxn_opcodes_h_l343_c7_9015
n8_MUX_uxn_opcodes_h_l343_c7_9015 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l343_c7_9015_cond,
n8_MUX_uxn_opcodes_h_l343_c7_9015_iftrue,
n8_MUX_uxn_opcodes_h_l343_c7_9015_iffalse,
n8_MUX_uxn_opcodes_h_l343_c7_9015_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_9015
result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_9015 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_9015_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_9015_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_9015_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_9015_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l343_c7_9015
result_stack_value_MUX_uxn_opcodes_h_l343_c7_9015 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l343_c7_9015_cond,
result_stack_value_MUX_uxn_opcodes_h_l343_c7_9015_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l343_c7_9015_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l343_c7_9015_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_9015
result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_9015 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_9015_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_9015_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_9015_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_9015_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_9015
result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_9015 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_9015_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_9015_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_9015_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_9015_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_9015
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_9015 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_9015_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_9015_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_9015_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_9015_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_9015
result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_9015 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_9015_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_9015_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_9015_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_9015_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_9015
result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_9015 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_9015_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_9015_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_9015_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_9015_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l346_c11_27e2
BIN_OP_EQ_uxn_opcodes_h_l346_c11_27e2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l346_c11_27e2_left,
BIN_OP_EQ_uxn_opcodes_h_l346_c11_27e2_right,
BIN_OP_EQ_uxn_opcodes_h_l346_c11_27e2_return_output);

-- n8_MUX_uxn_opcodes_h_l346_c7_c4d9
n8_MUX_uxn_opcodes_h_l346_c7_c4d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l346_c7_c4d9_cond,
n8_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue,
n8_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse,
n8_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_c4d9
result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_c4d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l346_c7_c4d9
result_stack_value_MUX_uxn_opcodes_h_l346_c7_c4d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l346_c7_c4d9_cond,
result_stack_value_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_c4d9
result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_c4d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_c4d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_c4d9
result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_c4d9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_c4d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_c4d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_c4d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_c4d9
result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_c4d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_c4d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_c4d9
result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_c4d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_c4d9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l350_c32_dc0e
BIN_OP_AND_uxn_opcodes_h_l350_c32_dc0e : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l350_c32_dc0e_left,
BIN_OP_AND_uxn_opcodes_h_l350_c32_dc0e_right,
BIN_OP_AND_uxn_opcodes_h_l350_c32_dc0e_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l350_c32_3267
BIN_OP_GT_uxn_opcodes_h_l350_c32_3267 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l350_c32_3267_left,
BIN_OP_GT_uxn_opcodes_h_l350_c32_3267_right,
BIN_OP_GT_uxn_opcodes_h_l350_c32_3267_return_output);

-- MUX_uxn_opcodes_h_l350_c32_bb49
MUX_uxn_opcodes_h_l350_c32_bb49 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l350_c32_bb49_cond,
MUX_uxn_opcodes_h_l350_c32_bb49_iftrue,
MUX_uxn_opcodes_h_l350_c32_bb49_iffalse,
MUX_uxn_opcodes_h_l350_c32_bb49_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l352_c11_47f2
BIN_OP_EQ_uxn_opcodes_h_l352_c11_47f2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l352_c11_47f2_left,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_47f2_right,
BIN_OP_EQ_uxn_opcodes_h_l352_c11_47f2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_efbd
result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_efbd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_efbd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_efbd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l352_c7_efbd
result_stack_value_MUX_uxn_opcodes_h_l352_c7_efbd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l352_c7_efbd_cond,
result_stack_value_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l352_c7_efbd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_efbd
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_efbd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_efbd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_efbd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_efbd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_efbd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_efbd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_efbd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_efbd
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_efbd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_efbd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_efbd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l358_c11_c589
BIN_OP_EQ_uxn_opcodes_h_l358_c11_c589 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l358_c11_c589_left,
BIN_OP_EQ_uxn_opcodes_h_l358_c11_c589_right,
BIN_OP_EQ_uxn_opcodes_h_l358_c11_c589_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l358_c7_1d44
result_stack_value_MUX_uxn_opcodes_h_l358_c7_1d44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l358_c7_1d44_cond,
result_stack_value_MUX_uxn_opcodes_h_l358_c7_1d44_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l358_c7_1d44_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l358_c7_1d44_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_1d44
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_1d44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_1d44_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_1d44_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_1d44_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_1d44_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_1d44
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_1d44 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_1d44_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_1d44_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_1d44_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_1d44_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_1d44
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_1d44 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_1d44_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_1d44_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_1d44_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_1d44_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l362_c11_73a8
BIN_OP_EQ_uxn_opcodes_h_l362_c11_73a8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l362_c11_73a8_left,
BIN_OP_EQ_uxn_opcodes_h_l362_c11_73a8_right,
BIN_OP_EQ_uxn_opcodes_h_l362_c11_73a8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l362_c7_9165
result_stack_value_MUX_uxn_opcodes_h_l362_c7_9165 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l362_c7_9165_cond,
result_stack_value_MUX_uxn_opcodes_h_l362_c7_9165_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l362_c7_9165_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l362_c7_9165_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_9165
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_9165 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_9165_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_9165_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_9165_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_9165_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_9165
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_9165 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_9165_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_9165_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_9165_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_9165_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_9165
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_9165 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_9165_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_9165_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_9165_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_9165_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l366_c11_eb95
BIN_OP_EQ_uxn_opcodes_h_l366_c11_eb95 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l366_c11_eb95_left,
BIN_OP_EQ_uxn_opcodes_h_l366_c11_eb95_right,
BIN_OP_EQ_uxn_opcodes_h_l366_c11_eb95_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_4d68
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_4d68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_4d68_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_4d68_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_4d68_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_4d68_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_4d68
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_4d68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_4d68_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_4d68_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_4d68_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_4d68_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_60a0_return_output,
 t8_MUX_uxn_opcodes_h_l330_c2_cc33_return_output,
 n8_MUX_uxn_opcodes_h_l330_c2_cc33_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_cc33_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l330_c2_cc33_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_cc33_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_cc33_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_cc33_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_cc33_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_cc33_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c_return_output,
 t8_MUX_uxn_opcodes_h_l336_c7_62ac_return_output,
 n8_MUX_uxn_opcodes_h_l336_c7_62ac_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_62ac_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l336_c7_62ac_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_62ac_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_62ac_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_62ac_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_62ac_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_62ac_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561_return_output,
 t8_MUX_uxn_opcodes_h_l339_c7_2940_return_output,
 n8_MUX_uxn_opcodes_h_l339_c7_2940_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_2940_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l339_c7_2940_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_2940_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_2940_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_2940_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_2940_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_2940_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l343_c11_015d_return_output,
 n8_MUX_uxn_opcodes_h_l343_c7_9015_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_9015_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l343_c7_9015_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_9015_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_9015_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_9015_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_9015_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_9015_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l346_c11_27e2_return_output,
 n8_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output,
 BIN_OP_AND_uxn_opcodes_h_l350_c32_dc0e_return_output,
 BIN_OP_GT_uxn_opcodes_h_l350_c32_3267_return_output,
 MUX_uxn_opcodes_h_l350_c32_bb49_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l352_c11_47f2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_efbd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l352_c7_efbd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_efbd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_efbd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_efbd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l358_c11_c589_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l358_c7_1d44_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_1d44_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_1d44_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_1d44_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l362_c11_73a8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l362_c7_9165_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_9165_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_9165_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_9165_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l366_c11_eb95_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_4d68_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_4d68_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_60a0_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_60a0_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_60a0_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_60a0_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l336_c7_62ac_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l330_c2_cc33_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l330_c2_cc33_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l336_c7_62ac_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l330_c2_cc33_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l330_c2_cc33_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_62ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_cc33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_cc33_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_62ac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_cc33_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_cc33_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_62ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_cc33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_cc33_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_62ac_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_cc33_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_cc33_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l333_c3_ad36 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_62ac_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_cc33_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_cc33_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_62ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_cc33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_cc33_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_62ac_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_cc33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_cc33_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l331_c3_b92d_uxn_opcodes_h_l331_c3_b92d_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l339_c7_2940_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l336_c7_62ac_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l339_c7_2940_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l336_c7_62ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_2940_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_62ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_2940_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_62ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_2940_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_62ac_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_2940_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_62ac_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l337_c3_850e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_2940_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_62ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_2940_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_62ac_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_2940_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_62ac_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l339_c7_2940_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l339_c7_2940_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l339_c7_2940_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l339_c7_2940_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l339_c7_2940_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l343_c7_9015_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l339_c7_2940_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_2940_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_2940_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_9015_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_2940_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_2940_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_2940_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_9015_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_2940_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_2940_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_2940_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_9015_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_2940_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_2940_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_2940_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_9015_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_2940_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_2940_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l341_c3_bc26 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_2940_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_9015_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_2940_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_2940_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_2940_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_9015_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_2940_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_2940_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_2940_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_9015_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_2940_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_015d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_015d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_015d_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l343_c7_9015_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l343_c7_9015_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l343_c7_9015_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_9015_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_9015_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_9015_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_9015_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_9015_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_9015_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_9015_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_9015_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_9015_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_9015_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_9015_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_9015_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_9015_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l344_c3_1bcc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_9015_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_9015_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_9015_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_9015_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_9015_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_9015_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_9015_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_9015_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_27e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_27e2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_27e2_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l346_c7_c4d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_efbd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_efbd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_c4d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_efbd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_c4d9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_efbd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_c4d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_efbd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_c4d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_c4d9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l350_c32_bb49_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l350_c32_bb49_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l350_c32_bb49_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l350_c32_dc0e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l350_c32_dc0e_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l350_c32_dc0e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l350_c32_3267_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l350_c32_3267_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l350_c32_3267_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l350_c32_bb49_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_47f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_47f2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_47f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_efbd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_1d44_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_efbd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_1d44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_efbd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l355_c3_1a79 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_1d44_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_efbd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_1d44_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_efbd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_c589_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_c589_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_c589_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_1d44_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_1d44_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_9165_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_1d44_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_1d44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_1d44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_9165_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_1d44_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_1d44_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_1d44_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_9165_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_1d44_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_1d44_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_8fc3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_1d44_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_9165_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_1d44_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_73a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_73a8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_73a8_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_9165_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_9165_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_9165_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_9165_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_9165_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_4d68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_9165_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_9165_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_9165_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_4d68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_9165_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_9165_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l363_c3_cc45 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_9165_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_9165_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_eb95_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_eb95_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_eb95_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_4d68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_4d68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_4d68_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_4d68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_4d68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_4d68_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l352_l343_l339_l336_l330_DUPLICATE_f2a8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l346_l343_l339_l336_l362_l330_DUPLICATE_3f22_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l346_l343_l339_l366_l336_l362_l330_l358_DUPLICATE_4884_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l346_l343_l339_l336_l330_DUPLICATE_086f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l352_l346_l343_l339_l366_l336_l362_l358_DUPLICATE_502c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l346_l339_l343_l336_DUPLICATE_49ed_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l346_l362_DUPLICATE_958e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l371_l326_DUPLICATE_ff8f_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_8fc3 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_1d44_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l359_c3_8fc3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l337_c3_850e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l337_c3_850e;
     VAR_MUX_uxn_opcodes_h_l350_c32_bb49_iffalse := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_4d68_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_73a8_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_47f2_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l333_c3_ad36 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l333_c3_ad36;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_015d_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l344_c3_1bcc := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_9015_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l344_c3_1bcc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l341_c3_bc26 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_2940_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l341_c3_bc26;
     VAR_BIN_OP_GT_uxn_opcodes_h_l350_c32_3267_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_4d68_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l355_c3_1a79 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l355_c3_1a79;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l363_c3_cc45 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_9165_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l363_c3_cc45;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_60a0_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l350_c32_dc0e_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_eb95_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_c589_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_27e2_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l350_c32_bb49_iftrue := signed(std_logic_vector(resize(to_unsigned(3, 2), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_60a0_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l350_c32_dc0e_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l339_c7_2940_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l343_c7_9015_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_9165_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_015d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_27e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_47f2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_c589_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_73a8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_eb95_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l339_c7_2940_iftrue := VAR_previous_stack_read;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_1d44_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l339_c7_2940_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l346_l343_l339_l366_l336_l362_l330_l358_DUPLICATE_4884 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l346_l343_l339_l366_l336_l362_l330_l358_DUPLICATE_4884_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l352_l343_l339_l336_l330_DUPLICATE_f2a8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l352_l343_l339_l336_l330_DUPLICATE_f2a8_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l346_l362_DUPLICATE_958e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l346_l362_DUPLICATE_958e_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l346_l339_l343_l336_DUPLICATE_49ed LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l346_l339_l343_l336_DUPLICATE_49ed_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l352_l346_l343_l339_l366_l336_l362_l358_DUPLICATE_502c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l352_l346_l343_l339_l366_l336_l362_l358_DUPLICATE_502c_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l346_c11_27e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l346_c11_27e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_27e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l346_c11_27e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_27e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_27e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l346_c11_27e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l366_c11_eb95] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l366_c11_eb95_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_eb95_left;
     BIN_OP_EQ_uxn_opcodes_h_l366_c11_eb95_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_eb95_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_eb95_return_output := BIN_OP_EQ_uxn_opcodes_h_l366_c11_eb95_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l339_c11_f561] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561_left;
     BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561_return_output := BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l352_c11_47f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_47f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_47f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l352_c11_47f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_47f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_47f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l352_c11_47f2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l336_c11_103c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c_left;
     BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c_return_output := BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l350_c32_dc0e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l350_c32_dc0e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l350_c32_dc0e_left;
     BIN_OP_AND_uxn_opcodes_h_l350_c32_dc0e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l350_c32_dc0e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l350_c32_dc0e_return_output := BIN_OP_AND_uxn_opcodes_h_l350_c32_dc0e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l358_c11_c589] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l358_c11_c589_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_c589_left;
     BIN_OP_EQ_uxn_opcodes_h_l358_c11_c589_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_c589_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_c589_return_output := BIN_OP_EQ_uxn_opcodes_h_l358_c11_c589_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l346_l343_l339_l336_l330_DUPLICATE_086f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l346_l343_l339_l336_l330_DUPLICATE_086f_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l343_c11_015d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l343_c11_015d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_015d_left;
     BIN_OP_EQ_uxn_opcodes_h_l343_c11_015d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_015d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_015d_return_output := BIN_OP_EQ_uxn_opcodes_h_l343_c11_015d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l346_l343_l339_l336_l362_l330_DUPLICATE_3f22 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l346_l343_l339_l336_l362_l330_DUPLICATE_3f22_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l362_c11_73a8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l362_c11_73a8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_73a8_left;
     BIN_OP_EQ_uxn_opcodes_h_l362_c11_73a8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_73a8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_73a8_return_output := BIN_OP_EQ_uxn_opcodes_h_l362_c11_73a8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l330_c6_84f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l350_c32_3267_left := VAR_BIN_OP_AND_uxn_opcodes_h_l350_c32_dc0e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_60a0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l330_c2_cc33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_cc33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_cc33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_cc33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_cc33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_cc33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_cc33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_cc33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l330_c2_cc33_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c6_84f4_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l336_c7_62ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_62ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_62ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_62ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_62ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_62ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_62ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_62ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l336_c7_62ac_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l336_c11_103c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l339_c7_2940_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_2940_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_2940_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_2940_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_2940_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_2940_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_2940_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_2940_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l339_c7_2940_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l339_c11_f561_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l343_c7_9015_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_015d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_9015_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_015d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_9015_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_015d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_9015_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_015d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_9015_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_015d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_9015_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_015d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_9015_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_015d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_9015_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l343_c11_015d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l346_c7_c4d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_27e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_c4d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_27e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_27e2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_c4d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_27e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_c4d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_27e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_27e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_c4d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_27e2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_c4d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l346_c11_27e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_efbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_47f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_efbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_47f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_efbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_47f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_efbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_47f2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_efbd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l352_c11_47f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_1d44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_c589_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_1d44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_c589_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_1d44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_c589_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_1d44_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l358_c11_c589_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_9165_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_73a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_9165_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_73a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_9165_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_73a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_9165_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l362_c11_73a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_4d68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_eb95_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_4d68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l366_c11_eb95_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l346_l343_l339_l336_l330_DUPLICATE_086f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l346_l343_l339_l336_l330_DUPLICATE_086f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_2940_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l346_l343_l339_l336_l330_DUPLICATE_086f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_9015_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l346_l343_l339_l336_l330_DUPLICATE_086f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l346_l343_l339_l336_l330_DUPLICATE_086f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l352_l346_l343_l339_l366_l336_l362_l358_DUPLICATE_502c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_2940_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l352_l346_l343_l339_l366_l336_l362_l358_DUPLICATE_502c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_9015_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l352_l346_l343_l339_l366_l336_l362_l358_DUPLICATE_502c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l352_l346_l343_l339_l366_l336_l362_l358_DUPLICATE_502c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l352_l346_l343_l339_l366_l336_l362_l358_DUPLICATE_502c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_1d44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l352_l346_l343_l339_l366_l336_l362_l358_DUPLICATE_502c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_9165_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l352_l346_l343_l339_l366_l336_l362_l358_DUPLICATE_502c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_4d68_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l352_l346_l343_l339_l366_l336_l362_l358_DUPLICATE_502c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l352_l343_l339_l336_l330_DUPLICATE_f2a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l352_l343_l339_l336_l330_DUPLICATE_f2a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_2940_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l352_l343_l339_l336_l330_DUPLICATE_f2a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_9015_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l352_l343_l339_l336_l330_DUPLICATE_f2a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l352_l343_l339_l336_l330_DUPLICATE_f2a8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l346_l339_l343_l336_DUPLICATE_49ed_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_2940_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l346_l339_l343_l336_DUPLICATE_49ed_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_9015_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l346_l339_l343_l336_DUPLICATE_49ed_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l346_l339_l343_l336_DUPLICATE_49ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l346_l343_l339_l366_l336_l362_l330_l358_DUPLICATE_4884_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l346_l343_l339_l366_l336_l362_l330_l358_DUPLICATE_4884_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_2940_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l346_l343_l339_l366_l336_l362_l330_l358_DUPLICATE_4884_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_9015_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l346_l343_l339_l366_l336_l362_l330_l358_DUPLICATE_4884_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l346_l343_l339_l366_l336_l362_l330_l358_DUPLICATE_4884_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_1d44_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l346_l343_l339_l366_l336_l362_l330_l358_DUPLICATE_4884_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_9165_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l346_l343_l339_l366_l336_l362_l330_l358_DUPLICATE_4884_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_4d68_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l346_l343_l339_l366_l336_l362_l330_l358_DUPLICATE_4884_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l346_l362_DUPLICATE_958e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_9165_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l346_l362_DUPLICATE_958e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l346_l343_l339_l336_l362_l330_DUPLICATE_3f22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l346_l343_l339_l336_l362_l330_DUPLICATE_3f22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_2940_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l346_l343_l339_l336_l362_l330_DUPLICATE_3f22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_9015_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l346_l343_l339_l336_l362_l330_DUPLICATE_3f22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l346_l343_l339_l336_l362_l330_DUPLICATE_3f22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_9165_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l346_l343_l339_l336_l362_l330_DUPLICATE_3f22_return_output;
     -- t8_MUX[uxn_opcodes_h_l339_c7_2940] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l339_c7_2940_cond <= VAR_t8_MUX_uxn_opcodes_h_l339_c7_2940_cond;
     t8_MUX_uxn_opcodes_h_l339_c7_2940_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l339_c7_2940_iftrue;
     t8_MUX_uxn_opcodes_h_l339_c7_2940_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l339_c7_2940_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l339_c7_2940_return_output := t8_MUX_uxn_opcodes_h_l339_c7_2940_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l362_c7_9165] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l362_c7_9165_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_9165_cond;
     result_stack_value_MUX_uxn_opcodes_h_l362_c7_9165_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_9165_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l362_c7_9165_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_9165_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_9165_return_output := result_stack_value_MUX_uxn_opcodes_h_l362_c7_9165_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l366_c7_4d68] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_4d68_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_4d68_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_4d68_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_4d68_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_4d68_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_4d68_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_4d68_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_4d68_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l366_c7_4d68] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_4d68_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_4d68_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_4d68_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_4d68_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_4d68_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_4d68_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_4d68_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_4d68_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l346_c7_c4d9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_c4d9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_c4d9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l362_c7_9165] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_9165_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_9165_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_9165_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_9165_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_9165_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_9165_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_9165_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_9165_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l352_c7_efbd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_efbd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_efbd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_efbd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_efbd_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l350_c32_3267] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l350_c32_3267_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l350_c32_3267_left;
     BIN_OP_GT_uxn_opcodes_h_l350_c32_3267_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l350_c32_3267_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l350_c32_3267_return_output := BIN_OP_GT_uxn_opcodes_h_l350_c32_3267_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l330_c1_60a0] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_60a0_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_60a0_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_60a0_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_60a0_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_60a0_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_60a0_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_60a0_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_60a0_return_output;

     -- n8_MUX[uxn_opcodes_h_l346_c7_c4d9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l346_c7_c4d9_cond <= VAR_n8_MUX_uxn_opcodes_h_l346_c7_c4d9_cond;
     n8_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue;
     n8_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output := n8_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l350_c32_bb49_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l350_c32_3267_return_output;
     VAR_printf_uxn_opcodes_h_l331_c3_b92d_uxn_opcodes_h_l331_c3_b92d_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l330_c1_60a0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l343_c7_9015_iffalse := VAR_n8_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_9165_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l366_c7_4d68_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l352_c7_efbd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_9015_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_9165_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l366_c7_4d68_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_1d44_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l362_c7_9165_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_1d44_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l362_c7_9165_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse := VAR_t8_MUX_uxn_opcodes_h_l339_c7_2940_return_output;
     -- printf_uxn_opcodes_h_l331_c3_b92d[uxn_opcodes_h_l331_c3_b92d] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l331_c3_b92d_uxn_opcodes_h_l331_c3_b92d_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l331_c3_b92d_uxn_opcodes_h_l331_c3_b92d_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l350_c32_bb49] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l350_c32_bb49_cond <= VAR_MUX_uxn_opcodes_h_l350_c32_bb49_cond;
     MUX_uxn_opcodes_h_l350_c32_bb49_iftrue <= VAR_MUX_uxn_opcodes_h_l350_c32_bb49_iftrue;
     MUX_uxn_opcodes_h_l350_c32_bb49_iffalse <= VAR_MUX_uxn_opcodes_h_l350_c32_bb49_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l350_c32_bb49_return_output := MUX_uxn_opcodes_h_l350_c32_bb49_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l358_c7_1d44] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l358_c7_1d44_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_1d44_cond;
     result_stack_value_MUX_uxn_opcodes_h_l358_c7_1d44_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_1d44_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l358_c7_1d44_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_1d44_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_1d44_return_output := result_stack_value_MUX_uxn_opcodes_h_l358_c7_1d44_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l358_c7_1d44] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_1d44_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_1d44_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_1d44_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_1d44_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_1d44_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_1d44_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_1d44_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_1d44_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l362_c7_9165] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_9165_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_9165_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_9165_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_9165_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_9165_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_9165_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_9165_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_9165_return_output;

     -- n8_MUX[uxn_opcodes_h_l343_c7_9015] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l343_c7_9015_cond <= VAR_n8_MUX_uxn_opcodes_h_l343_c7_9015_cond;
     n8_MUX_uxn_opcodes_h_l343_c7_9015_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l343_c7_9015_iftrue;
     n8_MUX_uxn_opcodes_h_l343_c7_9015_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l343_c7_9015_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l343_c7_9015_return_output := n8_MUX_uxn_opcodes_h_l343_c7_9015_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l343_c7_9015] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_9015_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_9015_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_9015_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_9015_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_9015_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_9015_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_9015_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_9015_return_output;

     -- t8_MUX[uxn_opcodes_h_l336_c7_62ac] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l336_c7_62ac_cond <= VAR_t8_MUX_uxn_opcodes_h_l336_c7_62ac_cond;
     t8_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue;
     t8_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l336_c7_62ac_return_output := t8_MUX_uxn_opcodes_h_l336_c7_62ac_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l362_c7_9165] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_9165_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_9165_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_9165_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_9165_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_9165_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_9165_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_9165_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_9165_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l346_c7_c4d9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue := VAR_MUX_uxn_opcodes_h_l350_c32_bb49_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l339_c7_2940_iffalse := VAR_n8_MUX_uxn_opcodes_h_l343_c7_9015_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_1d44_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l362_c7_9165_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_9015_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_2940_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l343_c7_9015_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_1d44_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l362_c7_9165_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l358_c7_1d44_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l358_c7_1d44_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse := VAR_t8_MUX_uxn_opcodes_h_l336_c7_62ac_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l358_c7_1d44] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_1d44_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_1d44_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_1d44_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_1d44_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_1d44_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_1d44_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_1d44_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_1d44_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l358_c7_1d44] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_1d44_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_1d44_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_1d44_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_1d44_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_1d44_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_1d44_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_1d44_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_1d44_return_output;

     -- t8_MUX[uxn_opcodes_h_l330_c2_cc33] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l330_c2_cc33_cond <= VAR_t8_MUX_uxn_opcodes_h_l330_c2_cc33_cond;
     t8_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue;
     t8_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l330_c2_cc33_return_output := t8_MUX_uxn_opcodes_h_l330_c2_cc33_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l339_c7_2940] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_2940_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_2940_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_2940_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_2940_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_2940_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_2940_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_2940_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_2940_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l346_c7_c4d9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l352_c7_efbd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_efbd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_efbd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_efbd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_efbd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l352_c7_efbd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l352_c7_efbd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_efbd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_efbd_return_output := result_stack_value_MUX_uxn_opcodes_h_l352_c7_efbd_return_output;

     -- n8_MUX[uxn_opcodes_h_l339_c7_2940] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l339_c7_2940_cond <= VAR_n8_MUX_uxn_opcodes_h_l339_c7_2940_cond;
     n8_MUX_uxn_opcodes_h_l339_c7_2940_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l339_c7_2940_iftrue;
     n8_MUX_uxn_opcodes_h_l339_c7_2940_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l339_c7_2940_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l339_c7_2940_return_output := n8_MUX_uxn_opcodes_h_l339_c7_2940_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l343_c7_9015] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_9015_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_9015_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_9015_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_9015_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_9015_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_9015_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_9015_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_9015_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse := VAR_n8_MUX_uxn_opcodes_h_l339_c7_2940_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l358_c7_1d44_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_2940_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l343_c7_9015_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l339_c7_2940_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l358_c7_1d44_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_9015_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l352_c7_efbd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l352_c7_efbd_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l330_c2_cc33_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l339_c7_2940] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_2940_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_2940_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_2940_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_2940_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_2940_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_2940_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_2940_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_2940_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l352_c7_efbd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_efbd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_efbd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_efbd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_efbd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l343_c7_9015] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_9015_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_9015_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_9015_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_9015_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_9015_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_9015_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_9015_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_9015_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l336_c7_62ac] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_62ac_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_62ac_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_62ac_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_62ac_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l346_c7_c4d9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l346_c7_c4d9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_c4d9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output := result_stack_value_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l346_c7_c4d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_c4d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_c4d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l352_c7_efbd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_efbd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_efbd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_efbd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_efbd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_efbd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_efbd_return_output;

     -- n8_MUX[uxn_opcodes_h_l336_c7_62ac] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l336_c7_62ac_cond <= VAR_n8_MUX_uxn_opcodes_h_l336_c7_62ac_cond;
     n8_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue;
     n8_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l336_c7_62ac_return_output := n8_MUX_uxn_opcodes_h_l336_c7_62ac_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse := VAR_n8_MUX_uxn_opcodes_h_l336_c7_62ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l352_c7_efbd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l339_c7_2940_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l336_c7_62ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l352_c7_efbd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_2940_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l343_c7_9015_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_9015_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_9015_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l346_c7_c4d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_c4d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_c4d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l343_c7_9015] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_9015_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_9015_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_9015_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_9015_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_9015_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_9015_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_9015_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_9015_return_output;

     -- n8_MUX[uxn_opcodes_h_l330_c2_cc33] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l330_c2_cc33_cond <= VAR_n8_MUX_uxn_opcodes_h_l330_c2_cc33_cond;
     n8_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue;
     n8_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l330_c2_cc33_return_output := n8_MUX_uxn_opcodes_h_l330_c2_cc33_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l346_c7_c4d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_c4d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_c4d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_c4d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_c4d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l330_c2_cc33] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_cc33_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_cc33_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_cc33_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_cc33_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l339_c7_2940] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_2940_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_2940_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_2940_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_2940_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_2940_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_2940_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_2940_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_2940_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l336_c7_62ac] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_62ac_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_62ac_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_62ac_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_62ac_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l343_c7_9015] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l343_c7_9015_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_9015_cond;
     result_stack_value_MUX_uxn_opcodes_h_l343_c7_9015_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_9015_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l343_c7_9015_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_9015_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_9015_return_output := result_stack_value_MUX_uxn_opcodes_h_l343_c7_9015_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l330_c2_cc33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_9015_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l336_c7_62ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_9015_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l346_c7_c4d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l339_c7_2940_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_2940_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l343_c7_9015_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_2940_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l343_c7_9015_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l330_c2_cc33] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_cc33_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_cc33_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_cc33_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_cc33_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l343_c7_9015] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_9015_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_9015_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_9015_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_9015_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_9015_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_9015_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_9015_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_9015_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l336_c7_62ac] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_62ac_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_62ac_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_62ac_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_62ac_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l339_c7_2940] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l339_c7_2940_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_2940_cond;
     result_stack_value_MUX_uxn_opcodes_h_l339_c7_2940_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_2940_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l339_c7_2940_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_2940_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_2940_return_output := result_stack_value_MUX_uxn_opcodes_h_l339_c7_2940_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l343_c7_9015] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_9015_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_9015_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_9015_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_9015_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_9015_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_9015_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_9015_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_9015_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l339_c7_2940] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_2940_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_2940_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_2940_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_2940_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_2940_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_2940_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_2940_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_2940_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_2940_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l343_c7_9015_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_2940_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l343_c7_9015_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l336_c7_62ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l339_c7_2940_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l339_c7_2940_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l339_c7_2940] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_2940_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_2940_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_2940_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_2940_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_2940_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_2940_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_2940_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_2940_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l336_c7_62ac] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_62ac_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_62ac_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_62ac_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_62ac_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l336_c7_62ac] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l336_c7_62ac_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_62ac_cond;
     result_stack_value_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_62ac_return_output := result_stack_value_MUX_uxn_opcodes_h_l336_c7_62ac_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l339_c7_2940] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_2940_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_2940_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_2940_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_2940_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_2940_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_2940_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_2940_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_2940_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l330_c2_cc33] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_cc33_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_cc33_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_cc33_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_cc33_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l339_c7_2940_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l339_c7_2940_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l336_c7_62ac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l336_c7_62ac_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l336_c7_62ac] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_62ac_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_62ac_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_62ac_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_62ac_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l330_c2_cc33] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l330_c2_cc33_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_cc33_cond;
     result_stack_value_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_cc33_return_output := result_stack_value_MUX_uxn_opcodes_h_l330_c2_cc33_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l336_c7_62ac] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_62ac_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_62ac_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_62ac_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_62ac_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_62ac_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_62ac_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l330_c2_cc33] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_cc33_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_cc33_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_cc33_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_cc33_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l336_c7_62ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l336_c7_62ac_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l330_c2_cc33] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_cc33_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_cc33_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_cc33_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_cc33_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l330_c2_cc33] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_cc33_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_cc33_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_cc33_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_cc33_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_cc33_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_cc33_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l371_l326_DUPLICATE_ff8f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l371_l326_DUPLICATE_ff8f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l330_c2_cc33_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c2_cc33_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c2_cc33_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l330_c2_cc33_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c2_cc33_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c2_cc33_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l330_c2_cc33_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l371_l326_DUPLICATE_ff8f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l371_l326_DUPLICATE_ff8f_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
