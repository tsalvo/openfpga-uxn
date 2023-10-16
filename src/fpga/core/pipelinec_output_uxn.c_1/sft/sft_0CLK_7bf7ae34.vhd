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
entity sft_0CLK_7bf7ae34 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft_0CLK_7bf7ae34;
architecture arch of sft_0CLK_7bf7ae34 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2349_c6_7344]
signal BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2349_c1_ad08]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_ad08_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_ad08_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_ad08_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_ad08_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2349_c2_7f1a]
signal n8_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2349_c2_7f1a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2349_c2_7f1a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2349_c2_7f1a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2349_c2_7f1a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2349_c2_7f1a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2349_c2_7f1a]
signal result_u8_value_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2349_c2_7f1a]
signal tmp8_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2349_c2_7f1a]
signal t8_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2350_c3_5039[uxn_opcodes_h_l2350_c3_5039]
signal printf_uxn_opcodes_h_l2350_c3_5039_uxn_opcodes_h_l2350_c3_5039_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2354_c11_b135]
signal BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2354_c7_e502]
signal n8_MUX_uxn_opcodes_h_l2354_c7_e502_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2354_c7_e502_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2354_c7_e502]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_e502_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_e502_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2354_c7_e502]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_e502_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_e502_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2354_c7_e502]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_e502_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_e502_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2354_c7_e502]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_e502_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_e502_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2354_c7_e502]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_e502_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_e502_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2354_c7_e502]
signal result_u8_value_MUX_uxn_opcodes_h_l2354_c7_e502_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2354_c7_e502_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2354_c7_e502]
signal tmp8_MUX_uxn_opcodes_h_l2354_c7_e502_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2354_c7_e502_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2354_c7_e502]
signal t8_MUX_uxn_opcodes_h_l2354_c7_e502_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2354_c7_e502_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2357_c11_7fbd]
signal BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2357_c7_3a4b]
signal n8_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2357_c7_3a4b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2357_c7_3a4b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2357_c7_3a4b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2357_c7_3a4b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2357_c7_3a4b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2357_c7_3a4b]
signal result_u8_value_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2357_c7_3a4b]
signal tmp8_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l2357_c7_3a4b]
signal t8_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2361_c11_7929]
signal BIN_OP_EQ_uxn_opcodes_h_l2361_c11_7929_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2361_c11_7929_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2361_c11_7929_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2361_c7_566b]
signal n8_MUX_uxn_opcodes_h_l2361_c7_566b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2361_c7_566b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2361_c7_566b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_566b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_566b_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2361_c7_566b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_566b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_566b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2361_c7_566b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_566b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_566b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2361_c7_566b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_566b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_566b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2361_c7_566b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_566b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_566b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2361_c7_566b]
signal result_u8_value_MUX_uxn_opcodes_h_l2361_c7_566b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2361_c7_566b_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2361_c7_566b]
signal tmp8_MUX_uxn_opcodes_h_l2361_c7_566b_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2361_c7_566b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2364_c11_5b7b]
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5b7b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5b7b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5b7b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2364_c7_f44b]
signal n8_MUX_uxn_opcodes_h_l2364_c7_f44b_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c7_f44b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2364_c7_f44b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f44b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2364_c7_f44b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c7_f44b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f44b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2364_c7_f44b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f44b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2364_c7_f44b]
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_f44b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l2364_c7_f44b]
signal tmp8_MUX_uxn_opcodes_h_l2364_c7_f44b_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2367_c30_59f3]
signal sp_relative_shift_uxn_opcodes_h_l2367_c30_59f3_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2367_c30_59f3_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2367_c30_59f3_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2367_c30_59f3_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2368_c18_6132]
signal BIN_OP_AND_uxn_opcodes_h_l2368_c18_6132_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2368_c18_6132_right : unsigned(3 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2368_c18_6132_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2368_c11_e7a3]
signal BIN_OP_SR_uxn_opcodes_h_l2368_c11_e7a3_left : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2368_c11_e7a3_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2368_c11_e7a3_return_output : unsigned(7 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2368_c34_204e]
signal CONST_SR_4_uxn_opcodes_h_l2368_c34_204e_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2368_c34_204e_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2368_c11_fa3f]
signal BIN_OP_SL_uxn_opcodes_h_l2368_c11_fa3f_left : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2368_c11_fa3f_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2368_c11_fa3f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2373_c11_d7f4]
signal BIN_OP_EQ_uxn_opcodes_h_l2373_c11_d7f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2373_c11_d7f4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2373_c11_d7f4_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2373_c7_bbe8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bbe8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bbe8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bbe8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bbe8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2373_c7_bbe8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bbe8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bbe8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bbe8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bbe8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2373_c7_bbe8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bbe8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bbe8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bbe8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bbe8_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_8cda( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344
BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344_left,
BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344_right,
BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_ad08
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_ad08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_ad08_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_ad08_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_ad08_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_ad08_return_output);

