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
-- BIN_OP_EQ[uxn_opcodes_h_l2047_c6_94b1]
signal BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2047_c1_3b3c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_3b3c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_3b3c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_3b3c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_3b3c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2047_c2_71c2]
signal n8_MUX_uxn_opcodes_h_l2047_c2_71c2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2047_c2_71c2]
signal t8_MUX_uxn_opcodes_h_l2047_c2_71c2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2047_c2_71c2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_71c2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2047_c2_71c2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2047_c2_71c2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_71c2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2047_c2_71c2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2047_c2_71c2]
signal result_stack_value_MUX_uxn_opcodes_h_l2047_c2_71c2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2047_c2_71c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_71c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2048_c3_9906[uxn_opcodes_h_l2048_c3_9906]
signal printf_uxn_opcodes_h_l2048_c3_9906_uxn_opcodes_h_l2048_c3_9906_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2052_c11_0c8c]
signal BIN_OP_EQ_uxn_opcodes_h_l2052_c11_0c8c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2052_c11_0c8c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2052_c11_0c8c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2052_c7_9299]
signal n8_MUX_uxn_opcodes_h_l2052_c7_9299_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2052_c7_9299_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2052_c7_9299]
signal t8_MUX_uxn_opcodes_h_l2052_c7_9299_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2052_c7_9299_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2052_c7_9299]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_9299_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_9299_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2052_c7_9299]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_9299_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_9299_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2052_c7_9299]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_9299_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_9299_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2052_c7_9299]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_9299_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_9299_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2052_c7_9299]
signal result_stack_value_MUX_uxn_opcodes_h_l2052_c7_9299_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2052_c7_9299_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2052_c7_9299]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_9299_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_9299_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2055_c11_c319]
signal BIN_OP_EQ_uxn_opcodes_h_l2055_c11_c319_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2055_c11_c319_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2055_c11_c319_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2055_c7_fbcf]
signal n8_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2055_c7_fbcf]
signal t8_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2055_c7_fbcf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2055_c7_fbcf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2055_c7_fbcf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2055_c7_fbcf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2055_c7_fbcf]
signal result_stack_value_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2055_c7_fbcf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2059_c11_0289]
signal BIN_OP_EQ_uxn_opcodes_h_l2059_c11_0289_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2059_c11_0289_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2059_c11_0289_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2059_c7_065f]
signal n8_MUX_uxn_opcodes_h_l2059_c7_065f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2059_c7_065f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2059_c7_065f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_065f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_065f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2059_c7_065f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_065f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_065f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2059_c7_065f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_065f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_065f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2059_c7_065f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_065f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_065f_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2059_c7_065f]
signal result_stack_value_MUX_uxn_opcodes_h_l2059_c7_065f_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2059_c7_065f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2059_c7_065f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_065f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_065f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2062_c11_db65]
signal BIN_OP_EQ_uxn_opcodes_h_l2062_c11_db65_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2062_c11_db65_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2062_c11_db65_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2062_c7_bb68]
signal n8_MUX_uxn_opcodes_h_l2062_c7_bb68_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2062_c7_bb68]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_bb68_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2062_c7_bb68]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2062_c7_bb68]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_bb68_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2062_c7_bb68]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2062_c7_bb68]
signal result_stack_value_MUX_uxn_opcodes_h_l2062_c7_bb68_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2062_c7_bb68]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_bb68_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2065_c32_8f08]
signal BIN_OP_AND_uxn_opcodes_h_l2065_c32_8f08_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2065_c32_8f08_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2065_c32_8f08_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2065_c32_f8c1]
signal BIN_OP_GT_uxn_opcodes_h_l2065_c32_f8c1_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2065_c32_f8c1_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2065_c32_f8c1_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2065_c32_9d60]
signal MUX_uxn_opcodes_h_l2065_c32_9d60_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2065_c32_9d60_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2065_c32_9d60_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2065_c32_9d60_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2067_c11_2f71]
signal BIN_OP_EQ_uxn_opcodes_h_l2067_c11_2f71_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2067_c11_2f71_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2067_c11_2f71_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2067_c7_d16e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d16e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2067_c7_d16e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_d16e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2067_c7_d16e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d16e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2067_c7_d16e]
signal result_stack_value_MUX_uxn_opcodes_h_l2067_c7_d16e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2067_c7_d16e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d16e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l2071_c24_ec11]
signal BIN_OP_LT_uxn_opcodes_h_l2071_c24_ec11_left : unsigned(7 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2071_c24_ec11_right : unsigned(7 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l2071_c24_ec11_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2071_c24_491b]
signal MUX_uxn_opcodes_h_l2071_c24_491b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2071_c24_491b_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2071_c24_491b_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l2071_c24_491b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2073_c11_984d]
signal BIN_OP_EQ_uxn_opcodes_h_l2073_c11_984d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2073_c11_984d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2073_c11_984d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2073_c7_5ac7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_5ac7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_5ac7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_5ac7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_5ac7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2073_c7_5ac7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_5ac7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_5ac7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_5ac7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_5ac7_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1
BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1_left,
BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1_right,
BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_3b3c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_3b3c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_3b3c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_3b3c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_3b3c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_3b3c_return_output);

