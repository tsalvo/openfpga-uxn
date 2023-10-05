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
-- Submodules: 123
entity add2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add2_0CLK_201aeef3;
architecture arch of add2_0CLK_201aeef3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l776_c6_3ab6]
signal BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l776_c1_2d93]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l776_c1_2d93_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l776_c1_2d93_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l776_c1_2d93_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l776_c1_2d93_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l776_c2_7c28]
signal n16_MUX_uxn_opcodes_h_l776_c2_7c28_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l776_c2_7c28_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l776_c2_7c28]
signal result_stack_value_MUX_uxn_opcodes_h_l776_c2_7c28_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l776_c2_7c28_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l776_c2_7c28]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c2_7c28_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c2_7c28_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l776_c2_7c28]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l776_c2_7c28_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l776_c2_7c28_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l776_c2_7c28]
signal result_is_stack_read_MUX_uxn_opcodes_h_l776_c2_7c28_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l776_c2_7c28_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l776_c2_7c28]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c2_7c28_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c2_7c28_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l776_c2_7c28]
signal result_is_stack_write_MUX_uxn_opcodes_h_l776_c2_7c28_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l776_c2_7c28_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l776_c2_7c28]
signal result_is_opc_done_MUX_uxn_opcodes_h_l776_c2_7c28_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l776_c2_7c28_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l776_c2_7c28]
signal tmp16_MUX_uxn_opcodes_h_l776_c2_7c28_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l776_c2_7c28_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l776_c2_7c28]
signal t16_MUX_uxn_opcodes_h_l776_c2_7c28_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l776_c2_7c28_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l777_c3_c336[uxn_opcodes_h_l777_c3_c336]
signal printf_uxn_opcodes_h_l777_c3_c336_uxn_opcodes_h_l777_c3_c336_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l782_c11_fd1f]
signal BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l782_c7_abb8]
signal n16_MUX_uxn_opcodes_h_l782_c7_abb8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l782_c7_abb8_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l782_c7_abb8]
signal result_stack_value_MUX_uxn_opcodes_h_l782_c7_abb8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l782_c7_abb8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l782_c7_abb8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_abb8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_abb8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l782_c7_abb8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_abb8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_abb8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l782_c7_abb8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l782_c7_abb8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l782_c7_abb8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l782_c7_abb8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_abb8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_abb8_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l782_c7_abb8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_abb8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_abb8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l782_c7_abb8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_abb8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_abb8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l782_c7_abb8]
signal tmp16_MUX_uxn_opcodes_h_l782_c7_abb8_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l782_c7_abb8_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l782_c7_abb8]
signal t16_MUX_uxn_opcodes_h_l782_c7_abb8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l782_c7_abb8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l785_c11_0c38]
signal BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l785_c7_9bc6]
signal n16_MUX_uxn_opcodes_h_l785_c7_9bc6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l785_c7_9bc6]
signal result_stack_value_MUX_uxn_opcodes_h_l785_c7_9bc6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l785_c7_9bc6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l785_c7_9bc6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l785_c7_9bc6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l785_c7_9bc6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l785_c7_9bc6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l785_c7_9bc6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l785_c7_9bc6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l785_c7_9bc6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l785_c7_9bc6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l785_c7_9bc6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l785_c7_9bc6]
signal tmp16_MUX_uxn_opcodes_h_l785_c7_9bc6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l785_c7_9bc6]
signal t16_MUX_uxn_opcodes_h_l785_c7_9bc6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l790_c11_98d6]
signal BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l790_c7_d951]
signal n16_MUX_uxn_opcodes_h_l790_c7_d951_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l790_c7_d951_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l790_c7_d951_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l790_c7_d951_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l790_c7_d951]
signal result_stack_value_MUX_uxn_opcodes_h_l790_c7_d951_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l790_c7_d951_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l790_c7_d951_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l790_c7_d951_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l790_c7_d951]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_d951_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_d951_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_d951_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_d951_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l790_c7_d951]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l790_c7_d951_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l790_c7_d951_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l790_c7_d951_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l790_c7_d951_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l790_c7_d951]
signal result_is_stack_read_MUX_uxn_opcodes_h_l790_c7_d951_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l790_c7_d951_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l790_c7_d951_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l790_c7_d951_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l790_c7_d951]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_d951_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_d951_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_d951_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_d951_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l790_c7_d951]
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_d951_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_d951_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_d951_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_d951_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l790_c7_d951]
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_d951_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_d951_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_d951_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_d951_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l790_c7_d951]
signal tmp16_MUX_uxn_opcodes_h_l790_c7_d951_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l790_c7_d951_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l790_c7_d951_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l790_c7_d951_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l790_c7_d951]
signal t16_MUX_uxn_opcodes_h_l790_c7_d951_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l790_c7_d951_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l790_c7_d951_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l790_c7_d951_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l793_c11_124a]
signal BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l793_c7_44b2]
signal n16_MUX_uxn_opcodes_h_l793_c7_44b2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l793_c7_44b2_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l793_c7_44b2]
signal result_stack_value_MUX_uxn_opcodes_h_l793_c7_44b2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l793_c7_44b2_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l793_c7_44b2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l793_c7_44b2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l793_c7_44b2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l793_c7_44b2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l793_c7_44b2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l793_c7_44b2_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l793_c7_44b2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l793_c7_44b2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l793_c7_44b2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l793_c7_44b2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l793_c7_44b2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l793_c7_44b2_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l793_c7_44b2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l793_c7_44b2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l793_c7_44b2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l793_c7_44b2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l793_c7_44b2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l793_c7_44b2_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l793_c7_44b2]
signal tmp16_MUX_uxn_opcodes_h_l793_c7_44b2_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l793_c7_44b2_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l793_c7_44b2]
signal t16_MUX_uxn_opcodes_h_l793_c7_44b2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l793_c7_44b2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l794_c3_ceff]
signal BIN_OP_OR_uxn_opcodes_h_l794_c3_ceff_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l794_c3_ceff_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l794_c3_ceff_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l797_c11_6170]
signal BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l797_c7_3785]
signal n16_MUX_uxn_opcodes_h_l797_c7_3785_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l797_c7_3785_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l797_c7_3785_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l797_c7_3785_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l797_c7_3785]
signal result_stack_value_MUX_uxn_opcodes_h_l797_c7_3785_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l797_c7_3785_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l797_c7_3785_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l797_c7_3785_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l797_c7_3785]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_3785_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_3785_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_3785_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_3785_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l797_c7_3785]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_3785_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_3785_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_3785_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_3785_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l797_c7_3785]
signal result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_3785_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_3785_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_3785_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_3785_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l797_c7_3785]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_3785_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_3785_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_3785_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_3785_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l797_c7_3785]
signal result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_3785_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_3785_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_3785_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_3785_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l797_c7_3785]
signal result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_3785_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_3785_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_3785_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_3785_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l797_c7_3785]
signal tmp16_MUX_uxn_opcodes_h_l797_c7_3785_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l797_c7_3785_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l797_c7_3785_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l797_c7_3785_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l800_c11_7729]
signal BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l800_c7_cdeb]
signal n16_MUX_uxn_opcodes_h_l800_c7_cdeb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l800_c7_cdeb]
signal result_stack_value_MUX_uxn_opcodes_h_l800_c7_cdeb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l800_c7_cdeb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l800_c7_cdeb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l800_c7_cdeb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l800_c7_cdeb]
signal result_is_stack_read_MUX_uxn_opcodes_h_l800_c7_cdeb_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l800_c7_cdeb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l800_c7_cdeb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_cdeb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l800_c7_cdeb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_cdeb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l800_c7_cdeb]
signal tmp16_MUX_uxn_opcodes_h_l800_c7_cdeb_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l805_c11_78f8]
signal BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l805_c7_e411]
signal n16_MUX_uxn_opcodes_h_l805_c7_e411_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l805_c7_e411_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l805_c7_e411_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l805_c7_e411_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l805_c7_e411]
signal result_stack_value_MUX_uxn_opcodes_h_l805_c7_e411_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l805_c7_e411_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l805_c7_e411_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l805_c7_e411_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l805_c7_e411]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_e411_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_e411_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_e411_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_e411_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l805_c7_e411]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_e411_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_e411_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_e411_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_e411_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l805_c7_e411]
signal result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_e411_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_e411_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_e411_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_e411_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l805_c7_e411]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_e411_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_e411_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_e411_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_e411_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l805_c7_e411]
signal result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_e411_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_e411_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_e411_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_e411_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l805_c7_e411]
signal result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_e411_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_e411_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_e411_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_e411_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l805_c7_e411]
signal tmp16_MUX_uxn_opcodes_h_l805_c7_e411_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l805_c7_e411_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l805_c7_e411_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l805_c7_e411_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l808_c11_1eb0]
signal BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l808_c7_51b4]
signal n16_MUX_uxn_opcodes_h_l808_c7_51b4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l808_c7_51b4_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l808_c7_51b4]
signal result_stack_value_MUX_uxn_opcodes_h_l808_c7_51b4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l808_c7_51b4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l808_c7_51b4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_51b4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_51b4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l808_c7_51b4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l808_c7_51b4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l808_c7_51b4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l808_c7_51b4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l808_c7_51b4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l808_c7_51b4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l808_c7_51b4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_51b4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_51b4_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l808_c7_51b4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_51b4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_51b4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l808_c7_51b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_51b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_51b4_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l808_c7_51b4]
signal tmp16_MUX_uxn_opcodes_h_l808_c7_51b4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l808_c7_51b4_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l809_c3_9da1]
signal BIN_OP_OR_uxn_opcodes_h_l809_c3_9da1_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l809_c3_9da1_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l809_c3_9da1_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l810_c11_2a11]
signal BIN_OP_PLUS_uxn_opcodes_h_l810_c11_2a11_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l810_c11_2a11_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l810_c11_2a11_return_output : unsigned(16 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l813_c32_721f]
signal BIN_OP_AND_uxn_opcodes_h_l813_c32_721f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l813_c32_721f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l813_c32_721f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l813_c32_e9a8]
signal BIN_OP_GT_uxn_opcodes_h_l813_c32_e9a8_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l813_c32_e9a8_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l813_c32_e9a8_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l813_c32_f7ec]
signal MUX_uxn_opcodes_h_l813_c32_f7ec_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l813_c32_f7ec_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l813_c32_f7ec_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l813_c32_f7ec_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l815_c11_4c5c]
signal BIN_OP_EQ_uxn_opcodes_h_l815_c11_4c5c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l815_c11_4c5c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l815_c11_4c5c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l815_c7_ec50]
signal result_stack_value_MUX_uxn_opcodes_h_l815_c7_ec50_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l815_c7_ec50_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l815_c7_ec50]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_ec50_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_ec50_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l815_c7_ec50]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_ec50_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_ec50_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l815_c7_ec50]
signal result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_ec50_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_ec50_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l815_c7_ec50]
signal result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_ec50_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_ec50_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l821_c11_92cc]
signal BIN_OP_EQ_uxn_opcodes_h_l821_c11_92cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l821_c11_92cc_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l821_c11_92cc_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l821_c7_57b4]
signal result_stack_value_MUX_uxn_opcodes_h_l821_c7_57b4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l821_c7_57b4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l821_c7_57b4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l821_c7_57b4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l821_c7_57b4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_57b4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_57b4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_57b4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_57b4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l821_c7_57b4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_57b4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_57b4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_57b4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_57b4_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l821_c7_57b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_57b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_57b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_57b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_57b4_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l823_c34_0e5d]
signal CONST_SR_8_uxn_opcodes_h_l823_c34_0e5d_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l823_c34_0e5d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l825_c11_2768]
signal BIN_OP_EQ_uxn_opcodes_h_l825_c11_2768_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l825_c11_2768_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l825_c11_2768_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l825_c7_9252]
signal result_is_stack_write_MUX_uxn_opcodes_h_l825_c7_9252_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l825_c7_9252_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l825_c7_9252_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l825_c7_9252_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l825_c7_9252]
signal result_is_opc_done_MUX_uxn_opcodes_h_l825_c7_9252_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l825_c7_9252_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l825_c7_9252_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l825_c7_9252_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l802_l787_DUPLICATE_d6ce
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l802_l787_DUPLICATE_d6ce_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l802_l787_DUPLICATE_d6ce_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_df93( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6
BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_left,
BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_right,
BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l776_c1_2d93
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l776_c1_2d93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l776_c1_2d93_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l776_c1_2d93_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l776_c1_2d93_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l776_c1_2d93_return_output);