-- n8_MUX_uxn_opcodes_h_l2349_c2_7f1a
n8_MUX_uxn_opcodes_h_l2349_c2_7f1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond,
n8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue,
n8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse,
n8_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_7f1a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_7f1a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a
result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_7f1a
result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_7f1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_7f1a
result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_7f1a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2349_c2_7f1a
result_u8_value_MUX_uxn_opcodes_h_l2349_c2_7f1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2349_c2_7f1a
tmp8_MUX_uxn_opcodes_h_l2349_c2_7f1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond,
tmp8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue,
tmp8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse,
tmp8_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output);

-- t8_MUX_uxn_opcodes_h_l2349_c2_7f1a
t8_MUX_uxn_opcodes_h_l2349_c2_7f1a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond,
t8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue,
t8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse,
t8_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output);

-- printf_uxn_opcodes_h_l2350_c3_5039_uxn_opcodes_h_l2350_c3_5039
printf_uxn_opcodes_h_l2350_c3_5039_uxn_opcodes_h_l2350_c3_5039 : entity work.printf_uxn_opcodes_h_l2350_c3_5039_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2350_c3_5039_uxn_opcodes_h_l2350_c3_5039_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135
BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135_left,
BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135_right,
BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135_return_output);

-- n8_MUX_uxn_opcodes_h_l2354_c7_e502
n8_MUX_uxn_opcodes_h_l2354_c7_e502 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2354_c7_e502_cond,
n8_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue,
n8_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse,
n8_MUX_uxn_opcodes_h_l2354_c7_e502_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_e502
result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_e502 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_e502_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_e502_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_e502
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_e502 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_e502_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_e502_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_e502
result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_e502 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_e502_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_e502_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_e502
result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_e502 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_e502_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_e502_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_e502
result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_e502 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_e502_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_e502_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2354_c7_e502
result_u8_value_MUX_uxn_opcodes_h_l2354_c7_e502 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2354_c7_e502_cond,
result_u8_value_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2354_c7_e502_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2354_c7_e502
tmp8_MUX_uxn_opcodes_h_l2354_c7_e502 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2354_c7_e502_cond,
tmp8_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue,
tmp8_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse,
tmp8_MUX_uxn_opcodes_h_l2354_c7_e502_return_output);

-- t8_MUX_uxn_opcodes_h_l2354_c7_e502
t8_MUX_uxn_opcodes_h_l2354_c7_e502 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2354_c7_e502_cond,
t8_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue,
t8_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse,
t8_MUX_uxn_opcodes_h_l2354_c7_e502_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd
BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd_left,
BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd_right,
BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd_return_output);

-- n8_MUX_uxn_opcodes_h_l2357_c7_3a4b
n8_MUX_uxn_opcodes_h_l2357_c7_3a4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond,
n8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue,
n8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse,
n8_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_3a4b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_3a4b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_3a4b
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_3a4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_3a4b
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_3a4b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2357_c7_3a4b
result_u8_value_MUX_uxn_opcodes_h_l2357_c7_3a4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2357_c7_3a4b
tmp8_MUX_uxn_opcodes_h_l2357_c7_3a4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond,
tmp8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue,
tmp8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse,
tmp8_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output);

