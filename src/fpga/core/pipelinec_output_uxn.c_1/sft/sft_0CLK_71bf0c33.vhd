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
-- Submodules: 68
entity sft_0CLK_71bf0c33 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft_0CLK_71bf0c33;
architecture arch of sft_0CLK_71bf0c33 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2404_c6_591a]
signal BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2404_c1_7cec]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2404_c1_7cec_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2404_c1_7cec_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2404_c1_7cec_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2404_c1_7cec_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2404_c2_1bf4]
signal t8_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2404_c2_1bf4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2404_c2_1bf4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2404_c2_1bf4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2404_c2_1bf4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2404_c2_1bf4]
signal result_stack_value_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2404_c2_1bf4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2404_c2_1bf4]
signal n8_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2404_c2_1bf4]
signal tmp8_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2405_c3_a769[uxn_opcodes_h_l2405_c3_a769]
signal printf_uxn_opcodes_h_l2405_c3_a769_uxn_opcodes_h_l2405_c3_a769_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2409_c11_17c6]
signal BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2409_c7_1ae2]
signal t8_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2409_c7_1ae2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2409_c7_1ae2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2409_c7_1ae2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2409_c7_1ae2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2409_c7_1ae2]
signal result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2409_c7_1ae2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2409_c7_1ae2]
signal n8_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2409_c7_1ae2]
signal tmp8_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2412_c11_954a]
signal BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2412_c7_86da]
signal t8_MUX_uxn_opcodes_h_l2412_c7_86da_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2412_c7_86da_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2412_c7_86da]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_86da_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_86da_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2412_c7_86da]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_86da_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_86da_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2412_c7_86da]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_86da_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_86da_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2412_c7_86da]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_86da_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_86da_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2412_c7_86da]
signal result_stack_value_MUX_uxn_opcodes_h_l2412_c7_86da_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2412_c7_86da_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2412_c7_86da]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_86da_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_86da_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2412_c7_86da]
signal n8_MUX_uxn_opcodes_h_l2412_c7_86da_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2412_c7_86da_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2412_c7_86da]
signal tmp8_MUX_uxn_opcodes_h_l2412_c7_86da_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2412_c7_86da_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2416_c11_d267]
signal BIN_OP_EQ_uxn_opcodes_h_l2416_c11_d267_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2416_c11_d267_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2416_c11_d267_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2416_c7_02b9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_02b9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2416_c7_02b9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_02b9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2416_c7_02b9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2416_c7_02b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_02b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2416_c7_02b9]
signal result_stack_value_MUX_uxn_opcodes_h_l2416_c7_02b9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2416_c7_02b9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2416_c7_02b9]
signal n8_MUX_uxn_opcodes_h_l2416_c7_02b9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2416_c7_02b9]
signal tmp8_MUX_uxn_opcodes_h_l2416_c7_02b9_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2419_c11_c67c]
signal BIN_OP_EQ_uxn_opcodes_h_l2419_c11_c67c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2419_c11_c67c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2419_c11_c67c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2419_c7_6fb4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2419_c7_6fb4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2419_c7_6fb4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2419_c7_6fb4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2419_c7_6fb4]
signal result_stack_value_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2419_c7_6fb4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2419_c7_6fb4]
signal n8_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2419_c7_6fb4]
signal tmp8_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2422_c32_1664]
signal BIN_OP_AND_uxn_opcodes_h_l2422_c32_1664_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2422_c32_1664_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2422_c32_1664_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2422_c32_726e]
signal BIN_OP_GT_uxn_opcodes_h_l2422_c32_726e_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2422_c32_726e_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2422_c32_726e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2422_c32_c84b]
signal MUX_uxn_opcodes_h_l2422_c32_c84b_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2422_c32_c84b_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2422_c32_c84b_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2422_c32_c84b_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2424_c11_0883]
signal BIN_OP_EQ_uxn_opcodes_h_l2424_c11_0883_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2424_c11_0883_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2424_c11_0883_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2424_c7_4af0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_4af0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2424_c7_4af0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_4af0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2424_c7_4af0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_4af0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2424_c7_4af0]
signal result_stack_value_MUX_uxn_opcodes_h_l2424_c7_4af0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2424_c7_4af0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_4af0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2424_c7_4af0]
signal tmp8_MUX_uxn_opcodes_h_l2424_c7_4af0_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2425_c18_6750]
signal BIN_OP_AND_uxn_opcodes_h_l2425_c18_6750_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2425_c18_6750_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2425_c18_6750_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2425_c11_8eea]
signal BIN_OP_SR_uxn_opcodes_h_l2425_c11_8eea_left : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2425_c11_8eea_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2425_c11_8eea_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2425_c34_0086]
signal CONST_SR_4_uxn_opcodes_h_l2425_c34_0086_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2425_c34_0086_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2425_c11_339d]
signal BIN_OP_SL_uxn_opcodes_h_l2425_c11_339d_left : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2425_c11_339d_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2425_c11_339d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2431_c11_1a41]
signal BIN_OP_EQ_uxn_opcodes_h_l2431_c11_1a41_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2431_c11_1a41_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2431_c11_1a41_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2431_c7_e0fd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2431_c7_e0fd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2431_c7_e0fd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2431_c7_e0fd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2431_c7_e0fd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2431_c7_e0fd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2431_c7_e0fd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2431_c7_e0fd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2431_c7_e0fd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2431_c7_e0fd_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a
BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a_left,
BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a_right,
BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2404_c1_7cec
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2404_c1_7cec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2404_c1_7cec_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2404_c1_7cec_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2404_c1_7cec_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2404_c1_7cec_return_output);

