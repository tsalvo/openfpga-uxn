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
-- Submodules: 64
entity add_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add_0CLK_fd2391e7;
architecture arch of add_0CLK_fd2391e7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l931_c6_835b]
signal BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l931_c1_7220]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l931_c1_7220_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l931_c1_7220_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l931_c1_7220_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l931_c1_7220_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l931_c2_d2f3]
signal t8_MUX_uxn_opcodes_h_l931_c2_d2f3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l931_c2_d2f3]
signal n8_MUX_uxn_opcodes_h_l931_c2_d2f3_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l931_c2_d2f3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l931_c2_d2f3]
signal result_stack_value_MUX_uxn_opcodes_h_l931_c2_d2f3_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l931_c2_d2f3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l931_c2_d2f3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l931_c2_d2f3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l931_c2_d2f3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c2_d2f3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l931_c2_d2f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l931_c2_d2f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l931_c2_d2f3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l931_c2_d2f3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l932_c3_0762[uxn_opcodes_h_l932_c3_0762]
signal printf_uxn_opcodes_h_l932_c3_0762_uxn_opcodes_h_l932_c3_0762_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l937_c11_9840]
signal BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l937_c7_7760]
signal t8_MUX_uxn_opcodes_h_l937_c7_7760_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l937_c7_7760_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l937_c7_7760_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l937_c7_7760_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l937_c7_7760]
signal n8_MUX_uxn_opcodes_h_l937_c7_7760_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l937_c7_7760_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l937_c7_7760_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l937_c7_7760_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l937_c7_7760]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l937_c7_7760_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l937_c7_7760_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l937_c7_7760_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l937_c7_7760_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l937_c7_7760]
signal result_stack_value_MUX_uxn_opcodes_h_l937_c7_7760_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l937_c7_7760_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l937_c7_7760_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l937_c7_7760_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l937_c7_7760]
signal result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_7760_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_7760_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_7760_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_7760_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l937_c7_7760]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_7760_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_7760_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_7760_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_7760_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l937_c7_7760]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_7760_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_7760_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_7760_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_7760_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l937_c7_7760]
signal result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_7760_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_7760_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_7760_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_7760_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l937_c7_7760]
signal result_is_stack_read_MUX_uxn_opcodes_h_l937_c7_7760_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l937_c7_7760_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l937_c7_7760_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l937_c7_7760_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l940_c11_0a73]
signal BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l940_c7_6abe]
signal t8_MUX_uxn_opcodes_h_l940_c7_6abe_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l940_c7_6abe_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l940_c7_6abe]
signal n8_MUX_uxn_opcodes_h_l940_c7_6abe_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l940_c7_6abe_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l940_c7_6abe]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6abe_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6abe_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l940_c7_6abe]
signal result_stack_value_MUX_uxn_opcodes_h_l940_c7_6abe_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l940_c7_6abe_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l940_c7_6abe]
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6abe_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6abe_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l940_c7_6abe]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_6abe_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_6abe_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l940_c7_6abe]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6abe_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6abe_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l940_c7_6abe]
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6abe_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6abe_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l940_c7_6abe]
signal result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_6abe_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_6abe_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l944_c11_b12c]
signal BIN_OP_EQ_uxn_opcodes_h_l944_c11_b12c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l944_c11_b12c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l944_c11_b12c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l944_c7_136b]
signal n8_MUX_uxn_opcodes_h_l944_c7_136b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l944_c7_136b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l944_c7_136b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l944_c7_136b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l944_c7_136b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_136b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_136b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_136b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_136b_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l944_c7_136b]
signal result_stack_value_MUX_uxn_opcodes_h_l944_c7_136b_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l944_c7_136b_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l944_c7_136b_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l944_c7_136b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l944_c7_136b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_136b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_136b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_136b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_136b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l944_c7_136b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_136b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_136b_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_136b_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_136b_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l944_c7_136b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_136b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_136b_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_136b_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_136b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l944_c7_136b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_136b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_136b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_136b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_136b_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l944_c7_136b]
signal result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_136b_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_136b_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_136b_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_136b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l947_c11_b5a4]
signal BIN_OP_EQ_uxn_opcodes_h_l947_c11_b5a4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l947_c11_b5a4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l947_c11_b5a4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l947_c7_4e93]
signal n8_MUX_uxn_opcodes_h_l947_c7_4e93_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l947_c7_4e93_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l947_c7_4e93]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_4e93_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_4e93_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l947_c7_4e93]
signal result_stack_value_MUX_uxn_opcodes_h_l947_c7_4e93_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l947_c7_4e93_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l947_c7_4e93]
signal result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_4e93_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_4e93_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l947_c7_4e93]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_4e93_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_4e93_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l947_c7_4e93]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_4e93_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_4e93_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l947_c7_4e93]
signal result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_4e93_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_4e93_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l947_c7_4e93]
signal result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_4e93_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_4e93_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l951_c32_b900]
signal BIN_OP_AND_uxn_opcodes_h_l951_c32_b900_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l951_c32_b900_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l951_c32_b900_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l951_c32_75f4]
signal BIN_OP_GT_uxn_opcodes_h_l951_c32_75f4_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l951_c32_75f4_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l951_c32_75f4_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l951_c32_7311]
signal MUX_uxn_opcodes_h_l951_c32_7311_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l951_c32_7311_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l951_c32_7311_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l951_c32_7311_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l953_c11_385f]
signal BIN_OP_EQ_uxn_opcodes_h_l953_c11_385f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l953_c11_385f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l953_c11_385f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l953_c7_e2b5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l953_c7_e2b5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l953_c7_e2b5]
signal result_stack_value_MUX_uxn_opcodes_h_l953_c7_e2b5_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l953_c7_e2b5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_e2b5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l953_c7_e2b5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_e2b5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l953_c7_e2b5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_e2b5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l957_c24_2570]
signal BIN_OP_PLUS_uxn_opcodes_h_l957_c24_2570_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l957_c24_2570_right : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l957_c24_2570_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l959_c11_2661]
signal BIN_OP_EQ_uxn_opcodes_h_l959_c11_2661_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l959_c11_2661_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l959_c11_2661_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l959_c7_f298]
signal result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_f298_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_f298_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_f298_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_f298_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l959_c7_f298]
signal result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_f298_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_f298_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_f298_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_f298_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b
BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b_left,
BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b_right,
BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l931_c1_7220
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l931_c1_7220 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l931_c1_7220_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l931_c1_7220_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l931_c1_7220_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l931_c1_7220_return_output);

