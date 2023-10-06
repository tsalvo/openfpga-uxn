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
entity and_0CLK_fd2391e7 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and_0CLK_fd2391e7;
architecture arch of and_0CLK_fd2391e7 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1032_c6_e742]
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c1_912c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_912c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_912c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_912c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_912c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1032_c2_ca7d]
signal t8_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1032_c2_ca7d]
signal n8_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1032_c2_ca7d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1032_c2_ca7d]
signal result_stack_value_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1032_c2_ca7d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1032_c2_ca7d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1032_c2_ca7d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1032_c2_ca7d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1032_c2_ca7d]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1033_c3_7f6c[uxn_opcodes_h_l1033_c3_7f6c]
signal printf_uxn_opcodes_h_l1033_c3_7f6c_uxn_opcodes_h_l1033_c3_7f6c_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_b104]
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1038_c7_5d0a]
signal t8_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1038_c7_5d0a]
signal n8_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1038_c7_5d0a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1038_c7_5d0a]
signal result_stack_value_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1038_c7_5d0a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1038_c7_5d0a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1038_c7_5d0a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1038_c7_5d0a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1038_c7_5d0a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_fee3]
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1041_c7_4493]
signal t8_MUX_uxn_opcodes_h_l1041_c7_4493_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1041_c7_4493_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1041_c7_4493]
signal n8_MUX_uxn_opcodes_h_l1041_c7_4493_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1041_c7_4493_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1041_c7_4493]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1041_c7_4493_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1041_c7_4493_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1041_c7_4493]
signal result_stack_value_MUX_uxn_opcodes_h_l1041_c7_4493_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1041_c7_4493_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1041_c7_4493]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_4493_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_4493_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1041_c7_4493]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_4493_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_4493_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1041_c7_4493]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_4493_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_4493_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1041_c7_4493]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_4493_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_4493_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1041_c7_4493]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1041_c7_4493_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1041_c7_4493_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1045_c11_28f8]
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_28f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_28f8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1045_c11_28f8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1045_c7_0c62]
signal n8_MUX_uxn_opcodes_h_l1045_c7_0c62_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1045_c7_0c62]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1045_c7_0c62]
signal result_stack_value_MUX_uxn_opcodes_h_l1045_c7_0c62_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1045_c7_0c62]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_0c62_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1045_c7_0c62]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1045_c7_0c62]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_0c62_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1045_c7_0c62]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_0c62_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1045_c7_0c62]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_0c62_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1048_c11_e498]
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_e498_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_e498_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1048_c11_e498_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1048_c7_e760]
signal n8_MUX_uxn_opcodes_h_l1048_c7_e760_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1048_c7_e760_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1048_c7_e760]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_e760_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_e760_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1048_c7_e760]
signal result_stack_value_MUX_uxn_opcodes_h_l1048_c7_e760_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1048_c7_e760_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1048_c7_e760]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_e760_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_e760_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1048_c7_e760]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_e760_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_e760_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1048_c7_e760]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_e760_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_e760_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1048_c7_e760]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_e760_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_e760_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1048_c7_e760]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_e760_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_e760_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1052_c32_deef]
signal BIN_OP_AND_uxn_opcodes_h_l1052_c32_deef_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1052_c32_deef_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1052_c32_deef_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1052_c32_e2eb]
signal BIN_OP_GT_uxn_opcodes_h_l1052_c32_e2eb_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1052_c32_e2eb_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1052_c32_e2eb_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1052_c32_cf1b]
signal MUX_uxn_opcodes_h_l1052_c32_cf1b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1052_c32_cf1b_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1052_c32_cf1b_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1052_c32_cf1b_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_2822]
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2822_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2822_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2822_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1054_c7_c321]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1054_c7_c321_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1054_c7_c321_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1054_c7_c321]
signal result_stack_value_MUX_uxn_opcodes_h_l1054_c7_c321_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1054_c7_c321_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1054_c7_c321]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_c321_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_c321_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1054_c7_c321]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_c321_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_c321_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1054_c7_c321]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_c321_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_c321_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1058_c24_fc75]
signal BIN_OP_AND_uxn_opcodes_h_l1058_c24_fc75_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1058_c24_fc75_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1058_c24_fc75_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1060_c11_c626]
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_c626_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_c626_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1060_c11_c626_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1060_c7_b68f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_b68f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_b68f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_b68f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_b68f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1060_c7_b68f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_b68f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_b68f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_b68f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_b68f_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742
BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742_left,
BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742_right,
BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_912c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_912c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_912c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_912c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_912c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_912c_return_output);