-- t8_MUX_uxn_opcodes_h_l2404_c2_1bf4
t8_MUX_uxn_opcodes_h_l2404_c2_1bf4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond,
t8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue,
t8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse,
t8_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_1bf4
result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_1bf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_1bf4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_1bf4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_1bf4
result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_1bf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2404_c2_1bf4
result_stack_value_MUX_uxn_opcodes_h_l2404_c2_1bf4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond,
result_stack_value_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4
result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output);

-- n8_MUX_uxn_opcodes_h_l2404_c2_1bf4
n8_MUX_uxn_opcodes_h_l2404_c2_1bf4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond,
n8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue,
n8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse,
n8_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2404_c2_1bf4
tmp8_MUX_uxn_opcodes_h_l2404_c2_1bf4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond,
tmp8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue,
tmp8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse,
tmp8_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output);

-- printf_uxn_opcodes_h_l2405_c3_a769_uxn_opcodes_h_l2405_c3_a769
printf_uxn_opcodes_h_l2405_c3_a769_uxn_opcodes_h_l2405_c3_a769 : entity work.printf_uxn_opcodes_h_l2405_c3_a769_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2405_c3_a769_uxn_opcodes_h_l2405_c3_a769_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6
BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6_left,
BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6_right,
BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6_return_output);

-- t8_MUX_uxn_opcodes_h_l2409_c7_1ae2
t8_MUX_uxn_opcodes_h_l2409_c7_1ae2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond,
t8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue,
t8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse,
t8_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1ae2
result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1ae2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1ae2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1ae2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1ae2
result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1ae2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1ae2
result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1ae2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2
result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output);

-- n8_MUX_uxn_opcodes_h_l2409_c7_1ae2
n8_MUX_uxn_opcodes_h_l2409_c7_1ae2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond,
n8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue,
n8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse,
n8_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2409_c7_1ae2
tmp8_MUX_uxn_opcodes_h_l2409_c7_1ae2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond,
tmp8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue,
tmp8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse,
tmp8_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a
BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a_left,
BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a_right,
BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a_return_output);

-- t8_MUX_uxn_opcodes_h_l2412_c7_86da
t8_MUX_uxn_opcodes_h_l2412_c7_86da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2412_c7_86da_cond,
t8_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue,
t8_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse,
t8_MUX_uxn_opcodes_h_l2412_c7_86da_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_86da
result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_86da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_86da_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_86da_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_86da
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_86da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_86da_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_86da_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_86da
result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_86da : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_86da_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_86da_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_86da
result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_86da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_86da_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_86da_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2412_c7_86da
result_stack_value_MUX_uxn_opcodes_h_l2412_c7_86da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2412_c7_86da_cond,
result_stack_value_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2412_c7_86da_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_86da
result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_86da : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_86da_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_86da_return_output);

