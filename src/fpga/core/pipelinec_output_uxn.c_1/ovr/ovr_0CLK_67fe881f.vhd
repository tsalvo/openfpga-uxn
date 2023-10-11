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
entity ovr_0CLK_67fe881f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ovr_0CLK_67fe881f;
architecture arch of ovr_0CLK_67fe881f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l300_c6_a6ba]
signal BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l300_c1_c0e3]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l300_c1_c0e3_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l300_c1_c0e3_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l300_c1_c0e3_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l300_c1_c0e3_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l300_c2_a5a9]
signal t8_MUX_uxn_opcodes_h_l300_c2_a5a9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l300_c2_a5a9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l300_c2_a5a9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l300_c2_a5a9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l300_c2_a5a9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l300_c2_a5a9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l300_c2_a5a9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l300_c2_a5a9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l300_c2_a5a9]
signal result_stack_value_MUX_uxn_opcodes_h_l300_c2_a5a9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l300_c2_a5a9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l300_c2_a5a9]
signal n8_MUX_uxn_opcodes_h_l300_c2_a5a9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l301_c3_08a7[uxn_opcodes_h_l301_c3_08a7]
signal printf_uxn_opcodes_h_l301_c3_08a7_uxn_opcodes_h_l301_c3_08a7_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l305_c11_93b6]
signal BIN_OP_EQ_uxn_opcodes_h_l305_c11_93b6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l305_c11_93b6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l305_c11_93b6_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l305_c7_4695]
signal t8_MUX_uxn_opcodes_h_l305_c7_4695_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l305_c7_4695_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l305_c7_4695_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l305_c7_4695_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l305_c7_4695]
signal result_is_stack_write_MUX_uxn_opcodes_h_l305_c7_4695_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l305_c7_4695_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l305_c7_4695_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l305_c7_4695_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l305_c7_4695]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l305_c7_4695_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l305_c7_4695_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l305_c7_4695_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l305_c7_4695_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l305_c7_4695]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l305_c7_4695_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l305_c7_4695_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l305_c7_4695_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l305_c7_4695_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l305_c7_4695]
signal result_is_opc_done_MUX_uxn_opcodes_h_l305_c7_4695_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l305_c7_4695_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l305_c7_4695_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l305_c7_4695_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l305_c7_4695]
signal result_stack_value_MUX_uxn_opcodes_h_l305_c7_4695_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l305_c7_4695_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l305_c7_4695_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l305_c7_4695_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l305_c7_4695]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l305_c7_4695_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l305_c7_4695_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l305_c7_4695_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l305_c7_4695_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l305_c7_4695]
signal n8_MUX_uxn_opcodes_h_l305_c7_4695_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l305_c7_4695_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l305_c7_4695_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l305_c7_4695_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l308_c11_29ac]
signal BIN_OP_EQ_uxn_opcodes_h_l308_c11_29ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l308_c11_29ac_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l308_c11_29ac_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l308_c7_6025]
signal t8_MUX_uxn_opcodes_h_l308_c7_6025_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l308_c7_6025_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l308_c7_6025_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l308_c7_6025_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l308_c7_6025]
signal result_is_stack_write_MUX_uxn_opcodes_h_l308_c7_6025_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l308_c7_6025_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l308_c7_6025_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l308_c7_6025_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l308_c7_6025]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l308_c7_6025_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l308_c7_6025_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l308_c7_6025_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l308_c7_6025_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l308_c7_6025]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l308_c7_6025_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l308_c7_6025_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l308_c7_6025_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l308_c7_6025_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l308_c7_6025]
signal result_is_opc_done_MUX_uxn_opcodes_h_l308_c7_6025_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l308_c7_6025_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l308_c7_6025_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l308_c7_6025_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l308_c7_6025]
signal result_stack_value_MUX_uxn_opcodes_h_l308_c7_6025_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l308_c7_6025_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l308_c7_6025_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l308_c7_6025_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l308_c7_6025]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l308_c7_6025_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l308_c7_6025_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l308_c7_6025_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l308_c7_6025_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l308_c7_6025]
signal n8_MUX_uxn_opcodes_h_l308_c7_6025_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l308_c7_6025_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l308_c7_6025_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l308_c7_6025_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l312_c11_da06]
signal BIN_OP_EQ_uxn_opcodes_h_l312_c11_da06_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l312_c11_da06_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l312_c11_da06_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l312_c7_bbc9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_bbc9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l312_c7_bbc9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_bbc9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l312_c7_bbc9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l312_c7_bbc9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_bbc9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l312_c7_bbc9]
signal result_stack_value_MUX_uxn_opcodes_h_l312_c7_bbc9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l312_c7_bbc9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l312_c7_bbc9]
signal n8_MUX_uxn_opcodes_h_l312_c7_bbc9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l315_c11_4c76]
signal BIN_OP_EQ_uxn_opcodes_h_l315_c11_4c76_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l315_c11_4c76_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l315_c11_4c76_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l315_c7_08b9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l315_c7_08b9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l315_c7_08b9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l315_c7_08b9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l315_c7_08b9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l315_c7_08b9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l315_c7_08b9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l315_c7_08b9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l315_c7_08b9_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l315_c7_08b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l315_c7_08b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l315_c7_08b9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l315_c7_08b9]
signal result_stack_value_MUX_uxn_opcodes_h_l315_c7_08b9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l315_c7_08b9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l315_c7_08b9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l315_c7_08b9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l315_c7_08b9_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l315_c7_08b9]
signal n8_MUX_uxn_opcodes_h_l315_c7_08b9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l315_c7_08b9_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l318_c32_9feb]
signal BIN_OP_AND_uxn_opcodes_h_l318_c32_9feb_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l318_c32_9feb_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l318_c32_9feb_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l318_c32_3de7]
signal BIN_OP_GT_uxn_opcodes_h_l318_c32_3de7_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l318_c32_3de7_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l318_c32_3de7_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l318_c32_d3a5]
signal MUX_uxn_opcodes_h_l318_c32_d3a5_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l318_c32_d3a5_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l318_c32_d3a5_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l318_c32_d3a5_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l320_c11_4848]
signal BIN_OP_EQ_uxn_opcodes_h_l320_c11_4848_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l320_c11_4848_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l320_c11_4848_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l320_c7_7201]
signal result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_7201_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_7201_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_7201_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_7201_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l320_c7_7201]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_7201_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_7201_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_7201_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_7201_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l320_c7_7201]
signal result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_7201_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_7201_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_7201_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_7201_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l320_c7_7201]
signal result_stack_value_MUX_uxn_opcodes_h_l320_c7_7201_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l320_c7_7201_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l320_c7_7201_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l320_c7_7201_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l320_c7_7201]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_7201_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_7201_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_7201_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_7201_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l326_c11_679e]
signal BIN_OP_EQ_uxn_opcodes_h_l326_c11_679e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l326_c11_679e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l326_c11_679e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l326_c7_6abf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_6abf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_6abf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_6abf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_6abf_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l326_c7_6abf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_6abf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_6abf_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_6abf_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_6abf_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l326_c7_6abf]
signal result_stack_value_MUX_uxn_opcodes_h_l326_c7_6abf_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l326_c7_6abf_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l326_c7_6abf_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l326_c7_6abf_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l326_c7_6abf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_6abf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_6abf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_6abf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_6abf_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l330_c11_b6f4]
signal BIN_OP_EQ_uxn_opcodes_h_l330_c11_b6f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l330_c11_b6f4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l330_c11_b6f4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l330_c7_ab83]
signal result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_ab83_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_ab83_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_ab83_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_ab83_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l330_c7_ab83]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c7_ab83_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c7_ab83_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c7_ab83_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c7_ab83_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l330_c7_ab83]
signal result_stack_value_MUX_uxn_opcodes_h_l330_c7_ab83_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l330_c7_ab83_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l330_c7_ab83_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l330_c7_ab83_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l330_c7_ab83]
signal result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_ab83_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_ab83_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_ab83_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_ab83_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l334_c11_6b3f]
signal BIN_OP_EQ_uxn_opcodes_h_l334_c11_6b3f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l334_c11_6b3f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l334_c11_6b3f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l334_c7_4312]
signal result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_4312_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_4312_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_4312_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_4312_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l334_c7_4312]
signal result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_4312_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_4312_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_4312_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_4312_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba
BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba_left,
BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba_right,
BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l300_c1_c0e3
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l300_c1_c0e3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l300_c1_c0e3_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l300_c1_c0e3_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l300_c1_c0e3_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l300_c1_c0e3_return_output);