-- n16_MUX_uxn_opcodes_h_l776_c2_7c28
n16_MUX_uxn_opcodes_h_l776_c2_7c28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l776_c2_7c28_cond,
n16_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue,
n16_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse,
n16_MUX_uxn_opcodes_h_l776_c2_7c28_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l776_c2_7c28
result_stack_value_MUX_uxn_opcodes_h_l776_c2_7c28 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l776_c2_7c28_cond,
result_stack_value_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l776_c2_7c28_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c2_7c28
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c2_7c28 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c2_7c28_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c2_7c28_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l776_c2_7c28
result_is_sp_shift_MUX_uxn_opcodes_h_l776_c2_7c28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l776_c2_7c28_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l776_c2_7c28_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l776_c2_7c28
result_is_stack_read_MUX_uxn_opcodes_h_l776_c2_7c28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l776_c2_7c28_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l776_c2_7c28_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c2_7c28
result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c2_7c28 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c2_7c28_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c2_7c28_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l776_c2_7c28
result_is_stack_write_MUX_uxn_opcodes_h_l776_c2_7c28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l776_c2_7c28_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l776_c2_7c28_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l776_c2_7c28
result_is_opc_done_MUX_uxn_opcodes_h_l776_c2_7c28 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l776_c2_7c28_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l776_c2_7c28_return_output);

-- tmp16_MUX_uxn_opcodes_h_l776_c2_7c28
tmp16_MUX_uxn_opcodes_h_l776_c2_7c28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l776_c2_7c28_cond,
tmp16_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue,
tmp16_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse,
tmp16_MUX_uxn_opcodes_h_l776_c2_7c28_return_output);

-- t16_MUX_uxn_opcodes_h_l776_c2_7c28
t16_MUX_uxn_opcodes_h_l776_c2_7c28 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l776_c2_7c28_cond,
t16_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue,
t16_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse,
t16_MUX_uxn_opcodes_h_l776_c2_7c28_return_output);

-- printf_uxn_opcodes_h_l777_c3_c336_uxn_opcodes_h_l777_c3_c336
printf_uxn_opcodes_h_l777_c3_c336_uxn_opcodes_h_l777_c3_c336 : entity work.printf_uxn_opcodes_h_l777_c3_c336_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l777_c3_c336_uxn_opcodes_h_l777_c3_c336_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f
BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f_left,
BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f_right,
BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f_return_output);

-- n16_MUX_uxn_opcodes_h_l782_c7_abb8
n16_MUX_uxn_opcodes_h_l782_c7_abb8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l782_c7_abb8_cond,
n16_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue,
n16_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse,
n16_MUX_uxn_opcodes_h_l782_c7_abb8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l782_c7_abb8
result_stack_value_MUX_uxn_opcodes_h_l782_c7_abb8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l782_c7_abb8_cond,
result_stack_value_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l782_c7_abb8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_abb8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_abb8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_abb8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_abb8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_abb8
result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_abb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_abb8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_abb8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l782_c7_abb8
result_is_stack_read_MUX_uxn_opcodes_h_l782_c7_abb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l782_c7_abb8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l782_c7_abb8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_abb8
result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_abb8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_abb8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_abb8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_abb8
result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_abb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_abb8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_abb8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_abb8
result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_abb8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_abb8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_abb8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l782_c7_abb8
tmp16_MUX_uxn_opcodes_h_l782_c7_abb8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l782_c7_abb8_cond,
tmp16_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue,
tmp16_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse,
tmp16_MUX_uxn_opcodes_h_l782_c7_abb8_return_output);

-- t16_MUX_uxn_opcodes_h_l782_c7_abb8
t16_MUX_uxn_opcodes_h_l782_c7_abb8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l782_c7_abb8_cond,
t16_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue,
t16_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse,
t16_MUX_uxn_opcodes_h_l782_c7_abb8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38
BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38_left,
BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38_right,
BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38_return_output);

-- n16_MUX_uxn_opcodes_h_l785_c7_9bc6
n16_MUX_uxn_opcodes_h_l785_c7_9bc6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l785_c7_9bc6_cond,
n16_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue,
n16_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse,
n16_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l785_c7_9bc6
result_stack_value_MUX_uxn_opcodes_h_l785_c7_9bc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l785_c7_9bc6_cond,
result_stack_value_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l785_c7_9bc6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l785_c7_9bc6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l785_c7_9bc6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l785_c7_9bc6
result_is_sp_shift_MUX_uxn_opcodes_h_l785_c7_9bc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l785_c7_9bc6
result_is_stack_read_MUX_uxn_opcodes_h_l785_c7_9bc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l785_c7_9bc6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l785_c7_9bc6
result_sp_relative_shift_MUX_uxn_opcodes_h_l785_c7_9bc6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l785_c7_9bc6
result_is_stack_write_MUX_uxn_opcodes_h_l785_c7_9bc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l785_c7_9bc6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l785_c7_9bc6
result_is_opc_done_MUX_uxn_opcodes_h_l785_c7_9bc6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l785_c7_9bc6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l785_c7_9bc6
tmp16_MUX_uxn_opcodes_h_l785_c7_9bc6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l785_c7_9bc6_cond,
tmp16_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue,
tmp16_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse,
tmp16_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output);

-- t16_MUX_uxn_opcodes_h_l785_c7_9bc6
t16_MUX_uxn_opcodes_h_l785_c7_9bc6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l785_c7_9bc6_cond,
t16_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue,
t16_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse,
t16_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6
BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6_left,
BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6_right,
BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6_return_output);

-- n16_MUX_uxn_opcodes_h_l790_c7_d951
n16_MUX_uxn_opcodes_h_l790_c7_d951 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l790_c7_d951_cond,
n16_MUX_uxn_opcodes_h_l790_c7_d951_iftrue,
n16_MUX_uxn_opcodes_h_l790_c7_d951_iffalse,
n16_MUX_uxn_opcodes_h_l790_c7_d951_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l790_c7_d951
result_stack_value_MUX_uxn_opcodes_h_l790_c7_d951 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l790_c7_d951_cond,
result_stack_value_MUX_uxn_opcodes_h_l790_c7_d951_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l790_c7_d951_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l790_c7_d951_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_d951
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_d951 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_d951_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_d951_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_d951_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_d951_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l790_c7_d951
result_is_sp_shift_MUX_uxn_opcodes_h_l790_c7_d951 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l790_c7_d951_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l790_c7_d951_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l790_c7_d951_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l790_c7_d951_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l790_c7_d951
result_is_stack_read_MUX_uxn_opcodes_h_l790_c7_d951 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l790_c7_d951_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l790_c7_d951_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l790_c7_d951_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l790_c7_d951_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_d951
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_d951 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_d951_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_d951_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_d951_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_d951_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_d951
result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_d951 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_d951_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_d951_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_d951_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_d951_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_d951
result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_d951 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_d951_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_d951_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_d951_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_d951_return_output);