-- n8_MUX_uxn_opcodes_h_l2412_c7_86da
n8_MUX_uxn_opcodes_h_l2412_c7_86da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2412_c7_86da_cond,
n8_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue,
n8_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse,
n8_MUX_uxn_opcodes_h_l2412_c7_86da_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2412_c7_86da
tmp8_MUX_uxn_opcodes_h_l2412_c7_86da : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2412_c7_86da_cond,
tmp8_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue,
tmp8_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse,
tmp8_MUX_uxn_opcodes_h_l2412_c7_86da_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2416_c11_d267
BIN_OP_EQ_uxn_opcodes_h_l2416_c11_d267 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2416_c11_d267_left,
BIN_OP_EQ_uxn_opcodes_h_l2416_c11_d267_right,
BIN_OP_EQ_uxn_opcodes_h_l2416_c11_d267_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_02b9
result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_02b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_02b9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_02b9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_02b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_02b9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_02b9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_02b9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_02b9
result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_02b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_02b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2416_c7_02b9
result_stack_value_MUX_uxn_opcodes_h_l2416_c7_02b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2416_c7_02b9_cond,
result_stack_value_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_02b9
result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_02b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output);

-- n8_MUX_uxn_opcodes_h_l2416_c7_02b9
n8_MUX_uxn_opcodes_h_l2416_c7_02b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2416_c7_02b9_cond,
n8_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue,
n8_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse,
n8_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2416_c7_02b9
tmp8_MUX_uxn_opcodes_h_l2416_c7_02b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2416_c7_02b9_cond,
tmp8_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue,
tmp8_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse,
tmp8_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2419_c11_c67c
BIN_OP_EQ_uxn_opcodes_h_l2419_c11_c67c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2419_c11_c67c_left,
BIN_OP_EQ_uxn_opcodes_h_l2419_c11_c67c_right,
BIN_OP_EQ_uxn_opcodes_h_l2419_c11_c67c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_6fb4
result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_6fb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_6fb4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_6fb4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4
result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_6fb4
result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_6fb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2419_c7_6fb4
result_stack_value_MUX_uxn_opcodes_h_l2419_c7_6fb4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond,
result_stack_value_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4
result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output);

-- n8_MUX_uxn_opcodes_h_l2419_c7_6fb4
n8_MUX_uxn_opcodes_h_l2419_c7_6fb4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond,
n8_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue,
n8_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse,
n8_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2419_c7_6fb4
tmp8_MUX_uxn_opcodes_h_l2419_c7_6fb4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond,
tmp8_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue,
tmp8_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse,
tmp8_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2422_c32_1664
BIN_OP_AND_uxn_opcodes_h_l2422_c32_1664 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2422_c32_1664_left,
BIN_OP_AND_uxn_opcodes_h_l2422_c32_1664_right,
BIN_OP_AND_uxn_opcodes_h_l2422_c32_1664_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2422_c32_726e
BIN_OP_GT_uxn_opcodes_h_l2422_c32_726e : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2422_c32_726e_left,
BIN_OP_GT_uxn_opcodes_h_l2422_c32_726e_right,
BIN_OP_GT_uxn_opcodes_h_l2422_c32_726e_return_output);

