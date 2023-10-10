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
-- Submodules: 65
entity gth_0CLK_7c2e709f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth_0CLK_7c2e709f;
architecture arch of gth_0CLK_7c2e709f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2031_c6_b8bd]
signal BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2031_c1_d380]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_d380_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_d380_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_d380_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_d380_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2031_c2_fde0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2031_c2_fde0]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2031_c2_fde0_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2031_c2_fde0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2031_c2_fde0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2031_c2_fde0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2031_c2_fde0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2031_c2_fde0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2031_c2_fde0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2031_c2_fde0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2031_c2_fde0]
signal result_stack_value_MUX_uxn_opcodes_h_l2031_c2_fde0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2031_c2_fde0]
signal t8_MUX_uxn_opcodes_h_l2031_c2_fde0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2031_c2_fde0]
signal n8_MUX_uxn_opcodes_h_l2031_c2_fde0_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2032_c3_9316[uxn_opcodes_h_l2032_c3_9316]
signal printf_uxn_opcodes_h_l2032_c3_9316_uxn_opcodes_h_l2032_c3_9316_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2037_c11_24d8]
signal BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2037_c7_8bd2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2037_c7_8bd2]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2037_c7_8bd2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2037_c7_8bd2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2037_c7_8bd2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2037_c7_8bd2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2037_c7_8bd2]
signal result_stack_value_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2037_c7_8bd2]
signal t8_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2037_c7_8bd2]
signal n8_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2040_c11_6ff3]
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2040_c7_6f12]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2040_c7_6f12]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2040_c7_6f12_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2040_c7_6f12]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2040_c7_6f12]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_6f12_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2040_c7_6f12]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_6f12_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2040_c7_6f12]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_6f12_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2040_c7_6f12]
signal result_stack_value_MUX_uxn_opcodes_h_l2040_c7_6f12_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2040_c7_6f12]
signal t8_MUX_uxn_opcodes_h_l2040_c7_6f12_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2040_c7_6f12]
signal n8_MUX_uxn_opcodes_h_l2040_c7_6f12_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2044_c11_9d74]
signal BIN_OP_EQ_uxn_opcodes_h_l2044_c11_9d74_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2044_c11_9d74_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2044_c11_9d74_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2044_c7_2b4d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2044_c7_2b4d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2044_c7_2b4d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2044_c7_2b4d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2044_c7_2b4d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2044_c7_2b4d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2044_c7_2b4d]
signal result_stack_value_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2044_c7_2b4d]
signal n8_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2047_c11_89f9]
signal BIN_OP_EQ_uxn_opcodes_h_l2047_c11_89f9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2047_c11_89f9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2047_c11_89f9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2047_c7_5c4c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l2047_c7_5c4c]
signal result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2047_c7_5c4c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2047_c7_5c4c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2047_c7_5c4c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2047_c7_5c4c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2047_c7_5c4c]
signal result_stack_value_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l2047_c7_5c4c]
signal n8_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2051_c32_493b]
signal BIN_OP_AND_uxn_opcodes_h_l2051_c32_493b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2051_c32_493b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2051_c32_493b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2051_c32_4a43]
signal BIN_OP_GT_uxn_opcodes_h_l2051_c32_4a43_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2051_c32_4a43_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2051_c32_4a43_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2051_c32_a8f5]
signal MUX_uxn_opcodes_h_l2051_c32_a8f5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2051_c32_a8f5_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2051_c32_a8f5_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2051_c32_a8f5_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2053_c11_6813]
signal BIN_OP_EQ_uxn_opcodes_h_l2053_c11_6813_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2053_c11_6813_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2053_c11_6813_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2053_c7_82ab]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_82ab_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2053_c7_82ab]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_82ab_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2053_c7_82ab]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_82ab_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2053_c7_82ab]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_82ab_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2053_c7_82ab]
signal result_stack_value_MUX_uxn_opcodes_h_l2053_c7_82ab_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2057_c24_61bf]
signal BIN_OP_GT_uxn_opcodes_h_l2057_c24_61bf_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2057_c24_61bf_right : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2057_c24_61bf_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2057_c24_811b]
signal MUX_uxn_opcodes_h_l2057_c24_811b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2057_c24_811b_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2057_c24_811b_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2057_c24_811b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2059_c11_61f4]
signal BIN_OP_EQ_uxn_opcodes_h_l2059_c11_61f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2059_c11_61f4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2059_c11_61f4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2059_c7_19cd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_19cd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_19cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_19cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_19cd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2059_c7_19cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_19cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_19cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_19cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_19cd_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_1ade( ref_toks_0 : opcode_result_t;
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
      base.is_stack_read := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd
BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd_left,
BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd_right,
BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_d380
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_d380 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_d380_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_d380_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_d380_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_d380_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2031_c2_fde0
result_is_sp_shift_MUX_uxn_opcodes_h_l2031_c2_fde0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2031_c2_fde0
result_is_stack_read_MUX_uxn_opcodes_h_l2031_c2_fde0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2031_c2_fde0_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2031_c2_fde0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2031_c2_fde0 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2031_c2_fde0
result_is_stack_write_MUX_uxn_opcodes_h_l2031_c2_fde0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2031_c2_fde0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2031_c2_fde0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2031_c2_fde0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2031_c2_fde0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2031_c2_fde0
result_is_opc_done_MUX_uxn_opcodes_h_l2031_c2_fde0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2031_c2_fde0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2031_c2_fde0
result_stack_value_MUX_uxn_opcodes_h_l2031_c2_fde0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2031_c2_fde0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output);

