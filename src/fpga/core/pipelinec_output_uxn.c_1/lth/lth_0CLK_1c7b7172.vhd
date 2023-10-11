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
-- Submodules: 60
entity lth_0CLK_1c7b7172 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth_0CLK_1c7b7172;
architecture arch of lth_0CLK_1c7b7172 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2043_c6_fd89]
signal BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2043_c1_29ff]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_29ff_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_29ff_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_29ff_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_29ff_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2043_c2_c4d2]
signal t8_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2043_c2_c4d2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2043_c2_c4d2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2043_c2_c4d2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2043_c2_c4d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2043_c2_c4d2]
signal result_stack_value_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2043_c2_c4d2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2043_c2_c4d2]
signal n8_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2044_c3_4662[uxn_opcodes_h_l2044_c3_4662]
signal printf_uxn_opcodes_h_l2044_c3_4662_uxn_opcodes_h_l2044_c3_4662_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2048_c11_0b02]
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0b02_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0b02_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0b02_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2048_c7_31ff]
signal t8_MUX_uxn_opcodes_h_l2048_c7_31ff_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2048_c7_31ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_31ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2048_c7_31ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_31ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2048_c7_31ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2048_c7_31ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_31ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2048_c7_31ff]
signal result_stack_value_MUX_uxn_opcodes_h_l2048_c7_31ff_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2048_c7_31ff]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2048_c7_31ff]
signal n8_MUX_uxn_opcodes_h_l2048_c7_31ff_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2051_c11_e060]
signal BIN_OP_EQ_uxn_opcodes_h_l2051_c11_e060_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2051_c11_e060_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2051_c11_e060_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2051_c7_8d9f]
signal t8_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2051_c7_8d9f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2051_c7_8d9f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2051_c7_8d9f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2051_c7_8d9f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2051_c7_8d9f]
signal result_stack_value_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2051_c7_8d9f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2051_c7_8d9f]
signal n8_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2055_c11_5a9a]
signal BIN_OP_EQ_uxn_opcodes_h_l2055_c11_5a9a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2055_c11_5a9a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2055_c11_5a9a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2055_c7_ed22]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_ed22_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2055_c7_ed22]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_ed22_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2055_c7_ed22]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2055_c7_ed22]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_ed22_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2055_c7_ed22]
signal result_stack_value_MUX_uxn_opcodes_h_l2055_c7_ed22_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2055_c7_ed22]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2055_c7_ed22]
signal n8_MUX_uxn_opcodes_h_l2055_c7_ed22_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2058_c11_08b7]
signal BIN_OP_EQ_uxn_opcodes_h_l2058_c11_08b7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2058_c11_08b7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2058_c11_08b7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2058_c7_8021]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_8021_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_8021_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2058_c7_8021]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_8021_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_8021_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2058_c7_8021]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_8021_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_8021_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2058_c7_8021]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_8021_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_8021_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2058_c7_8021]
signal result_stack_value_MUX_uxn_opcodes_h_l2058_c7_8021_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2058_c7_8021_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2058_c7_8021]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_8021_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_8021_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2058_c7_8021]
signal n8_MUX_uxn_opcodes_h_l2058_c7_8021_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2058_c7_8021_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2061_c32_4bb6]
signal BIN_OP_AND_uxn_opcodes_h_l2061_c32_4bb6_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2061_c32_4bb6_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2061_c32_4bb6_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2061_c32_570c]
signal BIN_OP_GT_uxn_opcodes_h_l2061_c32_570c_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2061_c32_570c_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2061_c32_570c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2061_c32_0156]
signal MUX_uxn_opcodes_h_l2061_c32_0156_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2061_c32_0156_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2061_c32_0156_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2061_c32_0156_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2063_c11_a625]
signal BIN_OP_EQ_uxn_opcodes_h_l2063_c11_a625_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2063_c11_a625_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2063_c11_a625_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2063_c7_7355]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_7355_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_7355_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2063_c7_7355]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_7355_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_7355_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2063_c7_7355]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_7355_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_7355_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2063_c7_7355]
signal result_stack_value_MUX_uxn_opcodes_h_l2063_c7_7355_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2063_c7_7355_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2063_c7_7355]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_7355_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_7355_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l2067_c24_08bb]
signal BIN_OP_LT_uxn_opcodes_h_l2067_c24_08bb_left : unsigned(7 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2067_c24_08bb_right : unsigned(7 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2067_c24_08bb_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2067_c24_85f8]
signal MUX_uxn_opcodes_h_l2067_c24_85f8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2067_c24_85f8_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2067_c24_85f8_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2067_c24_85f8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2069_c11_c677]
signal BIN_OP_EQ_uxn_opcodes_h_l2069_c11_c677_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2069_c11_c677_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2069_c11_c677_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2069_c7_6adc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_6adc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_6adc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_6adc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_6adc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2069_c7_6adc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_6adc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_6adc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_6adc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_6adc_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_53ff( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_value := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89
BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89_left,
BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89_right,
BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_29ff
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_29ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_29ff_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_29ff_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_29ff_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_29ff_return_output);