-- t8_MUX_uxn_opcodes_h_l300_c2_a5a9
t8_MUX_uxn_opcodes_h_l300_c2_a5a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l300_c2_a5a9_cond,
t8_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue,
t8_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse,
t8_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l300_c2_a5a9
result_is_stack_write_MUX_uxn_opcodes_h_l300_c2_a5a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l300_c2_a5a9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l300_c2_a5a9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l300_c2_a5a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l300_c2_a5a9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l300_c2_a5a9
result_sp_relative_shift_MUX_uxn_opcodes_h_l300_c2_a5a9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l300_c2_a5a9
result_is_opc_done_MUX_uxn_opcodes_h_l300_c2_a5a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l300_c2_a5a9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l300_c2_a5a9
result_stack_value_MUX_uxn_opcodes_h_l300_c2_a5a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l300_c2_a5a9_cond,
result_stack_value_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l300_c2_a5a9
result_is_sp_shift_MUX_uxn_opcodes_h_l300_c2_a5a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output);

-- n8_MUX_uxn_opcodes_h_l300_c2_a5a9
n8_MUX_uxn_opcodes_h_l300_c2_a5a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l300_c2_a5a9_cond,
n8_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue,
n8_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse,
n8_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output);

-- printf_uxn_opcodes_h_l301_c3_08a7_uxn_opcodes_h_l301_c3_08a7
printf_uxn_opcodes_h_l301_c3_08a7_uxn_opcodes_h_l301_c3_08a7 : entity work.printf_uxn_opcodes_h_l301_c3_08a7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l301_c3_08a7_uxn_opcodes_h_l301_c3_08a7_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l305_c11_93b6
BIN_OP_EQ_uxn_opcodes_h_l305_c11_93b6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l305_c11_93b6_left,
BIN_OP_EQ_uxn_opcodes_h_l305_c11_93b6_right,
BIN_OP_EQ_uxn_opcodes_h_l305_c11_93b6_return_output);

-- t8_MUX_uxn_opcodes_h_l305_c7_4695
t8_MUX_uxn_opcodes_h_l305_c7_4695 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l305_c7_4695_cond,
t8_MUX_uxn_opcodes_h_l305_c7_4695_iftrue,
t8_MUX_uxn_opcodes_h_l305_c7_4695_iffalse,
t8_MUX_uxn_opcodes_h_l305_c7_4695_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l305_c7_4695
result_is_stack_write_MUX_uxn_opcodes_h_l305_c7_4695 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l305_c7_4695_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l305_c7_4695_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l305_c7_4695_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l305_c7_4695_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l305_c7_4695
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l305_c7_4695 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l305_c7_4695_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l305_c7_4695_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l305_c7_4695_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l305_c7_4695_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l305_c7_4695
result_sp_relative_shift_MUX_uxn_opcodes_h_l305_c7_4695 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l305_c7_4695_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l305_c7_4695_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l305_c7_4695_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l305_c7_4695_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l305_c7_4695
result_is_opc_done_MUX_uxn_opcodes_h_l305_c7_4695 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l305_c7_4695_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l305_c7_4695_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l305_c7_4695_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l305_c7_4695_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l305_c7_4695
result_stack_value_MUX_uxn_opcodes_h_l305_c7_4695 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l305_c7_4695_cond,
result_stack_value_MUX_uxn_opcodes_h_l305_c7_4695_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l305_c7_4695_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l305_c7_4695_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l305_c7_4695
result_is_sp_shift_MUX_uxn_opcodes_h_l305_c7_4695 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l305_c7_4695_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l305_c7_4695_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l305_c7_4695_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l305_c7_4695_return_output);

-- n8_MUX_uxn_opcodes_h_l305_c7_4695
n8_MUX_uxn_opcodes_h_l305_c7_4695 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l305_c7_4695_cond,
n8_MUX_uxn_opcodes_h_l305_c7_4695_iftrue,
n8_MUX_uxn_opcodes_h_l305_c7_4695_iffalse,
n8_MUX_uxn_opcodes_h_l305_c7_4695_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l308_c11_29ac
BIN_OP_EQ_uxn_opcodes_h_l308_c11_29ac : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l308_c11_29ac_left,
BIN_OP_EQ_uxn_opcodes_h_l308_c11_29ac_right,
BIN_OP_EQ_uxn_opcodes_h_l308_c11_29ac_return_output);

