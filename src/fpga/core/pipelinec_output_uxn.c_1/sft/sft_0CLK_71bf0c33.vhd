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
-- BIN_OP_EQ[uxn_opcodes_h_l2408_c6_049d]
signal BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2408_c1_292d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2408_c1_292d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2408_c1_292d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2408_c1_292d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2408_c1_292d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2408_c2_e972]
signal n8_MUX_uxn_opcodes_h_l2408_c2_e972_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2408_c2_e972_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2408_c2_e972]
signal tmp8_MUX_uxn_opcodes_h_l2408_c2_e972_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2408_c2_e972_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2408_c2_e972]
signal t8_MUX_uxn_opcodes_h_l2408_c2_e972_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2408_c2_e972_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2408_c2_e972]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_e972_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_e972_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2408_c2_e972]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_e972_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_e972_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2408_c2_e972]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_e972_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_e972_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2408_c2_e972]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_e972_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_e972_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2408_c2_e972]
signal result_stack_value_MUX_uxn_opcodes_h_l2408_c2_e972_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2408_c2_e972_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2408_c2_e972]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_e972_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_e972_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l2409_c3_c579[uxn_opcodes_h_l2409_c3_c579]
signal printf_uxn_opcodes_h_l2409_c3_c579_uxn_opcodes_h_l2409_c3_c579_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2413_c11_f398]
signal BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2413_c7_51c2]
signal n8_MUX_uxn_opcodes_h_l2413_c7_51c2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2413_c7_51c2]
signal tmp8_MUX_uxn_opcodes_h_l2413_c7_51c2_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2413_c7_51c2]
signal t8_MUX_uxn_opcodes_h_l2413_c7_51c2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2413_c7_51c2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_51c2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2413_c7_51c2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2413_c7_51c2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_51c2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2413_c7_51c2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2413_c7_51c2]
signal result_stack_value_MUX_uxn_opcodes_h_l2413_c7_51c2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2413_c7_51c2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_51c2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2416_c11_c789]
signal BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2416_c7_780e]
signal n8_MUX_uxn_opcodes_h_l2416_c7_780e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2416_c7_780e_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2416_c7_780e]
signal tmp8_MUX_uxn_opcodes_h_l2416_c7_780e_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2416_c7_780e_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2416_c7_780e]
signal t8_MUX_uxn_opcodes_h_l2416_c7_780e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2416_c7_780e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2416_c7_780e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_780e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_780e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2416_c7_780e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_780e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_780e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2416_c7_780e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_780e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_780e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2416_c7_780e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_780e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_780e_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2416_c7_780e]
signal result_stack_value_MUX_uxn_opcodes_h_l2416_c7_780e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2416_c7_780e_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2416_c7_780e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_780e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_780e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2420_c11_a2dc]
signal BIN_OP_EQ_uxn_opcodes_h_l2420_c11_a2dc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2420_c11_a2dc_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2420_c11_a2dc_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2420_c7_25a8]
signal n8_MUX_uxn_opcodes_h_l2420_c7_25a8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2420_c7_25a8]
signal tmp8_MUX_uxn_opcodes_h_l2420_c7_25a8_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2420_c7_25a8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_25a8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2420_c7_25a8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2420_c7_25a8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_25a8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2420_c7_25a8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2420_c7_25a8]
signal result_stack_value_MUX_uxn_opcodes_h_l2420_c7_25a8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2420_c7_25a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_25a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2423_c11_8002]
signal BIN_OP_EQ_uxn_opcodes_h_l2423_c11_8002_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2423_c11_8002_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2423_c11_8002_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2423_c7_2c53]
signal n8_MUX_uxn_opcodes_h_l2423_c7_2c53_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2423_c7_2c53]
signal tmp8_MUX_uxn_opcodes_h_l2423_c7_2c53_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2423_c7_2c53]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_2c53_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2423_c7_2c53]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2423_c7_2c53]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_2c53_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2423_c7_2c53]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output : signed(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2423_c7_2c53]
signal result_stack_value_MUX_uxn_opcodes_h_l2423_c7_2c53_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2423_c7_2c53]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_2c53_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2426_c32_7e97]
signal BIN_OP_AND_uxn_opcodes_h_l2426_c32_7e97_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2426_c32_7e97_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2426_c32_7e97_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2426_c32_3fec]
signal BIN_OP_GT_uxn_opcodes_h_l2426_c32_3fec_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2426_c32_3fec_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2426_c32_3fec_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2426_c32_d05a]
signal MUX_uxn_opcodes_h_l2426_c32_d05a_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2426_c32_d05a_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2426_c32_d05a_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2426_c32_d05a_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2428_c11_9a96]
signal BIN_OP_EQ_uxn_opcodes_h_l2428_c11_9a96_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2428_c11_9a96_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2428_c11_9a96_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2428_c7_9b23]
signal tmp8_MUX_uxn_opcodes_h_l2428_c7_9b23_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2428_c7_9b23]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_9b23_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2428_c7_9b23]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_9b23_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2428_c7_9b23]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_9b23_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2428_c7_9b23]
signal result_stack_value_MUX_uxn_opcodes_h_l2428_c7_9b23_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2428_c7_9b23]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_9b23_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2429_c18_4c3e]
signal BIN_OP_AND_uxn_opcodes_h_l2429_c18_4c3e_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2429_c18_4c3e_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2429_c18_4c3e_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2429_c11_33aa]
signal BIN_OP_SR_uxn_opcodes_h_l2429_c11_33aa_left : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2429_c11_33aa_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2429_c11_33aa_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2429_c34_a4c3]
signal CONST_SR_4_uxn_opcodes_h_l2429_c34_a4c3_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2429_c34_a4c3_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2429_c11_4896]
signal BIN_OP_SL_uxn_opcodes_h_l2429_c11_4896_left : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2429_c11_4896_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2429_c11_4896_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2435_c11_dea6]
signal BIN_OP_EQ_uxn_opcodes_h_l2435_c11_dea6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2435_c11_dea6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2435_c11_dea6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2435_c7_8725]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_8725_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_8725_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_8725_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_8725_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2435_c7_8725]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_8725_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_8725_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_8725_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_8725_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d
BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d_left,
BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d_right,
BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2408_c1_292d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2408_c1_292d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2408_c1_292d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2408_c1_292d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2408_c1_292d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2408_c1_292d_return_output);