-- t8_MUX_uxn_opcodes_h_l2043_c2_c4d2
t8_MUX_uxn_opcodes_h_l2043_c2_c4d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond,
t8_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue,
t8_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse,
t8_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_c4d2
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_c4d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_c4d2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_c4d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_c4d2
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_c4d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2043_c2_c4d2
result_stack_value_MUX_uxn_opcodes_h_l2043_c2_c4d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2
result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output);

-- n8_MUX_uxn_opcodes_h_l2043_c2_c4d2
n8_MUX_uxn_opcodes_h_l2043_c2_c4d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond,
n8_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue,
n8_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse,
n8_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output);

-- printf_uxn_opcodes_h_l2044_c3_4662_uxn_opcodes_h_l2044_c3_4662
printf_uxn_opcodes_h_l2044_c3_4662_uxn_opcodes_h_l2044_c3_4662 : entity work.printf_uxn_opcodes_h_l2044_c3_4662_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2044_c3_4662_uxn_opcodes_h_l2044_c3_4662_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0b02
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0b02 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0b02_left,
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0b02_right,
BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0b02_return_output);

-- t8_MUX_uxn_opcodes_h_l2048_c7_31ff
t8_MUX_uxn_opcodes_h_l2048_c7_31ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2048_c7_31ff_cond,
t8_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue,
t8_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse,
t8_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_31ff
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_31ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_31ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_31ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_31ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_31ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_31ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_31ff : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_31ff
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_31ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_31ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2048_c7_31ff
result_stack_value_MUX_uxn_opcodes_h_l2048_c7_31ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2048_c7_31ff_cond,
result_stack_value_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_31ff
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_31ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output);

-- n8_MUX_uxn_opcodes_h_l2048_c7_31ff
n8_MUX_uxn_opcodes_h_l2048_c7_31ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2048_c7_31ff_cond,
n8_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue,
n8_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse,
n8_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2051_c11_e060
BIN_OP_EQ_uxn_opcodes_h_l2051_c11_e060 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2051_c11_e060_left,
BIN_OP_EQ_uxn_opcodes_h_l2051_c11_e060_right,
BIN_OP_EQ_uxn_opcodes_h_l2051_c11_e060_return_output);

-- t8_MUX_uxn_opcodes_h_l2051_c7_8d9f
t8_MUX_uxn_opcodes_h_l2051_c7_8d9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond,
t8_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue,
t8_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse,
t8_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_8d9f
result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_8d9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_8d9f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_8d9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_8d9f
result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_8d9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2051_c7_8d9f
result_stack_value_MUX_uxn_opcodes_h_l2051_c7_8d9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f
result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output);

-- n8_MUX_uxn_opcodes_h_l2051_c7_8d9f
n8_MUX_uxn_opcodes_h_l2051_c7_8d9f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond,
n8_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue,
n8_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse,
n8_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2055_c11_5a9a
BIN_OP_EQ_uxn_opcodes_h_l2055_c11_5a9a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2055_c11_5a9a_left,
BIN_OP_EQ_uxn_opcodes_h_l2055_c11_5a9a_right,
BIN_OP_EQ_uxn_opcodes_h_l2055_c11_5a9a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_ed22
result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_ed22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_ed22_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_ed22
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_ed22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_ed22_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_ed22
result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_ed22 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_ed22
result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_ed22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_ed22_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2055_c7_ed22
result_stack_value_MUX_uxn_opcodes_h_l2055_c7_ed22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2055_c7_ed22_cond,
result_stack_value_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_ed22
result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_ed22 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output);