-- t8_MUX_uxn_opcodes_h_l931_c2_d2f3
t8_MUX_uxn_opcodes_h_l931_c2_d2f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l931_c2_d2f3_cond,
t8_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue,
t8_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse,
t8_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output);

-- n8_MUX_uxn_opcodes_h_l931_c2_d2f3
n8_MUX_uxn_opcodes_h_l931_c2_d2f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l931_c2_d2f3_cond,
n8_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue,
n8_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse,
n8_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l931_c2_d2f3
result_is_sp_shift_MUX_uxn_opcodes_h_l931_c2_d2f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l931_c2_d2f3
result_stack_value_MUX_uxn_opcodes_h_l931_c2_d2f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l931_c2_d2f3_cond,
result_stack_value_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l931_c2_d2f3
result_is_stack_write_MUX_uxn_opcodes_h_l931_c2_d2f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l931_c2_d2f3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c2_d2f3
result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c2_d2f3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c2_d2f3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c2_d2f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c2_d2f3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l931_c2_d2f3
result_is_opc_done_MUX_uxn_opcodes_h_l931_c2_d2f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l931_c2_d2f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l931_c2_d2f3
result_is_stack_read_MUX_uxn_opcodes_h_l931_c2_d2f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l931_c2_d2f3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output);

-- printf_uxn_opcodes_h_l932_c3_0762_uxn_opcodes_h_l932_c3_0762
printf_uxn_opcodes_h_l932_c3_0762_uxn_opcodes_h_l932_c3_0762 : entity work.printf_uxn_opcodes_h_l932_c3_0762_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l932_c3_0762_uxn_opcodes_h_l932_c3_0762_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840
BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840_left,
BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840_right,
BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840_return_output);

-- t8_MUX_uxn_opcodes_h_l937_c7_7760
t8_MUX_uxn_opcodes_h_l937_c7_7760 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l937_c7_7760_cond,
t8_MUX_uxn_opcodes_h_l937_c7_7760_iftrue,
t8_MUX_uxn_opcodes_h_l937_c7_7760_iffalse,
t8_MUX_uxn_opcodes_h_l937_c7_7760_return_output);

-- n8_MUX_uxn_opcodes_h_l937_c7_7760
n8_MUX_uxn_opcodes_h_l937_c7_7760 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l937_c7_7760_cond,
n8_MUX_uxn_opcodes_h_l937_c7_7760_iftrue,
n8_MUX_uxn_opcodes_h_l937_c7_7760_iffalse,
n8_MUX_uxn_opcodes_h_l937_c7_7760_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l937_c7_7760
result_is_sp_shift_MUX_uxn_opcodes_h_l937_c7_7760 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l937_c7_7760_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l937_c7_7760_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l937_c7_7760_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l937_c7_7760_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l937_c7_7760
result_stack_value_MUX_uxn_opcodes_h_l937_c7_7760 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l937_c7_7760_cond,
result_stack_value_MUX_uxn_opcodes_h_l937_c7_7760_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l937_c7_7760_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l937_c7_7760_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_7760
result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_7760 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_7760_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_7760_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_7760_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_7760_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_7760
result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_7760 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_7760_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_7760_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_7760_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_7760_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_7760
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_7760 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_7760_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_7760_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_7760_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_7760_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_7760
result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_7760 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_7760_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_7760_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_7760_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_7760_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l937_c7_7760
result_is_stack_read_MUX_uxn_opcodes_h_l937_c7_7760 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l937_c7_7760_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l937_c7_7760_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l937_c7_7760_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l937_c7_7760_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73
BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73_left,
BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73_right,
BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73_return_output);