-- t8_MUX_uxn_opcodes_h_l2357_c7_3a4b
t8_MUX_uxn_opcodes_h_l2357_c7_3a4b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond,
t8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue,
t8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse,
t8_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2361_c11_7929
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_7929 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_7929_left,
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_7929_right,
BIN_OP_EQ_uxn_opcodes_h_l2361_c11_7929_return_output);

-- n8_MUX_uxn_opcodes_h_l2361_c7_566b
n8_MUX_uxn_opcodes_h_l2361_c7_566b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2361_c7_566b_cond,
n8_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue,
n8_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse,
n8_MUX_uxn_opcodes_h_l2361_c7_566b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_566b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_566b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_566b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_566b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_566b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_566b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_566b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_566b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_566b
result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_566b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_566b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_566b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_566b
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_566b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_566b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_566b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_566b
result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_566b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_566b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_566b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2361_c7_566b
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_566b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_566b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2361_c7_566b_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2361_c7_566b
tmp8_MUX_uxn_opcodes_h_l2361_c7_566b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2361_c7_566b_cond,
tmp8_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue,
tmp8_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse,
tmp8_MUX_uxn_opcodes_h_l2361_c7_566b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5b7b
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5b7b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5b7b_left,
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5b7b_right,
BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5b7b_return_output);

-- n8_MUX_uxn_opcodes_h_l2364_c7_f44b
n8_MUX_uxn_opcodes_h_l2364_c7_f44b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2364_c7_f44b_cond,
n8_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue,
n8_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse,
n8_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f44b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f44b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f44b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f44b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f44b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f44b
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f44b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f44b
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f44b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f44b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f44b
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f44b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f44b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2364_c7_f44b
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_f44b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_f44b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output);