-- n8_MUX_uxn_opcodes_h_l2055_c7_ed22
n8_MUX_uxn_opcodes_h_l2055_c7_ed22 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2055_c7_ed22_cond,
n8_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue,
n8_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse,
n8_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2058_c11_08b7
BIN_OP_EQ_uxn_opcodes_h_l2058_c11_08b7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2058_c11_08b7_left,
BIN_OP_EQ_uxn_opcodes_h_l2058_c11_08b7_right,
BIN_OP_EQ_uxn_opcodes_h_l2058_c11_08b7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_8021
result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_8021 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_8021_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_8021_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_8021
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_8021 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_8021_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_8021_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_8021
result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_8021 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_8021_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_8021_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_8021
result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_8021 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_8021_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_8021_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2058_c7_8021
result_stack_value_MUX_uxn_opcodes_h_l2058_c7_8021 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2058_c7_8021_cond,
result_stack_value_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2058_c7_8021_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_8021
result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_8021 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_8021_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_8021_return_output);

-- n8_MUX_uxn_opcodes_h_l2058_c7_8021
n8_MUX_uxn_opcodes_h_l2058_c7_8021 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2058_c7_8021_cond,
n8_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue,
n8_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse,
n8_MUX_uxn_opcodes_h_l2058_c7_8021_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2061_c32_4bb6
BIN_OP_AND_uxn_opcodes_h_l2061_c32_4bb6 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2061_c32_4bb6_left,
BIN_OP_AND_uxn_opcodes_h_l2061_c32_4bb6_right,
BIN_OP_AND_uxn_opcodes_h_l2061_c32_4bb6_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2061_c32_570c
BIN_OP_GT_uxn_opcodes_h_l2061_c32_570c : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2061_c32_570c_left,
BIN_OP_GT_uxn_opcodes_h_l2061_c32_570c_right,
BIN_OP_GT_uxn_opcodes_h_l2061_c32_570c_return_output);

-- MUX_uxn_opcodes_h_l2061_c32_0156
MUX_uxn_opcodes_h_l2061_c32_0156 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2061_c32_0156_cond,
MUX_uxn_opcodes_h_l2061_c32_0156_iftrue,
MUX_uxn_opcodes_h_l2061_c32_0156_iffalse,
MUX_uxn_opcodes_h_l2061_c32_0156_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2063_c11_a625
BIN_OP_EQ_uxn_opcodes_h_l2063_c11_a625 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2063_c11_a625_left,
BIN_OP_EQ_uxn_opcodes_h_l2063_c11_a625_right,
BIN_OP_EQ_uxn_opcodes_h_l2063_c11_a625_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_7355
result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_7355 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_7355_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_7355_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_7355
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_7355 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_7355_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_7355_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_7355
result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_7355 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_7355_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_7355_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2063_c7_7355
result_stack_value_MUX_uxn_opcodes_h_l2063_c7_7355 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2063_c7_7355_cond,
result_stack_value_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2063_c7_7355_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_7355
result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_7355 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_7355_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_7355_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l2067_c24_08bb
BIN_OP_LT_uxn_opcodes_h_l2067_c24_08bb : entity work.BIN_OP_LT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l2067_c24_08bb_left,
BIN_OP_LT_uxn_opcodes_h_l2067_c24_08bb_right,
BIN_OP_LT_uxn_opcodes_h_l2067_c24_08bb_return_output);