-- MUX_uxn_opcodes_h_l2422_c32_c84b
MUX_uxn_opcodes_h_l2422_c32_c84b : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2422_c32_c84b_cond,
MUX_uxn_opcodes_h_l2422_c32_c84b_iftrue,
MUX_uxn_opcodes_h_l2422_c32_c84b_iffalse,
MUX_uxn_opcodes_h_l2422_c32_c84b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2424_c11_0883
BIN_OP_EQ_uxn_opcodes_h_l2424_c11_0883 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2424_c11_0883_left,
BIN_OP_EQ_uxn_opcodes_h_l2424_c11_0883_right,
BIN_OP_EQ_uxn_opcodes_h_l2424_c11_0883_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_4af0
result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_4af0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_4af0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_4af0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_4af0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_4af0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_4af0
result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_4af0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_4af0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2424_c7_4af0
result_stack_value_MUX_uxn_opcodes_h_l2424_c7_4af0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2424_c7_4af0_cond,
result_stack_value_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_4af0
result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_4af0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_4af0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2424_c7_4af0
tmp8_MUX_uxn_opcodes_h_l2424_c7_4af0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2424_c7_4af0_cond,
tmp8_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue,
tmp8_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse,
tmp8_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2425_c18_6750
BIN_OP_AND_uxn_opcodes_h_l2425_c18_6750 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2425_c18_6750_left,
BIN_OP_AND_uxn_opcodes_h_l2425_c18_6750_right,
BIN_OP_AND_uxn_opcodes_h_l2425_c18_6750_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2425_c11_8eea
BIN_OP_SR_uxn_opcodes_h_l2425_c11_8eea : entity work.BIN_OP_SR_uint8_t_uint8_t_0CLK_25d197a7 port map (
BIN_OP_SR_uxn_opcodes_h_l2425_c11_8eea_left,
BIN_OP_SR_uxn_opcodes_h_l2425_c11_8eea_right,
BIN_OP_SR_uxn_opcodes_h_l2425_c11_8eea_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2425_c34_0086
CONST_SR_4_uxn_opcodes_h_l2425_c34_0086 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2425_c34_0086_x,
CONST_SR_4_uxn_opcodes_h_l2425_c34_0086_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2425_c11_339d
BIN_OP_SL_uxn_opcodes_h_l2425_c11_339d : entity work.BIN_OP_SL_uint8_t_uint8_t_0CLK_10d8c973 port map (
BIN_OP_SL_uxn_opcodes_h_l2425_c11_339d_left,
BIN_OP_SL_uxn_opcodes_h_l2425_c11_339d_right,
BIN_OP_SL_uxn_opcodes_h_l2425_c11_339d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2431_c11_1a41
BIN_OP_EQ_uxn_opcodes_h_l2431_c11_1a41 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2431_c11_1a41_left,
BIN_OP_EQ_uxn_opcodes_h_l2431_c11_1a41_right,
BIN_OP_EQ_uxn_opcodes_h_l2431_c11_1a41_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2431_c7_e0fd
result_is_stack_write_MUX_uxn_opcodes_h_l2431_c7_e0fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2431_c7_e0fd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2431_c7_e0fd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2431_c7_e0fd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2431_c7_e0fd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2431_c7_e0fd
result_is_opc_done_MUX_uxn_opcodes_h_l2431_c7_e0fd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2431_c7_e0fd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2431_c7_e0fd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2431_c7_e0fd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2431_c7_e0fd_return_output);



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
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2404_c1_7cec_return_output,
 t8_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output,
 n8_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output,
 tmp8_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6_return_output,
 t8_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output,
 n8_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output,
 tmp8_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a_return_output,
 t8_MUX_uxn_opcodes_h_l2412_c7_86da_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_86da_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_86da_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_86da_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_86da_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2412_c7_86da_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_86da_return_output,
 n8_MUX_uxn_opcodes_h_l2412_c7_86da_return_output,
 tmp8_MUX_uxn_opcodes_h_l2412_c7_86da_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2416_c11_d267_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output,
 n8_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output,
 tmp8_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2419_c11_c67c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output,
 n8_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output,
 tmp8_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2422_c32_1664_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2422_c32_726e_return_output,
 MUX_uxn_opcodes_h_l2422_c32_c84b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2424_c11_0883_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output,
 tmp8_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2425_c18_6750_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2425_c11_8eea_return_output,
 CONST_SR_4_uxn_opcodes_h_l2425_c34_0086_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2425_c11_339d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2431_c11_1a41_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2431_c7_e0fd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2431_c7_e0fd_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2404_c1_7cec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2404_c1_7cec_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2404_c1_7cec_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2404_c1_7cec_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2406_c3_eb1d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2405_c3_a769_uxn_opcodes_h_l2405_c3_a769_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2412_c7_86da_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_86da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2410_c3_8273 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_86da_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_86da_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_86da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_86da_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_86da_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2412_c7_86da_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2412_c7_86da_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2412_c7_86da_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_86da_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2414_c3_22b4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_86da_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_86da_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_86da_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_86da_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_86da_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2412_c7_86da_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2412_c7_86da_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_d267_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_d267_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_d267_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_02b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2417_c3_7b12 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_02b9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_02b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_02b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2416_c7_02b9_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_02b9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_c67c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_c67c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_c67c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2422_c32_c84b_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2422_c32_c84b_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2422_c32_c84b_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2422_c32_1664_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2422_c32_1664_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2422_c32_1664_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2422_c32_726e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2422_c32_726e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2422_c32_726e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2422_c32_c84b_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_0883_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_0883_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_0883_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2431_c7_e0fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_4af0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2428_c3_9227 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_4af0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2431_c7_e0fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_4af0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2424_c7_4af0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_4af0_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2424_c7_4af0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2425_c11_8eea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2425_c18_6750_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2425_c18_6750_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2425_c18_6750_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2425_c11_8eea_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2425_c11_8eea_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2425_c11_339d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2425_c11_339d_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2425_c34_0086_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2425_c34_0086_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2425_c11_339d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2431_c11_1a41_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2431_c11_1a41_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2431_c11_1a41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2431_c7_e0fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2431_c7_e0fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2431_c7_e0fd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2431_c7_e0fd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2431_c7_e0fd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2431_c7_e0fd_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2404_l2431_DUPLICATE_7b2f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2404_DUPLICATE_084c_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2404_l2424_DUPLICATE_356b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2416_l2412_l2409_l2404_l2424_DUPLICATE_03a8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2431_l2424_DUPLICATE_66e3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2419_l2424_DUPLICATE_5a83_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2436_l2400_DUPLICATE_b491_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2431_c7_e0fd_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2431_c11_1a41_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_0883_right := to_unsigned(5, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2422_c32_726e_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2422_c32_c84b_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2417_c3_7b12 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2417_c3_7b12;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2422_c32_1664_right := to_unsigned(128, 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2428_c3_9227 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2428_c3_9227;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2425_c18_6750_right := to_unsigned(15, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2406_c3_eb1d := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2406_c3_eb1d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_d267_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2410_c3_8273 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2410_c3_8273;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2414_c3_22b4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2414_c3_22b4;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2404_c1_7cec_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_c67c_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l2422_c32_c84b_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2431_c7_e0fd_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2404_c1_7cec_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2422_c32_1664_left := VAR_ins;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2425_c11_8eea_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_d267_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_c67c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_0883_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2431_c11_1a41_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2425_c18_6750_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2425_c34_0086_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse := t8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse := tmp8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2419_l2424_DUPLICATE_5a83 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2419_l2424_DUPLICATE_5a83_return_output := result.stack_address_sp_offset;

     -- BIN_OP_AND[uxn_opcodes_h_l2422_c32_1664] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2422_c32_1664_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2422_c32_1664_left;
     BIN_OP_AND_uxn_opcodes_h_l2422_c32_1664_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2422_c32_1664_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2422_c32_1664_return_output := BIN_OP_AND_uxn_opcodes_h_l2422_c32_1664_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2425_c18_6750] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2425_c18_6750_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2425_c18_6750_left;
     BIN_OP_AND_uxn_opcodes_h_l2425_c18_6750_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2425_c18_6750_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2425_c18_6750_return_output := BIN_OP_AND_uxn_opcodes_h_l2425_c18_6750_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2416_l2412_l2409_l2404_l2424_DUPLICATE_03a8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2416_l2412_l2409_l2404_l2424_DUPLICATE_03a8_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2416_c11_d267] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2416_c11_d267_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_d267_left;
     BIN_OP_EQ_uxn_opcodes_h_l2416_c11_d267_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_d267_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_d267_return_output := BIN_OP_EQ_uxn_opcodes_h_l2416_c11_d267_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2404_c6_591a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2409_c11_17c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2431_c11_1a41] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2431_c11_1a41_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2431_c11_1a41_left;
     BIN_OP_EQ_uxn_opcodes_h_l2431_c11_1a41_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2431_c11_1a41_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2431_c11_1a41_return_output := BIN_OP_EQ_uxn_opcodes_h_l2431_c11_1a41_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2419_c11_c67c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2419_c11_c67c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_c67c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2419_c11_c67c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_c67c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_c67c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2419_c11_c67c_return_output;

     -- CONST_SR_4[uxn_opcodes_h_l2425_c34_0086] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2425_c34_0086_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2425_c34_0086_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2425_c34_0086_return_output := CONST_SR_4_uxn_opcodes_h_l2425_c34_0086_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2424_c11_0883] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2424_c11_0883_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_0883_left;
     BIN_OP_EQ_uxn_opcodes_h_l2424_c11_0883_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_0883_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_0883_return_output := BIN_OP_EQ_uxn_opcodes_h_l2424_c11_0883_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2431_l2424_DUPLICATE_66e3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2431_l2424_DUPLICATE_66e3_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2404_l2431_DUPLICATE_7b2f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2404_l2431_DUPLICATE_7b2f_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2404_l2424_DUPLICATE_356b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2404_l2424_DUPLICATE_356b_return_output := result.stack_value;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2404_DUPLICATE_084c LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2404_DUPLICATE_084c_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2412_c11_954a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2422_c32_726e_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2422_c32_1664_return_output;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2425_c11_8eea_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2425_c18_6750_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2404_c1_7cec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2404_c6_591a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2409_c11_17c6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2412_c7_86da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_86da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_86da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_86da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_86da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_86da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_86da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2412_c7_86da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2412_c7_86da_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2412_c11_954a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2416_c7_02b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_d267_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_02b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_d267_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_d267_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_02b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_d267_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_d267_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_02b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_d267_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_02b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_d267_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_02b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_d267_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_c67c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_c67c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_c67c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_c67c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_c67c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_c67c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_c67c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2419_c11_c67c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_4af0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_0883_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_4af0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_0883_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_4af0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_0883_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_4af0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_0883_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2424_c7_4af0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_0883_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2424_c7_4af0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2424_c11_0883_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2431_c7_e0fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2431_c11_1a41_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2431_c7_e0fd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2431_c11_1a41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2404_DUPLICATE_084c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2404_DUPLICATE_084c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2404_DUPLICATE_084c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2404_DUPLICATE_084c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2404_DUPLICATE_084c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2431_l2424_DUPLICATE_66e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2431_l2424_DUPLICATE_66e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2431_l2424_DUPLICATE_66e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2431_l2424_DUPLICATE_66e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2431_l2424_DUPLICATE_66e3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2431_c7_e0fd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2431_l2424_DUPLICATE_66e3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2416_l2412_l2409_l2404_l2424_DUPLICATE_03a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2416_l2412_l2409_l2404_l2424_DUPLICATE_03a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2416_l2412_l2409_l2404_l2424_DUPLICATE_03a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2416_l2412_l2409_l2404_l2424_DUPLICATE_03a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2416_l2412_l2409_l2404_l2424_DUPLICATE_03a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2404_l2431_DUPLICATE_7b2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2404_l2431_DUPLICATE_7b2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2404_l2431_DUPLICATE_7b2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2404_l2431_DUPLICATE_7b2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2404_l2431_DUPLICATE_7b2f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2431_c7_e0fd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2404_l2431_DUPLICATE_7b2f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2419_l2424_DUPLICATE_5a83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2419_l2424_DUPLICATE_5a83_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2404_l2424_DUPLICATE_356b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2404_l2424_DUPLICATE_356b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2404_l2424_DUPLICATE_356b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2404_l2424_DUPLICATE_356b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2404_l2424_DUPLICATE_356b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2419_l2416_l2412_l2409_l2404_l2424_DUPLICATE_356b_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2425_c11_339d_right := VAR_CONST_SR_4_uxn_opcodes_h_l2425_c34_0086_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2404_c1_7cec] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2404_c1_7cec_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2404_c1_7cec_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2404_c1_7cec_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2404_c1_7cec_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2404_c1_7cec_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2404_c1_7cec_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2404_c1_7cec_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2404_c1_7cec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2424_c7_4af0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_4af0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_4af0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2431_c7_e0fd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2431_c7_e0fd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2431_c7_e0fd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2431_c7_e0fd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2431_c7_e0fd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2431_c7_e0fd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2431_c7_e0fd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2431_c7_e0fd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2431_c7_e0fd_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2425_c11_8eea] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2425_c11_8eea_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2425_c11_8eea_left;
     BIN_OP_SR_uxn_opcodes_h_l2425_c11_8eea_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2425_c11_8eea_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2425_c11_8eea_return_output := BIN_OP_SR_uxn_opcodes_h_l2425_c11_8eea_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2424_c7_4af0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_4af0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_4af0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output;

     -- n8_MUX[uxn_opcodes_h_l2419_c7_6fb4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond <= VAR_n8_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond;
     n8_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue;
     n8_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output := n8_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2431_c7_e0fd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2431_c7_e0fd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2431_c7_e0fd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2431_c7_e0fd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2431_c7_e0fd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2431_c7_e0fd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2431_c7_e0fd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2431_c7_e0fd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2431_c7_e0fd_return_output;

     -- t8_MUX[uxn_opcodes_h_l2412_c7_86da] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2412_c7_86da_cond <= VAR_t8_MUX_uxn_opcodes_h_l2412_c7_86da_cond;
     t8_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue;
     t8_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2412_c7_86da_return_output := t8_MUX_uxn_opcodes_h_l2412_c7_86da_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2422_c32_726e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2422_c32_726e_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2422_c32_726e_left;
     BIN_OP_GT_uxn_opcodes_h_l2422_c32_726e_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2422_c32_726e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2422_c32_726e_return_output := BIN_OP_GT_uxn_opcodes_h_l2422_c32_726e_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2422_c32_c84b_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2422_c32_726e_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2425_c11_339d_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2425_c11_8eea_return_output;
     VAR_printf_uxn_opcodes_h_l2405_c3_a769_uxn_opcodes_h_l2405_c3_a769_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2404_c1_7cec_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2431_c7_e0fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2431_c7_e0fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2412_c7_86da_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2419_c7_6fb4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output;

     -- printf_uxn_opcodes_h_l2405_c3_a769[uxn_opcodes_h_l2405_c3_a769] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2405_c3_a769_uxn_opcodes_h_l2405_c3_a769_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2405_c3_a769_uxn_opcodes_h_l2405_c3_a769_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2424_c7_4af0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_4af0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_4af0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output;

     -- t8_MUX[uxn_opcodes_h_l2409_c7_1ae2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond <= VAR_t8_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond;
     t8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue;
     t8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output := t8_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2425_c11_339d] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2425_c11_339d_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2425_c11_339d_left;
     BIN_OP_SL_uxn_opcodes_h_l2425_c11_339d_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2425_c11_339d_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2425_c11_339d_return_output := BIN_OP_SL_uxn_opcodes_h_l2425_c11_339d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2419_c7_6fb4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output;

     -- MUX[uxn_opcodes_h_l2422_c32_c84b] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2422_c32_c84b_cond <= VAR_MUX_uxn_opcodes_h_l2422_c32_c84b_cond;
     MUX_uxn_opcodes_h_l2422_c32_c84b_iftrue <= VAR_MUX_uxn_opcodes_h_l2422_c32_c84b_iftrue;
     MUX_uxn_opcodes_h_l2422_c32_c84b_iffalse <= VAR_MUX_uxn_opcodes_h_l2422_c32_c84b_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2422_c32_c84b_return_output := MUX_uxn_opcodes_h_l2422_c32_c84b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2424_c7_4af0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_4af0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_4af0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output;

     -- n8_MUX[uxn_opcodes_h_l2416_c7_02b9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2416_c7_02b9_cond <= VAR_n8_MUX_uxn_opcodes_h_l2416_c7_02b9_cond;
     n8_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue;
     n8_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output := n8_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2425_c11_339d_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2425_c11_339d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue := VAR_MUX_uxn_opcodes_h_l2422_c32_c84b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l2424_c7_4af0] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2424_c7_4af0_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2424_c7_4af0_cond;
     tmp8_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output := tmp8_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output;

     -- t8_MUX[uxn_opcodes_h_l2404_c2_1bf4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond <= VAR_t8_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond;
     t8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue;
     t8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output := t8_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2419_c7_6fb4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2419_c7_6fb4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2424_c7_4af0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2424_c7_4af0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2424_c7_4af0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2424_c7_4af0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2424_c7_4af0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output := result_stack_value_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2419_c7_6fb4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output;

     -- n8_MUX[uxn_opcodes_h_l2412_c7_86da] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2412_c7_86da_cond <= VAR_n8_MUX_uxn_opcodes_h_l2412_c7_86da_cond;
     n8_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue;
     n8_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2412_c7_86da_return_output := n8_MUX_uxn_opcodes_h_l2412_c7_86da_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2416_c7_02b9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2416_c7_02b9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_02b9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_02b9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2412_c7_86da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2424_c7_4af0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2416_c7_02b9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_02b9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_02b9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2419_c7_6fb4] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond;
     tmp8_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output := tmp8_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2412_c7_86da] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_86da_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_86da_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_86da_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_86da_return_output;

     -- n8_MUX[uxn_opcodes_h_l2409_c7_1ae2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond <= VAR_n8_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond;
     n8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue;
     n8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output := n8_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2416_c7_02b9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2419_c7_6fb4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2419_c7_6fb4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2419_c7_6fb4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2419_c7_6fb4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output := result_stack_value_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2412_c7_86da] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_86da_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_86da_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_86da_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_86da_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2416_c7_02b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_02b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_02b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2412_c7_86da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2412_c7_86da_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2419_c7_6fb4_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2416_c7_02b9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2416_c7_02b9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_02b9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output := result_stack_value_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2409_c7_1ae2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output;

     -- n8_MUX[uxn_opcodes_h_l2404_c2_1bf4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond <= VAR_n8_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond;
     n8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue;
     n8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output := n8_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2412_c7_86da] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_86da_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_86da_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_86da_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_86da_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2409_c7_1ae2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2412_c7_86da] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_86da_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_86da_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_86da_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_86da_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2412_c7_86da] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_86da_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_86da_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_86da_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_86da_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2416_c7_02b9] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2416_c7_02b9_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_02b9_cond;
     tmp8_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_02b9_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_02b9_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output := tmp8_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2412_c7_86da_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2412_c7_86da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2412_c7_86da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_02b9_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2412_c7_86da] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2412_c7_86da_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_86da_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_86da_return_output := result_stack_value_MUX_uxn_opcodes_h_l2412_c7_86da_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2409_c7_1ae2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2409_c7_1ae2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2409_c7_1ae2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2404_c2_1bf4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2404_c2_1bf4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2412_c7_86da] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2412_c7_86da_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2412_c7_86da_cond;
     tmp8_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2412_c7_86da_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2412_c7_86da_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2412_c7_86da_return_output := tmp8_MUX_uxn_opcodes_h_l2412_c7_86da_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2412_c7_86da_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2412_c7_86da_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2404_c2_1bf4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2404_c2_1bf4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2409_c7_1ae2] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond;
     tmp8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output := tmp8_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2409_c7_1ae2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1ae2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1ae2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1ae2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2404_c2_1bf4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output;

     -- Submodule level 8
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2409_c7_1ae2_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2404_c2_1bf4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output := result_stack_value_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2404_c2_1bf4] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2404_c2_1bf4_cond;
     tmp8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2404_c2_1bf4_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output := tmp8_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output;

     -- Submodule level 9
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2436_l2400_DUPLICATE_b491 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2436_l2400_DUPLICATE_b491_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2404_c2_1bf4_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2436_l2400_DUPLICATE_b491_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2436_l2400_DUPLICATE_b491_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