-- t8_MUX_uxn_opcodes_h_l2031_c2_fde0
t8_MUX_uxn_opcodes_h_l2031_c2_fde0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2031_c2_fde0_cond,
t8_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue,
t8_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse,
t8_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output);

-- n8_MUX_uxn_opcodes_h_l2031_c2_fde0
n8_MUX_uxn_opcodes_h_l2031_c2_fde0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2031_c2_fde0_cond,
n8_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue,
n8_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse,
n8_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output);

-- printf_uxn_opcodes_h_l2032_c3_9316_uxn_opcodes_h_l2032_c3_9316
printf_uxn_opcodes_h_l2032_c3_9316_uxn_opcodes_h_l2032_c3_9316 : entity work.printf_uxn_opcodes_h_l2032_c3_9316_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2032_c3_9316_uxn_opcodes_h_l2032_c3_9316_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8_left,
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8_right,
BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2
result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2037_c7_8bd2
result_is_stack_read_MUX_uxn_opcodes_h_l2037_c7_8bd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_8bd2
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_8bd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_8bd2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_8bd2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_8bd2
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_8bd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2037_c7_8bd2
result_stack_value_MUX_uxn_opcodes_h_l2037_c7_8bd2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output);

-- t8_MUX_uxn_opcodes_h_l2037_c7_8bd2
t8_MUX_uxn_opcodes_h_l2037_c7_8bd2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond,
t8_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue,
t8_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse,
t8_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output);

-- n8_MUX_uxn_opcodes_h_l2037_c7_8bd2
n8_MUX_uxn_opcodes_h_l2037_c7_8bd2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond,
n8_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue,
n8_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse,
n8_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3_left,
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3_right,
BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_6f12
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_6f12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2040_c7_6f12
result_is_stack_read_MUX_uxn_opcodes_h_l2040_c7_6f12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2040_c7_6f12_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_6f12
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_6f12 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_6f12
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_6f12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_6f12_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_6f12
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_6f12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_6f12_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_6f12
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_6f12 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_6f12_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2040_c7_6f12
result_stack_value_MUX_uxn_opcodes_h_l2040_c7_6f12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2040_c7_6f12_cond,
result_stack_value_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output);

-- t8_MUX_uxn_opcodes_h_l2040_c7_6f12
t8_MUX_uxn_opcodes_h_l2040_c7_6f12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2040_c7_6f12_cond,
t8_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue,
t8_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse,
t8_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output);