-- t8_MUX_uxn_opcodes_h_l1032_c2_ca7d
t8_MUX_uxn_opcodes_h_l1032_c2_ca7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond,
t8_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue,
t8_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse,
t8_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output);

-- n8_MUX_uxn_opcodes_h_l1032_c2_ca7d
n8_MUX_uxn_opcodes_h_l1032_c2_ca7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond,
n8_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue,
n8_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse,
n8_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d
result_is_sp_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1032_c2_ca7d
result_stack_value_MUX_uxn_opcodes_h_l1032_c2_ca7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond,
result_stack_value_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1032_c2_ca7d
result_is_stack_write_MUX_uxn_opcodes_h_l1032_c2_ca7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1032_c2_ca7d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1032_c2_ca7d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1032_c2_ca7d
result_is_opc_done_MUX_uxn_opcodes_h_l1032_c2_ca7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1032_c2_ca7d
result_is_stack_read_MUX_uxn_opcodes_h_l1032_c2_ca7d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output);

-- printf_uxn_opcodes_h_l1033_c3_7f6c_uxn_opcodes_h_l1033_c3_7f6c
printf_uxn_opcodes_h_l1033_c3_7f6c_uxn_opcodes_h_l1033_c3_7f6c : entity work.printf_uxn_opcodes_h_l1033_c3_7f6c_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1033_c3_7f6c_uxn_opcodes_h_l1033_c3_7f6c_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104_left,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104_right,
BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104_return_output);

-- t8_MUX_uxn_opcodes_h_l1038_c7_5d0a
t8_MUX_uxn_opcodes_h_l1038_c7_5d0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond,
t8_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue,
t8_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse,
t8_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output);

-- n8_MUX_uxn_opcodes_h_l1038_c7_5d0a
n8_MUX_uxn_opcodes_h_l1038_c7_5d0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond,
n8_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue,
n8_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse,
n8_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a
result_is_sp_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1038_c7_5d0a
result_stack_value_MUX_uxn_opcodes_h_l1038_c7_5d0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_5d0a
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_5d0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_5d0a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_5d0a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_5d0a
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_5d0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1038_c7_5d0a
result_is_stack_read_MUX_uxn_opcodes_h_l1038_c7_5d0a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3_left,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3_right,
BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3_return_output);

-- t8_MUX_uxn_opcodes_h_l1041_c7_4493
t8_MUX_uxn_opcodes_h_l1041_c7_4493 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1041_c7_4493_cond,
t8_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue,
t8_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse,
t8_MUX_uxn_opcodes_h_l1041_c7_4493_return_output);

-- n8_MUX_uxn_opcodes_h_l1041_c7_4493
n8_MUX_uxn_opcodes_h_l1041_c7_4493 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1041_c7_4493_cond,
n8_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue,
n8_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse,
n8_MUX_uxn_opcodes_h_l1041_c7_4493_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1041_c7_4493
result_is_sp_shift_MUX_uxn_opcodes_h_l1041_c7_4493 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1041_c7_4493_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1041_c7_4493_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1041_c7_4493
result_stack_value_MUX_uxn_opcodes_h_l1041_c7_4493 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1041_c7_4493_cond,
result_stack_value_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1041_c7_4493_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_4493
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_4493 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_4493_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_4493_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_4493
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_4493 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_4493_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_4493_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_4493
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_4493 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_4493_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_4493_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_4493
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_4493 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_4493_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_4493_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1041_c7_4493
result_is_stack_read_MUX_uxn_opcodes_h_l1041_c7_4493 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1041_c7_4493_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1041_c7_4493_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1045_c11_28f8
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_28f8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_28f8_left,
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_28f8_right,
BIN_OP_EQ_uxn_opcodes_h_l1045_c11_28f8_return_output);

