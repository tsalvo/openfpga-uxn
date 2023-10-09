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
-- Submodules: 96
entity rot_0CLK_9c3c4e32 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot_0CLK_9c3c4e32;
architecture arch of rot_0CLK_9c3c4e32 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal l8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_l8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l3031_c6_13e8]
signal BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3031_c1_a525]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3031_c1_a525_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3031_c1_a525_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3031_c1_a525_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3031_c1_a525_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l3031_c2_23a6]
signal t8_MUX_uxn_opcodes_h_l3031_c2_23a6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l3031_c2_23a6]
signal l8_MUX_uxn_opcodes_h_l3031_c2_23a6_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l3031_c2_23a6]
signal n8_MUX_uxn_opcodes_h_l3031_c2_23a6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3031_c2_23a6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3031_c2_23a6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3031_c2_23a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3031_c2_23a6]
signal result_stack_value_MUX_uxn_opcodes_h_l3031_c2_23a6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3031_c2_23a6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3031_c2_23a6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3031_c2_23a6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3031_c2_23a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3031_c2_23a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3031_c2_23a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c2_23a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l3032_c3_e3c9[uxn_opcodes_h_l3032_c3_e3c9]
signal printf_uxn_opcodes_h_l3032_c3_e3c9_uxn_opcodes_h_l3032_c3_e3c9_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3037_c11_0685]
signal BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l3037_c7_89e8]
signal t8_MUX_uxn_opcodes_h_l3037_c7_89e8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l3037_c7_89e8]
signal l8_MUX_uxn_opcodes_h_l3037_c7_89e8_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l3037_c7_89e8]
signal n8_MUX_uxn_opcodes_h_l3037_c7_89e8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3037_c7_89e8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3037_c7_89e8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3037_c7_89e8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3037_c7_89e8]
signal result_stack_value_MUX_uxn_opcodes_h_l3037_c7_89e8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3037_c7_89e8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3037_c7_89e8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3037_c7_89e8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3037_c7_89e8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3037_c7_89e8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3037_c7_89e8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3037_c7_89e8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3040_c11_d065]
signal BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l3040_c7_0877]
signal t8_MUX_uxn_opcodes_h_l3040_c7_0877_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l3040_c7_0877_return_output : unsigned(7 downto 0);

-- l8_MUX[uxn_opcodes_h_l3040_c7_0877]
signal l8_MUX_uxn_opcodes_h_l3040_c7_0877_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3040_c7_0877_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l3040_c7_0877]
signal n8_MUX_uxn_opcodes_h_l3040_c7_0877_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3040_c7_0877_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3040_c7_0877]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3040_c7_0877_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3040_c7_0877_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3040_c7_0877]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3040_c7_0877_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3040_c7_0877_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3040_c7_0877]
signal result_stack_value_MUX_uxn_opcodes_h_l3040_c7_0877_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3040_c7_0877_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3040_c7_0877]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3040_c7_0877_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3040_c7_0877_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3040_c7_0877]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3040_c7_0877_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3040_c7_0877_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3040_c7_0877]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3040_c7_0877_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3040_c7_0877_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3040_c7_0877]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3040_c7_0877_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3040_c7_0877_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3044_c11_eec7]
signal BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l3044_c7_64f6]
signal l8_MUX_uxn_opcodes_h_l3044_c7_64f6_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l3044_c7_64f6]
signal n8_MUX_uxn_opcodes_h_l3044_c7_64f6_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3044_c7_64f6]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3044_c7_64f6_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3044_c7_64f6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3044_c7_64f6]
signal result_stack_value_MUX_uxn_opcodes_h_l3044_c7_64f6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3044_c7_64f6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3044_c7_64f6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3044_c7_64f6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3044_c7_64f6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3044_c7_64f6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3044_c7_64f6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3044_c7_64f6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3047_c11_2c45]
signal BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l3047_c7_7ebf]
signal l8_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l3047_c7_7ebf]
signal n8_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3047_c7_7ebf]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3047_c7_7ebf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3047_c7_7ebf]
signal result_stack_value_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3047_c7_7ebf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3047_c7_7ebf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3047_c7_7ebf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3047_c7_7ebf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3051_c11_6dd0]
signal BIN_OP_EQ_uxn_opcodes_h_l3051_c11_6dd0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3051_c11_6dd0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3051_c11_6dd0_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l3051_c7_7a09]
signal l8_MUX_uxn_opcodes_h_l3051_c7_7a09_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3051_c7_7a09]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3051_c7_7a09_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3051_c7_7a09]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3051_c7_7a09]
signal result_stack_value_MUX_uxn_opcodes_h_l3051_c7_7a09_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3051_c7_7a09]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3051_c7_7a09]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3051_c7_7a09_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3051_c7_7a09]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3051_c7_7a09_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3051_c7_7a09]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3051_c7_7a09_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3054_c11_38c3]
signal BIN_OP_EQ_uxn_opcodes_h_l3054_c11_38c3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3054_c11_38c3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3054_c11_38c3_return_output : unsigned(0 downto 0);

-- l8_MUX[uxn_opcodes_h_l3054_c7_602d]
signal l8_MUX_uxn_opcodes_h_l3054_c7_602d_cond : unsigned(0 downto 0);
signal l8_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse : unsigned(7 downto 0);
signal l8_MUX_uxn_opcodes_h_l3054_c7_602d_return_output : unsigned(7 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l3054_c7_602d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l3054_c7_602d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l3054_c7_602d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l3054_c7_602d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3054_c7_602d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l3054_c7_602d_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3054_c7_602d]
signal result_stack_value_MUX_uxn_opcodes_h_l3054_c7_602d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3054_c7_602d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3054_c7_602d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_602d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_602d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3054_c7_602d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_602d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_602d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3054_c7_602d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_602d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_602d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3054_c7_602d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_602d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_602d_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l3058_c32_524c]
signal BIN_OP_AND_uxn_opcodes_h_l3058_c32_524c_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3058_c32_524c_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l3058_c32_524c_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l3058_c32_0483]
signal BIN_OP_GT_uxn_opcodes_h_l3058_c32_0483_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3058_c32_0483_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l3058_c32_0483_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l3058_c32_a7f2]
signal MUX_uxn_opcodes_h_l3058_c32_a7f2_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l3058_c32_a7f2_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l3058_c32_a7f2_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l3058_c32_a7f2_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3060_c11_b75a]
signal BIN_OP_EQ_uxn_opcodes_h_l3060_c11_b75a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3060_c11_b75a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3060_c11_b75a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l3060_c7_2125]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3060_c7_2125_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l3060_c7_2125_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3060_c7_2125]
signal result_stack_value_MUX_uxn_opcodes_h_l3060_c7_2125_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3060_c7_2125_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3060_c7_2125]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3060_c7_2125_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3060_c7_2125_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3060_c7_2125]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3060_c7_2125_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3060_c7_2125_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3060_c7_2125]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3060_c7_2125_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3060_c7_2125_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3066_c11_3539]
signal BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3539_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3539_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3539_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3066_c7_e2d7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3066_c7_e2d7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3066_c7_e2d7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3066_c7_e2d7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3066_c7_e2d7_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3066_c7_e2d7]
signal result_stack_value_MUX_uxn_opcodes_h_l3066_c7_e2d7_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3066_c7_e2d7_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3066_c7_e2d7_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3066_c7_e2d7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3066_c7_e2d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3066_c7_e2d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3066_c7_e2d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3066_c7_e2d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3066_c7_e2d7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3066_c7_e2d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3066_c7_e2d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3066_c7_e2d7_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3066_c7_e2d7_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3066_c7_e2d7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3070_c11_272c]
signal BIN_OP_EQ_uxn_opcodes_h_l3070_c11_272c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3070_c11_272c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3070_c11_272c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3070_c7_9189]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3070_c7_9189_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3070_c7_9189_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3070_c7_9189_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3070_c7_9189_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l3070_c7_9189]
signal result_stack_value_MUX_uxn_opcodes_h_l3070_c7_9189_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3070_c7_9189_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3070_c7_9189_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l3070_c7_9189_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3070_c7_9189]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3070_c7_9189_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3070_c7_9189_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3070_c7_9189_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3070_c7_9189_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3070_c7_9189]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3070_c7_9189_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3070_c7_9189_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3070_c7_9189_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3070_c7_9189_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l3074_c11_84b2]
signal BIN_OP_EQ_uxn_opcodes_h_l3074_c11_84b2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3074_c11_84b2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l3074_c11_84b2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l3074_c7_58f7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l3074_c7_58f7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3074_c7_58f7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3074_c7_58f7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l3074_c7_58f7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l3074_c7_58f7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l3074_c7_58f7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3074_c7_58f7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3074_c7_58f7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l3074_c7_58f7_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.stack_value := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8
BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_left,
BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_right,
BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3031_c1_a525
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3031_c1_a525 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3031_c1_a525_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3031_c1_a525_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3031_c1_a525_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3031_c1_a525_return_output);