-- n8_MUX_uxn_opcodes_h_l2047_c2_71c2
n8_MUX_uxn_opcodes_h_l2047_c2_71c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2047_c2_71c2_cond,
n8_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue,
n8_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse,
n8_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output);

-- t8_MUX_uxn_opcodes_h_l2047_c2_71c2
t8_MUX_uxn_opcodes_h_l2047_c2_71c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2047_c2_71c2_cond,
t8_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue,
t8_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse,
t8_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_71c2
result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_71c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_71c2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_71c2
result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_71c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_71c2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_71c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_71c2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_71c2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_71c2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2047_c2_71c2
result_stack_value_MUX_uxn_opcodes_h_l2047_c2_71c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2047_c2_71c2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_71c2
result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_71c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_71c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output);

-- printf_uxn_opcodes_h_l2048_c3_9906_uxn_opcodes_h_l2048_c3_9906
printf_uxn_opcodes_h_l2048_c3_9906_uxn_opcodes_h_l2048_c3_9906 : entity work.printf_uxn_opcodes_h_l2048_c3_9906_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2048_c3_9906_uxn_opcodes_h_l2048_c3_9906_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2052_c11_0c8c
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_0c8c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_0c8c_left,
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_0c8c_right,
BIN_OP_EQ_uxn_opcodes_h_l2052_c11_0c8c_return_output);

-- n8_MUX_uxn_opcodes_h_l2052_c7_9299
n8_MUX_uxn_opcodes_h_l2052_c7_9299 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2052_c7_9299_cond,
n8_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue,
n8_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse,
n8_MUX_uxn_opcodes_h_l2052_c7_9299_return_output);

-- t8_MUX_uxn_opcodes_h_l2052_c7_9299
t8_MUX_uxn_opcodes_h_l2052_c7_9299 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2052_c7_9299_cond,
t8_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue,
t8_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse,
t8_MUX_uxn_opcodes_h_l2052_c7_9299_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_9299
result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_9299 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_9299_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_9299_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_9299
result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_9299 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_9299_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_9299_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_9299
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_9299 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_9299_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_9299_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_9299
result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_9299 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_9299_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_9299_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2052_c7_9299
result_stack_value_MUX_uxn_opcodes_h_l2052_c7_9299 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2052_c7_9299_cond,
result_stack_value_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2052_c7_9299_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_9299
result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_9299 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_9299_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_9299_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2055_c11_c319
BIN_OP_EQ_uxn_opcodes_h_l2055_c11_c319 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2055_c11_c319_left,
BIN_OP_EQ_uxn_opcodes_h_l2055_c11_c319_right,
BIN_OP_EQ_uxn_opcodes_h_l2055_c11_c319_return_output);

-- n8_MUX_uxn_opcodes_h_l2055_c7_fbcf
n8_MUX_uxn_opcodes_h_l2055_c7_fbcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond,
n8_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue,
n8_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse,
n8_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output);