-- n8_MUX_uxn_opcodes_h_l2408_c2_e972
n8_MUX_uxn_opcodes_h_l2408_c2_e972 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2408_c2_e972_cond,
n8_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue,
n8_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse,
n8_MUX_uxn_opcodes_h_l2408_c2_e972_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2408_c2_e972
tmp8_MUX_uxn_opcodes_h_l2408_c2_e972 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2408_c2_e972_cond,
tmp8_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue,
tmp8_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse,
tmp8_MUX_uxn_opcodes_h_l2408_c2_e972_return_output);

-- t8_MUX_uxn_opcodes_h_l2408_c2_e972
t8_MUX_uxn_opcodes_h_l2408_c2_e972 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2408_c2_e972_cond,
t8_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue,
t8_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse,
t8_MUX_uxn_opcodes_h_l2408_c2_e972_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_e972
result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_e972 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_e972_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_e972_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_e972
result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_e972 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_e972_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_e972_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_e972
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_e972 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_e972_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_e972_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_e972
result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_e972 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_e972_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_e972_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2408_c2_e972
result_stack_value_MUX_uxn_opcodes_h_l2408_c2_e972 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2408_c2_e972_cond,
result_stack_value_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2408_c2_e972_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_e972
result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_e972 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_e972_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_e972_return_output);

-- printf_uxn_opcodes_h_l2409_c3_c579_uxn_opcodes_h_l2409_c3_c579
printf_uxn_opcodes_h_l2409_c3_c579_uxn_opcodes_h_l2409_c3_c579 : entity work.printf_uxn_opcodes_h_l2409_c3_c579_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2409_c3_c579_uxn_opcodes_h_l2409_c3_c579_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398
BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398_left,
BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398_right,
BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398_return_output);

-- n8_MUX_uxn_opcodes_h_l2413_c7_51c2
n8_MUX_uxn_opcodes_h_l2413_c7_51c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2413_c7_51c2_cond,
n8_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue,
n8_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse,
n8_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2413_c7_51c2
tmp8_MUX_uxn_opcodes_h_l2413_c7_51c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2413_c7_51c2_cond,
tmp8_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue,
tmp8_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse,
tmp8_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output);

-- t8_MUX_uxn_opcodes_h_l2413_c7_51c2
t8_MUX_uxn_opcodes_h_l2413_c7_51c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2413_c7_51c2_cond,
t8_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue,
t8_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse,
t8_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_51c2
result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_51c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_51c2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_51c2
result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_51c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_51c2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_51c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_51c2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_51c2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_51c2 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2413_c7_51c2
result_stack_value_MUX_uxn_opcodes_h_l2413_c7_51c2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2413_c7_51c2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_51c2
result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_51c2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_51c2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789
BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789_left,
BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789_right,
BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789_return_output);