-- n8_MUX_uxn_opcodes_h_l2040_c7_6f12
n8_MUX_uxn_opcodes_h_l2040_c7_6f12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2040_c7_6f12_cond,
n8_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue,
n8_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse,
n8_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2044_c11_9d74
BIN_OP_EQ_uxn_opcodes_h_l2044_c11_9d74 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2044_c11_9d74_left,
BIN_OP_EQ_uxn_opcodes_h_l2044_c11_9d74_right,
BIN_OP_EQ_uxn_opcodes_h_l2044_c11_9d74_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d
result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_2b4d
result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_2b4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_2b4d
result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_2b4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_2b4d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_2b4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_2b4d
result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_2b4d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2044_c7_2b4d
result_stack_value_MUX_uxn_opcodes_h_l2044_c7_2b4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output);

-- n8_MUX_uxn_opcodes_h_l2044_c7_2b4d
n8_MUX_uxn_opcodes_h_l2044_c7_2b4d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond,
n8_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue,
n8_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse,
n8_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2047_c11_89f9
BIN_OP_EQ_uxn_opcodes_h_l2047_c11_89f9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2047_c11_89f9_left,
BIN_OP_EQ_uxn_opcodes_h_l2047_c11_89f9_right,
BIN_OP_EQ_uxn_opcodes_h_l2047_c11_89f9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c
result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_5c4c
result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_5c4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_5c4c
result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_5c4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_5c4c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_5c4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_5c4c
result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_5c4c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2047_c7_5c4c
result_stack_value_MUX_uxn_opcodes_h_l2047_c7_5c4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output);

-- n8_MUX_uxn_opcodes_h_l2047_c7_5c4c
n8_MUX_uxn_opcodes_h_l2047_c7_5c4c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond,
n8_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue,
n8_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse,
n8_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2051_c32_493b
BIN_OP_AND_uxn_opcodes_h_l2051_c32_493b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2051_c32_493b_left,
BIN_OP_AND_uxn_opcodes_h_l2051_c32_493b_right,
BIN_OP_AND_uxn_opcodes_h_l2051_c32_493b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2051_c32_4a43
BIN_OP_GT_uxn_opcodes_h_l2051_c32_4a43 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2051_c32_4a43_left,
BIN_OP_GT_uxn_opcodes_h_l2051_c32_4a43_right,
BIN_OP_GT_uxn_opcodes_h_l2051_c32_4a43_return_output);

-- MUX_uxn_opcodes_h_l2051_c32_a8f5
MUX_uxn_opcodes_h_l2051_c32_a8f5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2051_c32_a8f5_cond,
MUX_uxn_opcodes_h_l2051_c32_a8f5_iftrue,
MUX_uxn_opcodes_h_l2051_c32_a8f5_iffalse,
MUX_uxn_opcodes_h_l2051_c32_a8f5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2053_c11_6813
BIN_OP_EQ_uxn_opcodes_h_l2053_c11_6813 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2053_c11_6813_left,
BIN_OP_EQ_uxn_opcodes_h_l2053_c11_6813_right,
BIN_OP_EQ_uxn_opcodes_h_l2053_c11_6813_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_82ab
result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_82ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_82ab_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_82ab
result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_82ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_82ab_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_82ab
result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_82ab : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_82ab_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_82ab
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_82ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_82ab_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2053_c7_82ab
result_stack_value_MUX_uxn_opcodes_h_l2053_c7_82ab : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2053_c7_82ab_cond,
result_stack_value_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2057_c24_61bf
BIN_OP_GT_uxn_opcodes_h_l2057_c24_61bf : entity work.BIN_OP_GT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2057_c24_61bf_left,
BIN_OP_GT_uxn_opcodes_h_l2057_c24_61bf_right,
BIN_OP_GT_uxn_opcodes_h_l2057_c24_61bf_return_output);