-- t8_MUX_uxn_opcodes_h_l2055_c7_fbcf
t8_MUX_uxn_opcodes_h_l2055_c7_fbcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond,
t8_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue,
t8_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse,
t8_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_fbcf
result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_fbcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf
result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_fbcf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_fbcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf
result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2055_c7_fbcf
result_stack_value_MUX_uxn_opcodes_h_l2055_c7_fbcf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond,
result_stack_value_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_fbcf
result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_fbcf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2059_c11_0289
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_0289 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_0289_left,
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_0289_right,
BIN_OP_EQ_uxn_opcodes_h_l2059_c11_0289_return_output);

-- n8_MUX_uxn_opcodes_h_l2059_c7_065f
n8_MUX_uxn_opcodes_h_l2059_c7_065f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2059_c7_065f_cond,
n8_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue,
n8_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse,
n8_MUX_uxn_opcodes_h_l2059_c7_065f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_065f
result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_065f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_065f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_065f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_065f
result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_065f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_065f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_065f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_065f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_065f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_065f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_065f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_065f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_065f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_065f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_065f_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2059_c7_065f
result_stack_value_MUX_uxn_opcodes_h_l2059_c7_065f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2059_c7_065f_cond,
result_stack_value_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2059_c7_065f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_065f
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_065f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_065f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_065f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2062_c11_db65
BIN_OP_EQ_uxn_opcodes_h_l2062_c11_db65 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2062_c11_db65_left,
BIN_OP_EQ_uxn_opcodes_h_l2062_c11_db65_right,
BIN_OP_EQ_uxn_opcodes_h_l2062_c11_db65_return_output);

-- n8_MUX_uxn_opcodes_h_l2062_c7_bb68
n8_MUX_uxn_opcodes_h_l2062_c7_bb68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2062_c7_bb68_cond,
n8_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue,
n8_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse,
n8_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_bb68
result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_bb68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_bb68_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_bb68
result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_bb68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_bb68
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_bb68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_bb68_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_bb68
result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_bb68 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2062_c7_bb68
result_stack_value_MUX_uxn_opcodes_h_l2062_c7_bb68 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2062_c7_bb68_cond,
result_stack_value_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_bb68
result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_bb68 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_bb68_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2065_c32_8f08
BIN_OP_AND_uxn_opcodes_h_l2065_c32_8f08 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2065_c32_8f08_left,
BIN_OP_AND_uxn_opcodes_h_l2065_c32_8f08_right,
BIN_OP_AND_uxn_opcodes_h_l2065_c32_8f08_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2065_c32_f8c1
BIN_OP_GT_uxn_opcodes_h_l2065_c32_f8c1 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2065_c32_f8c1_left,
BIN_OP_GT_uxn_opcodes_h_l2065_c32_f8c1_right,
BIN_OP_GT_uxn_opcodes_h_l2065_c32_f8c1_return_output);

-- MUX_uxn_opcodes_h_l2065_c32_9d60
MUX_uxn_opcodes_h_l2065_c32_9d60 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2065_c32_9d60_cond,
MUX_uxn_opcodes_h_l2065_c32_9d60_iftrue,
MUX_uxn_opcodes_h_l2065_c32_9d60_iffalse,
MUX_uxn_opcodes_h_l2065_c32_9d60_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2067_c11_2f71
BIN_OP_EQ_uxn_opcodes_h_l2067_c11_2f71 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2067_c11_2f71_left,
BIN_OP_EQ_uxn_opcodes_h_l2067_c11_2f71_right,
BIN_OP_EQ_uxn_opcodes_h_l2067_c11_2f71_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d16e
result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d16e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d16e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_d16e
result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_d16e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_d16e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d16e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d16e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d16e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2067_c7_d16e
result_stack_value_MUX_uxn_opcodes_h_l2067_c7_d16e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2067_c7_d16e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d16e
result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d16e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d16e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l2071_c24_ec11
BIN_OP_LT_uxn_opcodes_h_l2071_c24_ec11 : entity work.BIN_OP_LT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l2071_c24_ec11_left,
BIN_OP_LT_uxn_opcodes_h_l2071_c24_ec11_right,
BIN_OP_LT_uxn_opcodes_h_l2071_c24_ec11_return_output);