-- n8_MUX_uxn_opcodes_h_l2416_c7_780e
n8_MUX_uxn_opcodes_h_l2416_c7_780e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2416_c7_780e_cond,
n8_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue,
n8_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse,
n8_MUX_uxn_opcodes_h_l2416_c7_780e_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2416_c7_780e
tmp8_MUX_uxn_opcodes_h_l2416_c7_780e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2416_c7_780e_cond,
tmp8_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue,
tmp8_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse,
tmp8_MUX_uxn_opcodes_h_l2416_c7_780e_return_output);

-- t8_MUX_uxn_opcodes_h_l2416_c7_780e
t8_MUX_uxn_opcodes_h_l2416_c7_780e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2416_c7_780e_cond,
t8_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue,
t8_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse,
t8_MUX_uxn_opcodes_h_l2416_c7_780e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_780e
result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_780e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_780e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_780e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_780e
result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_780e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_780e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_780e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_780e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_780e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_780e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_780e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_780e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_780e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_780e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_780e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2416_c7_780e
result_stack_value_MUX_uxn_opcodes_h_l2416_c7_780e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2416_c7_780e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2416_c7_780e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_780e
result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_780e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_780e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_780e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2420_c11_a2dc
BIN_OP_EQ_uxn_opcodes_h_l2420_c11_a2dc : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2420_c11_a2dc_left,
BIN_OP_EQ_uxn_opcodes_h_l2420_c11_a2dc_right,
BIN_OP_EQ_uxn_opcodes_h_l2420_c11_a2dc_return_output);

-- n8_MUX_uxn_opcodes_h_l2420_c7_25a8
n8_MUX_uxn_opcodes_h_l2420_c7_25a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2420_c7_25a8_cond,
n8_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue,
n8_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse,
n8_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2420_c7_25a8
tmp8_MUX_uxn_opcodes_h_l2420_c7_25a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2420_c7_25a8_cond,
tmp8_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue,
tmp8_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse,
tmp8_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_25a8
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_25a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_25a8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_25a8
result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_25a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_25a8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_25a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_25a8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_25a8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_25a8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2420_c7_25a8
result_stack_value_MUX_uxn_opcodes_h_l2420_c7_25a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2420_c7_25a8_cond,
result_stack_value_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_25a8
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_25a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_25a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2423_c11_8002
BIN_OP_EQ_uxn_opcodes_h_l2423_c11_8002 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2423_c11_8002_left,
BIN_OP_EQ_uxn_opcodes_h_l2423_c11_8002_right,
BIN_OP_EQ_uxn_opcodes_h_l2423_c11_8002_return_output);

-- n8_MUX_uxn_opcodes_h_l2423_c7_2c53
n8_MUX_uxn_opcodes_h_l2423_c7_2c53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2423_c7_2c53_cond,
n8_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue,
n8_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse,
n8_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2423_c7_2c53
tmp8_MUX_uxn_opcodes_h_l2423_c7_2c53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2423_c7_2c53_cond,
tmp8_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue,
tmp8_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse,
tmp8_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_2c53
result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_2c53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_2c53_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_2c53
result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_2c53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_2c53
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_2c53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_2c53_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_2c53
result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_2c53 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2423_c7_2c53
result_stack_value_MUX_uxn_opcodes_h_l2423_c7_2c53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2423_c7_2c53_cond,
result_stack_value_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_2c53
result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_2c53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_2c53_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2426_c32_7e97
BIN_OP_AND_uxn_opcodes_h_l2426_c32_7e97 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2426_c32_7e97_left,
BIN_OP_AND_uxn_opcodes_h_l2426_c32_7e97_right,
BIN_OP_AND_uxn_opcodes_h_l2426_c32_7e97_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2426_c32_3fec
BIN_OP_GT_uxn_opcodes_h_l2426_c32_3fec : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2426_c32_3fec_left,
BIN_OP_GT_uxn_opcodes_h_l2426_c32_3fec_right,
BIN_OP_GT_uxn_opcodes_h_l2426_c32_3fec_return_output);