-- MUX_uxn_opcodes_h_l2067_c24_85f8
MUX_uxn_opcodes_h_l2067_c24_85f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2067_c24_85f8_cond,
MUX_uxn_opcodes_h_l2067_c24_85f8_iftrue,
MUX_uxn_opcodes_h_l2067_c24_85f8_iffalse,
MUX_uxn_opcodes_h_l2067_c24_85f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2069_c11_c677
BIN_OP_EQ_uxn_opcodes_h_l2069_c11_c677 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2069_c11_c677_left,
BIN_OP_EQ_uxn_opcodes_h_l2069_c11_c677_right,
BIN_OP_EQ_uxn_opcodes_h_l2069_c11_c677_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_6adc
result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_6adc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_6adc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_6adc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_6adc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_6adc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_6adc
result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_6adc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_6adc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_6adc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_6adc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_6adc_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_29ff_return_output,
 t8_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output,
 n8_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0b02_return_output,
 t8_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output,
 n8_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2051_c11_e060_return_output,
 t8_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output,
 n8_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2055_c11_5a9a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output,
 n8_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2058_c11_08b7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_8021_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_8021_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_8021_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_8021_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2058_c7_8021_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_8021_return_output,
 n8_MUX_uxn_opcodes_h_l2058_c7_8021_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2061_c32_4bb6_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2061_c32_570c_return_output,
 MUX_uxn_opcodes_h_l2061_c32_0156_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2063_c11_a625_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_7355_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_7355_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_7355_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2063_c7_7355_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_7355_return_output,
 BIN_OP_LT_uxn_opcodes_h_l2067_c24_08bb_return_output,
 MUX_uxn_opcodes_h_l2067_c24_85f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2069_c11_c677_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_6adc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_6adc_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_29ff_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_29ff_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_29ff_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_29ff_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2045_c3_1ad3 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2044_c3_4662_uxn_opcodes_h_l2044_c3_4662_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0b02_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0b02_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0b02_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2048_c7_31ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_31ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2049_c3_8d89 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_31ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_31ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2048_c7_31ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2048_c7_31ff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_e060_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_e060_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_e060_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2053_c3_e81a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_5a9a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_5a9a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_5a9a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_8021_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_ed22_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2056_c3_0e25 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_8021_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_ed22_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_8021_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_8021_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_ed22_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2058_c7_8021_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_ed22_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_8021_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2058_c7_8021_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2055_c7_ed22_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_08b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_08b7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_08b7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_7355_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_8021_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_7355_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_8021_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_8021_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_7355_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_8021_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2063_c7_7355_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2058_c7_8021_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_7355_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_8021_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2058_c7_8021_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2061_c32_0156_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2061_c32_0156_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2061_c32_0156_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2061_c32_4bb6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2061_c32_4bb6_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2061_c32_4bb6_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2061_c32_570c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2061_c32_570c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2061_c32_570c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2061_c32_0156_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_a625_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_a625_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_a625_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_6adc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_7355_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2066_c3_9ff0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_7355_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_6adc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_7355_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2063_c7_7355_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_7355_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2067_c24_85f8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2067_c24_85f8_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2067_c24_85f8_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2067_c24_08bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2067_c24_08bb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2067_c24_08bb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2067_c24_85f8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_c677_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_c677_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_c677_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_6adc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_6adc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_6adc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_6adc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_6adc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_6adc_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2069_l2058_l2055_DUPLICATE_89c5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2058_l2055_DUPLICATE_8bd4_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2063_l2058_l2055_DUPLICATE_a6b3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2063_l2055_DUPLICATE_e964_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2051_l2048_l2069_l2063_l2058_l2055_DUPLICATE_c398_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2058_l2063_DUPLICATE_8d16_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2039_l2074_DUPLICATE_4187_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2049_c3_8d89 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2049_c3_8d89;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_6adc_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2053_c3_e81a := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2053_c3_e81a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2045_c3_1ad3 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2045_c3_1ad3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_5a9a_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0b02_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_a625_right := to_unsigned(5, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2061_c32_4bb6_right := to_unsigned(128, 8);
     VAR_MUX_uxn_opcodes_h_l2061_c32_0156_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2061_c32_570c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_e060_right := to_unsigned(2, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_08b7_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_6adc_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2066_c3_9ff0 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2066_c3_9ff0;
     VAR_MUX_uxn_opcodes_h_l2061_c32_0156_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_29ff_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_c677_right := to_unsigned(6, 3);
     VAR_MUX_uxn_opcodes_h_l2067_c24_85f8_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2067_c24_85f8_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2056_c3_0e25 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2056_c3_0e25;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_29ff_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2061_c32_4bb6_left := VAR_ins;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2067_c24_08bb_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0b02_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_e060_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_5a9a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_08b7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_a625_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_c677_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2067_c24_08bb_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2058_c11_08b7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2058_c11_08b7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_08b7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2058_c11_08b7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_08b7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_08b7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2058_c11_08b7_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2063_l2055_DUPLICATE_e964 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2063_l2055_DUPLICATE_e964_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2058_l2063_DUPLICATE_8d16 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2058_l2063_DUPLICATE_8d16_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2043_c6_fd89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89_left;
     BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89_return_output := BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2069_c11_c677] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2069_c11_c677_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_c677_left;
     BIN_OP_EQ_uxn_opcodes_h_l2069_c11_c677_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_c677_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_c677_return_output := BIN_OP_EQ_uxn_opcodes_h_l2069_c11_c677_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2063_l2058_l2055_DUPLICATE_a6b3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2063_l2058_l2055_DUPLICATE_a6b3_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2069_l2058_l2055_DUPLICATE_89c5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2069_l2058_l2055_DUPLICATE_89c5_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2051_l2048_l2069_l2063_l2058_l2055_DUPLICATE_c398 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2051_l2048_l2069_l2063_l2058_l2055_DUPLICATE_c398_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l2061_c32_4bb6] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2061_c32_4bb6_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2061_c32_4bb6_left;
     BIN_OP_AND_uxn_opcodes_h_l2061_c32_4bb6_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2061_c32_4bb6_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2061_c32_4bb6_return_output := BIN_OP_AND_uxn_opcodes_h_l2061_c32_4bb6_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2058_l2055_DUPLICATE_8bd4 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2058_l2055_DUPLICATE_8bd4_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2051_c11_e060] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2051_c11_e060_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_e060_left;
     BIN_OP_EQ_uxn_opcodes_h_l2051_c11_e060_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_e060_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_e060_return_output := BIN_OP_EQ_uxn_opcodes_h_l2051_c11_e060_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2063_c11_a625] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2063_c11_a625_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_a625_left;
     BIN_OP_EQ_uxn_opcodes_h_l2063_c11_a625_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_a625_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_a625_return_output := BIN_OP_EQ_uxn_opcodes_h_l2063_c11_a625_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2055_c11_5a9a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2055_c11_5a9a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_5a9a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2055_c11_5a9a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_5a9a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_5a9a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2055_c11_5a9a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2048_c11_0b02] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0b02_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0b02_left;
     BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0b02_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0b02_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0b02_return_output := BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0b02_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l2067_c24_08bb] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l2067_c24_08bb_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l2067_c24_08bb_left;
     BIN_OP_LT_uxn_opcodes_h_l2067_c24_08bb_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l2067_c24_08bb_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l2067_c24_08bb_return_output := BIN_OP_LT_uxn_opcodes_h_l2067_c24_08bb_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2061_c32_570c_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2061_c32_4bb6_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_29ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2043_c6_fd89_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2048_c7_31ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0b02_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_31ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0b02_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0b02_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_31ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0b02_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0b02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_31ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0b02_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2048_c7_31ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0b02_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2048_c7_31ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2048_c11_0b02_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_e060_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_e060_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_e060_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_e060_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_e060_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_e060_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_e060_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2051_c11_e060_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2055_c7_ed22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_5a9a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_ed22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_5a9a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_5a9a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_ed22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_5a9a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_5a9a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_ed22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_5a9a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_ed22_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_5a9a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2058_c7_8021_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_08b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_8021_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_08b7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_8021_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_08b7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_8021_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_08b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_8021_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_08b7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_8021_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_08b7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2058_c7_8021_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2058_c11_08b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_7355_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_a625_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_7355_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_a625_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_7355_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_a625_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_7355_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_a625_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2063_c7_7355_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2063_c11_a625_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_6adc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_c677_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_6adc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2069_c11_c677_return_output;
     VAR_MUX_uxn_opcodes_h_l2067_c24_85f8_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l2067_c24_08bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2058_l2055_DUPLICATE_8bd4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2058_l2055_DUPLICATE_8bd4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2058_l2055_DUPLICATE_8bd4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2058_l2055_DUPLICATE_8bd4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2058_l2055_DUPLICATE_8bd4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2051_l2048_l2069_l2063_l2058_l2055_DUPLICATE_c398_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2051_l2048_l2069_l2063_l2058_l2055_DUPLICATE_c398_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2051_l2048_l2069_l2063_l2058_l2055_DUPLICATE_c398_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2051_l2048_l2069_l2063_l2058_l2055_DUPLICATE_c398_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2051_l2048_l2069_l2063_l2058_l2055_DUPLICATE_c398_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_6adc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2051_l2048_l2069_l2063_l2058_l2055_DUPLICATE_c398_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2063_l2055_DUPLICATE_e964_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2063_l2055_DUPLICATE_e964_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2063_l2055_DUPLICATE_e964_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2063_l2055_DUPLICATE_e964_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2063_l2055_DUPLICATE_e964_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2069_l2058_l2055_DUPLICATE_89c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2069_l2058_l2055_DUPLICATE_89c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2069_l2058_l2055_DUPLICATE_89c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2069_l2058_l2055_DUPLICATE_89c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2069_l2058_l2055_DUPLICATE_89c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_6adc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2069_l2058_l2055_DUPLICATE_89c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2058_l2063_DUPLICATE_8d16_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2058_l2063_DUPLICATE_8d16_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2063_l2058_l2055_DUPLICATE_a6b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2063_l2058_l2055_DUPLICATE_a6b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2063_l2058_l2055_DUPLICATE_a6b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2063_l2058_l2055_DUPLICATE_a6b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2063_l2058_l2055_DUPLICATE_a6b3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2051_l2048_l2043_l2063_l2058_l2055_DUPLICATE_a6b3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2069_c7_6adc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_6adc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_6adc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_6adc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_6adc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_6adc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_6adc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_6adc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_6adc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2069_c7_6adc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_6adc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_6adc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_6adc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_6adc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_6adc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_6adc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_6adc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_6adc_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2061_c32_570c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2061_c32_570c_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2061_c32_570c_left;
     BIN_OP_GT_uxn_opcodes_h_l2061_c32_570c_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2061_c32_570c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2061_c32_570c_return_output := BIN_OP_GT_uxn_opcodes_h_l2061_c32_570c_return_output;

     -- n8_MUX[uxn_opcodes_h_l2058_c7_8021] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2058_c7_8021_cond <= VAR_n8_MUX_uxn_opcodes_h_l2058_c7_8021_cond;
     n8_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue;
     n8_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2058_c7_8021_return_output := n8_MUX_uxn_opcodes_h_l2058_c7_8021_return_output;

     -- t8_MUX[uxn_opcodes_h_l2051_c7_8d9f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond <= VAR_t8_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond;
     t8_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue;
     t8_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output := t8_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2043_c1_29ff] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_29ff_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_29ff_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_29ff_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_29ff_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_29ff_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_29ff_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_29ff_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_29ff_return_output;

     -- MUX[uxn_opcodes_h_l2067_c24_85f8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2067_c24_85f8_cond <= VAR_MUX_uxn_opcodes_h_l2067_c24_85f8_cond;
     MUX_uxn_opcodes_h_l2067_c24_85f8_iftrue <= VAR_MUX_uxn_opcodes_h_l2067_c24_85f8_iftrue;
     MUX_uxn_opcodes_h_l2067_c24_85f8_iffalse <= VAR_MUX_uxn_opcodes_h_l2067_c24_85f8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2067_c24_85f8_return_output := MUX_uxn_opcodes_h_l2067_c24_85f8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2063_c7_7355] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_7355_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_7355_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_7355_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_7355_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2063_c7_7355] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_7355_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_7355_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_7355_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_7355_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2061_c32_0156_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2061_c32_570c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue := VAR_MUX_uxn_opcodes_h_l2067_c24_85f8_return_output;
     VAR_printf_uxn_opcodes_h_l2044_c3_4662_uxn_opcodes_h_l2044_c3_4662_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2043_c1_29ff_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2058_c7_8021_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2069_c7_6adc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2063_c7_7355_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2069_c7_6adc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2063_c7_7355_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2063_c7_7355] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_7355_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_7355_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_7355_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_7355_return_output;

     -- t8_MUX[uxn_opcodes_h_l2048_c7_31ff] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2048_c7_31ff_cond <= VAR_t8_MUX_uxn_opcodes_h_l2048_c7_31ff_cond;
     t8_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue;
     t8_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output := t8_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2063_c7_7355] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2063_c7_7355_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2063_c7_7355_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2063_c7_7355_return_output := result_stack_value_MUX_uxn_opcodes_h_l2063_c7_7355_return_output;

     -- n8_MUX[uxn_opcodes_h_l2055_c7_ed22] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2055_c7_ed22_cond <= VAR_n8_MUX_uxn_opcodes_h_l2055_c7_ed22_cond;
     n8_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue;
     n8_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output := n8_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output;

     -- printf_uxn_opcodes_h_l2044_c3_4662[uxn_opcodes_h_l2044_c3_4662] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2044_c3_4662_uxn_opcodes_h_l2044_c3_4662_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2044_c3_4662_uxn_opcodes_h_l2044_c3_4662_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l2061_c32_0156] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2061_c32_0156_cond <= VAR_MUX_uxn_opcodes_h_l2061_c32_0156_cond;
     MUX_uxn_opcodes_h_l2061_c32_0156_iftrue <= VAR_MUX_uxn_opcodes_h_l2061_c32_0156_iftrue;
     MUX_uxn_opcodes_h_l2061_c32_0156_iffalse <= VAR_MUX_uxn_opcodes_h_l2061_c32_0156_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2061_c32_0156_return_output := MUX_uxn_opcodes_h_l2061_c32_0156_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2058_c7_8021] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_8021_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_8021_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_8021_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_8021_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2058_c7_8021] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_8021_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_8021_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_8021_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_8021_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2063_c7_7355] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_7355_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_7355_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_7355_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_7355_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_7355_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_7355_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue := VAR_MUX_uxn_opcodes_h_l2061_c32_0156_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2063_c7_7355_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2058_c7_8021_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2063_c7_7355_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2058_c7_8021_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2063_c7_7355_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2058_c7_8021] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_8021_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_8021_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_8021_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_8021_return_output;

     -- t8_MUX[uxn_opcodes_h_l2043_c2_c4d2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond <= VAR_t8_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond;
     t8_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue;
     t8_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output := t8_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2055_c7_ed22] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2058_c7_8021] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2058_c7_8021_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2058_c7_8021_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2058_c7_8021_return_output := result_stack_value_MUX_uxn_opcodes_h_l2058_c7_8021_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2058_c7_8021] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_8021_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_8021_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_8021_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_8021_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2058_c7_8021] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_8021_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_8021_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_8021_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_8021_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_8021_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_8021_return_output;

     -- n8_MUX[uxn_opcodes_h_l2051_c7_8d9f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond <= VAR_n8_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond;
     n8_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue;
     n8_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output := n8_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2055_c7_ed22] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_ed22_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_ed22_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2058_c7_8021_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2058_c7_8021_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2058_c7_8021_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2058_c7_8021_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2051_c7_8d9f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2055_c7_ed22] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_ed22_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_ed22_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2055_c7_ed22] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_ed22_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_ed22_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output;

     -- n8_MUX[uxn_opcodes_h_l2048_c7_31ff] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2048_c7_31ff_cond <= VAR_n8_MUX_uxn_opcodes_h_l2048_c7_31ff_cond;
     n8_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue;
     n8_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output := n8_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2055_c7_ed22] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2055_c7_ed22_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_ed22_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output := result_stack_value_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2051_c7_8d9f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2055_c7_ed22] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_ed22_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2051_c7_8d9f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2051_c7_8d9f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2048_c7_31ff] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2051_c7_8d9f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output;

     -- n8_MUX[uxn_opcodes_h_l2043_c2_c4d2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond <= VAR_n8_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond;
     n8_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue;
     n8_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output := n8_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2051_c7_8d9f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2048_c7_31ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_31ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_31ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2051_c7_8d9f_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2048_c7_31ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_31ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_31ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2048_c7_31ff] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2048_c7_31ff_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2048_c7_31ff_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output := result_stack_value_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2048_c7_31ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2043_c2_c4d2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2048_c7_31ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_31ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_31ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_31ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_31ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2043_c2_c4d2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2048_c7_31ff_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2043_c2_c4d2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2043_c2_c4d2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2043_c2_c4d2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2043_c2_c4d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_c4d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_c4d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_c4d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2039_l2074_DUPLICATE_4187 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2039_l2074_DUPLICATE_4187_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2043_c2_c4d2_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2039_l2074_DUPLICATE_4187_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2039_l2074_DUPLICATE_4187_return_output;
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