-- MUX_uxn_opcodes_h_l2071_c24_491b
MUX_uxn_opcodes_h_l2071_c24_491b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2071_c24_491b_cond,
MUX_uxn_opcodes_h_l2071_c24_491b_iftrue,
MUX_uxn_opcodes_h_l2071_c24_491b_iffalse,
MUX_uxn_opcodes_h_l2071_c24_491b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2073_c11_984d
BIN_OP_EQ_uxn_opcodes_h_l2073_c11_984d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2073_c11_984d_left,
BIN_OP_EQ_uxn_opcodes_h_l2073_c11_984d_right,
BIN_OP_EQ_uxn_opcodes_h_l2073_c11_984d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_5ac7
result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_5ac7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_5ac7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_5ac7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_5ac7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_5ac7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_5ac7
result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_5ac7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_5ac7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_5ac7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_5ac7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_5ac7_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_3b3c_return_output,
 n8_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output,
 t8_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2052_c11_0c8c_return_output,
 n8_MUX_uxn_opcodes_h_l2052_c7_9299_return_output,
 t8_MUX_uxn_opcodes_h_l2052_c7_9299_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_9299_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_9299_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_9299_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_9299_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2052_c7_9299_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_9299_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2055_c11_c319_return_output,
 n8_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output,
 t8_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2059_c11_0289_return_output,
 n8_MUX_uxn_opcodes_h_l2059_c7_065f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_065f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_065f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_065f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_065f_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2059_c7_065f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_065f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2062_c11_db65_return_output,
 n8_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2065_c32_8f08_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2065_c32_f8c1_return_output,
 MUX_uxn_opcodes_h_l2065_c32_9d60_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2067_c11_2f71_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output,
 BIN_OP_LT_uxn_opcodes_h_l2071_c24_ec11_return_output,
 MUX_uxn_opcodes_h_l2071_c24_491b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2073_c11_984d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_5ac7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_5ac7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_3b3c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_3b3c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_3b3c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_3b3c_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2052_c7_9299_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2047_c2_71c2_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2052_c7_9299_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2047_c2_71c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_9299_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_71c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_9299_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2049_c3_e5e2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_9299_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_71c2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_9299_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_9299_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c2_71c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_9299_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_71c2_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2048_c3_9906_uxn_opcodes_h_l2048_c3_9906_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_0c8c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_0c8c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_0c8c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2052_c7_9299_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2052_c7_9299_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_9299_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_9299_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2053_c3_82e8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_9299_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_9299_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_9299_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_9299_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_c319_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_c319_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_c319_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2059_c7_065f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_065f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_065f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2057_c3_c45b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_065f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_065f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2059_c7_065f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_065f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_0289_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_0289_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_0289_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2059_c7_065f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_065f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_065f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2060_c3_c0a1 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_065f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_065f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2059_c7_065f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_065f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_db65_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_db65_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_db65_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2062_c7_bb68_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_bb68_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_bb68_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_bb68_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_bb68_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2065_c32_9d60_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2065_c32_9d60_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2065_c32_9d60_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2065_c32_8f08_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2065_c32_8f08_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2065_c32_8f08_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2065_c32_f8c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2065_c32_f8c1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2065_c32_f8c1_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2065_c32_9d60_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_2f71_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_2f71_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_2f71_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_5ac7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d16e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_d16e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2070_c3_81ad : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d16e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2067_c7_d16e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_5ac7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d16e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2071_c24_491b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2071_c24_491b_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2071_c24_491b_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2071_c24_ec11_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2071_c24_ec11_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l2071_c24_ec11_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2071_c24_491b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_984d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_984d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_984d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_5ac7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_5ac7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_5ac7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_5ac7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_5ac7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_5ac7_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2052_l2047_l2073_l2062_l2059_l2055_DUPLICATE_714f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2052_l2047_l2067_l2059_l2055_DUPLICATE_3989_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2052_l2047_l2062_l2059_l2055_DUPLICATE_5b74_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2052_l2047_l2067_l2062_l2059_l2055_DUPLICATE_a057_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2052_l2073_l2067_l2062_l2059_l2055_DUPLICATE_7926_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2062_l2067_DUPLICATE_a48f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2078_l2043_DUPLICATE_5fb2_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_2f71_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2057_c3_c45b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2057_c3_c45b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_c319_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2060_c3_c0a1 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2060_c3_c0a1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_984d_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_0289_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2053_c3_82e8 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2053_c3_82e8;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_3b3c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_db65_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_5ac7_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2071_c24_491b_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_MUX_uxn_opcodes_h_l2071_c24_491b_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2065_c32_8f08_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l2065_c32_9d60_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_MUX_uxn_opcodes_h_l2065_c32_9d60_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2065_c32_f8c1_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2070_c3_81ad := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2070_c3_81ad;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_0c8c_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_5ac7_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2049_c3_e5e2 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2049_c3_e5e2;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_3b3c_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2065_c32_8f08_left := VAR_ins;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2071_c24_ec11_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_0c8c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_c319_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_0289_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_db65_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_2f71_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_984d_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_LT_uxn_opcodes_h_l2071_c24_ec11_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2059_c11_0289] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2059_c11_0289_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_0289_left;
     BIN_OP_EQ_uxn_opcodes_h_l2059_c11_0289_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_0289_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_0289_return_output := BIN_OP_EQ_uxn_opcodes_h_l2059_c11_0289_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2073_c11_984d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2073_c11_984d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_984d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2073_c11_984d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_984d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_984d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2073_c11_984d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2052_l2047_l2067_l2062_l2059_l2055_DUPLICATE_a057 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2052_l2047_l2067_l2062_l2059_l2055_DUPLICATE_a057_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2052_l2047_l2073_l2062_l2059_l2055_DUPLICATE_714f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2052_l2047_l2073_l2062_l2059_l2055_DUPLICATE_714f_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2052_l2073_l2067_l2062_l2059_l2055_DUPLICATE_7926 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2052_l2073_l2067_l2062_l2059_l2055_DUPLICATE_7926_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2052_l2047_l2067_l2059_l2055_DUPLICATE_3989 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2052_l2047_l2067_l2059_l2055_DUPLICATE_3989_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2062_c11_db65] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2062_c11_db65_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_db65_left;
     BIN_OP_EQ_uxn_opcodes_h_l2062_c11_db65_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_db65_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_db65_return_output := BIN_OP_EQ_uxn_opcodes_h_l2062_c11_db65_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2067_c11_2f71] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2067_c11_2f71_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_2f71_left;
     BIN_OP_EQ_uxn_opcodes_h_l2067_c11_2f71_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_2f71_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_2f71_return_output := BIN_OP_EQ_uxn_opcodes_h_l2067_c11_2f71_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2055_c11_c319] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2055_c11_c319_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_c319_left;
     BIN_OP_EQ_uxn_opcodes_h_l2055_c11_c319_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_c319_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_c319_return_output := BIN_OP_EQ_uxn_opcodes_h_l2055_c11_c319_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2062_l2067_DUPLICATE_a48f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2062_l2067_DUPLICATE_a48f_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2052_c11_0c8c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2052_c11_0c8c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_0c8c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2052_c11_0c8c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_0c8c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_0c8c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2052_c11_0c8c_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2052_l2047_l2062_l2059_l2055_DUPLICATE_5b74 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2052_l2047_l2062_l2059_l2055_DUPLICATE_5b74_return_output := result.sp_relative_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l2065_c32_8f08] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2065_c32_8f08_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2065_c32_8f08_left;
     BIN_OP_AND_uxn_opcodes_h_l2065_c32_8f08_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2065_c32_8f08_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2065_c32_8f08_return_output := BIN_OP_AND_uxn_opcodes_h_l2065_c32_8f08_return_output;

     -- BIN_OP_LT[uxn_opcodes_h_l2071_c24_ec11] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l2071_c24_ec11_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l2071_c24_ec11_left;
     BIN_OP_LT_uxn_opcodes_h_l2071_c24_ec11_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l2071_c24_ec11_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l2071_c24_ec11_return_output := BIN_OP_LT_uxn_opcodes_h_l2071_c24_ec11_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2047_c6_94b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2065_c32_f8c1_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2065_c32_8f08_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_3b3c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2047_c2_71c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_71c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_71c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_71c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c2_71c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2047_c2_71c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2047_c6_94b1_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2052_c7_9299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_0c8c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_9299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_0c8c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_9299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_0c8c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_9299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_0c8c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_9299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_0c8c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_9299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_0c8c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_9299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_0c8c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2052_c7_9299_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2052_c11_0c8c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_c319_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_c319_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_c319_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_c319_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_c319_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_c319_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_c319_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2055_c11_c319_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2059_c7_065f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_0289_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_065f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_0289_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_065f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_0289_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_065f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_0289_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_065f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_0289_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_065f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_0289_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2059_c7_065f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2059_c11_0289_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2062_c7_bb68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_db65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_bb68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_db65_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_db65_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_bb68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_db65_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_db65_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_bb68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_db65_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_bb68_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2062_c11_db65_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d16e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_2f71_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_d16e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_2f71_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d16e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_2f71_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d16e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_2f71_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2067_c7_d16e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2067_c11_2f71_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_5ac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_984d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_5ac7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2073_c11_984d_return_output;
     VAR_MUX_uxn_opcodes_h_l2071_c24_491b_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l2071_c24_ec11_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2052_l2047_l2062_l2059_l2055_DUPLICATE_5b74_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2052_l2047_l2062_l2059_l2055_DUPLICATE_5b74_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2052_l2047_l2062_l2059_l2055_DUPLICATE_5b74_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2052_l2047_l2062_l2059_l2055_DUPLICATE_5b74_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2052_l2047_l2062_l2059_l2055_DUPLICATE_5b74_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2052_l2073_l2067_l2062_l2059_l2055_DUPLICATE_7926_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2052_l2073_l2067_l2062_l2059_l2055_DUPLICATE_7926_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2052_l2073_l2067_l2062_l2059_l2055_DUPLICATE_7926_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2052_l2073_l2067_l2062_l2059_l2055_DUPLICATE_7926_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2052_l2073_l2067_l2062_l2059_l2055_DUPLICATE_7926_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_5ac7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2052_l2073_l2067_l2062_l2059_l2055_DUPLICATE_7926_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2052_l2047_l2067_l2059_l2055_DUPLICATE_3989_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2052_l2047_l2067_l2059_l2055_DUPLICATE_3989_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2052_l2047_l2067_l2059_l2055_DUPLICATE_3989_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2052_l2047_l2067_l2059_l2055_DUPLICATE_3989_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2052_l2047_l2067_l2059_l2055_DUPLICATE_3989_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2052_l2047_l2073_l2062_l2059_l2055_DUPLICATE_714f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2052_l2047_l2073_l2062_l2059_l2055_DUPLICATE_714f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2052_l2047_l2073_l2062_l2059_l2055_DUPLICATE_714f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2052_l2047_l2073_l2062_l2059_l2055_DUPLICATE_714f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2052_l2047_l2073_l2062_l2059_l2055_DUPLICATE_714f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_5ac7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2052_l2047_l2073_l2062_l2059_l2055_DUPLICATE_714f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2062_l2067_DUPLICATE_a48f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2062_l2067_DUPLICATE_a48f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2052_l2047_l2067_l2062_l2059_l2055_DUPLICATE_a057_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2052_l2047_l2067_l2062_l2059_l2055_DUPLICATE_a057_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2052_l2047_l2067_l2062_l2059_l2055_DUPLICATE_a057_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2052_l2047_l2067_l2062_l2059_l2055_DUPLICATE_a057_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2052_l2047_l2067_l2062_l2059_l2055_DUPLICATE_a057_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2052_l2047_l2067_l2062_l2059_l2055_DUPLICATE_a057_return_output;
     -- MUX[uxn_opcodes_h_l2071_c24_491b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2071_c24_491b_cond <= VAR_MUX_uxn_opcodes_h_l2071_c24_491b_cond;
     MUX_uxn_opcodes_h_l2071_c24_491b_iftrue <= VAR_MUX_uxn_opcodes_h_l2071_c24_491b_iftrue;
     MUX_uxn_opcodes_h_l2071_c24_491b_iffalse <= VAR_MUX_uxn_opcodes_h_l2071_c24_491b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2071_c24_491b_return_output := MUX_uxn_opcodes_h_l2071_c24_491b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2073_c7_5ac7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_5ac7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_5ac7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_5ac7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_5ac7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_5ac7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_5ac7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_5ac7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_5ac7_return_output;

     -- n8_MUX[uxn_opcodes_h_l2062_c7_bb68] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2062_c7_bb68_cond <= VAR_n8_MUX_uxn_opcodes_h_l2062_c7_bb68_cond;
     n8_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue;
     n8_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output := n8_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2047_c1_3b3c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_3b3c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_3b3c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_3b3c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_3b3c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_3b3c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_3b3c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_3b3c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_3b3c_return_output;

     -- t8_MUX[uxn_opcodes_h_l2055_c7_fbcf] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond <= VAR_t8_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond;
     t8_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue;
     t8_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output := t8_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2067_c7_d16e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d16e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d16e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2065_c32_f8c1] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2065_c32_f8c1_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2065_c32_f8c1_left;
     BIN_OP_GT_uxn_opcodes_h_l2065_c32_f8c1_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2065_c32_f8c1_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2065_c32_f8c1_return_output := BIN_OP_GT_uxn_opcodes_h_l2065_c32_f8c1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2067_c7_d16e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_d16e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_d16e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2073_c7_5ac7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_5ac7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_5ac7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_5ac7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_5ac7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_5ac7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_5ac7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_5ac7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_5ac7_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2065_c32_9d60_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2065_c32_f8c1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue := VAR_MUX_uxn_opcodes_h_l2071_c24_491b_return_output;
     VAR_printf_uxn_opcodes_h_l2048_c3_9906_uxn_opcodes_h_l2048_c3_9906_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2047_c1_3b3c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2073_c7_5ac7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2073_c7_5ac7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output;
     -- printf_uxn_opcodes_h_l2048_c3_9906[uxn_opcodes_h_l2048_c3_9906] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2048_c3_9906_uxn_opcodes_h_l2048_c3_9906_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2048_c3_9906_uxn_opcodes_h_l2048_c3_9906_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2067_c7_d16e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d16e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d16e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2067_c7_d16e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2067_c7_d16e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2067_c7_d16e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output;

     -- MUX[uxn_opcodes_h_l2065_c32_9d60] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2065_c32_9d60_cond <= VAR_MUX_uxn_opcodes_h_l2065_c32_9d60_cond;
     MUX_uxn_opcodes_h_l2065_c32_9d60_iftrue <= VAR_MUX_uxn_opcodes_h_l2065_c32_9d60_iftrue;
     MUX_uxn_opcodes_h_l2065_c32_9d60_iffalse <= VAR_MUX_uxn_opcodes_h_l2065_c32_9d60_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2065_c32_9d60_return_output := MUX_uxn_opcodes_h_l2065_c32_9d60_return_output;

     -- n8_MUX[uxn_opcodes_h_l2059_c7_065f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2059_c7_065f_cond <= VAR_n8_MUX_uxn_opcodes_h_l2059_c7_065f_cond;
     n8_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue;
     n8_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2059_c7_065f_return_output := n8_MUX_uxn_opcodes_h_l2059_c7_065f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2062_c7_bb68] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_bb68_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_bb68_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output;

     -- t8_MUX[uxn_opcodes_h_l2052_c7_9299] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2052_c7_9299_cond <= VAR_t8_MUX_uxn_opcodes_h_l2052_c7_9299_cond;
     t8_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue;
     t8_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2052_c7_9299_return_output := t8_MUX_uxn_opcodes_h_l2052_c7_9299_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2067_c7_d16e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d16e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d16e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d16e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d16e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2062_c7_bb68] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue := VAR_MUX_uxn_opcodes_h_l2065_c32_9d60_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2059_c7_065f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2067_c7_d16e_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2052_c7_9299_return_output;
     -- n8_MUX[uxn_opcodes_h_l2055_c7_fbcf] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond <= VAR_n8_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond;
     n8_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue;
     n8_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output := n8_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2062_c7_bb68] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_bb68_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_bb68_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2062_c7_bb68] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2062_c7_bb68_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_bb68_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output := result_stack_value_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2062_c7_bb68] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2062_c7_bb68] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_bb68_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_bb68_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_bb68_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_bb68_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output;

     -- t8_MUX[uxn_opcodes_h_l2047_c2_71c2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2047_c2_71c2_cond <= VAR_t8_MUX_uxn_opcodes_h_l2047_c2_71c2_cond;
     t8_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue;
     t8_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output := t8_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2059_c7_065f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_065f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_065f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_065f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_065f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2059_c7_065f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_065f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_065f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_065f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_065f_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2059_c7_065f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2059_c7_065f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2062_c7_bb68_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output;
     -- n8_MUX[uxn_opcodes_h_l2052_c7_9299] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2052_c7_9299_cond <= VAR_n8_MUX_uxn_opcodes_h_l2052_c7_9299_cond;
     n8_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue;
     n8_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2052_c7_9299_return_output := n8_MUX_uxn_opcodes_h_l2052_c7_9299_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2059_c7_065f] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2059_c7_065f_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2059_c7_065f_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2059_c7_065f_return_output := result_stack_value_MUX_uxn_opcodes_h_l2059_c7_065f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2059_c7_065f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_065f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_065f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_065f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_065f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2059_c7_065f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_065f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_065f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_065f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_065f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2055_c7_fbcf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2059_c7_065f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_065f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_065f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_065f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_065f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_065f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_065f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2055_c7_fbcf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2052_c7_9299_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2059_c7_065f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2059_c7_065f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2059_c7_065f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2059_c7_065f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2052_c7_9299] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_9299_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_9299_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_9299_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_9299_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2055_c7_fbcf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2055_c7_fbcf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output := result_stack_value_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output;

     -- n8_MUX[uxn_opcodes_h_l2047_c2_71c2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2047_c2_71c2_cond <= VAR_n8_MUX_uxn_opcodes_h_l2047_c2_71c2_cond;
     n8_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue;
     n8_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output := n8_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2055_c7_fbcf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2055_c7_fbcf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2052_c7_9299] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_9299_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_9299_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_9299_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_9299_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2052_c7_9299_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2052_c7_9299_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2055_c7_fbcf_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2052_c7_9299] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_9299_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_9299_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_9299_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_9299_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2052_c7_9299] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_9299_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_9299_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_9299_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_9299_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2047_c2_71c2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_71c2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_71c2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2052_c7_9299] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2052_c7_9299_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_9299_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_9299_return_output := result_stack_value_MUX_uxn_opcodes_h_l2052_c7_9299_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2052_c7_9299] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_9299_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_9299_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_9299_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_9299_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_9299_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_9299_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2047_c2_71c2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2052_c7_9299_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2052_c7_9299_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2052_c7_9299_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2052_c7_9299_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2047_c2_71c2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2047_c2_71c2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_71c2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_71c2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2047_c2_71c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_71c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_71c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2047_c2_71c2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2047_c2_71c2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c2_71c2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c2_71c2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c2_71c2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2078_l2043_DUPLICATE_5fb2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2078_l2043_DUPLICATE_5fb2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2047_c2_71c2_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2078_l2043_DUPLICATE_5fb2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2078_l2043_DUPLICATE_5fb2_return_output;
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