-- n8_MUX_uxn_opcodes_h_l1045_c7_0c62
n8_MUX_uxn_opcodes_h_l1045_c7_0c62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1045_c7_0c62_cond,
n8_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue,
n8_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse,
n8_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_0c62
result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_0c62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1045_c7_0c62
result_stack_value_MUX_uxn_opcodes_h_l1045_c7_0c62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1045_c7_0c62_cond,
result_stack_value_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_0c62
result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_0c62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_0c62_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_0c62
result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_0c62 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_0c62
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_0c62 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_0c62_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_0c62
result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_0c62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_0c62_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_0c62
result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_0c62 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_0c62_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1048_c11_e498
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_e498 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_e498_left,
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_e498_right,
BIN_OP_EQ_uxn_opcodes_h_l1048_c11_e498_return_output);

-- n8_MUX_uxn_opcodes_h_l1048_c7_e760
n8_MUX_uxn_opcodes_h_l1048_c7_e760 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1048_c7_e760_cond,
n8_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue,
n8_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse,
n8_MUX_uxn_opcodes_h_l1048_c7_e760_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_e760
result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_e760 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_e760_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_e760_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1048_c7_e760
result_stack_value_MUX_uxn_opcodes_h_l1048_c7_e760 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1048_c7_e760_cond,
result_stack_value_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1048_c7_e760_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_e760
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_e760 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_e760_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_e760_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_e760
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_e760 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_e760_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_e760_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_e760
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_e760 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_e760_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_e760_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_e760
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_e760 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_e760_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_e760_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_e760
result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_e760 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_e760_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_e760_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1052_c32_deef
BIN_OP_AND_uxn_opcodes_h_l1052_c32_deef : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1052_c32_deef_left,
BIN_OP_AND_uxn_opcodes_h_l1052_c32_deef_right,
BIN_OP_AND_uxn_opcodes_h_l1052_c32_deef_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1052_c32_e2eb
BIN_OP_GT_uxn_opcodes_h_l1052_c32_e2eb : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1052_c32_e2eb_left,
BIN_OP_GT_uxn_opcodes_h_l1052_c32_e2eb_right,
BIN_OP_GT_uxn_opcodes_h_l1052_c32_e2eb_return_output);