-- t8_MUX_uxn_opcodes_h_l3031_c2_23a6
t8_MUX_uxn_opcodes_h_l3031_c2_23a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l3031_c2_23a6_cond,
t8_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue,
t8_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse,
t8_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output);

-- l8_MUX_uxn_opcodes_h_l3031_c2_23a6
l8_MUX_uxn_opcodes_h_l3031_c2_23a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l3031_c2_23a6_cond,
l8_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue,
l8_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse,
l8_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output);

-- n8_MUX_uxn_opcodes_h_l3031_c2_23a6
n8_MUX_uxn_opcodes_h_l3031_c2_23a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l3031_c2_23a6_cond,
n8_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue,
n8_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse,
n8_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3031_c2_23a6
result_is_stack_read_MUX_uxn_opcodes_h_l3031_c2_23a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3031_c2_23a6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c2_23a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c2_23a6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3031_c2_23a6
result_stack_value_MUX_uxn_opcodes_h_l3031_c2_23a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3031_c2_23a6_cond,
result_stack_value_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c2_23a6
result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c2_23a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3031_c2_23a6
result_is_stack_write_MUX_uxn_opcodes_h_l3031_c2_23a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3031_c2_23a6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3031_c2_23a6
result_is_opc_done_MUX_uxn_opcodes_h_l3031_c2_23a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3031_c2_23a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c2_23a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c2_23a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c2_23a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output);

-- printf_uxn_opcodes_h_l3032_c3_e3c9_uxn_opcodes_h_l3032_c3_e3c9
printf_uxn_opcodes_h_l3032_c3_e3c9_uxn_opcodes_h_l3032_c3_e3c9 : entity work.printf_uxn_opcodes_h_l3032_c3_e3c9_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l3032_c3_e3c9_uxn_opcodes_h_l3032_c3_e3c9_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685
BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685_left,
BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685_right,
BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685_return_output);

-- t8_MUX_uxn_opcodes_h_l3037_c7_89e8
t8_MUX_uxn_opcodes_h_l3037_c7_89e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l3037_c7_89e8_cond,
t8_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue,
t8_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse,
t8_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output);

-- l8_MUX_uxn_opcodes_h_l3037_c7_89e8
l8_MUX_uxn_opcodes_h_l3037_c7_89e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l3037_c7_89e8_cond,
l8_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue,
l8_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse,
l8_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output);

-- n8_MUX_uxn_opcodes_h_l3037_c7_89e8
n8_MUX_uxn_opcodes_h_l3037_c7_89e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l3037_c7_89e8_cond,
n8_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue,
n8_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse,
n8_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3037_c7_89e8
result_is_stack_read_MUX_uxn_opcodes_h_l3037_c7_89e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3037_c7_89e8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3037_c7_89e8
result_sp_relative_shift_MUX_uxn_opcodes_h_l3037_c7_89e8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3037_c7_89e8
result_stack_value_MUX_uxn_opcodes_h_l3037_c7_89e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3037_c7_89e8_cond,
result_stack_value_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3037_c7_89e8
result_is_sp_shift_MUX_uxn_opcodes_h_l3037_c7_89e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3037_c7_89e8
result_is_stack_write_MUX_uxn_opcodes_h_l3037_c7_89e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3037_c7_89e8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3037_c7_89e8
result_is_opc_done_MUX_uxn_opcodes_h_l3037_c7_89e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3037_c7_89e8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3037_c7_89e8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3037_c7_89e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3037_c7_89e8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065
BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065_left,
BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065_right,
BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065_return_output);

-- t8_MUX_uxn_opcodes_h_l3040_c7_0877
t8_MUX_uxn_opcodes_h_l3040_c7_0877 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l3040_c7_0877_cond,
t8_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue,
t8_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse,
t8_MUX_uxn_opcodes_h_l3040_c7_0877_return_output);

-- l8_MUX_uxn_opcodes_h_l3040_c7_0877
l8_MUX_uxn_opcodes_h_l3040_c7_0877 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l3040_c7_0877_cond,
l8_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue,
l8_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse,
l8_MUX_uxn_opcodes_h_l3040_c7_0877_return_output);

-- n8_MUX_uxn_opcodes_h_l3040_c7_0877
n8_MUX_uxn_opcodes_h_l3040_c7_0877 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l3040_c7_0877_cond,
n8_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue,
n8_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse,
n8_MUX_uxn_opcodes_h_l3040_c7_0877_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3040_c7_0877
result_is_stack_read_MUX_uxn_opcodes_h_l3040_c7_0877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3040_c7_0877_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3040_c7_0877_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3040_c7_0877
result_sp_relative_shift_MUX_uxn_opcodes_h_l3040_c7_0877 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3040_c7_0877_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3040_c7_0877_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3040_c7_0877
result_stack_value_MUX_uxn_opcodes_h_l3040_c7_0877 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3040_c7_0877_cond,
result_stack_value_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3040_c7_0877_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3040_c7_0877
result_is_sp_shift_MUX_uxn_opcodes_h_l3040_c7_0877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3040_c7_0877_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3040_c7_0877_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3040_c7_0877
result_is_stack_write_MUX_uxn_opcodes_h_l3040_c7_0877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3040_c7_0877_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3040_c7_0877_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3040_c7_0877
result_is_opc_done_MUX_uxn_opcodes_h_l3040_c7_0877 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3040_c7_0877_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3040_c7_0877_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3040_c7_0877
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3040_c7_0877 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3040_c7_0877_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3040_c7_0877_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7
BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7_left,
BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7_right,
BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7_return_output);