-- MUX_uxn_opcodes_h_l2426_c32_d05a
MUX_uxn_opcodes_h_l2426_c32_d05a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2426_c32_d05a_cond,
MUX_uxn_opcodes_h_l2426_c32_d05a_iftrue,
MUX_uxn_opcodes_h_l2426_c32_d05a_iffalse,
MUX_uxn_opcodes_h_l2426_c32_d05a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2428_c11_9a96
BIN_OP_EQ_uxn_opcodes_h_l2428_c11_9a96 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2428_c11_9a96_left,
BIN_OP_EQ_uxn_opcodes_h_l2428_c11_9a96_right,
BIN_OP_EQ_uxn_opcodes_h_l2428_c11_9a96_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2428_c7_9b23
tmp8_MUX_uxn_opcodes_h_l2428_c7_9b23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2428_c7_9b23_cond,
tmp8_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue,
tmp8_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse,
tmp8_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_9b23
result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_9b23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_9b23_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_9b23
result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_9b23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_9b23_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_9b23
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_9b23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_9b23_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2428_c7_9b23
result_stack_value_MUX_uxn_opcodes_h_l2428_c7_9b23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2428_c7_9b23_cond,
result_stack_value_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_9b23
result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_9b23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_9b23_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2429_c18_4c3e
BIN_OP_AND_uxn_opcodes_h_l2429_c18_4c3e : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2429_c18_4c3e_left,
BIN_OP_AND_uxn_opcodes_h_l2429_c18_4c3e_right,
BIN_OP_AND_uxn_opcodes_h_l2429_c18_4c3e_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2429_c11_33aa
BIN_OP_SR_uxn_opcodes_h_l2429_c11_33aa : entity work.BIN_OP_SR_uint8_t_uint8_t_0CLK_25d197a7 port map (
BIN_OP_SR_uxn_opcodes_h_l2429_c11_33aa_left,
BIN_OP_SR_uxn_opcodes_h_l2429_c11_33aa_right,
BIN_OP_SR_uxn_opcodes_h_l2429_c11_33aa_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2429_c34_a4c3
CONST_SR_4_uxn_opcodes_h_l2429_c34_a4c3 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2429_c34_a4c3_x,
CONST_SR_4_uxn_opcodes_h_l2429_c34_a4c3_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2429_c11_4896
BIN_OP_SL_uxn_opcodes_h_l2429_c11_4896 : entity work.BIN_OP_SL_uint8_t_uint8_t_0CLK_10d8c973 port map (
BIN_OP_SL_uxn_opcodes_h_l2429_c11_4896_left,
BIN_OP_SL_uxn_opcodes_h_l2429_c11_4896_right,
BIN_OP_SL_uxn_opcodes_h_l2429_c11_4896_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2435_c11_dea6
BIN_OP_EQ_uxn_opcodes_h_l2435_c11_dea6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2435_c11_dea6_left,
BIN_OP_EQ_uxn_opcodes_h_l2435_c11_dea6_right,
BIN_OP_EQ_uxn_opcodes_h_l2435_c11_dea6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_8725
result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_8725 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_8725_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_8725_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_8725_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_8725_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_8725
result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_8725 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_8725_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_8725_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_8725_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_8725_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2408_c1_292d_return_output,
 n8_MUX_uxn_opcodes_h_l2408_c2_e972_return_output,
 tmp8_MUX_uxn_opcodes_h_l2408_c2_e972_return_output,
 t8_MUX_uxn_opcodes_h_l2408_c2_e972_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_e972_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_e972_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_e972_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_e972_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2408_c2_e972_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_e972_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398_return_output,
 n8_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output,
 tmp8_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output,
 t8_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789_return_output,
 n8_MUX_uxn_opcodes_h_l2416_c7_780e_return_output,
 tmp8_MUX_uxn_opcodes_h_l2416_c7_780e_return_output,
 t8_MUX_uxn_opcodes_h_l2416_c7_780e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_780e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_780e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_780e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_780e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2416_c7_780e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_780e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2420_c11_a2dc_return_output,
 n8_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output,
 tmp8_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2423_c11_8002_return_output,
 n8_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output,
 tmp8_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2426_c32_7e97_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2426_c32_3fec_return_output,
 MUX_uxn_opcodes_h_l2426_c32_d05a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2428_c11_9a96_return_output,
 tmp8_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2429_c18_4c3e_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2429_c11_33aa_return_output,
 CONST_SR_4_uxn_opcodes_h_l2429_c34_a4c3_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2429_c11_4896_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2435_c11_dea6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_8725_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_8725_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2408_c1_292d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2408_c1_292d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2408_c1_292d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2408_c1_292d_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2408_c2_e972_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2408_c2_e972_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2408_c2_e972_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2408_c2_e972_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2408_c2_e972_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2408_c2_e972_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_e972_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_e972_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_e972_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_e972_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2410_c3_9b9f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_e972_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_e972_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_e972_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_e972_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c2_e972_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c2_e972_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_e972_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_e972_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2409_c3_c579_uxn_opcodes_h_l2409_c3_c579_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2416_c7_780e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2413_c7_51c2_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_780e_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2413_c7_51c2_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2416_c7_780e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2413_c7_51c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_780e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_51c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_780e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2414_c3_07ad : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_780e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_51c2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_780e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_780e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2413_c7_51c2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_780e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_51c2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2416_c7_780e_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_780e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2416_c7_780e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_780e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_780e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2418_c3_056b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_780e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_780e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_780e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_780e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_a2dc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_a2dc_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_a2dc_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2420_c7_25a8_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2420_c7_25a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_25a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2421_c3_cf9b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_25a8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_25a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_25a8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_8002_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_8002_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_8002_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2423_c7_2c53_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2423_c7_2c53_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_2c53_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_2c53_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_2c53_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_2c53_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2426_c32_d05a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2426_c32_d05a_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2426_c32_d05a_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2426_c32_7e97_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2426_c32_7e97_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2426_c32_7e97_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2426_c32_3fec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2426_c32_3fec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2426_c32_3fec_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2426_c32_d05a_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2428_c11_9a96_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2428_c11_9a96_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2428_c11_9a96_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2428_c7_9b23_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_8725_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_9b23_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_9b23_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2432_c3_df74 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_9b23_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2428_c7_9b23_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_8725_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_9b23_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2429_c11_33aa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2429_c18_4c3e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2429_c18_4c3e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2429_c18_4c3e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2429_c11_33aa_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2429_c11_33aa_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2429_c11_4896_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2429_c11_4896_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2429_c34_a4c3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2429_c34_a4c3_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2429_c11_4896_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2435_c11_dea6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2435_c11_dea6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2435_c11_dea6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_8725_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_8725_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_8725_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_8725_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_8725_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_8725_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2435_l2423_l2420_DUPLICATE_4829_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2428_l2420_DUPLICATE_c10f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2423_l2420_DUPLICATE_bee9_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2428_l2423_l2420_DUPLICATE_d22e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2416_l2413_l2435_l2428_l2423_l2420_DUPLICATE_b4bd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2428_l2423_DUPLICATE_6476_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2404_l2440_DUPLICATE_3b50_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2432_c3_df74 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2432_c3_df74;
     VAR_BIN_OP_GT_uxn_opcodes_h_l2426_c32_3fec_right := to_unsigned(0, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2426_c32_7e97_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_a2dc_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_8002_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2428_c11_9a96_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l2426_c32_d05a_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2435_c11_dea6_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2410_c3_9b9f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2410_c3_9b9f;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2408_c1_292d_iffalse := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_8725_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2421_c3_cf9b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2421_c3_cf9b;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2429_c18_4c3e_right := to_unsigned(15, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2414_c3_07ad := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2414_c3_07ad;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_8725_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2418_c3_056b := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2418_c3_056b;
     VAR_MUX_uxn_opcodes_h_l2426_c32_d05a_iffalse := resize(to_signed(-1, 2), 8);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2408_c1_292d_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2426_c32_7e97_left := VAR_ins;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2429_c11_33aa_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_a2dc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_8002_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2428_c11_9a96_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2435_c11_dea6_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2429_c18_4c3e_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2429_c34_a4c3_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse := t8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse := tmp8;
     -- BIN_OP_AND[uxn_opcodes_h_l2426_c32_7e97] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2426_c32_7e97_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2426_c32_7e97_left;
     BIN_OP_AND_uxn_opcodes_h_l2426_c32_7e97_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2426_c32_7e97_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2426_c32_7e97_return_output := BIN_OP_AND_uxn_opcodes_h_l2426_c32_7e97_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2428_l2420_DUPLICATE_c10f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2428_l2420_DUPLICATE_c10f_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2428_c11_9a96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2428_c11_9a96_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2428_c11_9a96_left;
     BIN_OP_EQ_uxn_opcodes_h_l2428_c11_9a96_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2428_c11_9a96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2428_c11_9a96_return_output := BIN_OP_EQ_uxn_opcodes_h_l2428_c11_9a96_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2416_l2413_l2435_l2428_l2423_l2420_DUPLICATE_b4bd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2416_l2413_l2435_l2428_l2423_l2420_DUPLICATE_b4bd_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2420_c11_a2dc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2420_c11_a2dc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_a2dc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2420_c11_a2dc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_a2dc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_a2dc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2420_c11_a2dc_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2429_c18_4c3e] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2429_c18_4c3e_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2429_c18_4c3e_left;
     BIN_OP_AND_uxn_opcodes_h_l2429_c18_4c3e_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2429_c18_4c3e_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2429_c18_4c3e_return_output := BIN_OP_AND_uxn_opcodes_h_l2429_c18_4c3e_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2423_l2420_DUPLICATE_bee9 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2423_l2420_DUPLICATE_bee9_return_output := result.sp_relative_shift;

     -- CONST_SR_4[uxn_opcodes_h_l2429_c34_a4c3] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2429_c34_a4c3_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2429_c34_a4c3_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2429_c34_a4c3_return_output := CONST_SR_4_uxn_opcodes_h_l2429_c34_a4c3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2413_c11_f398] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398_left;
     BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398_return_output := BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2428_l2423_l2420_DUPLICATE_d22e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2428_l2423_l2420_DUPLICATE_d22e_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2435_l2423_l2420_DUPLICATE_4829 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2435_l2423_l2420_DUPLICATE_4829_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2408_c6_049d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2423_c11_8002] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2423_c11_8002_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_8002_left;
     BIN_OP_EQ_uxn_opcodes_h_l2423_c11_8002_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_8002_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_8002_return_output := BIN_OP_EQ_uxn_opcodes_h_l2423_c11_8002_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2416_c11_c789] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789_left;
     BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789_return_output := BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2435_c11_dea6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2435_c11_dea6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2435_c11_dea6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2435_c11_dea6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2435_c11_dea6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2435_c11_dea6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2435_c11_dea6_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2428_l2423_DUPLICATE_6476 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2428_l2423_DUPLICATE_6476_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2426_c32_3fec_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2426_c32_7e97_return_output;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2429_c11_33aa_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2429_c18_4c3e_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2408_c1_292d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2408_c2_e972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_e972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_e972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_e972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_e972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_e972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c2_e972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2408_c2_e972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2408_c2_e972_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2408_c6_049d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2413_c7_51c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_51c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_51c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_51c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2413_c7_51c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2413_c7_51c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2413_c7_51c2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2413_c11_f398_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2416_c7_780e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_780e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_780e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_780e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_780e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_780e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_780e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2416_c7_780e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_780e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2416_c11_c789_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2420_c7_25a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_a2dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_25a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_a2dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_a2dc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_25a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_a2dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_a2dc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_25a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_a2dc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_25a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_a2dc_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2420_c7_25a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2420_c11_a2dc_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2423_c7_2c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_8002_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_2c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_8002_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_8002_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_2c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_8002_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_8002_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_2c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_8002_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_2c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_8002_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2423_c7_2c53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2423_c11_8002_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_9b23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2428_c11_9a96_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_9b23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2428_c11_9a96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_9b23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2428_c11_9a96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_9b23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2428_c11_9a96_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2428_c7_9b23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2428_c11_9a96_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2428_c7_9b23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2428_c11_9a96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_8725_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2435_c11_dea6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_8725_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2435_c11_dea6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2423_l2420_DUPLICATE_bee9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2423_l2420_DUPLICATE_bee9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2423_l2420_DUPLICATE_bee9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2423_l2420_DUPLICATE_bee9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2423_l2420_DUPLICATE_bee9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2416_l2413_l2435_l2428_l2423_l2420_DUPLICATE_b4bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2416_l2413_l2435_l2428_l2423_l2420_DUPLICATE_b4bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2416_l2413_l2435_l2428_l2423_l2420_DUPLICATE_b4bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2416_l2413_l2435_l2428_l2423_l2420_DUPLICATE_b4bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2416_l2413_l2435_l2428_l2423_l2420_DUPLICATE_b4bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_8725_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2416_l2413_l2435_l2428_l2423_l2420_DUPLICATE_b4bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2428_l2420_DUPLICATE_c10f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2428_l2420_DUPLICATE_c10f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2428_l2420_DUPLICATE_c10f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2428_l2420_DUPLICATE_c10f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2428_l2420_DUPLICATE_c10f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2435_l2423_l2420_DUPLICATE_4829_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2435_l2423_l2420_DUPLICATE_4829_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2435_l2423_l2420_DUPLICATE_4829_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2435_l2423_l2420_DUPLICATE_4829_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2435_l2423_l2420_DUPLICATE_4829_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_8725_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2435_l2423_l2420_DUPLICATE_4829_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2428_l2423_DUPLICATE_6476_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2428_l2423_DUPLICATE_6476_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2428_l2423_l2420_DUPLICATE_d22e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2428_l2423_l2420_DUPLICATE_d22e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2428_l2423_l2420_DUPLICATE_d22e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2428_l2423_l2420_DUPLICATE_d22e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2428_l2423_l2420_DUPLICATE_d22e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2416_l2413_l2408_l2428_l2423_l2420_DUPLICATE_d22e_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2429_c11_4896_right := VAR_CONST_SR_4_uxn_opcodes_h_l2429_c34_a4c3_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2435_c7_8725] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_8725_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_8725_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_8725_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_8725_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_8725_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_8725_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_8725_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_8725_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2426_c32_3fec] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2426_c32_3fec_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2426_c32_3fec_left;
     BIN_OP_GT_uxn_opcodes_h_l2426_c32_3fec_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2426_c32_3fec_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2426_c32_3fec_return_output := BIN_OP_GT_uxn_opcodes_h_l2426_c32_3fec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2428_c7_9b23] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_9b23_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_9b23_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output;

     -- n8_MUX[uxn_opcodes_h_l2423_c7_2c53] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2423_c7_2c53_cond <= VAR_n8_MUX_uxn_opcodes_h_l2423_c7_2c53_cond;
     n8_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue;
     n8_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output := n8_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output;

     -- t8_MUX[uxn_opcodes_h_l2416_c7_780e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2416_c7_780e_cond <= VAR_t8_MUX_uxn_opcodes_h_l2416_c7_780e_cond;
     t8_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue;
     t8_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2416_c7_780e_return_output := t8_MUX_uxn_opcodes_h_l2416_c7_780e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2435_c7_8725] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_8725_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_8725_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_8725_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_8725_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_8725_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_8725_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_8725_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_8725_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2428_c7_9b23] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_9b23_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_9b23_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2408_c1_292d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2408_c1_292d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2408_c1_292d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2408_c1_292d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2408_c1_292d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2408_c1_292d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2408_c1_292d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2408_c1_292d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2408_c1_292d_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2429_c11_33aa] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2429_c11_33aa_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2429_c11_33aa_left;
     BIN_OP_SR_uxn_opcodes_h_l2429_c11_33aa_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2429_c11_33aa_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2429_c11_33aa_return_output := BIN_OP_SR_uxn_opcodes_h_l2429_c11_33aa_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2426_c32_d05a_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2426_c32_3fec_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2429_c11_4896_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2429_c11_33aa_return_output;
     VAR_printf_uxn_opcodes_h_l2409_c3_c579_uxn_opcodes_h_l2409_c3_c579_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2408_c1_292d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2435_c7_8725_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2435_c7_8725_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2416_c7_780e_return_output;
     -- printf_uxn_opcodes_h_l2409_c3_c579[uxn_opcodes_h_l2409_c3_c579] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2409_c3_c579_uxn_opcodes_h_l2409_c3_c579_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2409_c3_c579_uxn_opcodes_h_l2409_c3_c579_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2423_c7_2c53] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_2c53_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_2c53_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2423_c7_2c53] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2428_c7_9b23] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_9b23_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_9b23_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2428_c7_9b23] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_9b23_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_9b23_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output;

     -- MUX[uxn_opcodes_h_l2426_c32_d05a] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2426_c32_d05a_cond <= VAR_MUX_uxn_opcodes_h_l2426_c32_d05a_cond;
     MUX_uxn_opcodes_h_l2426_c32_d05a_iftrue <= VAR_MUX_uxn_opcodes_h_l2426_c32_d05a_iftrue;
     MUX_uxn_opcodes_h_l2426_c32_d05a_iffalse <= VAR_MUX_uxn_opcodes_h_l2426_c32_d05a_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2426_c32_d05a_return_output := MUX_uxn_opcodes_h_l2426_c32_d05a_return_output;

     -- n8_MUX[uxn_opcodes_h_l2420_c7_25a8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2420_c7_25a8_cond <= VAR_n8_MUX_uxn_opcodes_h_l2420_c7_25a8_cond;
     n8_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue;
     n8_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output := n8_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output;

     -- t8_MUX[uxn_opcodes_h_l2413_c7_51c2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2413_c7_51c2_cond <= VAR_t8_MUX_uxn_opcodes_h_l2413_c7_51c2_cond;
     t8_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue;
     t8_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output := t8_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2429_c11_4896] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2429_c11_4896_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2429_c11_4896_left;
     BIN_OP_SL_uxn_opcodes_h_l2429_c11_4896_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2429_c11_4896_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2429_c11_4896_return_output := BIN_OP_SL_uxn_opcodes_h_l2429_c11_4896_return_output;

     -- Submodule level 3
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2429_c11_4896_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2429_c11_4896_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue := VAR_MUX_uxn_opcodes_h_l2426_c32_d05a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2420_c7_25a8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_25a8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_25a8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2428_c7_9b23] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2428_c7_9b23_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2428_c7_9b23_cond;
     tmp8_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output := tmp8_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output;

     -- t8_MUX[uxn_opcodes_h_l2408_c2_e972] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2408_c2_e972_cond <= VAR_t8_MUX_uxn_opcodes_h_l2408_c2_e972_cond;
     t8_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue;
     t8_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2408_c2_e972_return_output := t8_MUX_uxn_opcodes_h_l2408_c2_e972_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2423_c7_2c53] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_2c53_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_2c53_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output;

     -- n8_MUX[uxn_opcodes_h_l2416_c7_780e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2416_c7_780e_cond <= VAR_n8_MUX_uxn_opcodes_h_l2416_c7_780e_cond;
     n8_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue;
     n8_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2416_c7_780e_return_output := n8_MUX_uxn_opcodes_h_l2416_c7_780e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2423_c7_2c53] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_2c53_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_2c53_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2428_c7_9b23] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2428_c7_9b23_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2428_c7_9b23_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2428_c7_9b23_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2428_c7_9b23_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output := result_stack_value_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2423_c7_2c53] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2420_c7_25a8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2416_c7_780e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2408_c2_e972_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2428_c7_9b23_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l2423_c7_2c53] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2423_c7_2c53_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2423_c7_2c53_cond;
     tmp8_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output := tmp8_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2420_c7_25a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_25a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_25a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2420_c7_25a8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_25a8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_25a8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2416_c7_780e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_780e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_780e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_780e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_780e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2423_c7_2c53] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2423_c7_2c53_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_2c53_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_2c53_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_2c53_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output := result_stack_value_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2416_c7_780e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_780e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_780e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_780e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_780e_return_output;

     -- n8_MUX[uxn_opcodes_h_l2413_c7_51c2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2413_c7_51c2_cond <= VAR_n8_MUX_uxn_opcodes_h_l2413_c7_51c2_cond;
     n8_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue;
     n8_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output := n8_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2420_c7_25a8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2416_c7_780e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2416_c7_780e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2423_c7_2c53_return_output;
     -- n8_MUX[uxn_opcodes_h_l2408_c2_e972] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2408_c2_e972_cond <= VAR_n8_MUX_uxn_opcodes_h_l2408_c2_e972_cond;
     n8_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue;
     n8_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2408_c2_e972_return_output := n8_MUX_uxn_opcodes_h_l2408_c2_e972_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2416_c7_780e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_780e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_780e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_780e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_780e_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2420_c7_25a8] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2420_c7_25a8_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2420_c7_25a8_cond;
     tmp8_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output := tmp8_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2420_c7_25a8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2420_c7_25a8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_25a8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_25a8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_25a8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output := result_stack_value_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2416_c7_780e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_780e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_780e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_780e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_780e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2413_c7_51c2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2413_c7_51c2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_51c2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_51c2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2416_c7_780e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_780e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_780e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_780e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_780e_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2408_c2_e972_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2416_c7_780e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2416_c7_780e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2416_c7_780e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2420_c7_25a8_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2408_c2_e972] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_e972_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_e972_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_e972_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_e972_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2416_c7_780e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2416_c7_780e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_780e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_780e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2416_c7_780e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2413_c7_51c2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_51c2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_51c2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2413_c7_51c2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_51c2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_51c2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2408_c2_e972] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_e972_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_e972_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_e972_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_e972_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2413_c7_51c2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2416_c7_780e] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2416_c7_780e_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_780e_cond;
     tmp8_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_780e_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_780e_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_780e_return_output := tmp8_MUX_uxn_opcodes_h_l2416_c7_780e_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2416_c7_780e_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2416_c7_780e_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l2413_c7_51c2] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2413_c7_51c2_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2413_c7_51c2_cond;
     tmp8_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output := tmp8_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2413_c7_51c2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2413_c7_51c2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2413_c7_51c2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2413_c7_51c2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2413_c7_51c2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2408_c2_e972] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_e972_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_e972_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_e972_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_e972_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2408_c2_e972] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_e972_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_e972_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_e972_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_e972_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2408_c2_e972] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_e972_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_e972_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_e972_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_e972_return_output;

     -- Submodule level 8
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2413_c7_51c2_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l2408_c2_e972] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2408_c2_e972_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2408_c2_e972_cond;
     tmp8_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2408_c2_e972_return_output := tmp8_MUX_uxn_opcodes_h_l2408_c2_e972_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2408_c2_e972] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2408_c2_e972_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c2_e972_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c2_e972_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c2_e972_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c2_e972_return_output := result_stack_value_MUX_uxn_opcodes_h_l2408_c2_e972_return_output;

     -- Submodule level 9
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l2408_c2_e972_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2404_l2440_DUPLICATE_3b50 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2404_l2440_DUPLICATE_3b50_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_09c5(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2408_c2_e972_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2408_c2_e972_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2408_c2_e972_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2408_c2_e972_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2408_c2_e972_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2408_c2_e972_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2404_l2440_DUPLICATE_3b50_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_09c5_uxn_opcodes_h_l2404_l2440_DUPLICATE_3b50_return_output;
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