-- tmp8_MUX_uxn_opcodes_h_l2364_c7_f44b
tmp8_MUX_uxn_opcodes_h_l2364_c7_f44b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l2364_c7_f44b_cond,
tmp8_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue,
tmp8_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse,
tmp8_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2367_c30_59f3
sp_relative_shift_uxn_opcodes_h_l2367_c30_59f3 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2367_c30_59f3_ins,
sp_relative_shift_uxn_opcodes_h_l2367_c30_59f3_x,
sp_relative_shift_uxn_opcodes_h_l2367_c30_59f3_y,
sp_relative_shift_uxn_opcodes_h_l2367_c30_59f3_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2368_c18_6132
BIN_OP_AND_uxn_opcodes_h_l2368_c18_6132 : entity work.BIN_OP_AND_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2368_c18_6132_left,
BIN_OP_AND_uxn_opcodes_h_l2368_c18_6132_right,
BIN_OP_AND_uxn_opcodes_h_l2368_c18_6132_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2368_c11_e7a3
BIN_OP_SR_uxn_opcodes_h_l2368_c11_e7a3 : entity work.BIN_OP_SR_uint8_t_uint8_t_0CLK_25d197a7 port map (
BIN_OP_SR_uxn_opcodes_h_l2368_c11_e7a3_left,
BIN_OP_SR_uxn_opcodes_h_l2368_c11_e7a3_right,
BIN_OP_SR_uxn_opcodes_h_l2368_c11_e7a3_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2368_c34_204e
CONST_SR_4_uxn_opcodes_h_l2368_c34_204e : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2368_c34_204e_x,
CONST_SR_4_uxn_opcodes_h_l2368_c34_204e_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2368_c11_fa3f
BIN_OP_SL_uxn_opcodes_h_l2368_c11_fa3f : entity work.BIN_OP_SL_uint8_t_uint8_t_0CLK_10d8c973 port map (
BIN_OP_SL_uxn_opcodes_h_l2368_c11_fa3f_left,
BIN_OP_SL_uxn_opcodes_h_l2368_c11_fa3f_right,
BIN_OP_SL_uxn_opcodes_h_l2368_c11_fa3f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2373_c11_d7f4
BIN_OP_EQ_uxn_opcodes_h_l2373_c11_d7f4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2373_c11_d7f4_left,
BIN_OP_EQ_uxn_opcodes_h_l2373_c11_d7f4_right,
BIN_OP_EQ_uxn_opcodes_h_l2373_c11_d7f4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bbe8
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bbe8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bbe8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bbe8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bbe8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bbe8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bbe8
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bbe8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bbe8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bbe8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bbe8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bbe8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bbe8
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bbe8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bbe8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bbe8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bbe8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bbe8_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_ad08_return_output,
 n8_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output,
 tmp8_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output,
 t8_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135_return_output,
 n8_MUX_uxn_opcodes_h_l2354_c7_e502_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_e502_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_e502_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_e502_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_e502_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_e502_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2354_c7_e502_return_output,
 tmp8_MUX_uxn_opcodes_h_l2354_c7_e502_return_output,
 t8_MUX_uxn_opcodes_h_l2354_c7_e502_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd_return_output,
 n8_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output,
 tmp8_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output,
 t8_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2361_c11_7929_return_output,
 n8_MUX_uxn_opcodes_h_l2361_c7_566b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_566b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_566b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_566b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_566b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_566b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2361_c7_566b_return_output,
 tmp8_MUX_uxn_opcodes_h_l2361_c7_566b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5b7b_return_output,
 n8_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output,
 tmp8_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output,
 sp_relative_shift_uxn_opcodes_h_l2367_c30_59f3_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2368_c18_6132_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2368_c11_e7a3_return_output,
 CONST_SR_4_uxn_opcodes_h_l2368_c34_204e_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2368_c11_fa3f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2373_c11_d7f4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bbe8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bbe8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bbe8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_ad08_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_ad08_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_ad08_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_ad08_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2354_c7_e502_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_e502_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2351_c3_5b3f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_e502_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_e502_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_e502_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_e502_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c7_e502_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2354_c7_e502_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2354_c7_e502_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2350_c3_5039_uxn_opcodes_h_l2350_c3_5039_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2354_c7_e502_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_e502_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2355_c3_5a1c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_e502_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_e502_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_e502_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_e502_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c7_e502_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2354_c7_e502_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2354_c7_e502_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2361_c7_566b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_566b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2359_c3_fd81 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_566b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_566b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_566b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_566b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_566b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2361_c7_566b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_7929_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_7929_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_7929_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2361_c7_566b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_566b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_6b61 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_566b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_566b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_566b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_566b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_566b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2361_c7_566b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5b7b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5b7b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5b7b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2364_c7_f44b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2370_c3_974e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2364_c7_f44b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f44b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bbe8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bbe8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f44b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bbe8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f44b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_f44b_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_f44b_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_59f3_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_59f3_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_59f3_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_59f3_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2368_c11_e7a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2368_c18_6132_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2368_c18_6132_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2368_c18_6132_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2368_c11_e7a3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2368_c11_e7a3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2368_c11_fa3f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2368_c11_fa3f_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2368_c34_204e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2368_c34_204e_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2368_c11_fa3f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_d7f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_d7f4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_d7f4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bbe8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bbe8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bbe8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bbe8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bbe8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bbe8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bbe8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bbe8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bbe8_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2364_DUPLICATE_3f41_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2373_DUPLICATE_d4c7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2373_DUPLICATE_b422_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2364_DUPLICATE_799b_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2373_l2364_DUPLICATE_1d48_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2379_l2345_DUPLICATE_b768_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2368_c18_6132_right := to_unsigned(15, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bbe8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_ad08_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_59f3_y := resize(to_signed(-1, 2), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_59f3_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5b7b_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2355_c3_5a1c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2355_c3_5a1c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2370_c3_974e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2370_c3_974e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_d7f4_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_7929_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_6b61 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2362_c3_6b61;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2359_c3_fd81 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2359_c3_fd81;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bbe8_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bbe8_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2351_c3_5b3f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2351_c3_5b3f;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_ad08_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_59f3_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_7929_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5b7b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_d7f4_left := VAR_phase;
     VAR_BIN_OP_SR_uxn_opcodes_h_l2368_c11_e7a3_left := VAR_previous_stack_read;
     VAR_n8_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2368_c18_6132_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2368_c34_204e_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse := t8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse := tmp8;
     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2364_DUPLICATE_799b LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2364_DUPLICATE_799b_return_output := result.u8_value;

     -- CONST_SR_4[uxn_opcodes_h_l2368_c34_204e] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2368_c34_204e_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2368_c34_204e_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2368_c34_204e_return_output := CONST_SR_4_uxn_opcodes_h_l2368_c34_204e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2361_c11_7929] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2361_c11_7929_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_7929_left;
     BIN_OP_EQ_uxn_opcodes_h_l2361_c11_7929_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_7929_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_7929_return_output := BIN_OP_EQ_uxn_opcodes_h_l2361_c11_7929_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2373_l2364_DUPLICATE_1d48 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2373_l2364_DUPLICATE_1d48_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l2367_c30_59f3] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2367_c30_59f3_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_59f3_ins;
     sp_relative_shift_uxn_opcodes_h_l2367_c30_59f3_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_59f3_x;
     sp_relative_shift_uxn_opcodes_h_l2367_c30_59f3_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_59f3_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_59f3_return_output := sp_relative_shift_uxn_opcodes_h_l2367_c30_59f3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2373_c11_d7f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2373_c11_d7f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_d7f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2373_c11_d7f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_d7f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_d7f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2373_c11_d7f4_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2373_DUPLICATE_d4c7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2373_DUPLICATE_d4c7_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l2368_c18_6132] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2368_c18_6132_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2368_c18_6132_left;
     BIN_OP_AND_uxn_opcodes_h_l2368_c18_6132_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2368_c18_6132_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2368_c18_6132_return_output := BIN_OP_AND_uxn_opcodes_h_l2368_c18_6132_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2364_DUPLICATE_3f41 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2364_DUPLICATE_3f41_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2349_c6_7344] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344_left;
     BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344_return_output := BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2354_c11_b135] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135_left;
     BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135_return_output := BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2373_DUPLICATE_b422 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2373_DUPLICATE_b422_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2357_c11_7fbd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2364_c7_f44b] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2364_c7_f44b_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2364_c11_5b7b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5b7b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5b7b_left;
     BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5b7b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5b7b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5b7b_return_output := BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5b7b_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2368_c11_e7a3_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2368_c18_6132_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_ad08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2349_c6_7344_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2354_c7_e502_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_e502_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_e502_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_e502_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_e502_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_e502_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c7_e502_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2354_c7_e502_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2354_c7_e502_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2354_c11_b135_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2357_c11_7fbd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2361_c7_566b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_7929_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_566b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_7929_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_566b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_7929_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_566b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_7929_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_566b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_7929_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_566b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_7929_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_566b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_7929_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2361_c7_566b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2361_c11_7929_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2364_c7_f44b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5b7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f44b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5b7b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5b7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f44b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5b7b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5b7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f44b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5b7b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_f44b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5b7b_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_f44b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2364_c11_5b7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bbe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_d7f4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bbe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_d7f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bbe8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2373_c11_d7f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2364_DUPLICATE_3f41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2364_DUPLICATE_3f41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2364_DUPLICATE_3f41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2364_DUPLICATE_3f41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2364_DUPLICATE_3f41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2373_l2364_DUPLICATE_1d48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2373_l2364_DUPLICATE_1d48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2373_l2364_DUPLICATE_1d48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2373_l2364_DUPLICATE_1d48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bbe8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2373_l2364_DUPLICATE_1d48_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2373_DUPLICATE_d4c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2373_DUPLICATE_d4c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2373_DUPLICATE_d4c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2373_DUPLICATE_d4c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bbe8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2373_DUPLICATE_d4c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2373_DUPLICATE_b422_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2373_DUPLICATE_b422_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2373_DUPLICATE_b422_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2373_DUPLICATE_b422_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bbe8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2373_DUPLICATE_b422_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2364_DUPLICATE_799b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2364_DUPLICATE_799b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2364_DUPLICATE_799b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2364_DUPLICATE_799b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2361_l2357_l2354_l2349_l2364_DUPLICATE_799b_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2368_c11_fa3f_right := VAR_CONST_SR_4_uxn_opcodes_h_l2368_c34_204e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2364_c7_f44b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2367_c30_59f3_return_output;
     -- BIN_OP_SR[uxn_opcodes_h_l2368_c11_e7a3] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2368_c11_e7a3_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2368_c11_e7a3_left;
     BIN_OP_SR_uxn_opcodes_h_l2368_c11_e7a3_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2368_c11_e7a3_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2368_c11_e7a3_return_output := BIN_OP_SR_uxn_opcodes_h_l2368_c11_e7a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2364_c7_f44b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output;

     -- n8_MUX[uxn_opcodes_h_l2364_c7_f44b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2364_c7_f44b_cond <= VAR_n8_MUX_uxn_opcodes_h_l2364_c7_f44b_cond;
     n8_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue;
     n8_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output := n8_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2364_c7_f44b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f44b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f44b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2373_c7_bbe8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bbe8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bbe8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bbe8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bbe8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bbe8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bbe8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bbe8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bbe8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2373_c7_bbe8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bbe8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bbe8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bbe8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bbe8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bbe8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bbe8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bbe8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bbe8_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2349_c1_ad08] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_ad08_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_ad08_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_ad08_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_ad08_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_ad08_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_ad08_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_ad08_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_ad08_return_output;

     -- t8_MUX[uxn_opcodes_h_l2357_c7_3a4b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond <= VAR_t8_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond;
     t8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue;
     t8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output := t8_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2373_c7_bbe8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bbe8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bbe8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bbe8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bbe8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bbe8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bbe8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bbe8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bbe8_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SL_uxn_opcodes_h_l2368_c11_fa3f_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2368_c11_e7a3_return_output;
     VAR_printf_uxn_opcodes_h_l2350_c3_5039_uxn_opcodes_h_l2350_c3_5039_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2349_c1_ad08_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2373_c7_bbe8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2373_c7_bbe8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2373_c7_bbe8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2364_c7_f44b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f44b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f44b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2361_c7_566b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_566b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_566b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_566b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_566b_return_output;

     -- n8_MUX[uxn_opcodes_h_l2361_c7_566b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2361_c7_566b_cond <= VAR_n8_MUX_uxn_opcodes_h_l2361_c7_566b_cond;
     n8_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue;
     n8_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2361_c7_566b_return_output := n8_MUX_uxn_opcodes_h_l2361_c7_566b_return_output;

     -- printf_uxn_opcodes_h_l2350_c3_5039[uxn_opcodes_h_l2350_c3_5039] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2350_c3_5039_uxn_opcodes_h_l2350_c3_5039_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2350_c3_5039_uxn_opcodes_h_l2350_c3_5039_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2364_c7_f44b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f44b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f44b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2364_c7_f44b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2368_c11_fa3f] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2368_c11_fa3f_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2368_c11_fa3f_left;
     BIN_OP_SL_uxn_opcodes_h_l2368_c11_fa3f_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2368_c11_fa3f_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2368_c11_fa3f_return_output := BIN_OP_SL_uxn_opcodes_h_l2368_c11_fa3f_return_output;

     -- t8_MUX[uxn_opcodes_h_l2354_c7_e502] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2354_c7_e502_cond <= VAR_t8_MUX_uxn_opcodes_h_l2354_c7_e502_cond;
     t8_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue;
     t8_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2354_c7_e502_return_output := t8_MUX_uxn_opcodes_h_l2354_c7_e502_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2361_c7_566b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_566b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_566b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_566b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_566b_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2368_c11_fa3f_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2368_c11_fa3f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2361_c7_566b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2361_c7_566b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2361_c7_566b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2354_c7_e502_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2357_c7_3a4b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2361_c7_566b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_566b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_566b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_566b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_566b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2361_c7_566b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_566b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_566b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_566b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_566b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2364_c7_f44b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_f44b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_f44b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2357_c7_3a4b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2361_c7_566b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_566b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_566b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_566b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_566b_return_output;

     -- n8_MUX[uxn_opcodes_h_l2357_c7_3a4b] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond <= VAR_n8_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond;
     n8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue;
     n8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output := n8_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output;

     -- t8_MUX[uxn_opcodes_h_l2349_c2_7f1a] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond <= VAR_t8_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond;
     t8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue;
     t8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output := t8_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2364_c7_f44b] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2364_c7_f44b_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_f44b_cond;
     tmp8_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_f44b_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_f44b_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output := tmp8_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2361_c7_566b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2361_c7_566b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2361_c7_566b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2364_c7_f44b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2354_c7_e502] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_e502_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_e502_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_e502_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_e502_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2361_c7_566b] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2361_c7_566b_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2361_c7_566b_cond;
     tmp8_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2361_c7_566b_return_output := tmp8_MUX_uxn_opcodes_h_l2361_c7_566b_return_output;

     -- n8_MUX[uxn_opcodes_h_l2354_c7_e502] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2354_c7_e502_cond <= VAR_n8_MUX_uxn_opcodes_h_l2354_c7_e502_cond;
     n8_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue;
     n8_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2354_c7_e502_return_output := n8_MUX_uxn_opcodes_h_l2354_c7_e502_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2357_c7_3a4b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2361_c7_566b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2361_c7_566b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_566b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_566b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_566b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_566b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2361_c7_566b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2357_c7_3a4b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2357_c7_3a4b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2354_c7_e502] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_e502_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_e502_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_e502_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_e502_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2354_c7_e502_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2354_c7_e502_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2354_c7_e502_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2361_c7_566b_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2361_c7_566b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2354_c7_e502] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_e502_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_e502_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_e502_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_e502_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2357_c7_3a4b] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond;
     tmp8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output := tmp8_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output;

     -- n8_MUX[uxn_opcodes_h_l2349_c2_7f1a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond <= VAR_n8_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond;
     n8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue;
     n8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output := n8_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2354_c7_e502] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_e502_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_e502_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_e502_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_e502_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2349_c2_7f1a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2354_c7_e502] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_e502_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_e502_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_e502_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_e502_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2349_c2_7f1a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2357_c7_3a4b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_3a4b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_3a4b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_3a4b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2354_c7_e502_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2354_c7_e502_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2354_c7_e502_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2357_c7_3a4b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2349_c2_7f1a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2354_c7_e502] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2354_c7_e502_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2354_c7_e502_cond;
     tmp8_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2354_c7_e502_return_output := tmp8_MUX_uxn_opcodes_h_l2354_c7_e502_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2349_c2_7f1a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2354_c7_e502] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2354_c7_e502_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c7_e502_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c7_e502_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c7_e502_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c7_e502_return_output := result_u8_value_MUX_uxn_opcodes_h_l2354_c7_e502_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2349_c2_7f1a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output;

     -- Submodule level 7
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2354_c7_e502_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l2354_c7_e502_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2349_c2_7f1a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l2349_c2_7f1a] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l2349_c2_7f1a_cond;
     tmp8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iftrue;
     tmp8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l2349_c2_7f1a_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output := tmp8_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output;

     -- Submodule level 8
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2379_l2345_DUPLICATE_b768 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2379_l2345_DUPLICATE_b768_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8cda(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2349_c2_7f1a_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2379_l2345_DUPLICATE_b768_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8cda_uxn_opcodes_h_l2379_l2345_DUPLICATE_b768_return_output;
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