-- t8_MUX_uxn_opcodes_h_l940_c7_6abe
t8_MUX_uxn_opcodes_h_l940_c7_6abe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l940_c7_6abe_cond,
t8_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue,
t8_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse,
t8_MUX_uxn_opcodes_h_l940_c7_6abe_return_output);

-- n8_MUX_uxn_opcodes_h_l940_c7_6abe
n8_MUX_uxn_opcodes_h_l940_c7_6abe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l940_c7_6abe_cond,
n8_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue,
n8_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse,
n8_MUX_uxn_opcodes_h_l940_c7_6abe_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6abe
result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6abe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6abe_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6abe_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l940_c7_6abe
result_stack_value_MUX_uxn_opcodes_h_l940_c7_6abe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l940_c7_6abe_cond,
result_stack_value_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l940_c7_6abe_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6abe
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6abe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6abe_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6abe_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_6abe
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_6abe : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_6abe_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_6abe_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6abe
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6abe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6abe_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6abe_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6abe
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6abe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6abe_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6abe_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_6abe
result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_6abe : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_6abe_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_6abe_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l944_c11_b12c
BIN_OP_EQ_uxn_opcodes_h_l944_c11_b12c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l944_c11_b12c_left,
BIN_OP_EQ_uxn_opcodes_h_l944_c11_b12c_right,
BIN_OP_EQ_uxn_opcodes_h_l944_c11_b12c_return_output);

-- n8_MUX_uxn_opcodes_h_l944_c7_136b
n8_MUX_uxn_opcodes_h_l944_c7_136b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l944_c7_136b_cond,
n8_MUX_uxn_opcodes_h_l944_c7_136b_iftrue,
n8_MUX_uxn_opcodes_h_l944_c7_136b_iffalse,
n8_MUX_uxn_opcodes_h_l944_c7_136b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_136b
result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_136b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_136b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_136b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_136b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_136b_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l944_c7_136b
result_stack_value_MUX_uxn_opcodes_h_l944_c7_136b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l944_c7_136b_cond,
result_stack_value_MUX_uxn_opcodes_h_l944_c7_136b_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l944_c7_136b_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l944_c7_136b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_136b
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_136b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_136b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_136b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_136b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_136b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_136b
result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_136b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_136b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_136b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_136b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_136b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_136b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_136b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_136b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_136b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_136b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_136b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_136b
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_136b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_136b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_136b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_136b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_136b_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_136b
result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_136b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_136b_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_136b_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_136b_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_136b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l947_c11_b5a4
BIN_OP_EQ_uxn_opcodes_h_l947_c11_b5a4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l947_c11_b5a4_left,
BIN_OP_EQ_uxn_opcodes_h_l947_c11_b5a4_right,
BIN_OP_EQ_uxn_opcodes_h_l947_c11_b5a4_return_output);

-- n8_MUX_uxn_opcodes_h_l947_c7_4e93
n8_MUX_uxn_opcodes_h_l947_c7_4e93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l947_c7_4e93_cond,
n8_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue,
n8_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse,
n8_MUX_uxn_opcodes_h_l947_c7_4e93_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_4e93
result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_4e93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_4e93_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_4e93_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l947_c7_4e93
result_stack_value_MUX_uxn_opcodes_h_l947_c7_4e93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l947_c7_4e93_cond,
result_stack_value_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l947_c7_4e93_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_4e93
result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_4e93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_4e93_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_4e93_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_4e93
result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_4e93 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_4e93_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_4e93_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_4e93
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_4e93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_4e93_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_4e93_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_4e93
result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_4e93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_4e93_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_4e93_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_4e93
result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_4e93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_4e93_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_4e93_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l951_c32_b900
BIN_OP_AND_uxn_opcodes_h_l951_c32_b900 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l951_c32_b900_left,
BIN_OP_AND_uxn_opcodes_h_l951_c32_b900_right,
BIN_OP_AND_uxn_opcodes_h_l951_c32_b900_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l951_c32_75f4
BIN_OP_GT_uxn_opcodes_h_l951_c32_75f4 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l951_c32_75f4_left,
BIN_OP_GT_uxn_opcodes_h_l951_c32_75f4_right,
BIN_OP_GT_uxn_opcodes_h_l951_c32_75f4_return_output);