-- MUX_uxn_opcodes_h_l2057_c24_811b
MUX_uxn_opcodes_h_l2057_c24_811b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2057_c24_811b_cond,
MUX_uxn_opcodes_h_l2057_c24_811b_iftrue,
MUX_uxn_opcodes_h_l2057_c24_811b_iffalse,
MUX_uxn_opcodes_h_l2057_c24_811b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2059_c11_61f4
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_61f4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_61f4_left,
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_61f4_right,
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_61f4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_19cd
result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_19cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_19cd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_19cd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_19cd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_19cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_19cd
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_19cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_19cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_19cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_19cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_19cd_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_d380_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output,
 t8_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output,
 n8_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output,
 t8_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output,
 n8_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output,
 t8_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output,
 n8_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2044_c11_9d74_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output,
 n8_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2047_c11_89f9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output,
 n8_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2051_c32_493b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2051_c32_4a43_return_output,
 MUX_uxn_opcodes_h_l2051_c32_a8f5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2053_c11_6813_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2057_c24_61bf_return_output,
 MUX_uxn_opcodes_h_l2057_c24_811b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2059_c11_61f4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_19cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_19cd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_d380_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_d380_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_d380_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_d380_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2031_c2_fde0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2031_c2_fde0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2034_c3_b202 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2031_c2_fde0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2031_c2_fde0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2031_c2_fde0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2031_c2_fde0_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2031_c2_fde0_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2032_c3_9316_uxn_opcodes_h_l2032_c3_9316_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_f5bd : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2040_c7_6f12_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_6f12_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2042_c3_8bc8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_6f12_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_6f12_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2040_c7_6f12_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2040_c7_6f12_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2040_c7_6f12_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_9d74_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_9d74_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_9d74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2045_c3_76be : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_89f9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_89f9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_89f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2051_c32_a8f5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2051_c32_a8f5_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2051_c32_a8f5_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2051_c32_493b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2051_c32_493b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2051_c32_493b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2051_c32_4a43_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2051_c32_4a43_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2051_c32_4a43_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2051_c32_a8f5_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_6813_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_6813_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_6813_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_82ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_19cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_82ab_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_19cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_82ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2056_c3_f9cb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_82ab_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2053_c7_82ab_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2057_c24_811b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2057_c24_811b_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2057_c24_811b_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2057_c24_61bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2057_c24_61bf_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2057_c24_61bf_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2057_c24_811b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_61f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_61f4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_61f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_19cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_19cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_19cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_19cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_19cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_19cd_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2031_l2053_l2044_l2040_l2037_DUPLICATE_49a6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2031_l2047_l2044_l2040_l2037_DUPLICATE_12f1_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2031_l2059_l2047_l2044_l2040_l2037_DUPLICATE_7a0e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2031_l2053_l2047_l2044_l2040_l2037_DUPLICATE_306a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2047_l2040_l2044_l2037_DUPLICATE_b12f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2059_l2053_l2047_l2044_l2040_l2037_DUPLICATE_ee46_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2047_l2053_DUPLICATE_5e53_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2064_l2027_DUPLICATE_4f55_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2057_c24_811b_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_61f4_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_19cd_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2034_c3_b202 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2034_c3_b202;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_9d74_right := to_unsigned(3, 2);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_89f9_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_d380_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_f5bd := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2038_c3_f5bd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2056_c3_f9cb := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2056_c3_f9cb;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2057_c24_811b_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2045_c3_76be := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2045_c3_76be;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2051_c32_a8f5_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2051_c32_4a43_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2051_c32_a8f5_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3_right := to_unsigned(2, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2051_c32_493b_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_6813_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_19cd_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2042_c3_8bc8 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2042_c3_8bc8;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_d380_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2051_c32_493b_left := VAR_ins;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2057_c24_61bf_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_9d74_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_89f9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_6813_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_61f4_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2057_c24_61bf_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2059_l2053_l2047_l2044_l2040_l2037_DUPLICATE_ee46 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2059_l2053_l2047_l2044_l2040_l2037_DUPLICATE_ee46_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2053_c11_6813] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2053_c11_6813_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_6813_left;
     BIN_OP_EQ_uxn_opcodes_h_l2053_c11_6813_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_6813_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_6813_return_output := BIN_OP_EQ_uxn_opcodes_h_l2053_c11_6813_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2047_c11_89f9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2047_c11_89f9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_89f9_left;
     BIN_OP_EQ_uxn_opcodes_h_l2047_c11_89f9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_89f9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_89f9_return_output := BIN_OP_EQ_uxn_opcodes_h_l2047_c11_89f9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2031_c6_b8bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2040_c11_6ff3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2031_l2047_l2044_l2040_l2037_DUPLICATE_12f1 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2031_l2047_l2044_l2040_l2037_DUPLICATE_12f1_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2044_c11_9d74] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2044_c11_9d74_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_9d74_left;
     BIN_OP_EQ_uxn_opcodes_h_l2044_c11_9d74_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_9d74_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_9d74_return_output := BIN_OP_EQ_uxn_opcodes_h_l2044_c11_9d74_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2037_c11_24d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2057_c24_61bf] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2057_c24_61bf_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2057_c24_61bf_left;
     BIN_OP_GT_uxn_opcodes_h_l2057_c24_61bf_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2057_c24_61bf_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2057_c24_61bf_return_output := BIN_OP_GT_uxn_opcodes_h_l2057_c24_61bf_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2031_l2053_l2047_l2044_l2040_l2037_DUPLICATE_306a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2031_l2053_l2047_l2044_l2040_l2037_DUPLICATE_306a_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2031_l2053_l2044_l2040_l2037_DUPLICATE_49a6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2031_l2053_l2044_l2040_l2037_DUPLICATE_49a6_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2059_c11_61f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2059_c11_61f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_61f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2059_c11_61f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_61f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_61f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2059_c11_61f4_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2051_c32_493b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2051_c32_493b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2051_c32_493b_left;
     BIN_OP_AND_uxn_opcodes_h_l2051_c32_493b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2051_c32_493b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2051_c32_493b_return_output := BIN_OP_AND_uxn_opcodes_h_l2051_c32_493b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2047_l2053_DUPLICATE_5e53 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2047_l2053_DUPLICATE_5e53_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2047_l2040_l2044_l2037_DUPLICATE_b12f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2047_l2040_l2044_l2037_DUPLICATE_b12f_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2031_l2059_l2047_l2044_l2040_l2037_DUPLICATE_7a0e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2031_l2059_l2047_l2044_l2040_l2037_DUPLICATE_7a0e_return_output := result.is_stack_write;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2051_c32_4a43_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2051_c32_493b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_d380_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2031_c2_fde0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2031_c2_fde0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2031_c2_fde0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2031_c2_fde0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2031_c2_fde0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2031_c2_fde0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2031_c2_fde0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2031_c6_b8bd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2037_c11_24d8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2040_c7_6f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_6f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2040_c7_6f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_6f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_6f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2040_c7_6f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2040_c7_6f12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2040_c11_6ff3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_9d74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_9d74_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_9d74_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_9d74_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_9d74_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_9d74_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_9d74_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2044_c11_9d74_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_89f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_89f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_89f9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_89f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_89f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_89f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_89f9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c11_89f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_82ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_6813_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_82ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_6813_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_82ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_6813_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_82ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_6813_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2053_c7_82ab_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2053_c11_6813_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_19cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_61f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_19cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_61f4_return_output;
     VAR_MUX_uxn_opcodes_h_l2057_c24_811b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2057_c24_61bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2031_l2047_l2044_l2040_l2037_DUPLICATE_12f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2031_l2047_l2044_l2040_l2037_DUPLICATE_12f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2031_l2047_l2044_l2040_l2037_DUPLICATE_12f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2031_l2047_l2044_l2040_l2037_DUPLICATE_12f1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2031_l2047_l2044_l2040_l2037_DUPLICATE_12f1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2059_l2053_l2047_l2044_l2040_l2037_DUPLICATE_ee46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2059_l2053_l2047_l2044_l2040_l2037_DUPLICATE_ee46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2059_l2053_l2047_l2044_l2040_l2037_DUPLICATE_ee46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2059_l2053_l2047_l2044_l2040_l2037_DUPLICATE_ee46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2059_l2053_l2047_l2044_l2040_l2037_DUPLICATE_ee46_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_19cd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2059_l2053_l2047_l2044_l2040_l2037_DUPLICATE_ee46_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2031_l2053_l2044_l2040_l2037_DUPLICATE_49a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2031_l2053_l2044_l2040_l2037_DUPLICATE_49a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2031_l2053_l2044_l2040_l2037_DUPLICATE_49a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2031_l2053_l2044_l2040_l2037_DUPLICATE_49a6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2031_l2053_l2044_l2040_l2037_DUPLICATE_49a6_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2047_l2040_l2044_l2037_DUPLICATE_b12f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2047_l2040_l2044_l2037_DUPLICATE_b12f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2047_l2040_l2044_l2037_DUPLICATE_b12f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l2047_l2040_l2044_l2037_DUPLICATE_b12f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2031_l2059_l2047_l2044_l2040_l2037_DUPLICATE_7a0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2031_l2059_l2047_l2044_l2040_l2037_DUPLICATE_7a0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2031_l2059_l2047_l2044_l2040_l2037_DUPLICATE_7a0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2031_l2059_l2047_l2044_l2040_l2037_DUPLICATE_7a0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2031_l2059_l2047_l2044_l2040_l2037_DUPLICATE_7a0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_19cd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2031_l2059_l2047_l2044_l2040_l2037_DUPLICATE_7a0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2047_l2053_DUPLICATE_5e53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2047_l2053_DUPLICATE_5e53_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2031_l2053_l2047_l2044_l2040_l2037_DUPLICATE_306a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2031_l2053_l2047_l2044_l2040_l2037_DUPLICATE_306a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2031_l2053_l2047_l2044_l2040_l2037_DUPLICATE_306a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2031_l2053_l2047_l2044_l2040_l2037_DUPLICATE_306a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2031_l2053_l2047_l2044_l2040_l2037_DUPLICATE_306a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2031_l2053_l2047_l2044_l2040_l2037_DUPLICATE_306a_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2031_c1_d380] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_d380_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_d380_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_d380_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_d380_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_d380_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_d380_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_d380_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_d380_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2047_c7_5c4c] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2059_c7_19cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_19cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_19cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_19cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_19cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_19cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_19cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_19cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_19cd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2053_c7_82ab] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_82ab_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_82ab_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2053_c7_82ab] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_82ab_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_82ab_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output;

     -- t8_MUX[uxn_opcodes_h_l2040_c7_6f12] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2040_c7_6f12_cond <= VAR_t8_MUX_uxn_opcodes_h_l2040_c7_6f12_cond;
     t8_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue;
     t8_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output := t8_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output;

     -- MUX[uxn_opcodes_h_l2057_c24_811b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2057_c24_811b_cond <= VAR_MUX_uxn_opcodes_h_l2057_c24_811b_cond;
     MUX_uxn_opcodes_h_l2057_c24_811b_iftrue <= VAR_MUX_uxn_opcodes_h_l2057_c24_811b_iftrue;
     MUX_uxn_opcodes_h_l2057_c24_811b_iffalse <= VAR_MUX_uxn_opcodes_h_l2057_c24_811b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2057_c24_811b_return_output := MUX_uxn_opcodes_h_l2057_c24_811b_return_output;

     -- n8_MUX[uxn_opcodes_h_l2047_c7_5c4c] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond <= VAR_n8_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond;
     n8_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue;
     n8_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output := n8_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2059_c7_19cd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_19cd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_19cd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_19cd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_19cd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_19cd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_19cd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_19cd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_19cd_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2051_c32_4a43] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2051_c32_4a43_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2051_c32_4a43_left;
     BIN_OP_GT_uxn_opcodes_h_l2051_c32_4a43_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2051_c32_4a43_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2051_c32_4a43_return_output := BIN_OP_GT_uxn_opcodes_h_l2051_c32_4a43_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2051_c32_a8f5_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2051_c32_4a43_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue := VAR_MUX_uxn_opcodes_h_l2057_c24_811b_return_output;
     VAR_printf_uxn_opcodes_h_l2032_c3_9316_uxn_opcodes_h_l2032_c3_9316_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2031_c1_d380_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_19cd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_19cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2053_c7_82ab] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_82ab_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_82ab_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2047_c7_5c4c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output;

     -- n8_MUX[uxn_opcodes_h_l2044_c7_2b4d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond <= VAR_n8_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond;
     n8_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue;
     n8_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output := n8_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2047_c7_5c4c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output;

     -- printf_uxn_opcodes_h_l2032_c3_9316[uxn_opcodes_h_l2032_c3_9316] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2032_c3_9316_uxn_opcodes_h_l2032_c3_9316_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2032_c3_9316_uxn_opcodes_h_l2032_c3_9316_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l2037_c7_8bd2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond <= VAR_t8_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond;
     t8_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue;
     t8_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output := t8_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2044_c7_2b4d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2053_c7_82ab] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2053_c7_82ab_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2053_c7_82ab_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output := result_stack_value_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2053_c7_82ab] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_82ab_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_82ab_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_82ab_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_82ab_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output;

     -- MUX[uxn_opcodes_h_l2051_c32_a8f5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2051_c32_a8f5_cond <= VAR_MUX_uxn_opcodes_h_l2051_c32_a8f5_cond;
     MUX_uxn_opcodes_h_l2051_c32_a8f5_iftrue <= VAR_MUX_uxn_opcodes_h_l2051_c32_a8f5_iftrue;
     MUX_uxn_opcodes_h_l2051_c32_a8f5_iffalse <= VAR_MUX_uxn_opcodes_h_l2051_c32_a8f5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2051_c32_a8f5_return_output := MUX_uxn_opcodes_h_l2051_c32_a8f5_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue := VAR_MUX_uxn_opcodes_h_l2051_c32_a8f5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2053_c7_82ab_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2047_c7_5c4c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2040_c7_6f12] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2040_c7_6f12_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2040_c7_6f12_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output;

     -- t8_MUX[uxn_opcodes_h_l2031_c2_fde0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2031_c2_fde0_cond <= VAR_t8_MUX_uxn_opcodes_h_l2031_c2_fde0_cond;
     t8_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue;
     t8_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output := t8_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2047_c7_5c4c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output;

     -- n8_MUX[uxn_opcodes_h_l2040_c7_6f12] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2040_c7_6f12_cond <= VAR_n8_MUX_uxn_opcodes_h_l2040_c7_6f12_cond;
     n8_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue;
     n8_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output := n8_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2044_c7_2b4d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2044_c7_2b4d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2047_c7_5c4c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2047_c7_5c4c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_5c4c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_5c4c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_5c4c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c7_5c4c_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2044_c7_2b4d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2037_c7_8bd2] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2044_c7_2b4d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2044_c7_2b4d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2040_c7_6f12] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2040_c7_6f12] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_6f12_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_6f12_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output;

     -- n8_MUX[uxn_opcodes_h_l2037_c7_8bd2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond <= VAR_n8_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond;
     n8_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue;
     n8_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output := n8_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2044_c7_2b4d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_2b4d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_2b4d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_2b4d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2044_c7_2b4d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2040_c7_6f12] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2037_c7_8bd2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2040_c7_6f12] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_6f12_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_6f12_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l2031_c2_fde0] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l2031_c2_fde0_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2031_c2_fde0_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2040_c7_6f12] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_6f12_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_6f12_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output;

     -- n8_MUX[uxn_opcodes_h_l2031_c2_fde0] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2031_c2_fde0_cond <= VAR_n8_MUX_uxn_opcodes_h_l2031_c2_fde0_cond;
     n8_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue;
     n8_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output := n8_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2040_c7_6f12] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2040_c7_6f12_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2040_c7_6f12_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2040_c7_6f12_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2040_c7_6f12_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output := result_stack_value_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2037_c7_8bd2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2040_c7_6f12_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2031_c2_fde0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2031_c2_fde0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2031_c2_fde0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2037_c7_8bd2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2037_c7_8bd2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2037_c7_8bd2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2037_c7_8bd2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2037_c7_8bd2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2037_c7_8bd2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2037_c7_8bd2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2031_c2_fde0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2037_c7_8bd2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2031_c2_fde0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2031_c2_fde0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2031_c2_fde0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2031_c2_fde0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2031_c2_fde0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2031_c2_fde0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2031_c2_fde0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2031_c2_fde0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2031_c2_fde0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2031_c2_fde0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2064_l2027_DUPLICATE_4f55 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2064_l2027_DUPLICATE_4f55_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1ade(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2031_c2_fde0_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2064_l2027_DUPLICATE_4f55_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1ade_uxn_opcodes_h_l2064_l2027_DUPLICATE_4f55_return_output;
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