-- l8_MUX_uxn_opcodes_h_l3044_c7_64f6
l8_MUX_uxn_opcodes_h_l3044_c7_64f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l3044_c7_64f6_cond,
l8_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue,
l8_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse,
l8_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output);

-- n8_MUX_uxn_opcodes_h_l3044_c7_64f6
n8_MUX_uxn_opcodes_h_l3044_c7_64f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l3044_c7_64f6_cond,
n8_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue,
n8_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse,
n8_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3044_c7_64f6
result_is_stack_read_MUX_uxn_opcodes_h_l3044_c7_64f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3044_c7_64f6_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3044_c7_64f6
result_sp_relative_shift_MUX_uxn_opcodes_h_l3044_c7_64f6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3044_c7_64f6
result_stack_value_MUX_uxn_opcodes_h_l3044_c7_64f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3044_c7_64f6_cond,
result_stack_value_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3044_c7_64f6
result_is_sp_shift_MUX_uxn_opcodes_h_l3044_c7_64f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3044_c7_64f6
result_is_stack_write_MUX_uxn_opcodes_h_l3044_c7_64f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3044_c7_64f6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3044_c7_64f6
result_is_opc_done_MUX_uxn_opcodes_h_l3044_c7_64f6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3044_c7_64f6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3044_c7_64f6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3044_c7_64f6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3044_c7_64f6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45
BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45_left,
BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45_right,
BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45_return_output);

-- l8_MUX_uxn_opcodes_h_l3047_c7_7ebf
l8_MUX_uxn_opcodes_h_l3047_c7_7ebf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond,
l8_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue,
l8_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse,
l8_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output);

-- n8_MUX_uxn_opcodes_h_l3047_c7_7ebf
n8_MUX_uxn_opcodes_h_l3047_c7_7ebf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond,
n8_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue,
n8_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse,
n8_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3047_c7_7ebf
result_is_stack_read_MUX_uxn_opcodes_h_l3047_c7_7ebf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf
result_sp_relative_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3047_c7_7ebf
result_stack_value_MUX_uxn_opcodes_h_l3047_c7_7ebf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond,
result_stack_value_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf
result_is_sp_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3047_c7_7ebf
result_is_stack_write_MUX_uxn_opcodes_h_l3047_c7_7ebf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3047_c7_7ebf
result_is_opc_done_MUX_uxn_opcodes_h_l3047_c7_7ebf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3047_c7_7ebf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3047_c7_7ebf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3051_c11_6dd0
BIN_OP_EQ_uxn_opcodes_h_l3051_c11_6dd0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3051_c11_6dd0_left,
BIN_OP_EQ_uxn_opcodes_h_l3051_c11_6dd0_right,
BIN_OP_EQ_uxn_opcodes_h_l3051_c11_6dd0_return_output);

-- l8_MUX_uxn_opcodes_h_l3051_c7_7a09
l8_MUX_uxn_opcodes_h_l3051_c7_7a09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l3051_c7_7a09_cond,
l8_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue,
l8_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse,
l8_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3051_c7_7a09
result_is_stack_read_MUX_uxn_opcodes_h_l3051_c7_7a09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3051_c7_7a09_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3051_c7_7a09
result_sp_relative_shift_MUX_uxn_opcodes_h_l3051_c7_7a09 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3051_c7_7a09
result_stack_value_MUX_uxn_opcodes_h_l3051_c7_7a09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3051_c7_7a09_cond,
result_stack_value_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3051_c7_7a09
result_is_sp_shift_MUX_uxn_opcodes_h_l3051_c7_7a09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3051_c7_7a09
result_is_stack_write_MUX_uxn_opcodes_h_l3051_c7_7a09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3051_c7_7a09_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3051_c7_7a09
result_is_opc_done_MUX_uxn_opcodes_h_l3051_c7_7a09 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3051_c7_7a09_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3051_c7_7a09
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3051_c7_7a09 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3051_c7_7a09_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3054_c11_38c3
BIN_OP_EQ_uxn_opcodes_h_l3054_c11_38c3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3054_c11_38c3_left,
BIN_OP_EQ_uxn_opcodes_h_l3054_c11_38c3_right,
BIN_OP_EQ_uxn_opcodes_h_l3054_c11_38c3_return_output);

-- l8_MUX_uxn_opcodes_h_l3054_c7_602d
l8_MUX_uxn_opcodes_h_l3054_c7_602d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l8_MUX_uxn_opcodes_h_l3054_c7_602d_cond,
l8_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue,
l8_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse,
l8_MUX_uxn_opcodes_h_l3054_c7_602d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l3054_c7_602d
result_is_stack_read_MUX_uxn_opcodes_h_l3054_c7_602d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l3054_c7_602d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l3054_c7_602d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l3054_c7_602d
result_sp_relative_shift_MUX_uxn_opcodes_h_l3054_c7_602d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l3054_c7_602d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l3054_c7_602d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3054_c7_602d
result_stack_value_MUX_uxn_opcodes_h_l3054_c7_602d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3054_c7_602d_cond,
result_stack_value_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3054_c7_602d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_602d
result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_602d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_602d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_602d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_602d
result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_602d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_602d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_602d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_602d
result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_602d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_602d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_602d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_602d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_602d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_602d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_602d_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l3058_c32_524c
BIN_OP_AND_uxn_opcodes_h_l3058_c32_524c : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l3058_c32_524c_left,
BIN_OP_AND_uxn_opcodes_h_l3058_c32_524c_right,
BIN_OP_AND_uxn_opcodes_h_l3058_c32_524c_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l3058_c32_0483
BIN_OP_GT_uxn_opcodes_h_l3058_c32_0483 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l3058_c32_0483_left,
BIN_OP_GT_uxn_opcodes_h_l3058_c32_0483_right,
BIN_OP_GT_uxn_opcodes_h_l3058_c32_0483_return_output);