-- MUX_uxn_opcodes_h_l951_c32_7311
MUX_uxn_opcodes_h_l951_c32_7311 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l951_c32_7311_cond,
MUX_uxn_opcodes_h_l951_c32_7311_iftrue,
MUX_uxn_opcodes_h_l951_c32_7311_iffalse,
MUX_uxn_opcodes_h_l951_c32_7311_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l953_c11_385f
BIN_OP_EQ_uxn_opcodes_h_l953_c11_385f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l953_c11_385f_left,
BIN_OP_EQ_uxn_opcodes_h_l953_c11_385f_right,
BIN_OP_EQ_uxn_opcodes_h_l953_c11_385f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l953_c7_e2b5
result_is_sp_shift_MUX_uxn_opcodes_h_l953_c7_e2b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l953_c7_e2b5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l953_c7_e2b5
result_stack_value_MUX_uxn_opcodes_h_l953_c7_e2b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l953_c7_e2b5_cond,
result_stack_value_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_e2b5
result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_e2b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_e2b5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_e2b5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_e2b5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_e2b5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_e2b5
result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_e2b5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_e2b5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l957_c24_2570
BIN_OP_PLUS_uxn_opcodes_h_l957_c24_2570 : entity work.BIN_OP_PLUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l957_c24_2570_left,
BIN_OP_PLUS_uxn_opcodes_h_l957_c24_2570_right,
BIN_OP_PLUS_uxn_opcodes_h_l957_c24_2570_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l959_c11_2661
BIN_OP_EQ_uxn_opcodes_h_l959_c11_2661 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l959_c11_2661_left,
BIN_OP_EQ_uxn_opcodes_h_l959_c11_2661_right,
BIN_OP_EQ_uxn_opcodes_h_l959_c11_2661_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_f298
result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_f298 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_f298_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_f298_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_f298_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_f298_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_f298
result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_f298 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_f298_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_f298_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_f298_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_f298_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l931_c1_7220_return_output,
 t8_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output,
 n8_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840_return_output,
 t8_MUX_uxn_opcodes_h_l937_c7_7760_return_output,
 n8_MUX_uxn_opcodes_h_l937_c7_7760_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l937_c7_7760_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l937_c7_7760_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_7760_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_7760_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_7760_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_7760_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l937_c7_7760_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73_return_output,
 t8_MUX_uxn_opcodes_h_l940_c7_6abe_return_output,
 n8_MUX_uxn_opcodes_h_l940_c7_6abe_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6abe_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l940_c7_6abe_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6abe_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_6abe_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6abe_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6abe_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_6abe_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l944_c11_b12c_return_output,
 n8_MUX_uxn_opcodes_h_l944_c7_136b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_136b_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l944_c7_136b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_136b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_136b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_136b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_136b_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_136b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l947_c11_b5a4_return_output,
 n8_MUX_uxn_opcodes_h_l947_c7_4e93_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_4e93_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l947_c7_4e93_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_4e93_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_4e93_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_4e93_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_4e93_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_4e93_return_output,
 BIN_OP_AND_uxn_opcodes_h_l951_c32_b900_return_output,
 BIN_OP_GT_uxn_opcodes_h_l951_c32_75f4_return_output,
 MUX_uxn_opcodes_h_l951_c32_7311_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l953_c11_385f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l957_c24_2570_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l959_c11_2661_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_f298_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_f298_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l931_c1_7220_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l931_c1_7220_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l931_c1_7220_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l931_c1_7220_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l937_c7_7760_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l931_c2_d2f3_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l937_c7_7760_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l931_c2_d2f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l937_c7_7760_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l937_c7_7760_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c2_d2f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_7760_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c2_d2f3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_7760_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l934_c3_fcd4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_7760_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c2_d2f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_7760_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c2_d2f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l937_c7_7760_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l931_c2_d2f3_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l932_c3_0762_uxn_opcodes_h_l932_c3_0762_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l937_c7_7760_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l937_c7_7760_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l940_c7_6abe_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l937_c7_7760_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l937_c7_7760_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l937_c7_7760_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l940_c7_6abe_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l937_c7_7760_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l937_c7_7760_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l937_c7_7760_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6abe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l937_c7_7760_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l937_c7_7760_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l937_c7_7760_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_6abe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l937_c7_7760_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_7760_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_7760_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6abe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_7760_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_7760_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_7760_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_6abe_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_7760_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_7760_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l938_c3_5f25 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_7760_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6abe_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_7760_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_7760_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_7760_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6abe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_7760_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l937_c7_7760_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l937_c7_7760_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_6abe_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l937_c7_7760_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l940_c7_6abe_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l944_c7_136b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l940_c7_6abe_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_136b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6abe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_136b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_6abe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_136b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6abe_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_136b_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_6abe_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l942_c3_d4f6 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_136b_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6abe_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_136b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6abe_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_136b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_6abe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_b12c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_b12c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_b12c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l944_c7_136b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l944_c7_136b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l947_c7_4e93_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l944_c7_136b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_136b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_136b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_4e93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_136b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_136b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_136b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_4e93_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_136b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_136b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_136b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_4e93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_136b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_136b_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_136b_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_4e93_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_136b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_136b_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l945_c3_8137 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_136b_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_4e93_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_136b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_136b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_136b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_4e93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_136b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_136b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_136b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_4e93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_136b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_b5a4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_b5a4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_b5a4_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l947_c7_4e93_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_4e93_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_4e93_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_4e93_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_4e93_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_4e93_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_4e93_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_4e93_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l951_c32_7311_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l951_c32_7311_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l951_c32_7311_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l951_c32_b900_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l951_c32_b900_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l951_c32_b900_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l951_c32_75f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l951_c32_75f4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l951_c32_75f4_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l951_c32_7311_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_385f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_385f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_385f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l953_c7_e2b5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_uxn_opcodes_h_l957_c3_2f6c : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l953_c7_e2b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_f298_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_e2b5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l956_c3_e876 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_e2b5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_f298_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_e2b5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l957_c24_2570_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l957_c24_2570_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l957_c24_2570_return_output : unsigned(8 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_2661_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_2661_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_2661_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_f298_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_f298_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_f298_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_f298_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_f298_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_f298_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l931_l953_l944_l940_l937_DUPLICATE_f0f4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l931_l953_l947_l944_l940_l937_DUPLICATE_abab_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l931_l959_l947_l944_l940_l937_DUPLICATE_3aac_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l931_l947_l944_l940_l937_DUPLICATE_efff_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l959_l953_l947_l944_l940_l937_DUPLICATE_84a7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l944_l937_l947_l940_DUPLICATE_a7b5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l953_l947_DUPLICATE_04f1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l964_l927_DUPLICATE_b4d7_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_2661_right := to_unsigned(6, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_f298_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l951_c32_b900_right := to_unsigned(128, 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_b5a4_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_f298_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l951_c32_7311_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_MUX_uxn_opcodes_h_l951_c32_7311_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l951_c32_75f4_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_385f_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l931_c1_7220_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l938_c3_5f25 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_7760_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l938_c3_5f25;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l934_c3_fcd4 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l934_c3_fcd4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_b12c_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l942_c3_d4f6 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l942_c3_d4f6;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l945_c3_8137 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_136b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l945_c3_8137;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l956_c3_e876 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l956_c3_e876;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l931_c1_7220_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l951_c32_b900_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l957_c24_2570_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l937_c7_7760_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l944_c7_136b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_b12c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_b5a4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_385f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_2661_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l957_c24_2570_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l937_c7_7760_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse := t8;
     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l931_l947_l944_l940_l937_DUPLICATE_efff LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l931_l947_l944_l940_l937_DUPLICATE_efff_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l953_l947_DUPLICATE_04f1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l953_l947_DUPLICATE_04f1_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l931_c6_835b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b_left;
     BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b_return_output := BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l959_l953_l947_l944_l940_l937_DUPLICATE_84a7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l959_l953_l947_l944_l940_l937_DUPLICATE_84a7_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l937_c11_9840] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840_left;
     BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840_return_output := BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l940_c11_0a73] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73_left;
     BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73_return_output := BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l944_c11_b12c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l944_c11_b12c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_b12c_left;
     BIN_OP_EQ_uxn_opcodes_h_l944_c11_b12c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_b12c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_b12c_return_output := BIN_OP_EQ_uxn_opcodes_h_l944_c11_b12c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l931_l959_l947_l944_l940_l937_DUPLICATE_3aac LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l931_l959_l947_l944_l940_l937_DUPLICATE_3aac_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l959_c11_2661] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l959_c11_2661_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_2661_left;
     BIN_OP_EQ_uxn_opcodes_h_l959_c11_2661_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_2661_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_2661_return_output := BIN_OP_EQ_uxn_opcodes_h_l959_c11_2661_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l957_c24_2570] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l957_c24_2570_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l957_c24_2570_left;
     BIN_OP_PLUS_uxn_opcodes_h_l957_c24_2570_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l957_c24_2570_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l957_c24_2570_return_output := BIN_OP_PLUS_uxn_opcodes_h_l957_c24_2570_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l931_l953_l944_l940_l937_DUPLICATE_f0f4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l931_l953_l944_l940_l937_DUPLICATE_f0f4_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l944_l937_l947_l940_DUPLICATE_a7b5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l944_l937_l947_l940_DUPLICATE_a7b5_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l947_c11_b5a4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l947_c11_b5a4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_b5a4_left;
     BIN_OP_EQ_uxn_opcodes_h_l947_c11_b5a4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_b5a4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_b5a4_return_output := BIN_OP_EQ_uxn_opcodes_h_l947_c11_b5a4_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l951_c32_b900] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l951_c32_b900_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l951_c32_b900_left;
     BIN_OP_AND_uxn_opcodes_h_l951_c32_b900_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l951_c32_b900_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l951_c32_b900_return_output := BIN_OP_AND_uxn_opcodes_h_l951_c32_b900_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l953_c11_385f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l953_c11_385f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_385f_left;
     BIN_OP_EQ_uxn_opcodes_h_l953_c11_385f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_385f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_385f_return_output := BIN_OP_EQ_uxn_opcodes_h_l953_c11_385f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l931_l953_l947_l944_l940_l937_DUPLICATE_abab LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l931_l953_l947_l944_l940_l937_DUPLICATE_abab_return_output := result.stack_value;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l951_c32_75f4_left := VAR_BIN_OP_AND_uxn_opcodes_h_l951_c32_b900_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l931_c1_7220_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l931_c2_d2f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c2_d2f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l931_c2_d2f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c2_d2f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c2_d2f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c2_d2f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l931_c2_d2f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l931_c6_835b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l937_c7_7760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_7760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l937_c7_7760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l937_c7_7760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_7760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_7760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_7760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l937_c7_7760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l937_c7_7760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l937_c11_9840_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l940_c7_6abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_6abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_6abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_6abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l940_c7_6abe_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l940_c11_0a73_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l944_c7_136b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_b12c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_136b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_b12c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_136b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_b12c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_136b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_b12c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_136b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_b12c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_136b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_b12c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_136b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_b12c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_136b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l944_c11_b12c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l947_c7_4e93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_b5a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_4e93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_b5a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_4e93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_b5a4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_4e93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_b5a4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_4e93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_b5a4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_4e93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_b5a4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_4e93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_b5a4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_4e93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l947_c11_b5a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_e2b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_385f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l953_c7_e2b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_385f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_e2b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_385f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_e2b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_385f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l953_c7_e2b5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l953_c11_385f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_f298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_2661_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_f298_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l959_c11_2661_return_output;
     VAR_result_stack_value_uxn_opcodes_h_l957_c3_2f6c := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l957_c24_2570_return_output, 8);
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l931_l947_l944_l940_l937_DUPLICATE_efff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_7760_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l931_l947_l944_l940_l937_DUPLICATE_efff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l931_l947_l944_l940_l937_DUPLICATE_efff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_136b_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l931_l947_l944_l940_l937_DUPLICATE_efff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l931_l947_l944_l940_l937_DUPLICATE_efff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_7760_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l959_l953_l947_l944_l940_l937_DUPLICATE_84a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l959_l953_l947_l944_l940_l937_DUPLICATE_84a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_136b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l959_l953_l947_l944_l940_l937_DUPLICATE_84a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l959_l953_l947_l944_l940_l937_DUPLICATE_84a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l959_l953_l947_l944_l940_l937_DUPLICATE_84a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_f298_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l959_l953_l947_l944_l940_l937_DUPLICATE_84a7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l931_l953_l944_l940_l937_DUPLICATE_f0f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l937_c7_7760_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l931_l953_l944_l940_l937_DUPLICATE_f0f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l931_l953_l944_l940_l937_DUPLICATE_f0f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_136b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l931_l953_l944_l940_l937_DUPLICATE_f0f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l931_l953_l944_l940_l937_DUPLICATE_f0f4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l937_c7_7760_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l944_l937_l947_l940_DUPLICATE_a7b5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l944_l937_l947_l940_DUPLICATE_a7b5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_136b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l944_l937_l947_l940_DUPLICATE_a7b5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l944_l937_l947_l940_DUPLICATE_a7b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l931_l959_l947_l944_l940_l937_DUPLICATE_3aac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_7760_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l931_l959_l947_l944_l940_l937_DUPLICATE_3aac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l931_l959_l947_l944_l940_l937_DUPLICATE_3aac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_136b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l931_l959_l947_l944_l940_l937_DUPLICATE_3aac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l931_l959_l947_l944_l940_l937_DUPLICATE_3aac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_f298_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l931_l959_l947_l944_l940_l937_DUPLICATE_3aac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l953_l947_DUPLICATE_04f1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l953_l947_DUPLICATE_04f1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l931_l953_l947_l944_l940_l937_DUPLICATE_abab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l937_c7_7760_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l931_l953_l947_l944_l940_l937_DUPLICATE_abab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l931_l953_l947_l944_l940_l937_DUPLICATE_abab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_136b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l931_l953_l947_l944_l940_l937_DUPLICATE_abab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l931_l953_l947_l944_l940_l937_DUPLICATE_abab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l931_l953_l947_l944_l940_l937_DUPLICATE_abab_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue := VAR_result_stack_value_uxn_opcodes_h_l957_c3_2f6c;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l959_c7_f298] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_f298_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_f298_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_f298_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_f298_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_f298_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_f298_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_f298_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_f298_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l931_c1_7220] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l931_c1_7220_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l931_c1_7220_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l931_c1_7220_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l931_c1_7220_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l931_c1_7220_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l931_c1_7220_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l931_c1_7220_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l931_c1_7220_return_output;

     -- n8_MUX[uxn_opcodes_h_l947_c7_4e93] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l947_c7_4e93_cond <= VAR_n8_MUX_uxn_opcodes_h_l947_c7_4e93_cond;
     n8_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue;
     n8_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l947_c7_4e93_return_output := n8_MUX_uxn_opcodes_h_l947_c7_4e93_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l953_c7_e2b5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_e2b5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_e2b5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l959_c7_f298] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_f298_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_f298_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_f298_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_f298_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_f298_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_f298_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_f298_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_f298_return_output;

     -- t8_MUX[uxn_opcodes_h_l940_c7_6abe] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l940_c7_6abe_cond <= VAR_t8_MUX_uxn_opcodes_h_l940_c7_6abe_cond;
     t8_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue;
     t8_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l940_c7_6abe_return_output := t8_MUX_uxn_opcodes_h_l940_c7_6abe_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l947_c7_4e93] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_4e93_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_4e93_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_4e93_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_4e93_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l953_c7_e2b5] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l953_c7_e2b5_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l953_c7_e2b5_cond;
     result_stack_value_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output := result_stack_value_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l953_c7_e2b5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l953_c7_e2b5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l953_c7_e2b5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l951_c32_75f4] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l951_c32_75f4_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l951_c32_75f4_left;
     BIN_OP_GT_uxn_opcodes_h_l951_c32_75f4_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l951_c32_75f4_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l951_c32_75f4_return_output := BIN_OP_GT_uxn_opcodes_h_l951_c32_75f4_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l951_c32_7311_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l951_c32_75f4_return_output;
     VAR_printf_uxn_opcodes_h_l932_c3_0762_uxn_opcodes_h_l932_c3_0762_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l931_c1_7220_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l944_c7_136b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l947_c7_4e93_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l959_c7_f298_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_136b_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l947_c7_4e93_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l959_c7_f298_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l937_c7_7760_iffalse := VAR_t8_MUX_uxn_opcodes_h_l940_c7_6abe_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l953_c7_e2b5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_e2b5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_e2b5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l944_c7_136b] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_136b_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_136b_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_136b_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_136b_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_136b_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_136b_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_136b_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_136b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l953_c7_e2b5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_e2b5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_e2b5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_e2b5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_e2b5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output;

     -- printf_uxn_opcodes_h_l932_c3_0762[uxn_opcodes_h_l932_c3_0762] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l932_c3_0762_uxn_opcodes_h_l932_c3_0762_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l932_c3_0762_uxn_opcodes_h_l932_c3_0762_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- MUX[uxn_opcodes_h_l951_c32_7311] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l951_c32_7311_cond <= VAR_MUX_uxn_opcodes_h_l951_c32_7311_cond;
     MUX_uxn_opcodes_h_l951_c32_7311_iftrue <= VAR_MUX_uxn_opcodes_h_l951_c32_7311_iftrue;
     MUX_uxn_opcodes_h_l951_c32_7311_iffalse <= VAR_MUX_uxn_opcodes_h_l951_c32_7311_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l951_c32_7311_return_output := MUX_uxn_opcodes_h_l951_c32_7311_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l947_c7_4e93] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_4e93_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_4e93_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_4e93_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_4e93_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l947_c7_4e93] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l947_c7_4e93_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_4e93_cond;
     result_stack_value_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_4e93_return_output := result_stack_value_MUX_uxn_opcodes_h_l947_c7_4e93_return_output;

     -- t8_MUX[uxn_opcodes_h_l937_c7_7760] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l937_c7_7760_cond <= VAR_t8_MUX_uxn_opcodes_h_l937_c7_7760_cond;
     t8_MUX_uxn_opcodes_h_l937_c7_7760_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l937_c7_7760_iftrue;
     t8_MUX_uxn_opcodes_h_l937_c7_7760_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l937_c7_7760_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l937_c7_7760_return_output := t8_MUX_uxn_opcodes_h_l937_c7_7760_return_output;

     -- n8_MUX[uxn_opcodes_h_l944_c7_136b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l944_c7_136b_cond <= VAR_n8_MUX_uxn_opcodes_h_l944_c7_136b_cond;
     n8_MUX_uxn_opcodes_h_l944_c7_136b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l944_c7_136b_iftrue;
     n8_MUX_uxn_opcodes_h_l944_c7_136b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l944_c7_136b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l944_c7_136b_return_output := n8_MUX_uxn_opcodes_h_l944_c7_136b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l947_c7_4e93] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_4e93_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_4e93_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_4e93_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_4e93_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue := VAR_MUX_uxn_opcodes_h_l951_c32_7311_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse := VAR_n8_MUX_uxn_opcodes_h_l944_c7_136b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_136b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l947_c7_4e93_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l944_c7_136b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l953_c7_e2b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_136b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l947_c7_4e93_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_136b_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l947_c7_4e93_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l937_c7_7760_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l944_c7_136b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_136b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_136b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_136b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_136b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_136b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_136b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_136b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_136b_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l944_c7_136b] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l944_c7_136b_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_136b_cond;
     result_stack_value_MUX_uxn_opcodes_h_l944_c7_136b_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_136b_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l944_c7_136b_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_136b_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_136b_return_output := result_stack_value_MUX_uxn_opcodes_h_l944_c7_136b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l947_c7_4e93] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_4e93_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_4e93_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_4e93_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_4e93_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l947_c7_4e93] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_4e93_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_4e93_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_4e93_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_4e93_return_output;

     -- t8_MUX[uxn_opcodes_h_l931_c2_d2f3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l931_c2_d2f3_cond <= VAR_t8_MUX_uxn_opcodes_h_l931_c2_d2f3_cond;
     t8_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue;
     t8_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output := t8_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output;

     -- n8_MUX[uxn_opcodes_h_l940_c7_6abe] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l940_c7_6abe_cond <= VAR_n8_MUX_uxn_opcodes_h_l940_c7_6abe_cond;
     n8_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue;
     n8_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l940_c7_6abe_return_output := n8_MUX_uxn_opcodes_h_l940_c7_6abe_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l947_c7_4e93] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_4e93_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_4e93_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_4e93_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_4e93_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_4e93_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_4e93_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l940_c7_6abe] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_6abe_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_6abe_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_6abe_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_6abe_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l944_c7_136b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_136b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_136b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_136b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_136b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_136b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_136b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_136b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_136b_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l937_c7_7760_iffalse := VAR_n8_MUX_uxn_opcodes_h_l940_c7_6abe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_136b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l947_c7_4e93_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l944_c7_136b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l937_c7_7760_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l940_c7_6abe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_136b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l947_c7_4e93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_136b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l947_c7_4e93_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l944_c7_136b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l944_c7_136b_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l944_c7_136b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_136b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_136b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_136b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_136b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_136b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_136b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_136b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_136b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l944_c7_136b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_136b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_136b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_136b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_136b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_136b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_136b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_136b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_136b_return_output;

     -- n8_MUX[uxn_opcodes_h_l937_c7_7760] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l937_c7_7760_cond <= VAR_n8_MUX_uxn_opcodes_h_l937_c7_7760_cond;
     n8_MUX_uxn_opcodes_h_l937_c7_7760_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l937_c7_7760_iftrue;
     n8_MUX_uxn_opcodes_h_l937_c7_7760_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l937_c7_7760_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l937_c7_7760_return_output := n8_MUX_uxn_opcodes_h_l937_c7_7760_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l940_c7_6abe] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6abe_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6abe_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6abe_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6abe_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l940_c7_6abe] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l940_c7_6abe_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_6abe_cond;
     result_stack_value_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_6abe_return_output := result_stack_value_MUX_uxn_opcodes_h_l940_c7_6abe_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l944_c7_136b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_136b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_136b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_136b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_136b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_136b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_136b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_136b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_136b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l940_c7_6abe] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6abe_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6abe_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6abe_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6abe_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l937_c7_7760] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l937_c7_7760_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l937_c7_7760_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l937_c7_7760_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l937_c7_7760_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l937_c7_7760_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l937_c7_7760_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l937_c7_7760_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l937_c7_7760_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse := VAR_n8_MUX_uxn_opcodes_h_l937_c7_7760_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l944_c7_136b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l937_c7_7760_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l940_c7_6abe_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l937_c7_7760_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l944_c7_136b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l944_c7_136b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_7760_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l940_c7_6abe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l937_c7_7760_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l940_c7_6abe_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l931_c2_d2f3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l931_c2_d2f3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l931_c2_d2f3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output;

     -- n8_MUX[uxn_opcodes_h_l931_c2_d2f3] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l931_c2_d2f3_cond <= VAR_n8_MUX_uxn_opcodes_h_l931_c2_d2f3_cond;
     n8_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue;
     n8_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output := n8_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l940_c7_6abe] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6abe_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6abe_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6abe_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6abe_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l937_c7_7760] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l937_c7_7760_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l937_c7_7760_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l937_c7_7760_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l937_c7_7760_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l937_c7_7760_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l937_c7_7760_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l937_c7_7760_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l937_c7_7760_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l940_c7_6abe] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6abe_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6abe_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6abe_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6abe_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l937_c7_7760] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l937_c7_7760_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l937_c7_7760_cond;
     result_stack_value_MUX_uxn_opcodes_h_l937_c7_7760_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l937_c7_7760_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l937_c7_7760_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l937_c7_7760_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l937_c7_7760_return_output := result_stack_value_MUX_uxn_opcodes_h_l937_c7_7760_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l940_c7_6abe] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_6abe_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_6abe_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_6abe_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_6abe_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_6abe_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_6abe_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l937_c7_7760] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_7760_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_7760_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_7760_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_7760_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_7760_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_7760_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_7760_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_7760_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_7760_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l940_c7_6abe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l937_c7_7760_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_7760_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l940_c7_6abe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_7760_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l940_c7_6abe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l937_c7_7760_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l937_c7_7760_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l931_c2_d2f3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l937_c7_7760] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_7760_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_7760_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_7760_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_7760_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_7760_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_7760_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_7760_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_7760_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l937_c7_7760] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_7760_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_7760_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_7760_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_7760_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_7760_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_7760_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_7760_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_7760_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l937_c7_7760] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_7760_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_7760_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_7760_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_7760_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_7760_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_7760_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_7760_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_7760_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l931_c2_d2f3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c2_d2f3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c2_d2f3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l931_c2_d2f3] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l931_c2_d2f3_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c2_d2f3_cond;
     result_stack_value_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output := result_stack_value_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l937_c7_7760_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l937_c7_7760_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l937_c7_7760_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l931_c2_d2f3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l931_c2_d2f3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c2_d2f3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l931_c2_d2f3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l931_c2_d2f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l931_c2_d2f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c2_d2f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c2_d2f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c2_d2f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l964_l927_DUPLICATE_b4d7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l964_l927_DUPLICATE_b4d7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l931_c2_d2f3_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l964_l927_DUPLICATE_b4d7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l964_l927_DUPLICATE_b4d7_return_output;
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