-- tmp16_MUX_uxn_opcodes_h_l790_c7_d951
tmp16_MUX_uxn_opcodes_h_l790_c7_d951 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l790_c7_d951_cond,
tmp16_MUX_uxn_opcodes_h_l790_c7_d951_iftrue,
tmp16_MUX_uxn_opcodes_h_l790_c7_d951_iffalse,
tmp16_MUX_uxn_opcodes_h_l790_c7_d951_return_output);

-- t16_MUX_uxn_opcodes_h_l790_c7_d951
t16_MUX_uxn_opcodes_h_l790_c7_d951 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l790_c7_d951_cond,
t16_MUX_uxn_opcodes_h_l790_c7_d951_iftrue,
t16_MUX_uxn_opcodes_h_l790_c7_d951_iffalse,
t16_MUX_uxn_opcodes_h_l790_c7_d951_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a
BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a_left,
BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a_right,
BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a_return_output);

-- n16_MUX_uxn_opcodes_h_l793_c7_44b2
n16_MUX_uxn_opcodes_h_l793_c7_44b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l793_c7_44b2_cond,
n16_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue,
n16_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse,
n16_MUX_uxn_opcodes_h_l793_c7_44b2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l793_c7_44b2
result_stack_value_MUX_uxn_opcodes_h_l793_c7_44b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l793_c7_44b2_cond,
result_stack_value_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l793_c7_44b2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l793_c7_44b2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l793_c7_44b2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l793_c7_44b2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l793_c7_44b2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l793_c7_44b2
result_is_sp_shift_MUX_uxn_opcodes_h_l793_c7_44b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l793_c7_44b2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l793_c7_44b2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l793_c7_44b2
result_is_stack_read_MUX_uxn_opcodes_h_l793_c7_44b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l793_c7_44b2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l793_c7_44b2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l793_c7_44b2
result_sp_relative_shift_MUX_uxn_opcodes_h_l793_c7_44b2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l793_c7_44b2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l793_c7_44b2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l793_c7_44b2
result_is_stack_write_MUX_uxn_opcodes_h_l793_c7_44b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l793_c7_44b2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l793_c7_44b2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l793_c7_44b2
result_is_opc_done_MUX_uxn_opcodes_h_l793_c7_44b2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l793_c7_44b2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l793_c7_44b2_return_output);

-- tmp16_MUX_uxn_opcodes_h_l793_c7_44b2
tmp16_MUX_uxn_opcodes_h_l793_c7_44b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l793_c7_44b2_cond,
tmp16_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue,
tmp16_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse,
tmp16_MUX_uxn_opcodes_h_l793_c7_44b2_return_output);

-- t16_MUX_uxn_opcodes_h_l793_c7_44b2
t16_MUX_uxn_opcodes_h_l793_c7_44b2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l793_c7_44b2_cond,
t16_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue,
t16_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse,
t16_MUX_uxn_opcodes_h_l793_c7_44b2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l794_c3_ceff
BIN_OP_OR_uxn_opcodes_h_l794_c3_ceff : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l794_c3_ceff_left,
BIN_OP_OR_uxn_opcodes_h_l794_c3_ceff_right,
BIN_OP_OR_uxn_opcodes_h_l794_c3_ceff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170
BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170_left,
BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170_right,
BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170_return_output);

-- n16_MUX_uxn_opcodes_h_l797_c7_3785
n16_MUX_uxn_opcodes_h_l797_c7_3785 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l797_c7_3785_cond,
n16_MUX_uxn_opcodes_h_l797_c7_3785_iftrue,
n16_MUX_uxn_opcodes_h_l797_c7_3785_iffalse,
n16_MUX_uxn_opcodes_h_l797_c7_3785_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l797_c7_3785
result_stack_value_MUX_uxn_opcodes_h_l797_c7_3785 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l797_c7_3785_cond,
result_stack_value_MUX_uxn_opcodes_h_l797_c7_3785_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l797_c7_3785_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l797_c7_3785_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_3785
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_3785 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_3785_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_3785_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_3785_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_3785_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_3785
result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_3785 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_3785_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_3785_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_3785_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_3785_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_3785
result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_3785 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_3785_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_3785_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_3785_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_3785_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_3785
result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_3785 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_3785_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_3785_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_3785_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_3785_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_3785
result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_3785 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_3785_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_3785_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_3785_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_3785_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_3785
result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_3785 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_3785_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_3785_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_3785_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_3785_return_output);

-- tmp16_MUX_uxn_opcodes_h_l797_c7_3785
tmp16_MUX_uxn_opcodes_h_l797_c7_3785 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l797_c7_3785_cond,
tmp16_MUX_uxn_opcodes_h_l797_c7_3785_iftrue,
tmp16_MUX_uxn_opcodes_h_l797_c7_3785_iffalse,
tmp16_MUX_uxn_opcodes_h_l797_c7_3785_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729
BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729_left,
BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729_right,
BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729_return_output);

-- n16_MUX_uxn_opcodes_h_l800_c7_cdeb
n16_MUX_uxn_opcodes_h_l800_c7_cdeb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l800_c7_cdeb_cond,
n16_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue,
n16_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse,
n16_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l800_c7_cdeb
result_stack_value_MUX_uxn_opcodes_h_l800_c7_cdeb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l800_c7_cdeb_cond,
result_stack_value_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l800_c7_cdeb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l800_c7_cdeb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l800_c7_cdeb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l800_c7_cdeb
result_is_sp_shift_MUX_uxn_opcodes_h_l800_c7_cdeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l800_c7_cdeb
result_is_stack_read_MUX_uxn_opcodes_h_l800_c7_cdeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l800_c7_cdeb_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l800_c7_cdeb
result_sp_relative_shift_MUX_uxn_opcodes_h_l800_c7_cdeb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_cdeb
result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_cdeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_cdeb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_cdeb
result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_cdeb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_cdeb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l800_c7_cdeb
tmp16_MUX_uxn_opcodes_h_l800_c7_cdeb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l800_c7_cdeb_cond,
tmp16_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue,
tmp16_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse,
tmp16_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8
BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8_left,
BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8_right,
BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8_return_output);

-- n16_MUX_uxn_opcodes_h_l805_c7_e411
n16_MUX_uxn_opcodes_h_l805_c7_e411 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l805_c7_e411_cond,
n16_MUX_uxn_opcodes_h_l805_c7_e411_iftrue,
n16_MUX_uxn_opcodes_h_l805_c7_e411_iffalse,
n16_MUX_uxn_opcodes_h_l805_c7_e411_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l805_c7_e411
result_stack_value_MUX_uxn_opcodes_h_l805_c7_e411 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l805_c7_e411_cond,
result_stack_value_MUX_uxn_opcodes_h_l805_c7_e411_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l805_c7_e411_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l805_c7_e411_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_e411
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_e411 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_e411_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_e411_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_e411_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_e411_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_e411
result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_e411 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_e411_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_e411_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_e411_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_e411_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_e411
result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_e411 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_e411_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_e411_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_e411_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_e411_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_e411
result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_e411 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_e411_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_e411_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_e411_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_e411_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_e411
result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_e411 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_e411_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_e411_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_e411_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_e411_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_e411
result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_e411 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_e411_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_e411_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_e411_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_e411_return_output);

-- tmp16_MUX_uxn_opcodes_h_l805_c7_e411
tmp16_MUX_uxn_opcodes_h_l805_c7_e411 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l805_c7_e411_cond,
tmp16_MUX_uxn_opcodes_h_l805_c7_e411_iftrue,
tmp16_MUX_uxn_opcodes_h_l805_c7_e411_iffalse,
tmp16_MUX_uxn_opcodes_h_l805_c7_e411_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0
BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0_left,
BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0_right,
BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0_return_output);

-- n16_MUX_uxn_opcodes_h_l808_c7_51b4
n16_MUX_uxn_opcodes_h_l808_c7_51b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l808_c7_51b4_cond,
n16_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue,
n16_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse,
n16_MUX_uxn_opcodes_h_l808_c7_51b4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l808_c7_51b4
result_stack_value_MUX_uxn_opcodes_h_l808_c7_51b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l808_c7_51b4_cond,
result_stack_value_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l808_c7_51b4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_51b4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_51b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_51b4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_51b4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l808_c7_51b4
result_is_sp_shift_MUX_uxn_opcodes_h_l808_c7_51b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l808_c7_51b4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l808_c7_51b4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l808_c7_51b4
result_is_stack_read_MUX_uxn_opcodes_h_l808_c7_51b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l808_c7_51b4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l808_c7_51b4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_51b4
result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_51b4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_51b4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_51b4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_51b4
result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_51b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_51b4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_51b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_51b4
result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_51b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_51b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_51b4_return_output);

-- tmp16_MUX_uxn_opcodes_h_l808_c7_51b4
tmp16_MUX_uxn_opcodes_h_l808_c7_51b4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l808_c7_51b4_cond,
tmp16_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue,
tmp16_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse,
tmp16_MUX_uxn_opcodes_h_l808_c7_51b4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l809_c3_9da1
BIN_OP_OR_uxn_opcodes_h_l809_c3_9da1 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l809_c3_9da1_left,
BIN_OP_OR_uxn_opcodes_h_l809_c3_9da1_right,
BIN_OP_OR_uxn_opcodes_h_l809_c3_9da1_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l810_c11_2a11
BIN_OP_PLUS_uxn_opcodes_h_l810_c11_2a11 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l810_c11_2a11_left,
BIN_OP_PLUS_uxn_opcodes_h_l810_c11_2a11_right,
BIN_OP_PLUS_uxn_opcodes_h_l810_c11_2a11_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l813_c32_721f
BIN_OP_AND_uxn_opcodes_h_l813_c32_721f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l813_c32_721f_left,
BIN_OP_AND_uxn_opcodes_h_l813_c32_721f_right,
BIN_OP_AND_uxn_opcodes_h_l813_c32_721f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l813_c32_e9a8
BIN_OP_GT_uxn_opcodes_h_l813_c32_e9a8 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l813_c32_e9a8_left,
BIN_OP_GT_uxn_opcodes_h_l813_c32_e9a8_right,
BIN_OP_GT_uxn_opcodes_h_l813_c32_e9a8_return_output);