-- MUX_uxn_opcodes_h_l1052_c32_cf1b
MUX_uxn_opcodes_h_l1052_c32_cf1b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1052_c32_cf1b_cond,
MUX_uxn_opcodes_h_l1052_c32_cf1b_iftrue,
MUX_uxn_opcodes_h_l1052_c32_cf1b_iffalse,
MUX_uxn_opcodes_h_l1052_c32_cf1b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2822
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2822 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2822_left,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2822_right,
BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2822_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1054_c7_c321
result_is_sp_shift_MUX_uxn_opcodes_h_l1054_c7_c321 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1054_c7_c321_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1054_c7_c321_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1054_c7_c321
result_stack_value_MUX_uxn_opcodes_h_l1054_c7_c321 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1054_c7_c321_cond,
result_stack_value_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1054_c7_c321_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_c321
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_c321 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_c321_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_c321_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_c321
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_c321 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_c321_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_c321_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_c321
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_c321 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_c321_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_c321_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1058_c24_fc75
BIN_OP_AND_uxn_opcodes_h_l1058_c24_fc75 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1058_c24_fc75_left,
BIN_OP_AND_uxn_opcodes_h_l1058_c24_fc75_right,
BIN_OP_AND_uxn_opcodes_h_l1058_c24_fc75_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1060_c11_c626
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_c626 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_c626_left,
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_c626_right,
BIN_OP_EQ_uxn_opcodes_h_l1060_c11_c626_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_b68f
result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_b68f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_b68f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_b68f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_b68f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_b68f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_b68f
result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_b68f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_b68f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_b68f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_b68f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_b68f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_912c_return_output,
 t8_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output,
 n8_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104_return_output,
 t8_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output,
 n8_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3_return_output,
 t8_MUX_uxn_opcodes_h_l1041_c7_4493_return_output,
 n8_MUX_uxn_opcodes_h_l1041_c7_4493_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1041_c7_4493_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1041_c7_4493_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_4493_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_4493_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_4493_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_4493_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1041_c7_4493_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1045_c11_28f8_return_output,
 n8_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1048_c11_e498_return_output,
 n8_MUX_uxn_opcodes_h_l1048_c7_e760_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_e760_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1048_c7_e760_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_e760_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_e760_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_e760_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_e760_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_e760_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1052_c32_deef_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1052_c32_e2eb_return_output,
 MUX_uxn_opcodes_h_l1052_c32_cf1b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2822_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1054_c7_c321_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1054_c7_c321_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_c321_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_c321_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_c321_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1058_c24_fc75_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1060_c11_c626_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_b68f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_b68f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_912c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_912c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_912c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_912c_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_d656 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1033_c3_7f6c_uxn_opcodes_h_l1033_c3_7f6c_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1041_c7_4493_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1041_c7_4493_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1041_c7_4493_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1041_c7_4493_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_4493_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_4493_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1039_c3_9885 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_4493_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_4493_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1041_c7_4493_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1041_c7_4493_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1041_c7_4493_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1041_c7_4493_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1041_c7_4493_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_4493_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_4493_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1043_c3_de83 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_4493_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_4493_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1041_c7_4493_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_28f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_28f8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_28f8_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1048_c7_e760_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1045_c7_0c62_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_e760_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_e760_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_0c62_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_e760_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_0c62_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_e760_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1046_c3_32f4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_e760_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_0c62_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_e760_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_0c62_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_e760_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_0c62_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_e498_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_e498_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_e498_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1048_c7_e760_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1054_c7_c321_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_e760_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1054_c7_c321_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_e760_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_c321_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_e760_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_e760_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_c321_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_e760_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_c321_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_e760_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_e760_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1052_c32_cf1b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1052_c32_cf1b_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1052_c32_cf1b_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1052_c32_deef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1052_c32_deef_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1052_c32_deef_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1052_c32_e2eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1052_c32_e2eb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1052_c32_e2eb_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1052_c32_cf1b_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2822_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2822_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2822_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1054_c7_c321_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1054_c7_c321_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_b68f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_c321_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1057_c3_bb90 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_c321_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_b68f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_c321_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1058_c24_fc75_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1058_c24_fc75_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1058_c24_fc75_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_c626_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_c626_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_c626_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_b68f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_b68f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_b68f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_b68f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_b68f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_b68f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1054_DUPLICATE_44e0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1054_l1048_DUPLICATE_c674_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1060_l1048_DUPLICATE_171c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1048_DUPLICATE_849a_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1060_l1054_l1048_DUPLICATE_5800_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1041_l1045_l1038_l1048_DUPLICATE_eacc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1054_l1048_DUPLICATE_b618_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1065_l1028_DUPLICATE_454f_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1043_c3_de83 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1043_c3_de83;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_912c_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1046_c3_32f4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1046_c3_32f4;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1052_c32_deef_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104_right := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1052_c32_cf1b_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2822_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_e498_right := to_unsigned(4, 3);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1052_c32_cf1b_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_d656 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1035_c3_d656;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1052_c32_e2eb_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_b68f_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_b68f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1057_c3_bb90 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1057_c3_bb90;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1039_c3_9885 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1039_c3_9885;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_c626_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_28f8_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_912c_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1052_c32_deef_left := VAR_ins;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1058_c24_fc75_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_28f8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_e498_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2822_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_c626_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1058_c24_fc75_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1060_c11_c626] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1060_c11_c626_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_c626_left;
     BIN_OP_EQ_uxn_opcodes_h_l1060_c11_c626_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_c626_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_c626_return_output := BIN_OP_EQ_uxn_opcodes_h_l1060_c11_c626_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1054_c11_2822] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2822_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2822_left;
     BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2822_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2822_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2822_return_output := BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2822_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1041_c11_fee3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1032_c6_e742] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742_left;
     BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742_return_output := BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1054_l1048_DUPLICATE_c674 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1054_l1048_DUPLICATE_c674_return_output := result.stack_value;

     -- BIN_OP_AND[uxn_opcodes_h_l1058_c24_fc75] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1058_c24_fc75_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1058_c24_fc75_left;
     BIN_OP_AND_uxn_opcodes_h_l1058_c24_fc75_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1058_c24_fc75_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1058_c24_fc75_return_output := BIN_OP_AND_uxn_opcodes_h_l1058_c24_fc75_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1052_c32_deef] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1052_c32_deef_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1052_c32_deef_left;
     BIN_OP_AND_uxn_opcodes_h_l1052_c32_deef_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1052_c32_deef_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1052_c32_deef_return_output := BIN_OP_AND_uxn_opcodes_h_l1052_c32_deef_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1060_l1054_l1048_DUPLICATE_5800 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1060_l1054_l1048_DUPLICATE_5800_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1041_l1045_l1038_l1048_DUPLICATE_eacc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1041_l1045_l1038_l1048_DUPLICATE_eacc_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1045_c11_28f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1045_c11_28f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_28f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1045_c11_28f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_28f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_28f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1045_c11_28f8_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1048_DUPLICATE_849a LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1048_DUPLICATE_849a_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1054_l1048_DUPLICATE_b618 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1054_l1048_DUPLICATE_b618_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1060_l1048_DUPLICATE_171c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1060_l1048_DUPLICATE_171c_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1054_DUPLICATE_44e0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1054_DUPLICATE_44e0_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1038_c11_b104] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104_left;
     BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104_return_output := BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1048_c11_e498] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1048_c11_e498_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_e498_left;
     BIN_OP_EQ_uxn_opcodes_h_l1048_c11_e498_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_e498_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_e498_return_output := BIN_OP_EQ_uxn_opcodes_h_l1048_c11_e498_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1052_c32_e2eb_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1052_c32_deef_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l1058_c24_fc75_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_912c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1032_c6_e742_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1038_c11_b104_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1041_c7_4493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_4493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1041_c7_4493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1041_c7_4493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_4493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_4493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_4493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1041_c7_4493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1041_c7_4493_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1041_c11_fee3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1045_c7_0c62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_28f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_0c62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_28f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_28f8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_0c62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_28f8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_0c62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_28f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_28f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_0c62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_28f8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_0c62_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1045_c11_28f8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1048_c7_e760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_e498_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_e760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_e498_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_e760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_e498_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_e760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_e498_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_e760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_e498_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_e760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_e498_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_e760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_e498_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_e760_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1048_c11_e498_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_c321_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2822_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1054_c7_c321_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2822_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_c321_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2822_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_c321_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2822_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1054_c7_c321_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1054_c11_2822_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_b68f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_c626_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_b68f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1060_c11_c626_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1048_DUPLICATE_849a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1048_DUPLICATE_849a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1048_DUPLICATE_849a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1048_DUPLICATE_849a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1048_DUPLICATE_849a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1060_l1054_l1048_DUPLICATE_5800_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1060_l1054_l1048_DUPLICATE_5800_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1060_l1054_l1048_DUPLICATE_5800_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1060_l1054_l1048_DUPLICATE_5800_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1060_l1054_l1048_DUPLICATE_5800_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_b68f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1060_l1054_l1048_DUPLICATE_5800_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1054_DUPLICATE_44e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1054_DUPLICATE_44e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1054_DUPLICATE_44e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1054_DUPLICATE_44e0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1054_DUPLICATE_44e0_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1041_l1045_l1038_l1048_DUPLICATE_eacc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1041_l1045_l1038_l1048_DUPLICATE_eacc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1041_l1045_l1038_l1048_DUPLICATE_eacc_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1041_l1045_l1038_l1048_DUPLICATE_eacc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1060_l1048_DUPLICATE_171c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1060_l1048_DUPLICATE_171c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1060_l1048_DUPLICATE_171c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1060_l1048_DUPLICATE_171c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1060_l1048_DUPLICATE_171c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_b68f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1060_l1048_DUPLICATE_171c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1054_l1048_DUPLICATE_b618_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1054_l1048_DUPLICATE_b618_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1054_l1048_DUPLICATE_c674_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1054_l1048_DUPLICATE_c674_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1054_l1048_DUPLICATE_c674_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1054_l1048_DUPLICATE_c674_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1054_l1048_DUPLICATE_c674_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1045_l1041_l1038_l1032_l1054_l1048_DUPLICATE_c674_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1032_c1_912c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_912c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_912c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_912c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_912c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_912c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_912c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_912c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_912c_return_output;

     -- n8_MUX[uxn_opcodes_h_l1048_c7_e760] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1048_c7_e760_cond <= VAR_n8_MUX_uxn_opcodes_h_l1048_c7_e760_cond;
     n8_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue;
     n8_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1048_c7_e760_return_output := n8_MUX_uxn_opcodes_h_l1048_c7_e760_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1060_c7_b68f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_b68f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_b68f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_b68f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_b68f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_b68f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_b68f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_b68f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_b68f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1054_c7_c321] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1054_c7_c321_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1054_c7_c321_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1054_c7_c321_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1054_c7_c321_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1054_c7_c321] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1054_c7_c321_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1054_c7_c321_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1054_c7_c321_return_output := result_stack_value_MUX_uxn_opcodes_h_l1054_c7_c321_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1048_c7_e760] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_e760_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_e760_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_e760_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_e760_return_output;

     -- t8_MUX[uxn_opcodes_h_l1041_c7_4493] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1041_c7_4493_cond <= VAR_t8_MUX_uxn_opcodes_h_l1041_c7_4493_cond;
     t8_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue;
     t8_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1041_c7_4493_return_output := t8_MUX_uxn_opcodes_h_l1041_c7_4493_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1054_c7_c321] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_c321_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_c321_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_c321_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_c321_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1052_c32_e2eb] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1052_c32_e2eb_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1052_c32_e2eb_left;
     BIN_OP_GT_uxn_opcodes_h_l1052_c32_e2eb_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1052_c32_e2eb_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1052_c32_e2eb_return_output := BIN_OP_GT_uxn_opcodes_h_l1052_c32_e2eb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1060_c7_b68f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_b68f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_b68f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_b68f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_b68f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_b68f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_b68f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_b68f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_b68f_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1052_c32_cf1b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1052_c32_e2eb_return_output;
     VAR_printf_uxn_opcodes_h_l1033_c3_7f6c_uxn_opcodes_h_l1033_c3_7f6c_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1032_c1_912c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1048_c7_e760_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1060_c7_b68f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1054_c7_c321_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1048_c7_e760_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1060_c7_b68f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1054_c7_c321_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1054_c7_c321_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1041_c7_4493_return_output;
     -- t8_MUX[uxn_opcodes_h_l1038_c7_5d0a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond <= VAR_t8_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond;
     t8_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue;
     t8_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output := t8_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output;

     -- n8_MUX[uxn_opcodes_h_l1045_c7_0c62] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1045_c7_0c62_cond <= VAR_n8_MUX_uxn_opcodes_h_l1045_c7_0c62_cond;
     n8_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue;
     n8_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output := n8_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1048_c7_e760] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_e760_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_e760_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_e760_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_e760_return_output;

     -- printf_uxn_opcodes_h_l1033_c3_7f6c[uxn_opcodes_h_l1033_c3_7f6c] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1033_c3_7f6c_uxn_opcodes_h_l1033_c3_7f6c_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1033_c3_7f6c_uxn_opcodes_h_l1033_c3_7f6c_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1045_c7_0c62] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_0c62_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_0c62_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1054_c7_c321] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_c321_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_c321_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_c321_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_c321_return_output;

     -- MUX[uxn_opcodes_h_l1052_c32_cf1b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1052_c32_cf1b_cond <= VAR_MUX_uxn_opcodes_h_l1052_c32_cf1b_cond;
     MUX_uxn_opcodes_h_l1052_c32_cf1b_iftrue <= VAR_MUX_uxn_opcodes_h_l1052_c32_cf1b_iftrue;
     MUX_uxn_opcodes_h_l1052_c32_cf1b_iffalse <= VAR_MUX_uxn_opcodes_h_l1052_c32_cf1b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1052_c32_cf1b_return_output := MUX_uxn_opcodes_h_l1052_c32_cf1b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1048_c7_e760] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_e760_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_e760_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_e760_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_e760_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1048_c7_e760] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1048_c7_e760_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_e760_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_e760_return_output := result_stack_value_MUX_uxn_opcodes_h_l1048_c7_e760_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1054_c7_c321] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_c321_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_c321_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_c321_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_c321_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_c321_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_c321_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue := VAR_MUX_uxn_opcodes_h_l1052_c32_cf1b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1054_c7_c321_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1048_c7_e760_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1054_c7_c321_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1048_c7_e760_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1048_c7_e760_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1045_c7_0c62] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1045_c7_0c62_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_0c62_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output := result_stack_value_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1041_c7_4493] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1041_c7_4493_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1041_c7_4493_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1041_c7_4493_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1041_c7_4493_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1048_c7_e760] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_e760_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_e760_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_e760_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_e760_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1045_c7_0c62] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_0c62_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_0c62_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1048_c7_e760] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_e760_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_e760_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_e760_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_e760_return_output;

     -- t8_MUX[uxn_opcodes_h_l1032_c2_ca7d] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond <= VAR_t8_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond;
     t8_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue;
     t8_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output := t8_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output;

     -- n8_MUX[uxn_opcodes_h_l1041_c7_4493] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1041_c7_4493_cond <= VAR_n8_MUX_uxn_opcodes_h_l1041_c7_4493_cond;
     n8_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue;
     n8_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1041_c7_4493_return_output := n8_MUX_uxn_opcodes_h_l1041_c7_4493_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1045_c7_0c62] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1048_c7_e760] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_e760_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_e760_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_e760_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_e760_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_e760_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_e760_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1041_c7_4493_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1048_c7_e760_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1041_c7_4493_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1048_c7_e760_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1048_c7_e760_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1041_c7_4493] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_4493_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_4493_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_4493_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_4493_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1045_c7_0c62] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_0c62_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_0c62_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1041_c7_4493] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1041_c7_4493_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1041_c7_4493_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1041_c7_4493_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1041_c7_4493_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1038_c7_5d0a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output;

     -- n8_MUX[uxn_opcodes_h_l1038_c7_5d0a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond <= VAR_n8_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond;
     n8_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue;
     n8_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output := n8_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1045_c7_0c62] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_0c62_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_0c62_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1041_c7_4493] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1041_c7_4493_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1041_c7_4493_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1041_c7_4493_return_output := result_stack_value_MUX_uxn_opcodes_h_l1041_c7_4493_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1045_c7_0c62] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1041_c7_4493_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1045_c7_0c62_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1041_c7_4493_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1041_c7_4493_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1041_c7_4493] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_4493_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_4493_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_4493_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_4493_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1038_c7_5d0a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1041_c7_4493] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_4493_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_4493_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_4493_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_4493_return_output;

     -- n8_MUX[uxn_opcodes_h_l1032_c2_ca7d] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond <= VAR_n8_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond;
     n8_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue;
     n8_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output := n8_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1032_c2_ca7d] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1038_c7_5d0a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1038_c7_5d0a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1041_c7_4493] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_4493_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_4493_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_4493_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_4493_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_4493_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_4493_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1041_c7_4493_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1041_c7_4493_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1041_c7_4493_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1038_c7_5d0a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1032_c2_ca7d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output := result_stack_value_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1038_c7_5d0a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1032_c2_ca7d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1038_c7_5d0a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_5d0a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_5d0a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_5d0a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1032_c2_ca7d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1038_c7_5d0a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1032_c2_ca7d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1032_c2_ca7d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1032_c2_ca7d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1032_c2_ca7d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1032_c2_ca7d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1032_c2_ca7d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1065_l1028_DUPLICATE_454f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1065_l1028_DUPLICATE_454f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_287e(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1032_c2_ca7d_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1065_l1028_DUPLICATE_454f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_287e_uxn_opcodes_h_l1065_l1028_DUPLICATE_454f_return_output;
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