-- MUX_uxn_opcodes_h_l3058_c32_a7f2
MUX_uxn_opcodes_h_l3058_c32_a7f2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l3058_c32_a7f2_cond,
MUX_uxn_opcodes_h_l3058_c32_a7f2_iftrue,
MUX_uxn_opcodes_h_l3058_c32_a7f2_iffalse,
MUX_uxn_opcodes_h_l3058_c32_a7f2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3060_c11_b75a
BIN_OP_EQ_uxn_opcodes_h_l3060_c11_b75a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3060_c11_b75a_left,
BIN_OP_EQ_uxn_opcodes_h_l3060_c11_b75a_right,
BIN_OP_EQ_uxn_opcodes_h_l3060_c11_b75a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l3060_c7_2125
result_is_sp_shift_MUX_uxn_opcodes_h_l3060_c7_2125 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l3060_c7_2125_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l3060_c7_2125_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3060_c7_2125
result_stack_value_MUX_uxn_opcodes_h_l3060_c7_2125 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3060_c7_2125_cond,
result_stack_value_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3060_c7_2125_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3060_c7_2125
result_is_stack_write_MUX_uxn_opcodes_h_l3060_c7_2125 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3060_c7_2125_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3060_c7_2125_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3060_c7_2125
result_is_opc_done_MUX_uxn_opcodes_h_l3060_c7_2125 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3060_c7_2125_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3060_c7_2125_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3060_c7_2125
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3060_c7_2125 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3060_c7_2125_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3060_c7_2125_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3539
BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3539 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3539_left,
BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3539_right,
BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3539_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3066_c7_e2d7
result_is_stack_write_MUX_uxn_opcodes_h_l3066_c7_e2d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3066_c7_e2d7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3066_c7_e2d7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3066_c7_e2d7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3066_c7_e2d7_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3066_c7_e2d7
result_stack_value_MUX_uxn_opcodes_h_l3066_c7_e2d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3066_c7_e2d7_cond,
result_stack_value_MUX_uxn_opcodes_h_l3066_c7_e2d7_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3066_c7_e2d7_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3066_c7_e2d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3066_c7_e2d7
result_is_opc_done_MUX_uxn_opcodes_h_l3066_c7_e2d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3066_c7_e2d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3066_c7_e2d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3066_c7_e2d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3066_c7_e2d7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3066_c7_e2d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3066_c7_e2d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3066_c7_e2d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3066_c7_e2d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3066_c7_e2d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3066_c7_e2d7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3070_c11_272c
BIN_OP_EQ_uxn_opcodes_h_l3070_c11_272c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3070_c11_272c_left,
BIN_OP_EQ_uxn_opcodes_h_l3070_c11_272c_right,
BIN_OP_EQ_uxn_opcodes_h_l3070_c11_272c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3070_c7_9189
result_is_stack_write_MUX_uxn_opcodes_h_l3070_c7_9189 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3070_c7_9189_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3070_c7_9189_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3070_c7_9189_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3070_c7_9189_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l3070_c7_9189
result_stack_value_MUX_uxn_opcodes_h_l3070_c7_9189 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l3070_c7_9189_cond,
result_stack_value_MUX_uxn_opcodes_h_l3070_c7_9189_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l3070_c7_9189_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l3070_c7_9189_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3070_c7_9189
result_is_opc_done_MUX_uxn_opcodes_h_l3070_c7_9189 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3070_c7_9189_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3070_c7_9189_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3070_c7_9189_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3070_c7_9189_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3070_c7_9189
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3070_c7_9189 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3070_c7_9189_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3070_c7_9189_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3070_c7_9189_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3070_c7_9189_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l3074_c11_84b2
BIN_OP_EQ_uxn_opcodes_h_l3074_c11_84b2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l3074_c11_84b2_left,
BIN_OP_EQ_uxn_opcodes_h_l3074_c11_84b2_right,
BIN_OP_EQ_uxn_opcodes_h_l3074_c11_84b2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l3074_c7_58f7
result_is_stack_write_MUX_uxn_opcodes_h_l3074_c7_58f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l3074_c7_58f7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l3074_c7_58f7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l3074_c7_58f7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l3074_c7_58f7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l3074_c7_58f7
result_is_opc_done_MUX_uxn_opcodes_h_l3074_c7_58f7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l3074_c7_58f7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l3074_c7_58f7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l3074_c7_58f7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l3074_c7_58f7_return_output);



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
 l8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3031_c1_a525_return_output,
 t8_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output,
 l8_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output,
 n8_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685_return_output,
 t8_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output,
 l8_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output,
 n8_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065_return_output,
 t8_MUX_uxn_opcodes_h_l3040_c7_0877_return_output,
 l8_MUX_uxn_opcodes_h_l3040_c7_0877_return_output,
 n8_MUX_uxn_opcodes_h_l3040_c7_0877_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3040_c7_0877_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3040_c7_0877_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3040_c7_0877_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3040_c7_0877_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3040_c7_0877_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3040_c7_0877_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3040_c7_0877_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7_return_output,
 l8_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output,
 n8_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45_return_output,
 l8_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output,
 n8_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3051_c11_6dd0_return_output,
 l8_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3054_c11_38c3_return_output,
 l8_MUX_uxn_opcodes_h_l3054_c7_602d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l3054_c7_602d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l3054_c7_602d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3054_c7_602d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_602d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_602d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_602d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_602d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l3058_c32_524c_return_output,
 BIN_OP_GT_uxn_opcodes_h_l3058_c32_0483_return_output,
 MUX_uxn_opcodes_h_l3058_c32_a7f2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3060_c11_b75a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l3060_c7_2125_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3060_c7_2125_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3060_c7_2125_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3060_c7_2125_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3060_c7_2125_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3539_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3066_c7_e2d7_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3066_c7_e2d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3066_c7_e2d7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3066_c7_e2d7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3070_c11_272c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3070_c7_9189_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l3070_c7_9189_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3070_c7_9189_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3070_c7_9189_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l3074_c11_84b2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l3074_c7_58f7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l3074_c7_58f7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3031_c1_a525_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3031_c1_a525_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3031_c1_a525_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3031_c1_a525_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3031_c2_23a6_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3031_c2_23a6_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3031_c2_23a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3031_c2_23a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3031_c2_23a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3031_c2_23a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3031_c2_23a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3034_c3_d535 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c2_23a6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l3032_c3_e3c9_uxn_opcodes_h_l3032_c3_e3c9_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3040_c7_0877_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3037_c7_89e8_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3040_c7_0877_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3037_c7_89e8_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3040_c7_0877_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3037_c7_89e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3040_c7_0877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3037_c7_89e8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3040_c7_0877_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3040_c7_0877_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3037_c7_89e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3040_c7_0877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3040_c7_0877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3037_c7_89e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3040_c7_0877_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3037_c7_89e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3038_c3_2ddb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3040_c7_0877_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3037_c7_89e8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l3040_c7_0877_cond : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3040_c7_0877_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3040_c7_0877_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3040_c7_0877_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3040_c7_0877_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3040_c7_0877_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3040_c7_0877_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3040_c7_0877_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3040_c7_0877_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3042_c3_9c25 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3040_c7_0877_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3044_c7_64f6_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3044_c7_64f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3044_c7_64f6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3044_c7_64f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3044_c7_64f6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3044_c7_64f6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3045_c3_a3d7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3044_c7_64f6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3049_c3_1d04 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_6dd0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_6dd0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_6dd0_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3054_c7_602d_return_output : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3051_c7_7a09_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3054_c7_602d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3051_c7_7a09_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3054_c7_602d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3054_c7_602d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3051_c7_7a09_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_602d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_602d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3051_c7_7a09_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_602d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3051_c7_7a09_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3052_c3_f212 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_602d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3051_c7_7a09_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_38c3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_38c3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_38c3_return_output : unsigned(0 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse : unsigned(7 downto 0);
 variable VAR_l8_MUX_uxn_opcodes_h_l3054_c7_602d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3054_c7_602d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3054_c7_602d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3060_c7_2125_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3054_c7_602d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3060_c7_2125_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_602d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3060_c7_2125_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_602d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3060_c7_2125_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_602d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3060_c7_2125_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_602d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3058_c32_a7f2_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3058_c32_a7f2_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3058_c32_a7f2_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3058_c32_524c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3058_c32_524c_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l3058_c32_524c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3058_c32_0483_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3058_c32_0483_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l3058_c32_0483_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l3058_c32_a7f2_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_b75a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_b75a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_b75a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3060_c7_2125_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3066_c7_e2d7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3060_c7_2125_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3066_c7_e2d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3060_c7_2125_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3066_c7_e2d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3060_c7_2125_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3063_c3_c41a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3066_c7_e2d7_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3060_c7_2125_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3539_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3539_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3539_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3066_c7_e2d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3066_c7_e2d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3070_c7_9189_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3066_c7_e2d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3066_c7_e2d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3066_c7_e2d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3070_c7_9189_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3066_c7_e2d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3066_c7_e2d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3066_c7_e2d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3070_c7_9189_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3066_c7_e2d7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3066_c7_e2d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3067_c3_6abd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3066_c7_e2d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3070_c7_9189_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3066_c7_e2d7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_272c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_272c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_272c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3070_c7_9189_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3070_c7_9189_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3074_c7_58f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3070_c7_9189_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3070_c7_9189_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3070_c7_9189_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l3070_c7_9189_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3070_c7_9189_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3070_c7_9189_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3074_c7_58f7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3070_c7_9189_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3070_c7_9189_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3071_c3_0c69 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3070_c7_9189_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3070_c7_9189_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_84b2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_84b2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_84b2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3074_c7_58f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3074_c7_58f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3074_c7_58f7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3074_c7_58f7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3074_c7_58f7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3074_c7_58f7_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3031_l3054_l3051_DUPLICATE_463c_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3047_l3044_l3070_l3040_l3037_l3031_l3054_l3051_DUPLICATE_a055_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3060_l3031_l3051_DUPLICATE_a4c3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3047_l3074_l3044_l3070_l3040_l3066_l3037_l3031_l3054_l3051_DUPLICATE_0654_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3054_l3051_DUPLICATE_dbf0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3047_l3074_l3044_l3070_l3040_l3066_l3037_l3060_l3054_l3051_DUPLICATE_4237_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3054_l3070_DUPLICATE_8636_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l3079_l3027_DUPLICATE_8a86_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_l8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_l8 := l8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3071_c3_0c69 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3070_c7_9189_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3071_c3_0c69;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3034_c3_d535 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3034_c3_d535;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_272c_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_6dd0_right := to_unsigned(5, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l3058_c32_0483_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3042_c3_9c25 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3042_c3_9c25;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3074_c7_58f7_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l3058_c32_a7f2_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_84b2_right := to_unsigned(10, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3074_c7_58f7_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3539_right := to_unsigned(8, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_b75a_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3038_c3_2ddb := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3038_c3_2ddb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_38c3_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3031_c1_a525_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l3058_c32_a7f2_iftrue := signed(std_logic_vector(resize(to_unsigned(3, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3052_c3_f212 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3052_c3_f212;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3063_c3_c41a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3063_c3_c41a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3049_c3_1d04 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3049_c3_1d04;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3045_c3_a3d7 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3045_c3_a3d7;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l3058_c32_524c_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3067_c3_6abd := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3066_c7_e2d7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l3067_c3_6abd;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3031_c1_a525_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l3058_c32_524c_left := VAR_ins;
     VAR_l8_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue := l8;
     VAR_l8_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse := l8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue := l8;
     VAR_n8_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3070_c7_9189_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_6dd0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_38c3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_b75a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3539_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_272c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_84b2_left := VAR_phase;
     VAR_l8_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue := VAR_previous_stack_read;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3066_c7_e2d7_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l3074_c11_84b2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3074_c11_84b2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_84b2_left;
     BIN_OP_EQ_uxn_opcodes_h_l3074_c11_84b2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_84b2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_84b2_return_output := BIN_OP_EQ_uxn_opcodes_h_l3074_c11_84b2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3060_l3031_l3051_DUPLICATE_a4c3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3060_l3031_l3051_DUPLICATE_a4c3_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3047_l3044_l3070_l3040_l3037_l3031_l3054_l3051_DUPLICATE_a055 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3047_l3044_l3070_l3040_l3037_l3031_l3054_l3051_DUPLICATE_a055_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3047_l3074_l3044_l3070_l3040_l3066_l3037_l3060_l3054_l3051_DUPLICATE_4237 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3047_l3074_l3044_l3070_l3040_l3066_l3037_l3060_l3054_l3051_DUPLICATE_4237_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l3054_c11_38c3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3054_c11_38c3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_38c3_left;
     BIN_OP_EQ_uxn_opcodes_h_l3054_c11_38c3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_38c3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_38c3_return_output := BIN_OP_EQ_uxn_opcodes_h_l3054_c11_38c3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3054_l3051_DUPLICATE_dbf0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3054_l3051_DUPLICATE_dbf0_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l3037_c11_0685] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685_left;
     BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685_return_output := BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l3058_c32_524c] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l3058_c32_524c_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l3058_c32_524c_left;
     BIN_OP_AND_uxn_opcodes_h_l3058_c32_524c_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l3058_c32_524c_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l3058_c32_524c_return_output := BIN_OP_AND_uxn_opcodes_h_l3058_c32_524c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3044_c11_eec7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7_left;
     BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7_return_output := BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3066_c11_3539] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3539_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3539_left;
     BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3539_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3539_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3539_return_output := BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3539_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3040_c11_d065] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065_left;
     BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065_return_output := BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3051_c11_6dd0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3051_c11_6dd0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_6dd0_left;
     BIN_OP_EQ_uxn_opcodes_h_l3051_c11_6dd0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_6dd0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_6dd0_return_output := BIN_OP_EQ_uxn_opcodes_h_l3051_c11_6dd0_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3054_l3070_DUPLICATE_8636 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3054_l3070_DUPLICATE_8636_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l3031_c6_13e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3047_c11_2c45] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45_left;
     BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45_return_output := BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l3060_c11_b75a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3060_c11_b75a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_b75a_left;
     BIN_OP_EQ_uxn_opcodes_h_l3060_c11_b75a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_b75a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_b75a_return_output := BIN_OP_EQ_uxn_opcodes_h_l3060_c11_b75a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3047_l3074_l3044_l3070_l3040_l3066_l3037_l3031_l3054_l3051_DUPLICATE_0654 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3047_l3074_l3044_l3070_l3040_l3066_l3037_l3031_l3054_l3051_DUPLICATE_0654_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l3070_c11_272c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l3070_c11_272c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_272c_left;
     BIN_OP_EQ_uxn_opcodes_h_l3070_c11_272c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_272c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_272c_return_output := BIN_OP_EQ_uxn_opcodes_h_l3070_c11_272c_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3031_l3054_l3051_DUPLICATE_463c LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3031_l3054_l3051_DUPLICATE_463c_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l3058_c32_0483_left := VAR_BIN_OP_AND_uxn_opcodes_h_l3058_c32_524c_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3031_c1_a525_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l3031_c2_23a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l3031_c2_23a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3031_c2_23a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3031_c2_23a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3031_c2_23a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c2_23a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3031_c2_23a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l3031_c2_23a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3031_c6_13e8_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l3037_c7_89e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l3037_c7_89e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3037_c7_89e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3037_c7_89e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3037_c7_89e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3037_c7_89e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3037_c7_89e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l3037_c7_89e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3037_c11_0685_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l3040_c7_0877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l3040_c7_0877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3040_c7_0877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3040_c7_0877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3040_c7_0877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3040_c7_0877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3040_c7_0877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3040_c7_0877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3040_c7_0877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l3040_c7_0877_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3040_c11_d065_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l3044_c7_64f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l3044_c7_64f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3044_c7_64f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3044_c7_64f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3044_c7_64f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3044_c7_64f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3044_c7_64f6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3044_c11_eec7_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3047_c11_2c45_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l3051_c7_7a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_6dd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3051_c7_7a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_6dd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_6dd0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3051_c7_7a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_6dd0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3051_c7_7a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_6dd0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_6dd0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3051_c7_7a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_6dd0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3051_c7_7a09_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3051_c11_6dd0_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l3054_c7_602d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_38c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_602d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_38c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_602d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_38c3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3054_c7_602d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_38c3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_602d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_38c3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3054_c7_602d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_38c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_602d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_38c3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3054_c7_602d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3054_c11_38c3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3060_c7_2125_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_b75a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3060_c7_2125_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_b75a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3060_c7_2125_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_b75a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3060_c7_2125_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_b75a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3060_c7_2125_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3060_c11_b75a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3066_c7_e2d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3539_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3066_c7_e2d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3539_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3066_c7_e2d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3539_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3066_c7_e2d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3066_c11_3539_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3070_c7_9189_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_272c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3070_c7_9189_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_272c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3070_c7_9189_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_272c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3070_c7_9189_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3070_c11_272c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3074_c7_58f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_84b2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3074_c7_58f7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l3074_c11_84b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3031_l3054_l3051_DUPLICATE_463c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3031_l3054_l3051_DUPLICATE_463c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3031_l3054_l3051_DUPLICATE_463c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3031_l3054_l3051_DUPLICATE_463c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3031_l3054_l3051_DUPLICATE_463c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3031_l3054_l3051_DUPLICATE_463c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3031_l3054_l3051_DUPLICATE_463c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3047_l3074_l3044_l3070_l3040_l3066_l3037_l3060_l3054_l3051_DUPLICATE_4237_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3047_l3074_l3044_l3070_l3040_l3066_l3037_l3060_l3054_l3051_DUPLICATE_4237_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3047_l3074_l3044_l3070_l3040_l3066_l3037_l3060_l3054_l3051_DUPLICATE_4237_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3047_l3074_l3044_l3070_l3040_l3066_l3037_l3060_l3054_l3051_DUPLICATE_4237_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3047_l3074_l3044_l3070_l3040_l3066_l3037_l3060_l3054_l3051_DUPLICATE_4237_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3047_l3074_l3044_l3070_l3040_l3066_l3037_l3060_l3054_l3051_DUPLICATE_4237_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3047_l3074_l3044_l3070_l3040_l3066_l3037_l3060_l3054_l3051_DUPLICATE_4237_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3066_c7_e2d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3047_l3074_l3044_l3070_l3040_l3066_l3037_l3060_l3054_l3051_DUPLICATE_4237_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3070_c7_9189_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3047_l3074_l3044_l3070_l3040_l3066_l3037_l3060_l3054_l3051_DUPLICATE_4237_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3074_c7_58f7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l3047_l3074_l3044_l3070_l3040_l3066_l3037_l3060_l3054_l3051_DUPLICATE_4237_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3060_l3031_l3051_DUPLICATE_a4c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3060_l3031_l3051_DUPLICATE_a4c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3060_l3031_l3051_DUPLICATE_a4c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3060_l3031_l3051_DUPLICATE_a4c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3060_l3031_l3051_DUPLICATE_a4c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3060_l3031_l3051_DUPLICATE_a4c3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3060_l3031_l3051_DUPLICATE_a4c3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3054_l3051_DUPLICATE_dbf0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3054_l3051_DUPLICATE_dbf0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3054_l3051_DUPLICATE_dbf0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3054_l3051_DUPLICATE_dbf0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3054_l3051_DUPLICATE_dbf0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l3047_l3044_l3040_l3037_l3054_l3051_DUPLICATE_dbf0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3047_l3074_l3044_l3070_l3040_l3066_l3037_l3031_l3054_l3051_DUPLICATE_0654_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3047_l3074_l3044_l3070_l3040_l3066_l3037_l3031_l3054_l3051_DUPLICATE_0654_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3047_l3074_l3044_l3070_l3040_l3066_l3037_l3031_l3054_l3051_DUPLICATE_0654_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3047_l3074_l3044_l3070_l3040_l3066_l3037_l3031_l3054_l3051_DUPLICATE_0654_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3047_l3074_l3044_l3070_l3040_l3066_l3037_l3031_l3054_l3051_DUPLICATE_0654_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3047_l3074_l3044_l3070_l3040_l3066_l3037_l3031_l3054_l3051_DUPLICATE_0654_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3047_l3074_l3044_l3070_l3040_l3066_l3037_l3031_l3054_l3051_DUPLICATE_0654_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3066_c7_e2d7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3047_l3074_l3044_l3070_l3040_l3066_l3037_l3031_l3054_l3051_DUPLICATE_0654_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3070_c7_9189_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3047_l3074_l3044_l3070_l3040_l3066_l3037_l3031_l3054_l3051_DUPLICATE_0654_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3074_c7_58f7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l3047_l3074_l3044_l3070_l3040_l3066_l3037_l3031_l3054_l3051_DUPLICATE_0654_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3054_l3070_DUPLICATE_8636_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3070_c7_9189_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l3054_l3070_DUPLICATE_8636_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3047_l3044_l3070_l3040_l3037_l3031_l3054_l3051_DUPLICATE_a055_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3047_l3044_l3070_l3040_l3037_l3031_l3054_l3051_DUPLICATE_a055_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3047_l3044_l3070_l3040_l3037_l3031_l3054_l3051_DUPLICATE_a055_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3047_l3044_l3070_l3040_l3037_l3031_l3054_l3051_DUPLICATE_a055_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3047_l3044_l3070_l3040_l3037_l3031_l3054_l3051_DUPLICATE_a055_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3047_l3044_l3070_l3040_l3037_l3031_l3054_l3051_DUPLICATE_a055_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3047_l3044_l3070_l3040_l3037_l3031_l3054_l3051_DUPLICATE_a055_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3070_c7_9189_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l3047_l3044_l3070_l3040_l3037_l3031_l3054_l3051_DUPLICATE_a055_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l3054_c7_602d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3054_c7_602d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3054_c7_602d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3054_c7_602d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3054_c7_602d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3070_c7_9189] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3070_c7_9189_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3070_c7_9189_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3070_c7_9189_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3070_c7_9189_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3070_c7_9189_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3070_c7_9189_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3070_c7_9189_return_output := result_stack_value_MUX_uxn_opcodes_h_l3070_c7_9189_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3070_c7_9189] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3070_c7_9189_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3070_c7_9189_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3070_c7_9189_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3070_c7_9189_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3070_c7_9189_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3070_c7_9189_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3070_c7_9189_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3070_c7_9189_return_output;

     -- n8_MUX[uxn_opcodes_h_l3047_c7_7ebf] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond <= VAR_n8_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond;
     n8_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue;
     n8_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output := n8_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3074_c7_58f7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3074_c7_58f7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3074_c7_58f7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3074_c7_58f7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3074_c7_58f7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3074_c7_58f7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3074_c7_58f7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3074_c7_58f7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3074_c7_58f7_return_output;

     -- l8_MUX[uxn_opcodes_h_l3054_c7_602d] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l3054_c7_602d_cond <= VAR_l8_MUX_uxn_opcodes_h_l3054_c7_602d_cond;
     l8_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue;
     l8_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l3054_c7_602d_return_output := l8_MUX_uxn_opcodes_h_l3054_c7_602d_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l3058_c32_0483] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l3058_c32_0483_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l3058_c32_0483_left;
     BIN_OP_GT_uxn_opcodes_h_l3058_c32_0483_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l3058_c32_0483_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l3058_c32_0483_return_output := BIN_OP_GT_uxn_opcodes_h_l3058_c32_0483_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l3031_c1_a525] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3031_c1_a525_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3031_c1_a525_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3031_c1_a525_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3031_c1_a525_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3031_c1_a525_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3031_c1_a525_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3031_c1_a525_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3031_c1_a525_return_output;

     -- t8_MUX[uxn_opcodes_h_l3040_c7_0877] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l3040_c7_0877_cond <= VAR_t8_MUX_uxn_opcodes_h_l3040_c7_0877_cond;
     t8_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue;
     t8_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l3040_c7_0877_return_output := t8_MUX_uxn_opcodes_h_l3040_c7_0877_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3060_c7_2125] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3060_c7_2125_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3060_c7_2125_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3060_c7_2125_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3060_c7_2125_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3074_c7_58f7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3074_c7_58f7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3074_c7_58f7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3074_c7_58f7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3074_c7_58f7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3074_c7_58f7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3074_c7_58f7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3074_c7_58f7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3074_c7_58f7_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l3058_c32_a7f2_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l3058_c32_0483_return_output;
     VAR_printf_uxn_opcodes_h_l3032_c3_e3c9_uxn_opcodes_h_l3032_c3_e3c9_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l3031_c1_a525_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse := VAR_l8_MUX_uxn_opcodes_h_l3054_c7_602d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3070_c7_9189_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3074_c7_58f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3060_c7_2125_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3054_c7_602d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3070_c7_9189_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3074_c7_58f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3066_c7_e2d7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3070_c7_9189_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3066_c7_e2d7_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3070_c7_9189_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l3040_c7_0877_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3066_c7_e2d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3066_c7_e2d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3066_c7_e2d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3066_c7_e2d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3066_c7_e2d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3066_c7_e2d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3066_c7_e2d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3066_c7_e2d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3066_c7_e2d7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3070_c7_9189] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3070_c7_9189_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3070_c7_9189_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3070_c7_9189_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3070_c7_9189_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3070_c7_9189_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3070_c7_9189_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3070_c7_9189_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3070_c7_9189_return_output;

     -- t8_MUX[uxn_opcodes_h_l3037_c7_89e8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l3037_c7_89e8_cond <= VAR_t8_MUX_uxn_opcodes_h_l3037_c7_89e8_cond;
     t8_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue;
     t8_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output := t8_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3051_c7_7a09] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3051_c7_7a09_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3051_c7_7a09_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output;

     -- l8_MUX[uxn_opcodes_h_l3051_c7_7a09] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l3051_c7_7a09_cond <= VAR_l8_MUX_uxn_opcodes_h_l3051_c7_7a09_cond;
     l8_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue;
     l8_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output := l8_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3054_c7_602d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_602d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_602d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_602d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_602d_return_output;

     -- MUX[uxn_opcodes_h_l3058_c32_a7f2] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l3058_c32_a7f2_cond <= VAR_MUX_uxn_opcodes_h_l3058_c32_a7f2_cond;
     MUX_uxn_opcodes_h_l3058_c32_a7f2_iftrue <= VAR_MUX_uxn_opcodes_h_l3058_c32_a7f2_iftrue;
     MUX_uxn_opcodes_h_l3058_c32_a7f2_iffalse <= VAR_MUX_uxn_opcodes_h_l3058_c32_a7f2_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l3058_c32_a7f2_return_output := MUX_uxn_opcodes_h_l3058_c32_a7f2_return_output;

     -- n8_MUX[uxn_opcodes_h_l3044_c7_64f6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l3044_c7_64f6_cond <= VAR_n8_MUX_uxn_opcodes_h_l3044_c7_64f6_cond;
     n8_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue;
     n8_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output := n8_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3070_c7_9189] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3070_c7_9189_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3070_c7_9189_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3070_c7_9189_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3070_c7_9189_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3070_c7_9189_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3070_c7_9189_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3070_c7_9189_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3070_c7_9189_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3066_c7_e2d7] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3066_c7_e2d7_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3066_c7_e2d7_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3066_c7_e2d7_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3066_c7_e2d7_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3066_c7_e2d7_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3066_c7_e2d7_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3066_c7_e2d7_return_output := result_stack_value_MUX_uxn_opcodes_h_l3066_c7_e2d7_return_output;

     -- printf_uxn_opcodes_h_l3032_c3_e3c9[uxn_opcodes_h_l3032_c3_e3c9] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l3032_c3_e3c9_uxn_opcodes_h_l3032_c3_e3c9_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l3032_c3_e3c9_uxn_opcodes_h_l3032_c3_e3c9_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue := VAR_MUX_uxn_opcodes_h_l3058_c32_a7f2_return_output;
     VAR_l8_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse := VAR_l8_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse := VAR_n8_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3066_c7_e2d7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3070_c7_9189_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3054_c7_602d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3066_c7_e2d7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3070_c7_9189_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3066_c7_e2d7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3066_c7_e2d7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l3066_c7_e2d7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3066_c7_e2d7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3066_c7_e2d7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3066_c7_e2d7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3066_c7_e2d7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3066_c7_e2d7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3066_c7_e2d7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3066_c7_e2d7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3066_c7_e2d7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3060_c7_2125] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3060_c7_2125_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3060_c7_2125_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3060_c7_2125_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3060_c7_2125_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3047_c7_7ebf] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3051_c7_7a09] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output;

     -- l8_MUX[uxn_opcodes_h_l3047_c7_7ebf] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond <= VAR_l8_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond;
     l8_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue;
     l8_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output := l8_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3066_c7_e2d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3066_c7_e2d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3066_c7_e2d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3066_c7_e2d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3066_c7_e2d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3066_c7_e2d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3066_c7_e2d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3066_c7_e2d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3066_c7_e2d7_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3060_c7_2125] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3060_c7_2125_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3060_c7_2125_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3060_c7_2125_return_output := result_stack_value_MUX_uxn_opcodes_h_l3060_c7_2125_return_output;

     -- t8_MUX[uxn_opcodes_h_l3031_c2_23a6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l3031_c2_23a6_cond <= VAR_t8_MUX_uxn_opcodes_h_l3031_c2_23a6_cond;
     t8_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue;
     t8_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output := t8_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3054_c7_602d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3054_c7_602d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3054_c7_602d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3054_c7_602d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3054_c7_602d_return_output;

     -- n8_MUX[uxn_opcodes_h_l3040_c7_0877] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l3040_c7_0877_cond <= VAR_n8_MUX_uxn_opcodes_h_l3040_c7_0877_cond;
     n8_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue;
     n8_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l3040_c7_0877_return_output := n8_MUX_uxn_opcodes_h_l3040_c7_0877_return_output;

     -- Submodule level 4
     VAR_l8_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse := VAR_l8_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l3040_c7_0877_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3066_c7_e2d7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3066_c7_e2d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3054_c7_602d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3060_c7_2125_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3060_c7_2125_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3060_c7_2125] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3060_c7_2125_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3060_c7_2125_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3060_c7_2125_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3060_c7_2125_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3054_c7_602d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_602d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_602d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_602d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_602d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3060_c7_2125] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3060_c7_2125_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3060_c7_2125_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3060_c7_2125_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3060_c7_2125_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3060_c7_2125_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3060_c7_2125_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3047_c7_7ebf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3054_c7_602d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3054_c7_602d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3054_c7_602d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3054_c7_602d_return_output := result_stack_value_MUX_uxn_opcodes_h_l3054_c7_602d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3044_c7_64f6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3044_c7_64f6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3044_c7_64f6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3051_c7_7a09] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output;

     -- l8_MUX[uxn_opcodes_h_l3044_c7_64f6] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l3044_c7_64f6_cond <= VAR_l8_MUX_uxn_opcodes_h_l3044_c7_64f6_cond;
     l8_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue;
     l8_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output := l8_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output;

     -- n8_MUX[uxn_opcodes_h_l3037_c7_89e8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l3037_c7_89e8_cond <= VAR_n8_MUX_uxn_opcodes_h_l3037_c7_89e8_cond;
     n8_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue;
     n8_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output := n8_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output;

     -- Submodule level 5
     VAR_l8_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse := VAR_l8_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse := VAR_n8_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3060_c7_2125_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3060_c7_2125_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3054_c7_602d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3054_c7_602d_return_output;
     -- n8_MUX[uxn_opcodes_h_l3031_c2_23a6] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l3031_c2_23a6_cond <= VAR_n8_MUX_uxn_opcodes_h_l3031_c2_23a6_cond;
     n8_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue;
     n8_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output := n8_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3044_c7_64f6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3054_c7_602d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_602d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_602d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_602d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_602d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3040_c7_0877] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3040_c7_0877_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3040_c7_0877_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3040_c7_0877_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3040_c7_0877_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3051_c7_7a09] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3051_c7_7a09_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3051_c7_7a09_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output;

     -- l8_MUX[uxn_opcodes_h_l3040_c7_0877] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l3040_c7_0877_cond <= VAR_l8_MUX_uxn_opcodes_h_l3040_c7_0877_cond;
     l8_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue;
     l8_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l3040_c7_0877_return_output := l8_MUX_uxn_opcodes_h_l3040_c7_0877_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3051_c7_7a09] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3051_c7_7a09_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3051_c7_7a09_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output := result_stack_value_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3054_c7_602d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_602d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_602d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_602d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_602d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_602d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_602d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3047_c7_7ebf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output;

     -- Submodule level 6
     VAR_l8_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse := VAR_l8_MUX_uxn_opcodes_h_l3040_c7_0877_return_output;
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3054_c7_602d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3040_c7_0877_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3054_c7_602d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l3047_c7_7ebf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output := result_stack_value_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3051_c7_7a09] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3051_c7_7a09_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3051_c7_7a09_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3044_c7_64f6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3037_c7_89e8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3037_c7_89e8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3037_c7_89e8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output;

     -- l8_MUX[uxn_opcodes_h_l3037_c7_89e8] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l3037_c7_89e8_cond <= VAR_l8_MUX_uxn_opcodes_h_l3037_c7_89e8_cond;
     l8_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue;
     l8_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output := l8_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3051_c7_7a09] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3051_c7_7a09_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3051_c7_7a09_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3051_c7_7a09_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3051_c7_7a09_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3040_c7_0877] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3040_c7_0877_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3040_c7_0877_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3040_c7_0877_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3040_c7_0877_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3047_c7_7ebf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output;

     -- Submodule level 7
     VAR_l8_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse := VAR_l8_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3040_c7_0877_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3051_c7_7a09_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l3044_c7_64f6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3044_c7_64f6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3044_c7_64f6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output := result_stack_value_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3040_c7_0877] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3040_c7_0877_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3040_c7_0877_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3040_c7_0877_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3040_c7_0877_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3044_c7_64f6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3044_c7_64f6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3044_c7_64f6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3047_c7_7ebf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3047_c7_7ebf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3047_c7_7ebf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3047_c7_7ebf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3047_c7_7ebf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3037_c7_89e8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output;

     -- l8_MUX[uxn_opcodes_h_l3031_c2_23a6] LATENCY=0
     -- Inputs
     l8_MUX_uxn_opcodes_h_l3031_c2_23a6_cond <= VAR_l8_MUX_uxn_opcodes_h_l3031_c2_23a6_cond;
     l8_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue <= VAR_l8_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue;
     l8_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse <= VAR_l8_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse;
     -- Outputs
     VAR_l8_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output := l8_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l3031_c2_23a6] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l3031_c2_23a6_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3031_c2_23a6_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output;

     -- Submodule level 8
     REG_VAR_l8 := VAR_l8_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3047_c7_7ebf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3040_c7_0877_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3037_c7_89e8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3044_c7_64f6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3044_c7_64f6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3044_c7_64f6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l3031_c2_23a6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3040_c7_0877] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3040_c7_0877_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3040_c7_0877_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3040_c7_0877_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3040_c7_0877_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3040_c7_0877] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3040_c7_0877_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3040_c7_0877_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3040_c7_0877_return_output := result_stack_value_MUX_uxn_opcodes_h_l3040_c7_0877_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3044_c7_64f6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3044_c7_64f6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3044_c7_64f6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3044_c7_64f6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3044_c7_64f6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3044_c7_64f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3040_c7_0877_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3040_c7_0877_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l3031_c2_23a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3037_c7_89e8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3037_c7_89e8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3037_c7_89e8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3040_c7_0877] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3040_c7_0877_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3040_c7_0877_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3040_c7_0877_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3040_c7_0877_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3040_c7_0877] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3040_c7_0877_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3040_c7_0877_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3040_c7_0877_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3040_c7_0877_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3040_c7_0877_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3040_c7_0877_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l3037_c7_89e8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3037_c7_89e8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3037_c7_89e8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output := result_stack_value_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3040_c7_0877_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3040_c7_0877_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l3031_c2_23a6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l3031_c2_23a6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3031_c2_23a6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output := result_stack_value_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l3037_c7_89e8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3037_c7_89e8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3037_c7_89e8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3037_c7_89e8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3037_c7_89e8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3037_c7_89e8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3037_c7_89e8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3037_c7_89e8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l3031_c2_23a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c2_23a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c2_23a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3037_c7_89e8_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l3031_c2_23a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l3031_c2_23a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3031_c2_23a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l3031_c2_23a6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l3031_c2_23a6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3031_c2_23a6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3031_c2_23a6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3031_c2_23a6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output;

     -- Submodule level 12
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l3079_l3027_DUPLICATE_8a86 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l3079_l3027_DUPLICATE_8a86_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l3031_c2_23a6_return_output);

     -- Submodule level 13
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l3079_l3027_DUPLICATE_8a86_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b1f3_uxn_opcodes_h_l3079_l3027_DUPLICATE_8a86_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_l8 <= REG_VAR_l8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     l8 <= REG_COMB_l8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