-- MUX_uxn_opcodes_h_l813_c32_f7ec
MUX_uxn_opcodes_h_l813_c32_f7ec : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l813_c32_f7ec_cond,
MUX_uxn_opcodes_h_l813_c32_f7ec_iftrue,
MUX_uxn_opcodes_h_l813_c32_f7ec_iffalse,
MUX_uxn_opcodes_h_l813_c32_f7ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l815_c11_4c5c
BIN_OP_EQ_uxn_opcodes_h_l815_c11_4c5c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l815_c11_4c5c_left,
BIN_OP_EQ_uxn_opcodes_h_l815_c11_4c5c_right,
BIN_OP_EQ_uxn_opcodes_h_l815_c11_4c5c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l815_c7_ec50
result_stack_value_MUX_uxn_opcodes_h_l815_c7_ec50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l815_c7_ec50_cond,
result_stack_value_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l815_c7_ec50_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_ec50
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_ec50 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_ec50_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_ec50_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_ec50
result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_ec50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_ec50_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_ec50_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_ec50
result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_ec50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_ec50_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_ec50_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_ec50
result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_ec50 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_ec50_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_ec50_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l821_c11_92cc
BIN_OP_EQ_uxn_opcodes_h_l821_c11_92cc : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l821_c11_92cc_left,
BIN_OP_EQ_uxn_opcodes_h_l821_c11_92cc_right,
BIN_OP_EQ_uxn_opcodes_h_l821_c11_92cc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l821_c7_57b4
result_stack_value_MUX_uxn_opcodes_h_l821_c7_57b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l821_c7_57b4_cond,
result_stack_value_MUX_uxn_opcodes_h_l821_c7_57b4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l821_c7_57b4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l821_c7_57b4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_57b4
result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_57b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_57b4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_57b4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_57b4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_57b4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_57b4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_57b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_57b4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_57b4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_57b4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_57b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_57b4
result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_57b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_57b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_57b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_57b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_57b4_return_output);