-- t8_MUX_uxn_opcodes_h_l308_c7_6025
t8_MUX_uxn_opcodes_h_l308_c7_6025 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l308_c7_6025_cond,
t8_MUX_uxn_opcodes_h_l308_c7_6025_iftrue,
t8_MUX_uxn_opcodes_h_l308_c7_6025_iffalse,
t8_MUX_uxn_opcodes_h_l308_c7_6025_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l308_c7_6025
result_is_stack_write_MUX_uxn_opcodes_h_l308_c7_6025 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l308_c7_6025_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l308_c7_6025_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l308_c7_6025_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l308_c7_6025_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l308_c7_6025
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l308_c7_6025 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l308_c7_6025_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l308_c7_6025_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l308_c7_6025_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l308_c7_6025_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l308_c7_6025
result_sp_relative_shift_MUX_uxn_opcodes_h_l308_c7_6025 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l308_c7_6025_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l308_c7_6025_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l308_c7_6025_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l308_c7_6025_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l308_c7_6025
result_is_opc_done_MUX_uxn_opcodes_h_l308_c7_6025 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l308_c7_6025_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l308_c7_6025_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l308_c7_6025_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l308_c7_6025_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l308_c7_6025
result_stack_value_MUX_uxn_opcodes_h_l308_c7_6025 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l308_c7_6025_cond,
result_stack_value_MUX_uxn_opcodes_h_l308_c7_6025_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l308_c7_6025_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l308_c7_6025_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l308_c7_6025
result_is_sp_shift_MUX_uxn_opcodes_h_l308_c7_6025 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l308_c7_6025_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l308_c7_6025_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l308_c7_6025_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l308_c7_6025_return_output);

-- n8_MUX_uxn_opcodes_h_l308_c7_6025
n8_MUX_uxn_opcodes_h_l308_c7_6025 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l308_c7_6025_cond,
n8_MUX_uxn_opcodes_h_l308_c7_6025_iftrue,
n8_MUX_uxn_opcodes_h_l308_c7_6025_iffalse,
n8_MUX_uxn_opcodes_h_l308_c7_6025_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l312_c11_da06
BIN_OP_EQ_uxn_opcodes_h_l312_c11_da06 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l312_c11_da06_left,
BIN_OP_EQ_uxn_opcodes_h_l312_c11_da06_right,
BIN_OP_EQ_uxn_opcodes_h_l312_c11_da06_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_bbc9
result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_bbc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_bbc9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_bbc9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_bbc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_bbc9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_bbc9
result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_bbc9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_bbc9
result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_bbc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_bbc9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l312_c7_bbc9
result_stack_value_MUX_uxn_opcodes_h_l312_c7_bbc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l312_c7_bbc9_cond,
result_stack_value_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_bbc9
result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_bbc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output);

-- n8_MUX_uxn_opcodes_h_l312_c7_bbc9
n8_MUX_uxn_opcodes_h_l312_c7_bbc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l312_c7_bbc9_cond,
n8_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue,
n8_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse,
n8_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l315_c11_4c76
BIN_OP_EQ_uxn_opcodes_h_l315_c11_4c76 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l315_c11_4c76_left,
BIN_OP_EQ_uxn_opcodes_h_l315_c11_4c76_right,
BIN_OP_EQ_uxn_opcodes_h_l315_c11_4c76_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l315_c7_08b9
result_is_stack_write_MUX_uxn_opcodes_h_l315_c7_08b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l315_c7_08b9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l315_c7_08b9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l315_c7_08b9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l315_c7_08b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l315_c7_08b9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l315_c7_08b9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l315_c7_08b9
result_sp_relative_shift_MUX_uxn_opcodes_h_l315_c7_08b9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l315_c7_08b9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l315_c7_08b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l315_c7_08b9
result_is_opc_done_MUX_uxn_opcodes_h_l315_c7_08b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l315_c7_08b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l315_c7_08b9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l315_c7_08b9
result_stack_value_MUX_uxn_opcodes_h_l315_c7_08b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l315_c7_08b9_cond,
result_stack_value_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l315_c7_08b9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l315_c7_08b9
result_is_sp_shift_MUX_uxn_opcodes_h_l315_c7_08b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l315_c7_08b9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l315_c7_08b9_return_output);

-- n8_MUX_uxn_opcodes_h_l315_c7_08b9
n8_MUX_uxn_opcodes_h_l315_c7_08b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l315_c7_08b9_cond,
n8_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue,
n8_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse,
n8_MUX_uxn_opcodes_h_l315_c7_08b9_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l318_c32_9feb
BIN_OP_AND_uxn_opcodes_h_l318_c32_9feb : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l318_c32_9feb_left,
BIN_OP_AND_uxn_opcodes_h_l318_c32_9feb_right,
BIN_OP_AND_uxn_opcodes_h_l318_c32_9feb_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l318_c32_3de7
BIN_OP_GT_uxn_opcodes_h_l318_c32_3de7 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l318_c32_3de7_left,
BIN_OP_GT_uxn_opcodes_h_l318_c32_3de7_right,
BIN_OP_GT_uxn_opcodes_h_l318_c32_3de7_return_output);

-- MUX_uxn_opcodes_h_l318_c32_d3a5
MUX_uxn_opcodes_h_l318_c32_d3a5 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l318_c32_d3a5_cond,
MUX_uxn_opcodes_h_l318_c32_d3a5_iftrue,
MUX_uxn_opcodes_h_l318_c32_d3a5_iffalse,
MUX_uxn_opcodes_h_l318_c32_d3a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l320_c11_4848
BIN_OP_EQ_uxn_opcodes_h_l320_c11_4848 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l320_c11_4848_left,
BIN_OP_EQ_uxn_opcodes_h_l320_c11_4848_right,
BIN_OP_EQ_uxn_opcodes_h_l320_c11_4848_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_7201
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_7201 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_7201_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_7201_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_7201_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_7201_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_7201
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_7201 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_7201_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_7201_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_7201_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_7201_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_7201
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_7201 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_7201_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_7201_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_7201_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_7201_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l320_c7_7201
result_stack_value_MUX_uxn_opcodes_h_l320_c7_7201 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l320_c7_7201_cond,
result_stack_value_MUX_uxn_opcodes_h_l320_c7_7201_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l320_c7_7201_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l320_c7_7201_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_7201
result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_7201 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_7201_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_7201_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_7201_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_7201_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l326_c11_679e
BIN_OP_EQ_uxn_opcodes_h_l326_c11_679e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l326_c11_679e_left,
BIN_OP_EQ_uxn_opcodes_h_l326_c11_679e_right,
BIN_OP_EQ_uxn_opcodes_h_l326_c11_679e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_6abf
result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_6abf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_6abf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_6abf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_6abf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_6abf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_6abf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_6abf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_6abf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_6abf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_6abf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_6abf_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l326_c7_6abf
result_stack_value_MUX_uxn_opcodes_h_l326_c7_6abf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l326_c7_6abf_cond,
result_stack_value_MUX_uxn_opcodes_h_l326_c7_6abf_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l326_c7_6abf_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l326_c7_6abf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_6abf
result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_6abf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_6abf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_6abf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_6abf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_6abf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l330_c11_b6f4
BIN_OP_EQ_uxn_opcodes_h_l330_c11_b6f4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l330_c11_b6f4_left,
BIN_OP_EQ_uxn_opcodes_h_l330_c11_b6f4_right,
BIN_OP_EQ_uxn_opcodes_h_l330_c11_b6f4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_ab83
result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_ab83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_ab83_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_ab83_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_ab83_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_ab83_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c7_ab83
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c7_ab83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c7_ab83_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c7_ab83_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c7_ab83_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c7_ab83_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l330_c7_ab83
result_stack_value_MUX_uxn_opcodes_h_l330_c7_ab83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l330_c7_ab83_cond,
result_stack_value_MUX_uxn_opcodes_h_l330_c7_ab83_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l330_c7_ab83_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l330_c7_ab83_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_ab83
result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_ab83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_ab83_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_ab83_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_ab83_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_ab83_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l334_c11_6b3f
BIN_OP_EQ_uxn_opcodes_h_l334_c11_6b3f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l334_c11_6b3f_left,
BIN_OP_EQ_uxn_opcodes_h_l334_c11_6b3f_right,
BIN_OP_EQ_uxn_opcodes_h_l334_c11_6b3f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_4312
result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_4312 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_4312_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_4312_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_4312_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_4312_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_4312
result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_4312 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_4312_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_4312_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_4312_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_4312_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l300_c1_c0e3_return_output,
 t8_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output,
 n8_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l305_c11_93b6_return_output,
 t8_MUX_uxn_opcodes_h_l305_c7_4695_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l305_c7_4695_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l305_c7_4695_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l305_c7_4695_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l305_c7_4695_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l305_c7_4695_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l305_c7_4695_return_output,
 n8_MUX_uxn_opcodes_h_l305_c7_4695_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l308_c11_29ac_return_output,
 t8_MUX_uxn_opcodes_h_l308_c7_6025_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l308_c7_6025_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l308_c7_6025_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l308_c7_6025_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l308_c7_6025_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l308_c7_6025_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l308_c7_6025_return_output,
 n8_MUX_uxn_opcodes_h_l308_c7_6025_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l312_c11_da06_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output,
 n8_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l315_c11_4c76_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l315_c7_08b9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l315_c7_08b9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l315_c7_08b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l315_c7_08b9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l315_c7_08b9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l315_c7_08b9_return_output,
 n8_MUX_uxn_opcodes_h_l315_c7_08b9_return_output,
 BIN_OP_AND_uxn_opcodes_h_l318_c32_9feb_return_output,
 BIN_OP_GT_uxn_opcodes_h_l318_c32_3de7_return_output,
 MUX_uxn_opcodes_h_l318_c32_d3a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l320_c11_4848_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_7201_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_7201_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_7201_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l320_c7_7201_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_7201_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l326_c11_679e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_6abf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_6abf_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l326_c7_6abf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_6abf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l330_c11_b6f4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_ab83_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c7_ab83_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l330_c7_ab83_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_ab83_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l334_c11_6b3f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_4312_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_4312_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l300_c1_c0e3_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l300_c1_c0e3_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l300_c1_c0e3_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l300_c1_c0e3_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l305_c7_4695_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l300_c2_a5a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l305_c7_4695_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l300_c2_a5a9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l302_c3_7f7a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l305_c7_4695_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l300_c2_a5a9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l305_c7_4695_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l305_c7_4695_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l300_c2_a5a9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l305_c7_4695_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l300_c2_a5a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l305_c7_4695_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l305_c7_4695_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l300_c2_a5a9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l301_c3_08a7_uxn_opcodes_h_l301_c3_08a7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l305_c11_93b6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l305_c11_93b6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l305_c11_93b6_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l305_c7_4695_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l305_c7_4695_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l308_c7_6025_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l305_c7_4695_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l305_c7_4695_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l305_c7_4695_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l308_c7_6025_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l305_c7_4695_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l305_c7_4695_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l306_c3_957f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l305_c7_4695_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l308_c7_6025_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l305_c7_4695_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l305_c7_4695_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l305_c7_4695_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l308_c7_6025_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l305_c7_4695_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l305_c7_4695_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l305_c7_4695_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l308_c7_6025_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l305_c7_4695_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l305_c7_4695_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l305_c7_4695_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l308_c7_6025_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l305_c7_4695_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l305_c7_4695_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l305_c7_4695_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l308_c7_6025_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l305_c7_4695_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l305_c7_4695_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l305_c7_4695_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l308_c7_6025_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l305_c7_4695_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l308_c11_29ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l308_c11_29ac_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l308_c11_29ac_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l308_c7_6025_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l308_c7_6025_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l308_c7_6025_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l308_c7_6025_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l308_c7_6025_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l308_c7_6025_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l308_c7_6025_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l310_c3_1625 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l308_c7_6025_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l308_c7_6025_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l308_c7_6025_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l308_c7_6025_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l308_c7_6025_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l308_c7_6025_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l308_c7_6025_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l308_c7_6025_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l308_c7_6025_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l308_c7_6025_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l308_c7_6025_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l308_c7_6025_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l308_c7_6025_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l308_c7_6025_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l308_c7_6025_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l308_c7_6025_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l308_c7_6025_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_da06_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_da06_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_da06_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l315_c7_08b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_bbc9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l313_c3_f196 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l315_c7_08b9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_bbc9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l315_c7_08b9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l315_c7_08b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_bbc9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l315_c7_08b9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l312_c7_bbc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l315_c7_08b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l315_c7_08b9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l312_c7_bbc9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l315_c11_4c76_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l315_c11_4c76_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l315_c11_4c76_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_7201_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l315_c7_08b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_7201_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l315_c7_08b9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l315_c7_08b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_7201_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l315_c7_08b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_7201_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l315_c7_08b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_7201_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l315_c7_08b9_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l315_c7_08b9_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l318_c32_d3a5_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l318_c32_d3a5_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l318_c32_d3a5_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l318_c32_9feb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l318_c32_9feb_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l318_c32_9feb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l318_c32_3de7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l318_c32_3de7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l318_c32_3de7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l318_c32_d3a5_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_4848_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_4848_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_4848_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_7201_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_7201_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_6abf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_7201_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_7201_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l323_c3_69de : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_7201_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_6abf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_7201_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_7201_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_7201_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_6abf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_7201_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_7201_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_7201_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l326_c7_6abf_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_7201_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_7201_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_7201_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_7201_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l326_c11_679e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l326_c11_679e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l326_c11_679e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_6abf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_6abf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_ab83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_6abf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_6abf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l327_c3_c374 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_6abf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c7_ab83_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_6abf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l326_c7_6abf_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l326_c7_6abf_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c7_ab83_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l326_c7_6abf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_6abf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_6abf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_ab83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_6abf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b6f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b6f4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b6f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_ab83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_ab83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_4312_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_ab83_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c7_ab83_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l331_c3_dc02 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c7_ab83_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c7_ab83_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c7_ab83_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c7_ab83_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c7_ab83_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_ab83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_ab83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_4312_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_ab83_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l334_c11_6b3f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l334_c11_6b3f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l334_c11_6b3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_4312_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_4312_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_4312_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_4312_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_4312_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_4312_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l308_l334_l305_l330_l300_l326_l315_l312_DUPLICATE_d834_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l308_l305_l300_l315_l312_DUPLICATE_04a7_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l308_l305_l330_l300_l315_l312_DUPLICATE_584b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l308_l305_l300_l320_l312_DUPLICATE_3e45_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l308_l334_l305_l330_l326_l320_l315_l312_DUPLICATE_f1c7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l315_l330_DUPLICATE_1391_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l339_l296_DUPLICATE_ff8e_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l334_c11_6b3f_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l331_c3_dc02 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c7_ab83_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l331_c3_dc02;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_7201_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l327_c3_c374 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_6abf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l327_c3_c374;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_4312_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_4848_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l300_c1_c0e3_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_da06_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l308_c11_29ac_right := to_unsigned(2, 2);
     VAR_MUX_uxn_opcodes_h_l318_c32_d3a5_iftrue := signed(std_logic_vector(resize(to_unsigned(3, 2), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l310_c3_1625 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l308_c7_6025_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l310_c3_1625;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l315_c11_4c76_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l323_c3_69de := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_7201_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l323_c3_69de;
     VAR_BIN_OP_GT_uxn_opcodes_h_l318_c32_3de7_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l306_c3_957f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l305_c7_4695_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l306_c3_957f;
     VAR_MUX_uxn_opcodes_h_l318_c32_d3a5_iffalse := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l302_c3_7f7a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l302_c3_7f7a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b6f4_right := to_unsigned(7, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l313_c3_f196 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l313_c3_f196;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_4312_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l326_c11_679e_right := to_unsigned(6, 3);
     VAR_BIN_OP_AND_uxn_opcodes_h_l318_c32_9feb_right := to_unsigned(128, 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_7201_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l305_c11_93b6_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l300_c1_c0e3_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l318_c32_9feb_left := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l305_c7_4695_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l308_c7_6025_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_7201_iftrue := n8;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c7_ab83_iftrue := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l305_c11_93b6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l308_c11_29ac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_da06_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l315_c11_4c76_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_4848_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l326_c11_679e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b6f4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l334_c11_6b3f_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l308_c7_6025_iftrue := VAR_previous_stack_read;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l326_c7_6abf_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l305_c7_4695_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l308_c7_6025_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l308_l334_l305_l330_l300_l326_l315_l312_DUPLICATE_d834 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l308_l334_l305_l330_l300_l326_l315_l312_DUPLICATE_d834_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l305_c11_93b6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l305_c11_93b6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l305_c11_93b6_left;
     BIN_OP_EQ_uxn_opcodes_h_l305_c11_93b6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l305_c11_93b6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l305_c11_93b6_return_output := BIN_OP_EQ_uxn_opcodes_h_l305_c11_93b6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l308_c11_29ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l308_c11_29ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l308_c11_29ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l308_c11_29ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l308_c11_29ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l308_c11_29ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l308_c11_29ac_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l330_c11_b6f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l330_c11_b6f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b6f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l330_c11_b6f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b6f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b6f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l330_c11_b6f4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l315_c11_4c76] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l315_c11_4c76_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l315_c11_4c76_left;
     BIN_OP_EQ_uxn_opcodes_h_l315_c11_4c76_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l315_c11_4c76_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l315_c11_4c76_return_output := BIN_OP_EQ_uxn_opcodes_h_l315_c11_4c76_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l334_c11_6b3f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l334_c11_6b3f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l334_c11_6b3f_left;
     BIN_OP_EQ_uxn_opcodes_h_l334_c11_6b3f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l334_c11_6b3f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l334_c11_6b3f_return_output := BIN_OP_EQ_uxn_opcodes_h_l334_c11_6b3f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l315_l330_DUPLICATE_1391 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l315_l330_DUPLICATE_1391_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l320_c11_4848] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l320_c11_4848_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_4848_left;
     BIN_OP_EQ_uxn_opcodes_h_l320_c11_4848_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_4848_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_4848_return_output := BIN_OP_EQ_uxn_opcodes_h_l320_c11_4848_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l300_c6_a6ba] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba_left;
     BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba_return_output := BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l318_c32_9feb] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l318_c32_9feb_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l318_c32_9feb_left;
     BIN_OP_AND_uxn_opcodes_h_l318_c32_9feb_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l318_c32_9feb_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l318_c32_9feb_return_output := BIN_OP_AND_uxn_opcodes_h_l318_c32_9feb_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l308_l305_l300_l315_l312_DUPLICATE_04a7 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l308_l305_l300_l315_l312_DUPLICATE_04a7_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l326_c11_679e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l326_c11_679e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l326_c11_679e_left;
     BIN_OP_EQ_uxn_opcodes_h_l326_c11_679e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l326_c11_679e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l326_c11_679e_return_output := BIN_OP_EQ_uxn_opcodes_h_l326_c11_679e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l308_l305_l300_l320_l312_DUPLICATE_3e45 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l308_l305_l300_l320_l312_DUPLICATE_3e45_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l308_l334_l305_l330_l326_l320_l315_l312_DUPLICATE_f1c7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l308_l334_l305_l330_l326_l320_l315_l312_DUPLICATE_f1c7_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l308_l305_l330_l300_l315_l312_DUPLICATE_584b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l308_l305_l330_l300_l315_l312_DUPLICATE_584b_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l312_c11_da06] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l312_c11_da06_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_da06_left;
     BIN_OP_EQ_uxn_opcodes_h_l312_c11_da06_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_da06_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_da06_return_output := BIN_OP_EQ_uxn_opcodes_h_l312_c11_da06_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l318_c32_3de7_left := VAR_BIN_OP_AND_uxn_opcodes_h_l318_c32_9feb_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l300_c1_c0e3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l300_c2_a5a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l300_c2_a5a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l300_c2_a5a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l300_c2_a5a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l300_c2_a5a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l300_c2_a5a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l300_c6_a6ba_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l305_c7_4695_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l305_c11_93b6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l305_c7_4695_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l305_c11_93b6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l305_c7_4695_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l305_c11_93b6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l305_c7_4695_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l305_c11_93b6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l305_c7_4695_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l305_c11_93b6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l305_c7_4695_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l305_c11_93b6_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l305_c7_4695_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l305_c11_93b6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l305_c7_4695_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l305_c11_93b6_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l308_c7_6025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l308_c11_29ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l308_c7_6025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l308_c11_29ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l308_c7_6025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l308_c11_29ac_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l308_c7_6025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l308_c11_29ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l308_c7_6025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l308_c11_29ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l308_c7_6025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l308_c11_29ac_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l308_c7_6025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l308_c11_29ac_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l308_c7_6025_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l308_c11_29ac_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l312_c7_bbc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_da06_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_bbc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_da06_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_da06_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_bbc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_da06_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_da06_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_bbc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_da06_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l312_c7_bbc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l312_c11_da06_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l315_c7_08b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l315_c11_4c76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l315_c7_08b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l315_c11_4c76_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l315_c7_08b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l315_c11_4c76_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l315_c7_08b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l315_c11_4c76_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l315_c7_08b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l315_c11_4c76_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l315_c7_08b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l315_c11_4c76_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l315_c7_08b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l315_c11_4c76_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_7201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_4848_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_7201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_4848_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_7201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_4848_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_7201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_4848_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_7201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l320_c11_4848_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_6abf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l326_c11_679e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_6abf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l326_c11_679e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_6abf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l326_c11_679e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l326_c7_6abf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l326_c11_679e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_ab83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b6f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_ab83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b6f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c7_ab83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b6f4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c7_ab83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l330_c11_b6f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_4312_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l334_c11_6b3f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_4312_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l334_c11_6b3f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l308_l305_l300_l315_l312_DUPLICATE_04a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l305_c7_4695_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l308_l305_l300_l315_l312_DUPLICATE_04a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l308_c7_6025_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l308_l305_l300_l315_l312_DUPLICATE_04a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l308_l305_l300_l315_l312_DUPLICATE_04a7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l308_l305_l300_l315_l312_DUPLICATE_04a7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l305_c7_4695_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l308_l334_l305_l330_l326_l320_l315_l312_DUPLICATE_f1c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l308_c7_6025_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l308_l334_l305_l330_l326_l320_l315_l312_DUPLICATE_f1c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l308_l334_l305_l330_l326_l320_l315_l312_DUPLICATE_f1c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l308_l334_l305_l330_l326_l320_l315_l312_DUPLICATE_f1c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_7201_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l308_l334_l305_l330_l326_l320_l315_l312_DUPLICATE_f1c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_6abf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l308_l334_l305_l330_l326_l320_l315_l312_DUPLICATE_f1c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_ab83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l308_l334_l305_l330_l326_l320_l315_l312_DUPLICATE_f1c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_4312_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l308_l334_l305_l330_l326_l320_l315_l312_DUPLICATE_f1c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l308_l305_l300_l320_l312_DUPLICATE_3e45_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l305_c7_4695_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l308_l305_l300_l320_l312_DUPLICATE_3e45_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l308_c7_6025_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l308_l305_l300_l320_l312_DUPLICATE_3e45_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l308_l305_l300_l320_l312_DUPLICATE_3e45_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_7201_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l308_l305_l300_l320_l312_DUPLICATE_3e45_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l308_l334_l305_l330_l300_l326_l315_l312_DUPLICATE_d834_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l305_c7_4695_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l308_l334_l305_l330_l300_l326_l315_l312_DUPLICATE_d834_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l308_c7_6025_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l308_l334_l305_l330_l300_l326_l315_l312_DUPLICATE_d834_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l308_l334_l305_l330_l300_l326_l315_l312_DUPLICATE_d834_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l308_l334_l305_l330_l300_l326_l315_l312_DUPLICATE_d834_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_6abf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l308_l334_l305_l330_l300_l326_l315_l312_DUPLICATE_d834_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_ab83_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l308_l334_l305_l330_l300_l326_l315_l312_DUPLICATE_d834_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_4312_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l308_l334_l305_l330_l300_l326_l315_l312_DUPLICATE_d834_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l315_l330_DUPLICATE_1391_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c7_ab83_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l315_l330_DUPLICATE_1391_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l308_l305_l330_l300_l315_l312_DUPLICATE_584b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l305_c7_4695_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l308_l305_l330_l300_l315_l312_DUPLICATE_584b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l308_c7_6025_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l308_l305_l330_l300_l315_l312_DUPLICATE_584b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l308_l305_l330_l300_l315_l312_DUPLICATE_584b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l308_l305_l330_l300_l315_l312_DUPLICATE_584b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c7_ab83_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l308_l305_l330_l300_l315_l312_DUPLICATE_584b_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l330_c7_ab83] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l330_c7_ab83_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c7_ab83_cond;
     result_stack_value_MUX_uxn_opcodes_h_l330_c7_ab83_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c7_ab83_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l330_c7_ab83_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c7_ab83_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c7_ab83_return_output := result_stack_value_MUX_uxn_opcodes_h_l330_c7_ab83_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l320_c7_7201] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_7201_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_7201_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_7201_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_7201_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_7201_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_7201_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_7201_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_7201_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l334_c7_4312] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_4312_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_4312_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_4312_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_4312_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_4312_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_4312_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_4312_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_4312_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l334_c7_4312] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_4312_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_4312_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_4312_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_4312_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_4312_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_4312_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_4312_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_4312_return_output;

     -- n8_MUX[uxn_opcodes_h_l315_c7_08b9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l315_c7_08b9_cond <= VAR_n8_MUX_uxn_opcodes_h_l315_c7_08b9_cond;
     n8_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue;
     n8_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l315_c7_08b9_return_output := n8_MUX_uxn_opcodes_h_l315_c7_08b9_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l318_c32_3de7] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l318_c32_3de7_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l318_c32_3de7_left;
     BIN_OP_GT_uxn_opcodes_h_l318_c32_3de7_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l318_c32_3de7_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l318_c32_3de7_return_output := BIN_OP_GT_uxn_opcodes_h_l318_c32_3de7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l330_c7_ab83] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c7_ab83_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c7_ab83_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c7_ab83_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c7_ab83_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c7_ab83_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c7_ab83_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c7_ab83_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c7_ab83_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l300_c1_c0e3] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l300_c1_c0e3_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l300_c1_c0e3_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l300_c1_c0e3_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l300_c1_c0e3_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l300_c1_c0e3_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l300_c1_c0e3_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l300_c1_c0e3_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l300_c1_c0e3_return_output;

     -- t8_MUX[uxn_opcodes_h_l308_c7_6025] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l308_c7_6025_cond <= VAR_t8_MUX_uxn_opcodes_h_l308_c7_6025_cond;
     t8_MUX_uxn_opcodes_h_l308_c7_6025_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l308_c7_6025_iftrue;
     t8_MUX_uxn_opcodes_h_l308_c7_6025_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l308_c7_6025_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l308_c7_6025_return_output := t8_MUX_uxn_opcodes_h_l308_c7_6025_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l318_c32_d3a5_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l318_c32_3de7_return_output;
     VAR_printf_uxn_opcodes_h_l301_c3_08a7_uxn_opcodes_h_l301_c3_08a7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l300_c1_c0e3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l315_c7_08b9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_ab83_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l334_c7_4312_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l320_c7_7201_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_ab83_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l334_c7_4312_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_6abf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l330_c7_ab83_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l326_c7_6abf_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l330_c7_ab83_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l305_c7_4695_iffalse := VAR_t8_MUX_uxn_opcodes_h_l308_c7_6025_return_output;
     -- t8_MUX[uxn_opcodes_h_l305_c7_4695] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l305_c7_4695_cond <= VAR_t8_MUX_uxn_opcodes_h_l305_c7_4695_cond;
     t8_MUX_uxn_opcodes_h_l305_c7_4695_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l305_c7_4695_iftrue;
     t8_MUX_uxn_opcodes_h_l305_c7_4695_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l305_c7_4695_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l305_c7_4695_return_output := t8_MUX_uxn_opcodes_h_l305_c7_4695_return_output;

     -- printf_uxn_opcodes_h_l301_c3_08a7[uxn_opcodes_h_l301_c3_08a7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l301_c3_08a7_uxn_opcodes_h_l301_c3_08a7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l301_c3_08a7_uxn_opcodes_h_l301_c3_08a7_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n8_MUX[uxn_opcodes_h_l312_c7_bbc9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l312_c7_bbc9_cond <= VAR_n8_MUX_uxn_opcodes_h_l312_c7_bbc9_cond;
     n8_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue;
     n8_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output := n8_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l330_c7_ab83] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_ab83_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_ab83_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_ab83_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_ab83_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_ab83_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_ab83_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_ab83_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_ab83_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l330_c7_ab83] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_ab83_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_ab83_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_ab83_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_ab83_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_ab83_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_ab83_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_ab83_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_ab83_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l326_c7_6abf] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l326_c7_6abf_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l326_c7_6abf_cond;
     result_stack_value_MUX_uxn_opcodes_h_l326_c7_6abf_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l326_c7_6abf_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l326_c7_6abf_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l326_c7_6abf_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l326_c7_6abf_return_output := result_stack_value_MUX_uxn_opcodes_h_l326_c7_6abf_return_output;

     -- MUX[uxn_opcodes_h_l318_c32_d3a5] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l318_c32_d3a5_cond <= VAR_MUX_uxn_opcodes_h_l318_c32_d3a5_cond;
     MUX_uxn_opcodes_h_l318_c32_d3a5_iftrue <= VAR_MUX_uxn_opcodes_h_l318_c32_d3a5_iftrue;
     MUX_uxn_opcodes_h_l318_c32_d3a5_iffalse <= VAR_MUX_uxn_opcodes_h_l318_c32_d3a5_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l318_c32_d3a5_return_output := MUX_uxn_opcodes_h_l318_c32_d3a5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l315_c7_08b9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l315_c7_08b9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l315_c7_08b9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l315_c7_08b9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l315_c7_08b9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l326_c7_6abf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_6abf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_6abf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_6abf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_6abf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_6abf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_6abf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_6abf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_6abf_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue := VAR_MUX_uxn_opcodes_h_l318_c32_d3a5_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l308_c7_6025_iffalse := VAR_n8_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_6abf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l330_c7_ab83_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l315_c7_08b9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_6abf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l330_c7_ab83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_7201_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l326_c7_6abf_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_7201_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l326_c7_6abf_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l305_c7_4695_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l315_c7_08b9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l315_c7_08b9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l315_c7_08b9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l315_c7_08b9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l315_c7_08b9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l320_c7_7201] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_7201_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_7201_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_7201_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_7201_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_7201_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_7201_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_7201_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_7201_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l326_c7_6abf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_6abf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_6abf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_6abf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_6abf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_6abf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_6abf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_6abf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_6abf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l312_c7_bbc9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l320_c7_7201] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l320_c7_7201_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_7201_cond;
     result_stack_value_MUX_uxn_opcodes_h_l320_c7_7201_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_7201_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l320_c7_7201_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_7201_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_7201_return_output := result_stack_value_MUX_uxn_opcodes_h_l320_c7_7201_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l326_c7_6abf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_6abf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_6abf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_6abf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_6abf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_6abf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_6abf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_6abf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_6abf_return_output;

     -- t8_MUX[uxn_opcodes_h_l300_c2_a5a9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l300_c2_a5a9_cond <= VAR_t8_MUX_uxn_opcodes_h_l300_c2_a5a9_cond;
     t8_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue;
     t8_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output := t8_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output;

     -- n8_MUX[uxn_opcodes_h_l308_c7_6025] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l308_c7_6025_cond <= VAR_n8_MUX_uxn_opcodes_h_l308_c7_6025_cond;
     n8_MUX_uxn_opcodes_h_l308_c7_6025_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l308_c7_6025_iftrue;
     n8_MUX_uxn_opcodes_h_l308_c7_6025_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l308_c7_6025_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l308_c7_6025_return_output := n8_MUX_uxn_opcodes_h_l308_c7_6025_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l305_c7_4695_iffalse := VAR_n8_MUX_uxn_opcodes_h_l308_c7_6025_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_7201_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l326_c7_6abf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l308_c7_6025_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_7201_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l326_c7_6abf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l315_c7_08b9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l320_c7_7201_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l320_c7_7201_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l320_c7_7201] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_7201_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_7201_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_7201_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_7201_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_7201_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_7201_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_7201_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_7201_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l315_c7_08b9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l315_c7_08b9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l315_c7_08b9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l315_c7_08b9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l315_c7_08b9_return_output;

     -- n8_MUX[uxn_opcodes_h_l305_c7_4695] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l305_c7_4695_cond <= VAR_n8_MUX_uxn_opcodes_h_l305_c7_4695_cond;
     n8_MUX_uxn_opcodes_h_l305_c7_4695_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l305_c7_4695_iftrue;
     n8_MUX_uxn_opcodes_h_l305_c7_4695_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l305_c7_4695_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l305_c7_4695_return_output := n8_MUX_uxn_opcodes_h_l305_c7_4695_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l312_c7_bbc9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l315_c7_08b9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l315_c7_08b9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l315_c7_08b9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l315_c7_08b9_return_output := result_stack_value_MUX_uxn_opcodes_h_l315_c7_08b9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l320_c7_7201] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_7201_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_7201_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_7201_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_7201_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_7201_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_7201_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_7201_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_7201_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l308_c7_6025] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l308_c7_6025_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l308_c7_6025_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l308_c7_6025_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l308_c7_6025_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l308_c7_6025_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l308_c7_6025_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l308_c7_6025_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l308_c7_6025_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l305_c7_4695_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l320_c7_7201_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l305_c7_4695_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l308_c7_6025_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l320_c7_7201_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l308_c7_6025_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l315_c7_08b9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l315_c7_08b9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l315_c7_08b9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l315_c7_08b9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l315_c7_08b9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l315_c7_08b9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l315_c7_08b9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l312_c7_bbc9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l312_c7_bbc9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l312_c7_bbc9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output := result_stack_value_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l312_c7_bbc9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_bbc9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_bbc9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l305_c7_4695] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l305_c7_4695_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l305_c7_4695_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l305_c7_4695_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l305_c7_4695_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l305_c7_4695_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l305_c7_4695_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l305_c7_4695_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l305_c7_4695_return_output;

     -- n8_MUX[uxn_opcodes_h_l300_c2_a5a9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l300_c2_a5a9_cond <= VAR_n8_MUX_uxn_opcodes_h_l300_c2_a5a9_cond;
     n8_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue;
     n8_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output := n8_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l315_c7_08b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l315_c7_08b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l315_c7_08b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l315_c7_08b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l315_c7_08b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l315_c7_08b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l315_c7_08b9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l308_c7_6025] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l308_c7_6025_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l308_c7_6025_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l308_c7_6025_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l308_c7_6025_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l308_c7_6025_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l308_c7_6025_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l308_c7_6025_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l308_c7_6025_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l315_c7_08b9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l305_c7_4695_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l315_c7_08b9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l305_c7_4695_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l308_c7_6025_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l308_c7_6025_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l308_c7_6025_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l305_c7_4695] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l305_c7_4695_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l305_c7_4695_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l305_c7_4695_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l305_c7_4695_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l305_c7_4695_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l305_c7_4695_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l305_c7_4695_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l305_c7_4695_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l308_c7_6025] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l308_c7_6025_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l308_c7_6025_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l308_c7_6025_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l308_c7_6025_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l308_c7_6025_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l308_c7_6025_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l308_c7_6025_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l308_c7_6025_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l308_c7_6025] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l308_c7_6025_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l308_c7_6025_cond;
     result_stack_value_MUX_uxn_opcodes_h_l308_c7_6025_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l308_c7_6025_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l308_c7_6025_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l308_c7_6025_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l308_c7_6025_return_output := result_stack_value_MUX_uxn_opcodes_h_l308_c7_6025_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l312_c7_bbc9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_bbc9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_bbc9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l312_c7_bbc9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_bbc9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_bbc9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_bbc9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_bbc9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l300_c2_a5a9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l308_c7_6025_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l308_c7_6025_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l312_c7_bbc9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l305_c7_4695_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l305_c7_4695_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l308_c7_6025_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l305_c7_4695_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l308_c7_6025_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l308_c7_6025] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l308_c7_6025_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l308_c7_6025_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l308_c7_6025_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l308_c7_6025_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l308_c7_6025_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l308_c7_6025_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l308_c7_6025_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l308_c7_6025_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l305_c7_4695] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l305_c7_4695_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l305_c7_4695_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l305_c7_4695_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l305_c7_4695_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l305_c7_4695_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l305_c7_4695_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l305_c7_4695_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l305_c7_4695_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l300_c2_a5a9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l305_c7_4695] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l305_c7_4695_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l305_c7_4695_cond;
     result_stack_value_MUX_uxn_opcodes_h_l305_c7_4695_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l305_c7_4695_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l305_c7_4695_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l305_c7_4695_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l305_c7_4695_return_output := result_stack_value_MUX_uxn_opcodes_h_l305_c7_4695_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l308_c7_6025] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l308_c7_6025_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l308_c7_6025_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l308_c7_6025_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l308_c7_6025_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l308_c7_6025_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l308_c7_6025_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l308_c7_6025_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l308_c7_6025_return_output;

     -- Submodule level 8
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l305_c7_4695_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l308_c7_6025_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l305_c7_4695_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l308_c7_6025_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l305_c7_4695_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l305_c7_4695_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l305_c7_4695] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l305_c7_4695_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l305_c7_4695_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l305_c7_4695_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l305_c7_4695_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l305_c7_4695_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l305_c7_4695_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l305_c7_4695_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l305_c7_4695_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l305_c7_4695] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l305_c7_4695_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l305_c7_4695_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l305_c7_4695_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l305_c7_4695_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l305_c7_4695_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l305_c7_4695_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l305_c7_4695_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l305_c7_4695_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l300_c2_a5a9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l300_c2_a5a9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l300_c2_a5a9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output := result_stack_value_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l300_c2_a5a9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l300_c2_a5a9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l300_c2_a5a9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output;

     -- Submodule level 9
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l305_c7_4695_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l305_c7_4695_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l300_c2_a5a9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l300_c2_a5a9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l300_c2_a5a9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l300_c2_a5a9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l300_c2_a5a9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l300_c2_a5a9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l300_c2_a5a9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l300_c2_a5a9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l339_l296_DUPLICATE_ff8e LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l339_l296_DUPLICATE_ff8e_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l300_c2_a5a9_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l339_l296_DUPLICATE_ff8e_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l339_l296_DUPLICATE_ff8e_return_output;
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