-- CONST_SR_8_uxn_opcodes_h_l823_c34_0e5d
CONST_SR_8_uxn_opcodes_h_l823_c34_0e5d : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l823_c34_0e5d_x,
CONST_SR_8_uxn_opcodes_h_l823_c34_0e5d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l825_c11_2768
BIN_OP_EQ_uxn_opcodes_h_l825_c11_2768 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l825_c11_2768_left,
BIN_OP_EQ_uxn_opcodes_h_l825_c11_2768_right,
BIN_OP_EQ_uxn_opcodes_h_l825_c11_2768_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l825_c7_9252
result_is_stack_write_MUX_uxn_opcodes_h_l825_c7_9252 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l825_c7_9252_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l825_c7_9252_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l825_c7_9252_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l825_c7_9252_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l825_c7_9252
result_is_opc_done_MUX_uxn_opcodes_h_l825_c7_9252 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l825_c7_9252_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l825_c7_9252_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l825_c7_9252_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l825_c7_9252_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l802_l787_DUPLICATE_d6ce
CONST_SL_8_uint16_t_uxn_opcodes_h_l802_l787_DUPLICATE_d6ce : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l802_l787_DUPLICATE_d6ce_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l802_l787_DUPLICATE_d6ce_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l776_c1_2d93_return_output,
 n16_MUX_uxn_opcodes_h_l776_c2_7c28_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l776_c2_7c28_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c2_7c28_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l776_c2_7c28_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l776_c2_7c28_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c2_7c28_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l776_c2_7c28_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l776_c2_7c28_return_output,
 tmp16_MUX_uxn_opcodes_h_l776_c2_7c28_return_output,
 t16_MUX_uxn_opcodes_h_l776_c2_7c28_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f_return_output,
 n16_MUX_uxn_opcodes_h_l782_c7_abb8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l782_c7_abb8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_abb8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_abb8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l782_c7_abb8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_abb8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_abb8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_abb8_return_output,
 tmp16_MUX_uxn_opcodes_h_l782_c7_abb8_return_output,
 t16_MUX_uxn_opcodes_h_l782_c7_abb8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38_return_output,
 n16_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output,
 tmp16_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output,
 t16_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6_return_output,
 n16_MUX_uxn_opcodes_h_l790_c7_d951_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l790_c7_d951_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_d951_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l790_c7_d951_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l790_c7_d951_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_d951_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_d951_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_d951_return_output,
 tmp16_MUX_uxn_opcodes_h_l790_c7_d951_return_output,
 t16_MUX_uxn_opcodes_h_l790_c7_d951_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a_return_output,
 n16_MUX_uxn_opcodes_h_l793_c7_44b2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l793_c7_44b2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l793_c7_44b2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l793_c7_44b2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l793_c7_44b2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l793_c7_44b2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l793_c7_44b2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l793_c7_44b2_return_output,
 tmp16_MUX_uxn_opcodes_h_l793_c7_44b2_return_output,
 t16_MUX_uxn_opcodes_h_l793_c7_44b2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l794_c3_ceff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170_return_output,
 n16_MUX_uxn_opcodes_h_l797_c7_3785_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l797_c7_3785_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_3785_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_3785_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_3785_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_3785_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_3785_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_3785_return_output,
 tmp16_MUX_uxn_opcodes_h_l797_c7_3785_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729_return_output,
 n16_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output,
 tmp16_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8_return_output,
 n16_MUX_uxn_opcodes_h_l805_c7_e411_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l805_c7_e411_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_e411_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_e411_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_e411_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_e411_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_e411_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_e411_return_output,
 tmp16_MUX_uxn_opcodes_h_l805_c7_e411_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0_return_output,
 n16_MUX_uxn_opcodes_h_l808_c7_51b4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l808_c7_51b4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_51b4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l808_c7_51b4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l808_c7_51b4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_51b4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_51b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_51b4_return_output,
 tmp16_MUX_uxn_opcodes_h_l808_c7_51b4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l809_c3_9da1_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l810_c11_2a11_return_output,
 BIN_OP_AND_uxn_opcodes_h_l813_c32_721f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l813_c32_e9a8_return_output,
 MUX_uxn_opcodes_h_l813_c32_f7ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l815_c11_4c5c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l815_c7_ec50_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_ec50_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_ec50_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_ec50_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_ec50_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l821_c11_92cc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l821_c7_57b4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_57b4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_57b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_57b4_return_output,
 CONST_SR_8_uxn_opcodes_h_l823_c34_0e5d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l825_c11_2768_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l825_c7_9252_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l825_c7_9252_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l802_l787_DUPLICATE_d6ce_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l776_c1_2d93_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l776_c1_2d93_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l776_c1_2d93_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l776_c1_2d93_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l782_c7_abb8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l776_c2_7c28_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l776_c2_7c28_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l782_c7_abb8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c2_7c28_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c2_7c28_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l779_c3_ca27 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_abb8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c2_7c28_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c2_7c28_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_abb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c2_7c28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c2_7c28_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l782_c7_abb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l776_c2_7c28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l776_c2_7c28_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_abb8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c2_7c28_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c2_7c28_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_abb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c2_7c28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c2_7c28_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_abb8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c2_7c28_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c2_7c28_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l782_c7_abb8_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l776_c2_7c28_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l776_c2_7c28_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l782_c7_abb8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l776_c2_7c28_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l776_c2_7c28_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l777_c3_c336_uxn_opcodes_h_l777_c3_c336_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l782_c7_abb8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l782_c7_abb8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l783_c3_de64 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_abb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_abb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l782_c7_abb8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_abb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_abb8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_abb8_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l782_c7_abb8_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l782_c7_abb8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l790_c7_d951_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l785_c7_9bc6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l790_c7_d951_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l785_c7_9bc6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l788_c3_3f6a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_d951_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l785_c7_9bc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l790_c7_d951_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l790_c7_d951_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l785_c7_9bc6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_d951_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_d951_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l785_c7_9bc6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_d951_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l785_c7_9bc6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l790_c7_d951_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l785_c7_9bc6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l790_c7_d951_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l785_c7_9bc6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l790_c7_d951_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l790_c7_d951_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l793_c7_44b2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l790_c7_d951_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l790_c7_d951_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l790_c7_d951_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l793_c7_44b2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l790_c7_d951_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_d951_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l791_c3_035c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_d951_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l793_c7_44b2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_d951_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l790_c7_d951_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l790_c7_d951_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l793_c7_44b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l790_c7_d951_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l790_c7_d951_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l790_c7_d951_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l793_c7_44b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l790_c7_d951_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_d951_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_d951_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l793_c7_44b2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_d951_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_d951_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_d951_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l793_c7_44b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_d951_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_d951_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_d951_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l793_c7_44b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_d951_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l790_c7_d951_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l790_c7_d951_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l793_c7_44b2_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l790_c7_d951_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l790_c7_d951_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l790_c7_d951_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l793_c7_44b2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l790_c7_d951_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l797_c7_3785_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l793_c7_44b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_3785_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l793_c7_44b2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l795_c3_b9cb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_3785_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l793_c7_44b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_3785_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l793_c7_44b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_3785_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l793_c7_44b2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_3785_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l793_c7_44b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_3785_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l793_c7_44b2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_3785_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l793_c7_44b2_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l797_c7_3785_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l793_c7_44b2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l793_c7_44b2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l794_c3_ceff_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l794_c3_ceff_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l794_c3_ceff_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l797_c7_3785_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l797_c7_3785_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l797_c7_3785_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_3785_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_3785_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_3785_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_3785_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l798_c3_a356 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_3785_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_3785_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_3785_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_3785_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_3785_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_3785_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_3785_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_3785_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_3785_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_3785_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_3785_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_3785_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_3785_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_3785_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_3785_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_3785_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_3785_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l797_c7_3785_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l797_c7_3785_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l797_c7_3785_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l805_c7_e411_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l800_c7_cdeb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l805_c7_e411_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l800_c7_cdeb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l803_c3_20fa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_e411_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l800_c7_cdeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_e411_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_e411_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l800_c7_cdeb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_e411_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_e411_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_cdeb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_e411_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_cdeb_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l805_c7_e411_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l800_c7_cdeb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l805_c7_e411_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l805_c7_e411_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l808_c7_51b4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l805_c7_e411_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l805_c7_e411_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l805_c7_e411_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l808_c7_51b4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l805_c7_e411_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_e411_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l806_c3_03e3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_e411_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_51b4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_e411_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_e411_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_e411_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l808_c7_51b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_e411_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_e411_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_e411_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l808_c7_51b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_e411_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_e411_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_e411_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_51b4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_e411_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_e411_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_e411_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_51b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_e411_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_e411_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_e411_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_51b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_e411_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l805_c7_e411_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l805_c7_e411_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l808_c7_51b4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l805_c7_e411_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l808_c7_51b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l815_c7_ec50_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l808_c7_51b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_ec50_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_51b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_ec50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l808_c7_51b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l808_c7_51b4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_51b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_ec50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_51b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_ec50_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_51b4_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l810_c3_43ca : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l808_c7_51b4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l809_c3_9da1_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l809_c3_9da1_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l809_c3_9da1_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l810_c11_2a11_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l810_c11_2a11_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l810_c11_2a11_return_output : unsigned(16 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l813_c32_f7ec_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l813_c32_f7ec_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l813_c32_f7ec_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l813_c32_721f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l813_c32_721f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l813_c32_721f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l813_c32_e9a8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l813_c32_e9a8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l813_c32_e9a8_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l813_c32_f7ec_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_4c5c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_4c5c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_4c5c_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l821_c7_57b4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l815_c7_ec50_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l818_c3_4324 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_57b4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_ec50_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_ec50_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_57b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_ec50_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_57b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_ec50_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l819_c24_1fee_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_92cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_92cc_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_92cc_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l821_c7_57b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l821_c7_57b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l821_c7_57b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_57b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_57b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l825_c7_9252_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_57b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_57b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l822_c3_62c0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_57b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_57b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_57b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_57b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l825_c7_9252_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_57b4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l823_c34_0e5d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l823_c34_0e5d_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l823_c24_6021_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l825_c11_2768_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l825_c11_2768_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l825_c11_2768_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l825_c7_9252_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l825_c7_9252_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l825_c7_9252_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l825_c7_9252_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l825_c7_9252_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l825_c7_9252_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l821_l782_l776_l808_l805_DUPLICATE_2317_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l815_l776_l805_DUPLICATE_5dac_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l776_l808_l805_DUPLICATE_f74f_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l800_l797_l790_l825_l793_l785_l821_l782_l776_l808_l805_DUPLICATE_6d5c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l808_l805_DUPLICATE_6b61_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l800_l797_l790_l825_l793_l785_l821_l782_l815_l808_l805_DUPLICATE_30e3_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l794_l786_l809_l801_DUPLICATE_3eb1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l802_l787_DUPLICATE_d6ce_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l802_l787_DUPLICATE_d6ce_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l821_l808_DUPLICATE_802a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l830_l772_DUPLICATE_3f3d_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_92cc_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l783_c3_de64 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l783_c3_de64;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l776_c1_2d93_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l813_c32_f7ec_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l803_c3_20fa := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l803_c3_20fa;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l818_c3_4324 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l818_c3_4324;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l798_c3_a356 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_3785_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l798_c3_a356;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l825_c11_2768_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l791_c3_035c := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_d951_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l791_c3_035c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l806_c3_03e3 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_e411_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l806_c3_03e3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l779_c3_ca27 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l779_c3_ca27;
     VAR_BIN_OP_GT_uxn_opcodes_h_l813_c32_e9a8_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170_right := to_unsigned(5, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l795_c3_b9cb := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l795_c3_b9cb;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l822_c3_62c0 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_57b4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l822_c3_62c0;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_4c5c_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l788_c3_3f6a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l788_c3_3f6a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8_right := to_unsigned(7, 3);
     VAR_MUX_uxn_opcodes_h_l813_c32_f7ec_iffalse := resize(to_signed(-2, 3), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l825_c7_9252_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l825_c7_9252_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l813_c32_721f_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l776_c1_2d93_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l813_c32_721f_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l809_c3_9da1_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l790_c7_d951_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l797_c7_3785_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l805_c7_e411_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_4c5c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_92cc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l825_c11_2768_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l794_c3_ceff_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l810_c11_2a11_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l790_c7_d951_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l823_c34_0e5d_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l790_c7_d951_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l797_c7_3785_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l805_c7_e411_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l821_c11_92cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l821_c11_92cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_92cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l821_c11_92cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_92cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_92cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l821_c11_92cc_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l819_c24_1fee] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l819_c24_1fee_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- BIN_OP_EQ[uxn_opcodes_h_l805_c11_78f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l821_l782_l776_l808_l805_DUPLICATE_2317 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l821_l782_l776_l808_l805_DUPLICATE_2317_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l808_c11_1eb0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0_left;
     BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0_return_output := BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l790_c11_98d6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6_left;
     BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6_return_output := BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l794_l786_l809_l801_DUPLICATE_3eb1 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l794_l786_l809_l801_DUPLICATE_3eb1_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_SR_8[uxn_opcodes_h_l823_c34_0e5d] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l823_c34_0e5d_x <= VAR_CONST_SR_8_uxn_opcodes_h_l823_c34_0e5d_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l823_c34_0e5d_return_output := CONST_SR_8_uxn_opcodes_h_l823_c34_0e5d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l793_c11_124a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a_left;
     BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a_return_output := BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l808_l805_DUPLICATE_6b61 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l808_l805_DUPLICATE_6b61_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l815_l776_l805_DUPLICATE_5dac LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l815_l776_l805_DUPLICATE_5dac_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l813_c32_721f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l813_c32_721f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l813_c32_721f_left;
     BIN_OP_AND_uxn_opcodes_h_l813_c32_721f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l813_c32_721f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l813_c32_721f_return_output := BIN_OP_AND_uxn_opcodes_h_l813_c32_721f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l821_l808_DUPLICATE_802a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l821_l808_DUPLICATE_802a_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l825_c11_2768] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l825_c11_2768_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l825_c11_2768_left;
     BIN_OP_EQ_uxn_opcodes_h_l825_c11_2768_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l825_c11_2768_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l825_c11_2768_return_output := BIN_OP_EQ_uxn_opcodes_h_l825_c11_2768_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l800_c11_7729] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729_left;
     BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729_return_output := BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l800_l797_l790_l825_l793_l785_l821_l782_l815_l808_l805_DUPLICATE_30e3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l800_l797_l790_l825_l793_l785_l821_l782_l815_l808_l805_DUPLICATE_30e3_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l797_c11_6170] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170_left;
     BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170_return_output := BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l776_c6_3ab6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_left;
     BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_return_output := BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l785_c11_0c38] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38_left;
     BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38_return_output := BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l815_c11_4c5c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l815_c11_4c5c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_4c5c_left;
     BIN_OP_EQ_uxn_opcodes_h_l815_c11_4c5c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_4c5c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_4c5c_return_output := BIN_OP_EQ_uxn_opcodes_h_l815_c11_4c5c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l782_c11_fd1f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f_left;
     BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f_return_output := BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l776_l808_l805_DUPLICATE_f74f LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l776_l808_l805_DUPLICATE_f74f_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l800_l797_l790_l825_l793_l785_l821_l782_l776_l808_l805_DUPLICATE_6d5c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l800_l797_l790_l825_l793_l785_l821_l782_l776_l808_l805_DUPLICATE_6d5c_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l813_c32_e9a8_left := VAR_BIN_OP_AND_uxn_opcodes_h_l813_c32_721f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l776_c1_2d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l776_c2_7c28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c2_7c28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c2_7c28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l776_c2_7c28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c2_7c28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c2_7c28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c2_7c28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c2_7c28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l776_c2_7c28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l776_c2_7c28_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l776_c6_3ab6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l782_c7_abb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_abb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_abb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l782_c7_abb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_abb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_abb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_abb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l782_c7_abb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l782_c7_abb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l782_c7_abb8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l782_c11_fd1f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l785_c7_9bc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l785_c7_9bc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l785_c7_9bc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l785_c7_9bc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l785_c7_9bc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l785_c7_9bc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l785_c7_9bc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l785_c7_9bc6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l785_c11_0c38_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l790_c7_d951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_d951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l790_c7_d951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l790_c7_d951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_d951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_d951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_d951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l790_c7_d951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l790_c7_d951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l790_c7_d951_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_98d6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l793_c7_44b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l793_c7_44b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l793_c7_44b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l793_c7_44b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l793_c7_44b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l793_c7_44b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l793_c7_44b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l793_c7_44b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l793_c7_44b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l793_c7_44b2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l793_c11_124a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l797_c7_3785_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_3785_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_3785_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_3785_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_3785_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_3785_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_3785_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_3785_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l797_c7_3785_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l797_c11_6170_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l800_c7_cdeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_cdeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l800_c7_cdeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_cdeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l800_c7_cdeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l800_c7_cdeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l800_c7_cdeb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l800_c11_7729_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l805_c7_e411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_e411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_e411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_e411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_e411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_e411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_e411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l805_c7_e411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l805_c7_e411_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l805_c11_78f8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l808_c7_51b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_51b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l808_c7_51b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l808_c7_51b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_51b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_51b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_51b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l808_c7_51b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l808_c7_51b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l808_c11_1eb0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_ec50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_4c5c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_ec50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_4c5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_ec50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_4c5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_ec50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_4c5c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l815_c7_ec50_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l815_c11_4c5c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_57b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_92cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_57b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_92cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_57b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_92cc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l821_c7_57b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l821_c11_92cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l825_c7_9252_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l825_c11_2768_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l825_c7_9252_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l825_c11_2768_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l794_c3_ceff_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l794_l786_l809_l801_DUPLICATE_3eb1_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l809_c3_9da1_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l794_l786_l809_l801_DUPLICATE_3eb1_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l802_l787_DUPLICATE_d6ce_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l794_l786_l809_l801_DUPLICATE_3eb1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l819_c24_1fee_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l776_l808_l805_DUPLICATE_f74f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l776_l808_l805_DUPLICATE_f74f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l776_l808_l805_DUPLICATE_f74f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_d951_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l776_l808_l805_DUPLICATE_f74f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l776_l808_l805_DUPLICATE_f74f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_3785_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l776_l808_l805_DUPLICATE_f74f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l776_l808_l805_DUPLICATE_f74f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_e411_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l776_l808_l805_DUPLICATE_f74f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l776_l808_l805_DUPLICATE_f74f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l800_l797_l790_l825_l793_l785_l821_l782_l815_l808_l805_DUPLICATE_30e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l800_l797_l790_l825_l793_l785_l821_l782_l815_l808_l805_DUPLICATE_30e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_d951_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l800_l797_l790_l825_l793_l785_l821_l782_l815_l808_l805_DUPLICATE_30e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l800_l797_l790_l825_l793_l785_l821_l782_l815_l808_l805_DUPLICATE_30e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_3785_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l800_l797_l790_l825_l793_l785_l821_l782_l815_l808_l805_DUPLICATE_30e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l800_l797_l790_l825_l793_l785_l821_l782_l815_l808_l805_DUPLICATE_30e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_e411_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l800_l797_l790_l825_l793_l785_l821_l782_l815_l808_l805_DUPLICATE_30e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l800_l797_l790_l825_l793_l785_l821_l782_l815_l808_l805_DUPLICATE_30e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l800_l797_l790_l825_l793_l785_l821_l782_l815_l808_l805_DUPLICATE_30e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_57b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l800_l797_l790_l825_l793_l785_l821_l782_l815_l808_l805_DUPLICATE_30e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l825_c7_9252_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l800_l797_l790_l825_l793_l785_l821_l782_l815_l808_l805_DUPLICATE_30e3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l815_l776_l805_DUPLICATE_5dac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l815_l776_l805_DUPLICATE_5dac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l815_l776_l805_DUPLICATE_5dac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l790_c7_d951_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l815_l776_l805_DUPLICATE_5dac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l815_l776_l805_DUPLICATE_5dac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_3785_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l815_l776_l805_DUPLICATE_5dac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l815_l776_l805_DUPLICATE_5dac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_e411_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l815_l776_l805_DUPLICATE_5dac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l815_l776_l805_DUPLICATE_5dac_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l808_l805_DUPLICATE_6b61_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l808_l805_DUPLICATE_6b61_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l790_c7_d951_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l808_l805_DUPLICATE_6b61_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l808_l805_DUPLICATE_6b61_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_3785_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l808_l805_DUPLICATE_6b61_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l808_l805_DUPLICATE_6b61_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_e411_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l808_l805_DUPLICATE_6b61_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l782_l808_l805_DUPLICATE_6b61_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l800_l797_l790_l825_l793_l785_l821_l782_l776_l808_l805_DUPLICATE_6d5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l800_l797_l790_l825_l793_l785_l821_l782_l776_l808_l805_DUPLICATE_6d5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l800_l797_l790_l825_l793_l785_l821_l782_l776_l808_l805_DUPLICATE_6d5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_d951_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l800_l797_l790_l825_l793_l785_l821_l782_l776_l808_l805_DUPLICATE_6d5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l800_l797_l790_l825_l793_l785_l821_l782_l776_l808_l805_DUPLICATE_6d5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_3785_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l800_l797_l790_l825_l793_l785_l821_l782_l776_l808_l805_DUPLICATE_6d5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l800_l797_l790_l825_l793_l785_l821_l782_l776_l808_l805_DUPLICATE_6d5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_e411_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l800_l797_l790_l825_l793_l785_l821_l782_l776_l808_l805_DUPLICATE_6d5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l800_l797_l790_l825_l793_l785_l821_l782_l776_l808_l805_DUPLICATE_6d5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_57b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l800_l797_l790_l825_l793_l785_l821_l782_l776_l808_l805_DUPLICATE_6d5c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l825_c7_9252_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l800_l797_l790_l825_l793_l785_l821_l782_l776_l808_l805_DUPLICATE_6d5c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l821_l808_DUPLICATE_802a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_57b4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l821_l808_DUPLICATE_802a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l821_l782_l776_l808_l805_DUPLICATE_2317_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l821_l782_l776_l808_l805_DUPLICATE_2317_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l821_l782_l776_l808_l805_DUPLICATE_2317_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l790_c7_d951_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l821_l782_l776_l808_l805_DUPLICATE_2317_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l821_l782_l776_l808_l805_DUPLICATE_2317_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_3785_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l821_l782_l776_l808_l805_DUPLICATE_2317_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l821_l782_l776_l808_l805_DUPLICATE_2317_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l805_c7_e411_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l821_l782_l776_l808_l805_DUPLICATE_2317_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l821_l782_l776_l808_l805_DUPLICATE_2317_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l821_c7_57b4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l800_l797_l790_l793_l785_l821_l782_l776_l808_l805_DUPLICATE_2317_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l815_c7_ec50] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_ec50_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_ec50_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_ec50_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_ec50_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l794_c3_ceff] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l794_c3_ceff_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l794_c3_ceff_left;
     BIN_OP_OR_uxn_opcodes_h_l794_c3_ceff_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l794_c3_ceff_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l794_c3_ceff_return_output := BIN_OP_OR_uxn_opcodes_h_l794_c3_ceff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l821_c7_57b4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_57b4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_57b4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_57b4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_57b4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_57b4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_57b4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_57b4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_57b4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l825_c7_9252] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l825_c7_9252_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l825_c7_9252_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l825_c7_9252_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l825_c7_9252_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l825_c7_9252_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l825_c7_9252_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l825_c7_9252_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l825_c7_9252_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l813_c32_e9a8] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l813_c32_e9a8_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l813_c32_e9a8_left;
     BIN_OP_GT_uxn_opcodes_h_l813_c32_e9a8_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l813_c32_e9a8_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l813_c32_e9a8_return_output := BIN_OP_GT_uxn_opcodes_h_l813_c32_e9a8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l825_c7_9252] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l825_c7_9252_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l825_c7_9252_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l825_c7_9252_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l825_c7_9252_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l825_c7_9252_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l825_c7_9252_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l825_c7_9252_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l825_c7_9252_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l823_c24_6021] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l823_c24_6021_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l823_c34_0e5d_return_output);

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l802_l787_DUPLICATE_d6ce LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l802_l787_DUPLICATE_d6ce_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l802_l787_DUPLICATE_d6ce_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l802_l787_DUPLICATE_d6ce_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l802_l787_DUPLICATE_d6ce_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l809_c3_9da1] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l809_c3_9da1_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l809_c3_9da1_left;
     BIN_OP_OR_uxn_opcodes_h_l809_c3_9da1_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l809_c3_9da1_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l809_c3_9da1_return_output := BIN_OP_OR_uxn_opcodes_h_l809_c3_9da1_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l776_c1_2d93] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l776_c1_2d93_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l776_c1_2d93_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l776_c1_2d93_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l776_c1_2d93_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l776_c1_2d93_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l776_c1_2d93_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l776_c1_2d93_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l776_c1_2d93_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l808_c7_51b4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l808_c7_51b4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l808_c7_51b4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l808_c7_51b4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l808_c7_51b4_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l813_c32_f7ec_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l813_c32_e9a8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l794_c3_ceff_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l810_c11_2a11_right := VAR_BIN_OP_OR_uxn_opcodes_h_l809_c3_9da1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l809_c3_9da1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l821_c7_57b4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l823_c24_6021_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l802_l787_DUPLICATE_d6ce_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l802_l787_DUPLICATE_d6ce_return_output;
     VAR_printf_uxn_opcodes_h_l777_c3_c336_uxn_opcodes_h_l777_c3_c336_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l776_c1_2d93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_57b4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l825_c7_9252_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l815_c7_ec50_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_e411_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l808_c7_51b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_57b4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l825_c7_9252_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l821_c7_57b4_return_output;
     -- printf_uxn_opcodes_h_l777_c3_c336[uxn_opcodes_h_l777_c3_c336] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l777_c3_c336_uxn_opcodes_h_l777_c3_c336_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l777_c3_c336_uxn_opcodes_h_l777_c3_c336_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t16_MUX[uxn_opcodes_h_l793_c7_44b2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l793_c7_44b2_cond <= VAR_t16_MUX_uxn_opcodes_h_l793_c7_44b2_cond;
     t16_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue;
     t16_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l793_c7_44b2_return_output := t16_MUX_uxn_opcodes_h_l793_c7_44b2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l821_c7_57b4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_57b4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_57b4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_57b4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_57b4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_57b4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_57b4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_57b4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_57b4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l821_c7_57b4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l821_c7_57b4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l821_c7_57b4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l821_c7_57b4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l821_c7_57b4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l821_c7_57b4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l821_c7_57b4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l821_c7_57b4_return_output := result_stack_value_MUX_uxn_opcodes_h_l821_c7_57b4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l821_c7_57b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_57b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_57b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_57b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_57b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_57b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_57b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_57b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_57b4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l808_c7_51b4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l808_c7_51b4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l808_c7_51b4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l808_c7_51b4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l808_c7_51b4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l805_c7_e411] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_e411_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_e411_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_e411_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_e411_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_e411_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_e411_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_e411_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_e411_return_output;

     -- n16_MUX[uxn_opcodes_h_l808_c7_51b4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l808_c7_51b4_cond <= VAR_n16_MUX_uxn_opcodes_h_l808_c7_51b4_cond;
     n16_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue;
     n16_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l808_c7_51b4_return_output := n16_MUX_uxn_opcodes_h_l808_c7_51b4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l815_c7_ec50] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_ec50_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_ec50_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_ec50_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_ec50_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l810_c11_2a11] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l810_c11_2a11_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l810_c11_2a11_left;
     BIN_OP_PLUS_uxn_opcodes_h_l810_c11_2a11_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l810_c11_2a11_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l810_c11_2a11_return_output := BIN_OP_PLUS_uxn_opcodes_h_l810_c11_2a11_return_output;

     -- MUX[uxn_opcodes_h_l813_c32_f7ec] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l813_c32_f7ec_cond <= VAR_MUX_uxn_opcodes_h_l813_c32_f7ec_cond;
     MUX_uxn_opcodes_h_l813_c32_f7ec_iftrue <= VAR_MUX_uxn_opcodes_h_l813_c32_f7ec_iftrue;
     MUX_uxn_opcodes_h_l813_c32_f7ec_iffalse <= VAR_MUX_uxn_opcodes_h_l813_c32_f7ec_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l813_c32_f7ec_return_output := MUX_uxn_opcodes_h_l813_c32_f7ec_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l810_c3_43ca := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l810_c11_2a11_return_output, 16);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue := VAR_MUX_uxn_opcodes_h_l813_c32_f7ec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l805_c7_e411_iffalse := VAR_n16_MUX_uxn_opcodes_h_l808_c7_51b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l821_c7_57b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_e411_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l808_c7_51b4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l805_c7_e411_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l821_c7_57b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l815_c7_ec50_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l821_c7_57b4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l790_c7_d951_iffalse := VAR_t16_MUX_uxn_opcodes_h_l793_c7_44b2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue := VAR_tmp16_uxn_opcodes_h_l810_c3_43ca;
     -- t16_MUX[uxn_opcodes_h_l790_c7_d951] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l790_c7_d951_cond <= VAR_t16_MUX_uxn_opcodes_h_l790_c7_d951_cond;
     t16_MUX_uxn_opcodes_h_l790_c7_d951_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l790_c7_d951_iftrue;
     t16_MUX_uxn_opcodes_h_l790_c7_d951_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l790_c7_d951_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l790_c7_d951_return_output := t16_MUX_uxn_opcodes_h_l790_c7_d951_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l805_c7_e411] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_e411_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_e411_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_e411_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_e411_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_e411_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_e411_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_e411_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_e411_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l800_c7_cdeb] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l800_c7_cdeb_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l800_c7_cdeb_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output;

     -- n16_MUX[uxn_opcodes_h_l805_c7_e411] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l805_c7_e411_cond <= VAR_n16_MUX_uxn_opcodes_h_l805_c7_e411_cond;
     n16_MUX_uxn_opcodes_h_l805_c7_e411_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l805_c7_e411_iftrue;
     n16_MUX_uxn_opcodes_h_l805_c7_e411_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l805_c7_e411_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l805_c7_e411_return_output := n16_MUX_uxn_opcodes_h_l805_c7_e411_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l808_c7_51b4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_51b4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_51b4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_51b4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_51b4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l808_c7_51b4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_51b4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_51b4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_51b4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_51b4_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l808_c7_51b4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l808_c7_51b4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l808_c7_51b4_cond;
     tmp16_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l808_c7_51b4_return_output := tmp16_MUX_uxn_opcodes_h_l808_c7_51b4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l815_c7_ec50] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l815_c7_ec50_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l815_c7_ec50_cond;
     result_stack_value_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l815_c7_ec50_return_output := result_stack_value_MUX_uxn_opcodes_h_l815_c7_ec50_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l815_c7_ec50] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_ec50_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_ec50_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_ec50_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_ec50_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l815_c7_ec50] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_ec50_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_ec50_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_ec50_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_ec50_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_ec50_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_ec50_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l805_c7_e411_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l815_c7_ec50_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l805_c7_e411_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_3785_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l815_c7_ec50_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_e411_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l808_c7_51b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_e411_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l808_c7_51b4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l815_c7_ec50_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l790_c7_d951_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l805_c7_e411_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l808_c7_51b4_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l808_c7_51b4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_51b4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_51b4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_51b4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_51b4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l808_c7_51b4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l808_c7_51b4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l808_c7_51b4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l808_c7_51b4_return_output := result_stack_value_MUX_uxn_opcodes_h_l808_c7_51b4_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l797_c7_3785] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_3785_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_3785_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_3785_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_3785_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_3785_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_3785_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_3785_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_3785_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l800_c7_cdeb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l805_c7_e411] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l805_c7_e411_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l805_c7_e411_cond;
     tmp16_MUX_uxn_opcodes_h_l805_c7_e411_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l805_c7_e411_iftrue;
     tmp16_MUX_uxn_opcodes_h_l805_c7_e411_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l805_c7_e411_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l805_c7_e411_return_output := tmp16_MUX_uxn_opcodes_h_l805_c7_e411_return_output;

     -- t16_MUX[uxn_opcodes_h_l785_c7_9bc6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l785_c7_9bc6_cond <= VAR_t16_MUX_uxn_opcodes_h_l785_c7_9bc6_cond;
     t16_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue;
     t16_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output := t16_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l805_c7_e411] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_e411_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_e411_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_e411_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_e411_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_e411_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_e411_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_e411_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_e411_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l808_c7_51b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_51b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_51b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_51b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_51b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_51b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_51b4_return_output;

     -- n16_MUX[uxn_opcodes_h_l800_c7_cdeb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l800_c7_cdeb_cond <= VAR_n16_MUX_uxn_opcodes_h_l800_c7_cdeb_cond;
     n16_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue;
     n16_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output := n16_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l805_c7_e411] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_e411_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_e411_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_e411_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_e411_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_e411_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_e411_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_e411_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_e411_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l797_c7_3785_iffalse := VAR_n16_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_e411_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l808_c7_51b4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_3785_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l797_c7_3785_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_e411_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l808_c7_51b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l805_c7_e411_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l805_c7_e411_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l805_c7_e411_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l808_c7_51b4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l805_c7_e411_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l805_c7_e411] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l805_c7_e411_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l805_c7_e411_cond;
     result_stack_value_MUX_uxn_opcodes_h_l805_c7_e411_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l805_c7_e411_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l805_c7_e411_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l805_c7_e411_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l805_c7_e411_return_output := result_stack_value_MUX_uxn_opcodes_h_l805_c7_e411_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l805_c7_e411] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_e411_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_e411_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_e411_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_e411_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_e411_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_e411_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_e411_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_e411_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l797_c7_3785] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_3785_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_3785_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_3785_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_3785_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_3785_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_3785_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_3785_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_3785_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l800_c7_cdeb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l800_c7_cdeb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l800_c7_cdeb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l793_c7_44b2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l793_c7_44b2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l793_c7_44b2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l793_c7_44b2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l793_c7_44b2_return_output;

     -- n16_MUX[uxn_opcodes_h_l797_c7_3785] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l797_c7_3785_cond <= VAR_n16_MUX_uxn_opcodes_h_l797_c7_3785_cond;
     n16_MUX_uxn_opcodes_h_l797_c7_3785_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l797_c7_3785_iftrue;
     n16_MUX_uxn_opcodes_h_l797_c7_3785_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l797_c7_3785_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l797_c7_3785_return_output := n16_MUX_uxn_opcodes_h_l797_c7_3785_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l800_c7_cdeb] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l800_c7_cdeb_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l800_c7_cdeb_cond;
     tmp16_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue;
     tmp16_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output := tmp16_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output;

     -- t16_MUX[uxn_opcodes_h_l782_c7_abb8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l782_c7_abb8_cond <= VAR_t16_MUX_uxn_opcodes_h_l782_c7_abb8_cond;
     t16_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue;
     t16_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l782_c7_abb8_return_output := t16_MUX_uxn_opcodes_h_l782_c7_abb8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l805_c7_e411] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_e411_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_e411_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_e411_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_e411_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_e411_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_e411_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_e411_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_e411_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l800_c7_cdeb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l797_c7_3785_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l805_c7_e411_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l797_c7_3785_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l790_c7_d951_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l793_c7_44b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l805_c7_e411_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_3785_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_3785_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l805_c7_e411_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse := VAR_t16_MUX_uxn_opcodes_h_l782_c7_abb8_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l797_c7_3785_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output;
     -- n16_MUX[uxn_opcodes_h_l793_c7_44b2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l793_c7_44b2_cond <= VAR_n16_MUX_uxn_opcodes_h_l793_c7_44b2_cond;
     n16_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue;
     n16_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l793_c7_44b2_return_output := n16_MUX_uxn_opcodes_h_l793_c7_44b2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l793_c7_44b2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l793_c7_44b2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l793_c7_44b2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l793_c7_44b2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l793_c7_44b2_return_output;

     -- t16_MUX[uxn_opcodes_h_l776_c2_7c28] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l776_c2_7c28_cond <= VAR_t16_MUX_uxn_opcodes_h_l776_c2_7c28_cond;
     t16_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue;
     t16_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l776_c2_7c28_return_output := t16_MUX_uxn_opcodes_h_l776_c2_7c28_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l800_c7_cdeb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_cdeb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_cdeb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l800_c7_cdeb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l800_c7_cdeb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l800_c7_cdeb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output := result_stack_value_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l797_c7_3785] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_3785_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_3785_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_3785_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_3785_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_3785_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_3785_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_3785_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_3785_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l797_c7_3785] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l797_c7_3785_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l797_c7_3785_cond;
     tmp16_MUX_uxn_opcodes_h_l797_c7_3785_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l797_c7_3785_iftrue;
     tmp16_MUX_uxn_opcodes_h_l797_c7_3785_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l797_c7_3785_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l797_c7_3785_return_output := tmp16_MUX_uxn_opcodes_h_l797_c7_3785_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l797_c7_3785] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_3785_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_3785_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_3785_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_3785_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_3785_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_3785_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_3785_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_3785_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l790_c7_d951] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l790_c7_d951_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l790_c7_d951_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l790_c7_d951_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l790_c7_d951_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l790_c7_d951_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l790_c7_d951_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l790_c7_d951_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l790_c7_d951_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l800_c7_cdeb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_cdeb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_cdeb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_cdeb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_cdeb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l790_c7_d951_iffalse := VAR_n16_MUX_uxn_opcodes_h_l793_c7_44b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_3785_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l790_c7_d951_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l793_c7_44b2_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l790_c7_d951_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_3785_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l797_c7_3785_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l797_c7_3785_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_3785_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l800_c7_cdeb_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l776_c2_7c28_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l797_c7_3785_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l785_c7_9bc6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l785_c7_9bc6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l785_c7_9bc6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l790_c7_d951] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l790_c7_d951_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l790_c7_d951_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l790_c7_d951_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l790_c7_d951_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l790_c7_d951_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l790_c7_d951_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l790_c7_d951_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l790_c7_d951_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l797_c7_3785] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_3785_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_3785_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_3785_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_3785_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_3785_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_3785_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_3785_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_3785_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l793_c7_44b2] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l793_c7_44b2_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l793_c7_44b2_cond;
     tmp16_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue;
     tmp16_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l793_c7_44b2_return_output := tmp16_MUX_uxn_opcodes_h_l793_c7_44b2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l793_c7_44b2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l793_c7_44b2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l793_c7_44b2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l793_c7_44b2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l793_c7_44b2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l793_c7_44b2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l793_c7_44b2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l793_c7_44b2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l793_c7_44b2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l793_c7_44b2_return_output;

     -- n16_MUX[uxn_opcodes_h_l790_c7_d951] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l790_c7_d951_cond <= VAR_n16_MUX_uxn_opcodes_h_l790_c7_d951_cond;
     n16_MUX_uxn_opcodes_h_l790_c7_d951_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l790_c7_d951_iftrue;
     n16_MUX_uxn_opcodes_h_l790_c7_d951_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l790_c7_d951_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l790_c7_d951_return_output := n16_MUX_uxn_opcodes_h_l790_c7_d951_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l797_c7_3785] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l797_c7_3785_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_3785_cond;
     result_stack_value_MUX_uxn_opcodes_h_l797_c7_3785_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_3785_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l797_c7_3785_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_3785_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_3785_return_output := result_stack_value_MUX_uxn_opcodes_h_l797_c7_3785_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l797_c7_3785] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_3785_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_3785_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_3785_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_3785_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_3785_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_3785_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_3785_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_3785_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l790_c7_d951_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l797_c7_3785_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l790_c7_d951_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l797_c7_3785_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_d951_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l793_c7_44b2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_d951_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l793_c7_44b2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l797_c7_3785_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l790_c7_d951_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l793_c7_44b2_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l782_c7_abb8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l782_c7_abb8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l782_c7_abb8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l782_c7_abb8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l782_c7_abb8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l793_c7_44b2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l793_c7_44b2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l793_c7_44b2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l793_c7_44b2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l793_c7_44b2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l790_c7_d951] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_d951_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_d951_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_d951_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_d951_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_d951_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_d951_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_d951_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_d951_return_output;

     -- n16_MUX[uxn_opcodes_h_l785_c7_9bc6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l785_c7_9bc6_cond <= VAR_n16_MUX_uxn_opcodes_h_l785_c7_9bc6_cond;
     n16_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue;
     n16_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output := n16_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l785_c7_9bc6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l793_c7_44b2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l793_c7_44b2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l793_c7_44b2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l793_c7_44b2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l793_c7_44b2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l793_c7_44b2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l793_c7_44b2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l793_c7_44b2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l793_c7_44b2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l793_c7_44b2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l793_c7_44b2_return_output := result_stack_value_MUX_uxn_opcodes_h_l793_c7_44b2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l790_c7_d951] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_d951_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_d951_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_d951_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_d951_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_d951_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_d951_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_d951_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_d951_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l790_c7_d951] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l790_c7_d951_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l790_c7_d951_cond;
     tmp16_MUX_uxn_opcodes_h_l790_c7_d951_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l790_c7_d951_iftrue;
     tmp16_MUX_uxn_opcodes_h_l790_c7_d951_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l790_c7_d951_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l790_c7_d951_return_output := tmp16_MUX_uxn_opcodes_h_l790_c7_d951_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_d951_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l793_c7_44b2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l782_c7_abb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_d951_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l793_c7_44b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_d951_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_d951_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l790_c7_d951_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l793_c7_44b2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l790_c7_d951_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l776_c2_7c28] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l776_c2_7c28_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l776_c2_7c28_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l776_c2_7c28_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l776_c2_7c28_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l790_c7_d951] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_d951_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_d951_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_d951_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_d951_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_d951_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_d951_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_d951_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_d951_return_output;

     -- n16_MUX[uxn_opcodes_h_l782_c7_abb8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l782_c7_abb8_cond <= VAR_n16_MUX_uxn_opcodes_h_l782_c7_abb8_cond;
     n16_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue;
     n16_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l782_c7_abb8_return_output := n16_MUX_uxn_opcodes_h_l782_c7_abb8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l785_c7_9bc6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l785_c7_9bc6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l785_c7_9bc6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l790_c7_d951] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l790_c7_d951_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l790_c7_d951_cond;
     result_stack_value_MUX_uxn_opcodes_h_l790_c7_d951_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l790_c7_d951_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l790_c7_d951_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l790_c7_d951_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l790_c7_d951_return_output := result_stack_value_MUX_uxn_opcodes_h_l790_c7_d951_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l785_c7_9bc6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l785_c7_9bc6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l785_c7_9bc6_cond;
     tmp16_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output := tmp16_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l790_c7_d951] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_d951_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_d951_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_d951_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_d951_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_d951_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_d951_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_d951_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_d951_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l785_c7_9bc6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l782_c7_abb8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_abb8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_abb8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_abb8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_abb8_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse := VAR_n16_MUX_uxn_opcodes_h_l782_c7_abb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_d951_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l782_c7_abb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_d951_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l790_c7_d951_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l782_c7_abb8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_abb8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_abb8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_abb8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_abb8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l785_c7_9bc6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l785_c7_9bc6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l785_c7_9bc6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output := result_stack_value_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output;

     -- n16_MUX[uxn_opcodes_h_l776_c2_7c28] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l776_c2_7c28_cond <= VAR_n16_MUX_uxn_opcodes_h_l776_c2_7c28_cond;
     n16_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue;
     n16_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l776_c2_7c28_return_output := n16_MUX_uxn_opcodes_h_l776_c2_7c28_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l785_c7_9bc6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l785_c7_9bc6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l785_c7_9bc6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l782_c7_abb8] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l782_c7_abb8_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l782_c7_abb8_cond;
     tmp16_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue;
     tmp16_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l782_c7_abb8_return_output := tmp16_MUX_uxn_opcodes_h_l782_c7_abb8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l782_c7_abb8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_abb8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_abb8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_abb8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_abb8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l785_c7_9bc6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l785_c7_9bc6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l785_c7_9bc6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l785_c7_9bc6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l785_c7_9bc6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l776_c2_7c28] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l776_c2_7c28_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c2_7c28_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c2_7c28_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l776_c2_7c28_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l776_c2_7c28_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l782_c7_abb8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l782_c7_abb8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l785_c7_9bc6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l782_c7_abb8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l776_c2_7c28] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c2_7c28_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c2_7c28_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c2_7c28_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c2_7c28_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l782_c7_abb8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_abb8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_abb8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_abb8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_abb8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l776_c2_7c28] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c2_7c28_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c2_7c28_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c2_7c28_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c2_7c28_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l782_c7_abb8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_abb8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_abb8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_abb8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_abb8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l782_c7_abb8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l782_c7_abb8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l782_c7_abb8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l782_c7_abb8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l782_c7_abb8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l782_c7_abb8_return_output := result_stack_value_MUX_uxn_opcodes_h_l782_c7_abb8_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l776_c2_7c28] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l776_c2_7c28_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l776_c2_7c28_cond;
     tmp16_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue;
     tmp16_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l776_c2_7c28_return_output := tmp16_MUX_uxn_opcodes_h_l776_c2_7c28_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l782_c7_abb8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l782_c7_abb8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l782_c7_abb8_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l776_c2_7c28_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l776_c2_7c28] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l776_c2_7c28_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c2_7c28_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c2_7c28_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l776_c2_7c28_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l776_c2_7c28] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l776_c2_7c28_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c2_7c28_cond;
     result_stack_value_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c2_7c28_return_output := result_stack_value_MUX_uxn_opcodes_h_l776_c2_7c28_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l776_c2_7c28] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l776_c2_7c28_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c2_7c28_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c2_7c28_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c2_7c28_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c2_7c28_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l776_c2_7c28_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l830_l772_DUPLICATE_3f3d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l830_l772_DUPLICATE_3f3d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l776_c2_7c28_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l776_c2_7c28_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l776_c2_7c28_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l776_c2_7c28_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l776_c2_7c28_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l776_c2_7c28_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l776_c2_7c28_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l830_l772_DUPLICATE_3f3d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l830_l772_DUPLICATE_3f3d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
