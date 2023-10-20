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
-- -- use ieee.float_pkg.all;
use work.c_structs_pkg.all;
-- Submodules: 109
entity swp2_0CLK_3cd05a88 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp2_0CLK_3cd05a88;
architecture arch of swp2_0CLK_3cd05a88 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2753_c6_f8fb]
signal BIN_OP_EQ_uxn_opcodes_h_l2753_c6_f8fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2753_c6_f8fb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2753_c6_f8fb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2753_c2_a839]
signal n16_MUX_uxn_opcodes_h_l2753_c2_a839_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2753_c2_a839_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2753_c2_a839]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c2_a839_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c2_a839_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2753_c2_a839]
signal result_u8_value_MUX_uxn_opcodes_h_l2753_c2_a839_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2753_c2_a839_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2753_c2_a839]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2753_c2_a839_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2753_c2_a839_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2753_c2_a839]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2753_c2_a839_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2753_c2_a839_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2753_c2_a839]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2753_c2_a839_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2753_c2_a839_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2753_c2_a839]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2753_c2_a839_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2753_c2_a839_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2753_c2_a839]
signal t16_MUX_uxn_opcodes_h_l2753_c2_a839_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2753_c2_a839_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2758_c11_34ae]
signal BIN_OP_EQ_uxn_opcodes_h_l2758_c11_34ae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2758_c11_34ae_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2758_c11_34ae_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2758_c7_262b]
signal n16_MUX_uxn_opcodes_h_l2758_c7_262b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2758_c7_262b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2758_c7_262b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_262b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_262b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2758_c7_262b]
signal result_u8_value_MUX_uxn_opcodes_h_l2758_c7_262b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2758_c7_262b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2758_c7_262b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_262b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_262b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2758_c7_262b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_262b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_262b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2758_c7_262b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_262b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_262b_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2758_c7_262b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_262b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_262b_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2758_c7_262b]
signal t16_MUX_uxn_opcodes_h_l2758_c7_262b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2758_c7_262b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2761_c11_1b2e]
signal BIN_OP_EQ_uxn_opcodes_h_l2761_c11_1b2e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2761_c11_1b2e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2761_c11_1b2e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2761_c7_286d]
signal n16_MUX_uxn_opcodes_h_l2761_c7_286d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2761_c7_286d_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2761_c7_286d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_286d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_286d_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2761_c7_286d]
signal result_u8_value_MUX_uxn_opcodes_h_l2761_c7_286d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2761_c7_286d_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2761_c7_286d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2761_c7_286d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2761_c7_286d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2761_c7_286d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_286d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_286d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2761_c7_286d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2761_c7_286d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2761_c7_286d_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2761_c7_286d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2761_c7_286d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2761_c7_286d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2761_c7_286d]
signal t16_MUX_uxn_opcodes_h_l2761_c7_286d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2761_c7_286d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2766_c11_56e2]
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_56e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_56e2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2766_c11_56e2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2766_c7_1ea9]
signal n16_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2766_c7_1ea9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2766_c7_1ea9]
signal result_u8_value_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2766_c7_1ea9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2766_c7_1ea9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2766_c7_1ea9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2766_c7_1ea9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2766_c7_1ea9]
signal t16_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2769_c11_a6eb]
signal BIN_OP_EQ_uxn_opcodes_h_l2769_c11_a6eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2769_c11_a6eb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2769_c11_a6eb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2769_c7_5b1e]
signal n16_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2769_c7_5b1e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2769_c7_5b1e]
signal result_u8_value_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2769_c7_5b1e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2769_c7_5b1e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2769_c7_5b1e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2769_c7_5b1e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2769_c7_5b1e]
signal t16_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2770_c3_c3af]
signal BIN_OP_OR_uxn_opcodes_h_l2770_c3_c3af_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2770_c3_c3af_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2770_c3_c3af_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2773_c11_2e5a]
signal BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2e5a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2e5a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2e5a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2773_c7_87bd]
signal n16_MUX_uxn_opcodes_h_l2773_c7_87bd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2773_c7_87bd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87bd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2773_c7_87bd]
signal result_u8_value_MUX_uxn_opcodes_h_l2773_c7_87bd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2773_c7_87bd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87bd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2773_c7_87bd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87bd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2773_c7_87bd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2773_c7_87bd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2776_c11_5711]
signal BIN_OP_EQ_uxn_opcodes_h_l2776_c11_5711_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2776_c11_5711_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2776_c11_5711_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2776_c7_5e18]
signal n16_MUX_uxn_opcodes_h_l2776_c7_5e18_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2776_c7_5e18]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_5e18_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2776_c7_5e18]
signal result_u8_value_MUX_uxn_opcodes_h_l2776_c7_5e18_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2776_c7_5e18]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_5e18_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2776_c7_5e18]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_5e18_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2776_c7_5e18]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2776_c7_5e18]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2781_c11_a684]
signal BIN_OP_EQ_uxn_opcodes_h_l2781_c11_a684_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2781_c11_a684_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2781_c11_a684_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2781_c7_f4d3]
signal n16_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2781_c7_f4d3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2781_c7_f4d3]
signal result_u8_value_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2781_c7_f4d3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2781_c7_f4d3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2781_c7_f4d3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2781_c7_f4d3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2784_c11_12c6]
signal BIN_OP_EQ_uxn_opcodes_h_l2784_c11_12c6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2784_c11_12c6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2784_c11_12c6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2784_c7_44bf]
signal n16_MUX_uxn_opcodes_h_l2784_c7_44bf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2784_c7_44bf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_44bf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2784_c7_44bf]
signal result_u8_value_MUX_uxn_opcodes_h_l2784_c7_44bf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2784_c7_44bf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_44bf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2784_c7_44bf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_44bf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2784_c7_44bf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2784_c7_44bf]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2785_c3_f064]
signal BIN_OP_OR_uxn_opcodes_h_l2785_c3_f064_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2785_c3_f064_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2785_c3_f064_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2787_c30_a8d1]
signal sp_relative_shift_uxn_opcodes_h_l2787_c30_a8d1_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2787_c30_a8d1_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2787_c30_a8d1_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2787_c30_a8d1_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2792_c11_3bb5]
signal BIN_OP_EQ_uxn_opcodes_h_l2792_c11_3bb5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2792_c11_3bb5_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2792_c11_3bb5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2792_c7_65ed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2792_c7_65ed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2792_c7_65ed]
signal result_u8_value_MUX_uxn_opcodes_h_l2792_c7_65ed_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2792_c7_65ed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2792_c7_65ed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2792_c7_65ed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2792_c7_65ed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2792_c7_65ed]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2792_c7_65ed_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2795_c31_4203]
signal CONST_SR_8_uxn_opcodes_h_l2795_c31_4203_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2795_c31_4203_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2797_c11_2c00]
signal BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2c00_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2c00_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2c00_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2797_c7_0afa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_0afa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2797_c7_0afa]
signal result_u8_value_MUX_uxn_opcodes_h_l2797_c7_0afa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2797_c7_0afa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_0afa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2797_c7_0afa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_0afa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2797_c7_0afa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_0afa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2802_c11_1fd6]
signal BIN_OP_EQ_uxn_opcodes_h_l2802_c11_1fd6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2802_c11_1fd6_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2802_c11_1fd6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2802_c7_ef32]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_ef32_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_ef32_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_ef32_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_ef32_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2802_c7_ef32]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_ef32_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_ef32_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_ef32_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_ef32_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2802_c7_ef32]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_ef32_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_ef32_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_ef32_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_ef32_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2802_c7_ef32]
signal result_u8_value_MUX_uxn_opcodes_h_l2802_c7_ef32_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2802_c7_ef32_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2802_c7_ef32_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2802_c7_ef32_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2804_c31_0faf]
signal CONST_SR_8_uxn_opcodes_h_l2804_c31_0faf_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2804_c31_0faf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2806_c11_6bda]
signal BIN_OP_EQ_uxn_opcodes_h_l2806_c11_6bda_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2806_c11_6bda_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2806_c11_6bda_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2806_c7_553b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_553b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_553b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_553b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_553b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2806_c7_553b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_553b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_553b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_553b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_553b_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2763_l2778_DUPLICATE_99de
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2763_l2778_DUPLICATE_99de_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2763_l2778_DUPLICATE_99de_return_output : unsigned(15 downto 0);

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_3345( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2753_c6_f8fb
BIN_OP_EQ_uxn_opcodes_h_l2753_c6_f8fb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2753_c6_f8fb_left,
BIN_OP_EQ_uxn_opcodes_h_l2753_c6_f8fb_right,
BIN_OP_EQ_uxn_opcodes_h_l2753_c6_f8fb_return_output);

-- n16_MUX_uxn_opcodes_h_l2753_c2_a839
n16_MUX_uxn_opcodes_h_l2753_c2_a839 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2753_c2_a839_cond,
n16_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue,
n16_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse,
n16_MUX_uxn_opcodes_h_l2753_c2_a839_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c2_a839
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c2_a839 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c2_a839_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c2_a839_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2753_c2_a839
result_u8_value_MUX_uxn_opcodes_h_l2753_c2_a839 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2753_c2_a839_cond,
result_u8_value_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2753_c2_a839_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2753_c2_a839
result_is_stack_write_MUX_uxn_opcodes_h_l2753_c2_a839 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2753_c2_a839_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2753_c2_a839_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2753_c2_a839
result_is_opc_done_MUX_uxn_opcodes_h_l2753_c2_a839 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2753_c2_a839_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2753_c2_a839_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2753_c2_a839
result_sp_relative_shift_MUX_uxn_opcodes_h_l2753_c2_a839 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2753_c2_a839_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2753_c2_a839_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2753_c2_a839
result_is_sp_shift_MUX_uxn_opcodes_h_l2753_c2_a839 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2753_c2_a839_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2753_c2_a839_return_output);

-- t16_MUX_uxn_opcodes_h_l2753_c2_a839
t16_MUX_uxn_opcodes_h_l2753_c2_a839 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2753_c2_a839_cond,
t16_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue,
t16_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse,
t16_MUX_uxn_opcodes_h_l2753_c2_a839_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2758_c11_34ae
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_34ae : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_34ae_left,
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_34ae_right,
BIN_OP_EQ_uxn_opcodes_h_l2758_c11_34ae_return_output);

-- n16_MUX_uxn_opcodes_h_l2758_c7_262b
n16_MUX_uxn_opcodes_h_l2758_c7_262b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2758_c7_262b_cond,
n16_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue,
n16_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse,
n16_MUX_uxn_opcodes_h_l2758_c7_262b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_262b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_262b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_262b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_262b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2758_c7_262b
result_u8_value_MUX_uxn_opcodes_h_l2758_c7_262b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2758_c7_262b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2758_c7_262b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_262b
result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_262b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_262b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_262b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_262b
result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_262b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_262b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_262b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_262b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_262b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_262b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_262b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_262b
result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_262b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_262b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_262b_return_output);

-- t16_MUX_uxn_opcodes_h_l2758_c7_262b
t16_MUX_uxn_opcodes_h_l2758_c7_262b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2758_c7_262b_cond,
t16_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue,
t16_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse,
t16_MUX_uxn_opcodes_h_l2758_c7_262b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2761_c11_1b2e
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_1b2e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_1b2e_left,
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_1b2e_right,
BIN_OP_EQ_uxn_opcodes_h_l2761_c11_1b2e_return_output);

-- n16_MUX_uxn_opcodes_h_l2761_c7_286d
n16_MUX_uxn_opcodes_h_l2761_c7_286d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2761_c7_286d_cond,
n16_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue,
n16_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse,
n16_MUX_uxn_opcodes_h_l2761_c7_286d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_286d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_286d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_286d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_286d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2761_c7_286d
result_u8_value_MUX_uxn_opcodes_h_l2761_c7_286d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2761_c7_286d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2761_c7_286d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2761_c7_286d
result_is_stack_write_MUX_uxn_opcodes_h_l2761_c7_286d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2761_c7_286d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2761_c7_286d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_286d
result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_286d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_286d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_286d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2761_c7_286d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2761_c7_286d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2761_c7_286d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2761_c7_286d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2761_c7_286d
result_is_sp_shift_MUX_uxn_opcodes_h_l2761_c7_286d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2761_c7_286d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2761_c7_286d_return_output);

-- t16_MUX_uxn_opcodes_h_l2761_c7_286d
t16_MUX_uxn_opcodes_h_l2761_c7_286d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2761_c7_286d_cond,
t16_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue,
t16_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse,
t16_MUX_uxn_opcodes_h_l2761_c7_286d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2766_c11_56e2
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_56e2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_56e2_left,
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_56e2_right,
BIN_OP_EQ_uxn_opcodes_h_l2766_c11_56e2_return_output);

-- n16_MUX_uxn_opcodes_h_l2766_c7_1ea9
n16_MUX_uxn_opcodes_h_l2766_c7_1ea9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond,
n16_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue,
n16_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse,
n16_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_1ea9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_1ea9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2766_c7_1ea9
result_u8_value_MUX_uxn_opcodes_h_l2766_c7_1ea9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_1ea9
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_1ea9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_1ea9
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_1ea9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9
result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output);

-- t16_MUX_uxn_opcodes_h_l2766_c7_1ea9
t16_MUX_uxn_opcodes_h_l2766_c7_1ea9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond,
t16_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue,
t16_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse,
t16_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2769_c11_a6eb
BIN_OP_EQ_uxn_opcodes_h_l2769_c11_a6eb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2769_c11_a6eb_left,
BIN_OP_EQ_uxn_opcodes_h_l2769_c11_a6eb_right,
BIN_OP_EQ_uxn_opcodes_h_l2769_c11_a6eb_return_output);

-- n16_MUX_uxn_opcodes_h_l2769_c7_5b1e
n16_MUX_uxn_opcodes_h_l2769_c7_5b1e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond,
n16_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue,
n16_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse,
n16_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_5b1e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_5b1e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2769_c7_5b1e
result_u8_value_MUX_uxn_opcodes_h_l2769_c7_5b1e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_5b1e
result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_5b1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_5b1e
result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_5b1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e
result_is_sp_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output);

-- t16_MUX_uxn_opcodes_h_l2769_c7_5b1e
t16_MUX_uxn_opcodes_h_l2769_c7_5b1e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond,
t16_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue,
t16_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse,
t16_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2770_c3_c3af
BIN_OP_OR_uxn_opcodes_h_l2770_c3_c3af : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2770_c3_c3af_left,
BIN_OP_OR_uxn_opcodes_h_l2770_c3_c3af_right,
BIN_OP_OR_uxn_opcodes_h_l2770_c3_c3af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2e5a
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2e5a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2e5a_left,
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2e5a_right,
BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2e5a_return_output);

-- n16_MUX_uxn_opcodes_h_l2773_c7_87bd
n16_MUX_uxn_opcodes_h_l2773_c7_87bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2773_c7_87bd_cond,
n16_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue,
n16_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse,
n16_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87bd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87bd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87bd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2773_c7_87bd
result_u8_value_MUX_uxn_opcodes_h_l2773_c7_87bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2773_c7_87bd_cond,
result_u8_value_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87bd
result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87bd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87bd
result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87bd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87bd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87bd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87bd
result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2776_c11_5711
BIN_OP_EQ_uxn_opcodes_h_l2776_c11_5711 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2776_c11_5711_left,
BIN_OP_EQ_uxn_opcodes_h_l2776_c11_5711_right,
BIN_OP_EQ_uxn_opcodes_h_l2776_c11_5711_return_output);

-- n16_MUX_uxn_opcodes_h_l2776_c7_5e18
n16_MUX_uxn_opcodes_h_l2776_c7_5e18 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2776_c7_5e18_cond,
n16_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue,
n16_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse,
n16_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_5e18
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_5e18 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_5e18_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2776_c7_5e18
result_u8_value_MUX_uxn_opcodes_h_l2776_c7_5e18 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2776_c7_5e18_cond,
result_u8_value_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_5e18
result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_5e18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_5e18_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_5e18
result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_5e18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_5e18_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_5e18
result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_5e18 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_5e18
result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_5e18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2781_c11_a684
BIN_OP_EQ_uxn_opcodes_h_l2781_c11_a684 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2781_c11_a684_left,
BIN_OP_EQ_uxn_opcodes_h_l2781_c11_a684_right,
BIN_OP_EQ_uxn_opcodes_h_l2781_c11_a684_return_output);

-- n16_MUX_uxn_opcodes_h_l2781_c7_f4d3
n16_MUX_uxn_opcodes_h_l2781_c7_f4d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond,
n16_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue,
n16_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse,
n16_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_f4d3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_f4d3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2781_c7_f4d3
result_u8_value_MUX_uxn_opcodes_h_l2781_c7_f4d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond,
result_u8_value_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_f4d3
result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_f4d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_f4d3
result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_f4d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3
result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3
result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2784_c11_12c6
BIN_OP_EQ_uxn_opcodes_h_l2784_c11_12c6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2784_c11_12c6_left,
BIN_OP_EQ_uxn_opcodes_h_l2784_c11_12c6_right,
BIN_OP_EQ_uxn_opcodes_h_l2784_c11_12c6_return_output);

-- n16_MUX_uxn_opcodes_h_l2784_c7_44bf
n16_MUX_uxn_opcodes_h_l2784_c7_44bf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2784_c7_44bf_cond,
n16_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue,
n16_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse,
n16_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_44bf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_44bf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_44bf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2784_c7_44bf
result_u8_value_MUX_uxn_opcodes_h_l2784_c7_44bf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2784_c7_44bf_cond,
result_u8_value_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_44bf
result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_44bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_44bf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_44bf
result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_44bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_44bf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_44bf
result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_44bf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_44bf
result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_44bf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2785_c3_f064
BIN_OP_OR_uxn_opcodes_h_l2785_c3_f064 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2785_c3_f064_left,
BIN_OP_OR_uxn_opcodes_h_l2785_c3_f064_right,
BIN_OP_OR_uxn_opcodes_h_l2785_c3_f064_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2787_c30_a8d1
sp_relative_shift_uxn_opcodes_h_l2787_c30_a8d1 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2787_c30_a8d1_ins,
sp_relative_shift_uxn_opcodes_h_l2787_c30_a8d1_x,
sp_relative_shift_uxn_opcodes_h_l2787_c30_a8d1_y,
sp_relative_shift_uxn_opcodes_h_l2787_c30_a8d1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2792_c11_3bb5
BIN_OP_EQ_uxn_opcodes_h_l2792_c11_3bb5 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2792_c11_3bb5_left,
BIN_OP_EQ_uxn_opcodes_h_l2792_c11_3bb5_right,
BIN_OP_EQ_uxn_opcodes_h_l2792_c11_3bb5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2792_c7_65ed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2792_c7_65ed : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2792_c7_65ed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2792_c7_65ed
result_u8_value_MUX_uxn_opcodes_h_l2792_c7_65ed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2792_c7_65ed_cond,
result_u8_value_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2792_c7_65ed
result_is_stack_write_MUX_uxn_opcodes_h_l2792_c7_65ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2792_c7_65ed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2792_c7_65ed
result_is_opc_done_MUX_uxn_opcodes_h_l2792_c7_65ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2792_c7_65ed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2792_c7_65ed
result_is_sp_shift_MUX_uxn_opcodes_h_l2792_c7_65ed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2792_c7_65ed_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2795_c31_4203
CONST_SR_8_uxn_opcodes_h_l2795_c31_4203 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2795_c31_4203_x,
CONST_SR_8_uxn_opcodes_h_l2795_c31_4203_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2c00
BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2c00 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2c00_left,
BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2c00_right,
BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2c00_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_0afa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_0afa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_0afa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2797_c7_0afa
result_u8_value_MUX_uxn_opcodes_h_l2797_c7_0afa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2797_c7_0afa_cond,
result_u8_value_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_0afa
result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_0afa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_0afa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_0afa
result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_0afa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_0afa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_0afa
result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_0afa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_0afa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2802_c11_1fd6
BIN_OP_EQ_uxn_opcodes_h_l2802_c11_1fd6 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2802_c11_1fd6_left,
BIN_OP_EQ_uxn_opcodes_h_l2802_c11_1fd6_right,
BIN_OP_EQ_uxn_opcodes_h_l2802_c11_1fd6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_ef32
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_ef32 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_ef32_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_ef32_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_ef32_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_ef32_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_ef32
result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_ef32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_ef32_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_ef32_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_ef32_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_ef32_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_ef32
result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_ef32 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_ef32_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_ef32_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_ef32_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_ef32_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2802_c7_ef32
result_u8_value_MUX_uxn_opcodes_h_l2802_c7_ef32 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2802_c7_ef32_cond,
result_u8_value_MUX_uxn_opcodes_h_l2802_c7_ef32_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2802_c7_ef32_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2802_c7_ef32_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2804_c31_0faf
CONST_SR_8_uxn_opcodes_h_l2804_c31_0faf : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2804_c31_0faf_x,
CONST_SR_8_uxn_opcodes_h_l2804_c31_0faf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2806_c11_6bda
BIN_OP_EQ_uxn_opcodes_h_l2806_c11_6bda : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2806_c11_6bda_left,
BIN_OP_EQ_uxn_opcodes_h_l2806_c11_6bda_right,
BIN_OP_EQ_uxn_opcodes_h_l2806_c11_6bda_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_553b
result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_553b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_553b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_553b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_553b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_553b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_553b
result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_553b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_553b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_553b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_553b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_553b_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2763_l2778_DUPLICATE_99de
CONST_SL_8_uint16_t_uxn_opcodes_h_l2763_l2778_DUPLICATE_99de : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2763_l2778_DUPLICATE_99de_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2763_l2778_DUPLICATE_99de_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2753_c6_f8fb_return_output,
 n16_MUX_uxn_opcodes_h_l2753_c2_a839_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c2_a839_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2753_c2_a839_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2753_c2_a839_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2753_c2_a839_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2753_c2_a839_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2753_c2_a839_return_output,
 t16_MUX_uxn_opcodes_h_l2753_c2_a839_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2758_c11_34ae_return_output,
 n16_MUX_uxn_opcodes_h_l2758_c7_262b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_262b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2758_c7_262b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_262b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_262b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_262b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_262b_return_output,
 t16_MUX_uxn_opcodes_h_l2758_c7_262b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2761_c11_1b2e_return_output,
 n16_MUX_uxn_opcodes_h_l2761_c7_286d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_286d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2761_c7_286d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2761_c7_286d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_286d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2761_c7_286d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2761_c7_286d_return_output,
 t16_MUX_uxn_opcodes_h_l2761_c7_286d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2766_c11_56e2_return_output,
 n16_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output,
 t16_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2769_c11_a6eb_return_output,
 n16_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output,
 t16_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2770_c3_c3af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2e5a_return_output,
 n16_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2776_c11_5711_return_output,
 n16_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2781_c11_a684_return_output,
 n16_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2784_c11_12c6_return_output,
 n16_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2785_c3_f064_return_output,
 sp_relative_shift_uxn_opcodes_h_l2787_c30_a8d1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2792_c11_3bb5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output,
 CONST_SR_8_uxn_opcodes_h_l2795_c31_4203_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2c00_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2802_c11_1fd6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_ef32_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_ef32_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_ef32_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2802_c7_ef32_return_output,
 CONST_SR_8_uxn_opcodes_h_l2804_c31_0faf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2806_c11_6bda_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_553b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_553b_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2763_l2778_DUPLICATE_99de_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c6_f8fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c6_f8fb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c6_f8fb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2758_c7_262b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2753_c2_a839_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2753_c2_a839_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2755_c3_a1f7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_262b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c2_a839_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c2_a839_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_262b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2753_c2_a839_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2753_c2_a839_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_262b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2753_c2_a839_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2753_c2_a839_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_262b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2753_c2_a839_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2753_c2_a839_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_262b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2753_c2_a839_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2753_c2_a839_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_262b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2753_c2_a839_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2753_c2_a839_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2758_c7_262b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2753_c2_a839_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2753_c2_a839_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_34ae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_34ae_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_34ae_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2761_c7_286d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2758_c7_262b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2759_c3_6411 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_286d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_262b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2761_c7_286d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_262b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2761_c7_286d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_262b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_286d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_262b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2761_c7_286d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_262b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2761_c7_286d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_262b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2761_c7_286d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2758_c7_262b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_1b2e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_1b2e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_1b2e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2761_c7_286d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2764_c3_54e6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_286d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2761_c7_286d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2761_c7_286d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_286d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2761_c7_286d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2761_c7_286d_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2761_c7_286d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_56e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_56e2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_56e2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2767_c3_8496 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_a6eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_a6eb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_a6eb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2771_c3_bfb9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2770_c3_c3af_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2770_c3_c3af_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2770_c3_c3af_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2e5a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2e5a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2e5a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2773_c7_87bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2774_c3_2dd4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87bd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_87bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87bd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_5711_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_5711_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_5711_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2776_c7_5e18_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2779_c3_2fed : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_5e18_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2776_c7_5e18_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_5e18_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_5e18_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_a684_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_a684_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_a684_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2782_c3_e804 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_12c6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_12c6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_12c6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2784_c7_44bf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2789_c3_8ce1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_44bf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2784_c7_44bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_44bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_44bf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2785_c3_f064_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2785_c3_f064_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2785_c3_f064_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2787_c30_a8d1_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2787_c30_a8d1_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2787_c30_a8d1_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2787_c30_a8d1_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2790_c21_7f40_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2792_c11_3bb5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2792_c11_3bb5_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2792_c11_3bb5_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2794_c3_e72b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2792_c7_65ed_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2792_c7_65ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2792_c7_65ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2792_c7_65ed_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2792_c7_65ed_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2795_c31_4203_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2795_c31_4203_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2795_c21_895a_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2c00_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2c00_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2c00_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2799_c3_1811 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_ef32_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_0afa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2802_c7_ef32_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2797_c7_0afa_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_ef32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_0afa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_ef32_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_0afa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_0afa_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2800_c21_3a61_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_1fd6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_1fd6_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_1fd6_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_ef32_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2803_c3_e1f5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_ef32_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2802_c7_ef32_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_ef32_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_ef32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_ef32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_553b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_ef32_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_ef32_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_ef32_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_553b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_ef32_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2802_c7_ef32_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2802_c7_ef32_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2802_c7_ef32_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2804_c31_0faf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2804_c31_0faf_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2804_c21_140b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2806_c11_6bda_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2806_c11_6bda_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2806_c11_6bda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_553b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_553b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_553b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_553b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_553b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_553b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2773_l2802_l2769_l2766_l2761_DUPLICATE_8ce2_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_ebb7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2784_l2758_l2781_l2753_l2776_l2773_l2769_l2766_l2761_DUPLICATE_f132_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2773_l2769_l2797_l2766_l2761_DUPLICATE_08fd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2784_l2758_l2781_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_7cdd_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2770_l2762_l2777_l2785_DUPLICATE_e3e4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2763_l2778_DUPLICATE_99de_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2763_l2778_DUPLICATE_99de_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2811_l2749_DUPLICATE_d399_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_a684_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2779_c3_2fed := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2779_c3_2fed;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2755_c3_a1f7 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2755_c3_a1f7;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2794_c3_e72b := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2794_c3_e72b;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_34ae_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2759_c3_6411 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2759_c3_6411;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2792_c11_3bb5_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_a6eb_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_5711_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2764_c3_54e6 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2764_c3_54e6;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c6_f8fb_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_12c6_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2767_c3_8496 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2767_c3_8496;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2789_c3_8ce1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2789_c3_8ce1;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_553b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2e5a_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2787_c30_a8d1_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_56e2_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2806_c11_6bda_right := to_unsigned(12, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_1b2e_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2799_c3_1811 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2799_c3_1811;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2782_c3_e804 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2782_c3_e804;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2774_c3_2dd4 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2774_c3_2dd4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_1fd6_right := to_unsigned(11, 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_553b_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2787_c30_a8d1_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2c00_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2803_c3_e1f5 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_ef32_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2803_c3_e1f5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2771_c3_bfb9 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2771_c3_bfb9;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2787_c30_a8d1_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2785_c3_f064_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2795_c31_4203_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c6_f8fb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_34ae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_1b2e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_56e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_a6eb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2e5a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_5711_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_a684_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_12c6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2792_c11_3bb5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2c00_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_1fd6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2806_c11_6bda_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2770_c3_c3af_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2804_c31_0faf_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2753_c6_f8fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2753_c6_f8fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c6_f8fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2753_c6_f8fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c6_f8fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c6_f8fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2753_c6_f8fb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2761_c11_1b2e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2761_c11_1b2e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_1b2e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2761_c11_1b2e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_1b2e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_1b2e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2761_c11_1b2e_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2784_l2758_l2781_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_7cdd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2784_l2758_l2781_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_7cdd_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2769_c11_a6eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2769_c11_a6eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_a6eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2769_c11_a6eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_a6eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_a6eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2769_c11_a6eb_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2787_c30_a8d1] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2787_c30_a8d1_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2787_c30_a8d1_ins;
     sp_relative_shift_uxn_opcodes_h_l2787_c30_a8d1_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2787_c30_a8d1_x;
     sp_relative_shift_uxn_opcodes_h_l2787_c30_a8d1_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2787_c30_a8d1_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2787_c30_a8d1_return_output := sp_relative_shift_uxn_opcodes_h_l2787_c30_a8d1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2776_c11_5711] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2776_c11_5711_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_5711_left;
     BIN_OP_EQ_uxn_opcodes_h_l2776_c11_5711_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_5711_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_5711_return_output := BIN_OP_EQ_uxn_opcodes_h_l2776_c11_5711_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2802_c11_1fd6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2802_c11_1fd6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_1fd6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2802_c11_1fd6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_1fd6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_1fd6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2802_c11_1fd6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2792_c11_3bb5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2792_c11_3bb5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2792_c11_3bb5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2792_c11_3bb5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2792_c11_3bb5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2792_c11_3bb5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2792_c11_3bb5_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2773_l2802_l2769_l2766_l2761_DUPLICATE_8ce2 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2773_l2802_l2769_l2766_l2761_DUPLICATE_8ce2_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2758_c11_34ae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2758_c11_34ae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_34ae_left;
     BIN_OP_EQ_uxn_opcodes_h_l2758_c11_34ae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_34ae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_34ae_return_output := BIN_OP_EQ_uxn_opcodes_h_l2758_c11_34ae_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2784_l2758_l2781_l2753_l2776_l2773_l2769_l2766_l2761_DUPLICATE_f132 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2784_l2758_l2781_l2753_l2776_l2773_l2769_l2766_l2761_DUPLICATE_f132_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2766_c11_56e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2766_c11_56e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_56e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2766_c11_56e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_56e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_56e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2766_c11_56e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2806_c11_6bda] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2806_c11_6bda_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2806_c11_6bda_left;
     BIN_OP_EQ_uxn_opcodes_h_l2806_c11_6bda_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2806_c11_6bda_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2806_c11_6bda_return_output := BIN_OP_EQ_uxn_opcodes_h_l2806_c11_6bda_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2781_c11_a684] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2781_c11_a684_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_a684_left;
     BIN_OP_EQ_uxn_opcodes_h_l2781_c11_a684_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_a684_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_a684_return_output := BIN_OP_EQ_uxn_opcodes_h_l2781_c11_a684_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2795_c31_4203] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2795_c31_4203_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2795_c31_4203_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2795_c31_4203_return_output := CONST_SR_8_uxn_opcodes_h_l2795_c31_4203_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2800_c21_3a61] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2800_c21_3a61_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_ebb7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_ebb7_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2773_l2769_l2797_l2766_l2761_DUPLICATE_08fd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2773_l2769_l2797_l2766_l2761_DUPLICATE_08fd_return_output := result.is_sp_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2770_l2762_l2777_l2785_DUPLICATE_e3e4 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2770_l2762_l2777_l2785_DUPLICATE_e3e4_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2784_c11_12c6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2784_c11_12c6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_12c6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2784_c11_12c6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_12c6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_12c6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2784_c11_12c6_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2802_c7_ef32] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2802_c7_ef32_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l2804_c31_0faf] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2804_c31_0faf_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2804_c31_0faf_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2804_c31_0faf_return_output := CONST_SR_8_uxn_opcodes_h_l2804_c31_0faf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2773_c11_2e5a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2e5a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2e5a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2e5a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2e5a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2e5a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2e5a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2797_c11_2c00] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2c00_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2c00_left;
     BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2c00_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2c00_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2c00_return_output := BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2c00_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2753_c2_a839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c6_f8fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2753_c2_a839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c6_f8fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2753_c2_a839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c6_f8fb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2753_c2_a839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c6_f8fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2753_c2_a839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c6_f8fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c2_a839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c6_f8fb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2753_c2_a839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c6_f8fb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2753_c2_a839_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2753_c6_f8fb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2758_c7_262b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_34ae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_262b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_34ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_262b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_34ae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_262b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_34ae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_262b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_34ae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_262b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_34ae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_262b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_34ae_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2758_c7_262b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2758_c11_34ae_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2761_c7_286d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_1b2e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_286d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_1b2e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2761_c7_286d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_1b2e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2761_c7_286d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_1b2e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2761_c7_286d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_1b2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_286d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_1b2e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2761_c7_286d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_1b2e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2761_c7_286d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2761_c11_1b2e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_56e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_56e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_56e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_56e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_56e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_56e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_56e2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2766_c11_56e2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_a6eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_a6eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_a6eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_a6eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_a6eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_a6eb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_a6eb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2769_c11_a6eb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2773_c7_87bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2e5a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2e5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2e5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2e5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2e5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2e5a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_87bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2773_c11_2e5a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2776_c7_5e18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_5711_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_5e18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_5711_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_5711_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_5e18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_5711_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_5711_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_5e18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_5711_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2776_c7_5e18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2776_c11_5711_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_a684_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_a684_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_a684_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_a684_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_a684_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_a684_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2781_c11_a684_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2784_c7_44bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_12c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_44bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_12c6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_12c6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_44bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_12c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_12c6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_44bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_12c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2784_c7_44bf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2784_c11_12c6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2792_c7_65ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2792_c11_3bb5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2792_c7_65ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2792_c11_3bb5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2792_c7_65ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2792_c11_3bb5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2792_c7_65ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2792_c11_3bb5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2792_c7_65ed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2792_c11_3bb5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_0afa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2c00_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_0afa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2c00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_0afa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2c00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_0afa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2c00_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2797_c7_0afa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2797_c11_2c00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_ef32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_1fd6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_ef32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_1fd6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_ef32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_1fd6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2802_c7_ef32_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2802_c11_1fd6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_553b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2806_c11_6bda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_553b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2806_c11_6bda_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2770_c3_c3af_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2770_l2762_l2777_l2785_DUPLICATE_e3e4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2785_c3_f064_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2770_l2762_l2777_l2785_DUPLICATE_e3e4_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2763_l2778_DUPLICATE_99de_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2770_l2762_l2777_l2785_DUPLICATE_e3e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2800_c21_3a61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2784_l2758_l2781_l2753_l2776_l2773_l2769_l2766_l2761_DUPLICATE_f132_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2784_l2758_l2781_l2753_l2776_l2773_l2769_l2766_l2761_DUPLICATE_f132_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2784_l2758_l2781_l2753_l2776_l2773_l2769_l2766_l2761_DUPLICATE_f132_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2784_l2758_l2781_l2753_l2776_l2773_l2769_l2766_l2761_DUPLICATE_f132_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2784_l2758_l2781_l2753_l2776_l2773_l2769_l2766_l2761_DUPLICATE_f132_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2784_l2758_l2781_l2753_l2776_l2773_l2769_l2766_l2761_DUPLICATE_f132_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2784_l2758_l2781_l2753_l2776_l2773_l2769_l2766_l2761_DUPLICATE_f132_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2784_l2758_l2781_l2753_l2776_l2773_l2769_l2766_l2761_DUPLICATE_f132_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2784_l2758_l2781_l2753_l2776_l2773_l2769_l2766_l2761_DUPLICATE_f132_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2784_l2758_l2781_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_7cdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2784_l2758_l2781_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_7cdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2784_l2758_l2781_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_7cdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2784_l2758_l2781_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_7cdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2784_l2758_l2781_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_7cdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2784_l2758_l2781_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_7cdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2784_l2758_l2781_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_7cdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2784_l2758_l2781_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_7cdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2784_l2758_l2781_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_7cdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2784_l2758_l2781_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_7cdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_ef32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2784_l2758_l2781_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_7cdd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_553b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2784_l2758_l2781_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_7cdd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2773_l2769_l2797_l2766_l2761_DUPLICATE_08fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2773_l2769_l2797_l2766_l2761_DUPLICATE_08fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2773_l2769_l2797_l2766_l2761_DUPLICATE_08fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2773_l2769_l2797_l2766_l2761_DUPLICATE_08fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2773_l2769_l2797_l2766_l2761_DUPLICATE_08fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2773_l2769_l2797_l2766_l2761_DUPLICATE_08fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2773_l2769_l2797_l2766_l2761_DUPLICATE_08fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2773_l2769_l2797_l2766_l2761_DUPLICATE_08fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2773_l2769_l2797_l2766_l2761_DUPLICATE_08fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_ebb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_ebb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_ebb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_ebb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_ebb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_ebb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_ebb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_ebb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_ebb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_ebb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_ef32_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_ebb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_553b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2806_l2773_l2802_l2769_l2797_l2766_l2792_l2761_DUPLICATE_ebb7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2773_l2802_l2769_l2766_l2761_DUPLICATE_8ce2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2773_l2802_l2769_l2766_l2761_DUPLICATE_8ce2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2773_l2802_l2769_l2766_l2761_DUPLICATE_8ce2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2773_l2802_l2769_l2766_l2761_DUPLICATE_8ce2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2773_l2802_l2769_l2766_l2761_DUPLICATE_8ce2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2773_l2802_l2769_l2766_l2761_DUPLICATE_8ce2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2773_l2802_l2769_l2766_l2761_DUPLICATE_8ce2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2773_l2802_l2769_l2766_l2761_DUPLICATE_8ce2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2802_c7_ef32_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2758_l2781_l2753_l2776_l2773_l2802_l2769_l2766_l2761_DUPLICATE_8ce2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_ef32_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2802_c7_ef32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2787_c30_a8d1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2806_c7_553b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_553b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_553b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_553b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_553b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_553b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_553b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_553b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_553b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2795_c21_895a] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2795_c21_895a_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2795_c31_4203_return_output);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2804_c21_140b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2804_c21_140b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2804_c31_0faf_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2785_c3_f064] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2785_c3_f064_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2785_c3_f064_left;
     BIN_OP_OR_uxn_opcodes_h_l2785_c3_f064_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2785_c3_f064_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2785_c3_f064_return_output := BIN_OP_OR_uxn_opcodes_h_l2785_c3_f064_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2763_l2778_DUPLICATE_99de LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2763_l2778_DUPLICATE_99de_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2763_l2778_DUPLICATE_99de_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2763_l2778_DUPLICATE_99de_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2763_l2778_DUPLICATE_99de_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2784_c7_44bf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2770_c3_c3af] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2770_c3_c3af_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2770_c3_c3af_left;
     BIN_OP_OR_uxn_opcodes_h_l2770_c3_c3af_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2770_c3_c3af_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2770_c3_c3af_return_output := BIN_OP_OR_uxn_opcodes_h_l2770_c3_c3af_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2797_c7_0afa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_0afa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_0afa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2802_c7_ef32] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_ef32_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_ef32_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_ef32_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_ef32_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_ef32_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_ef32_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_ef32_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_ef32_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2806_c7_553b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_553b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_553b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_553b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_553b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_553b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_553b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_553b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_553b_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2770_c3_c3af_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2785_c3_f064_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2795_c21_895a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2802_c7_ef32_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2804_c21_140b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2763_l2778_DUPLICATE_99de_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2763_l2778_DUPLICATE_99de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_ef32_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2806_c7_553b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_ef32_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2806_c7_553b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2802_c7_ef32_return_output;
     -- t16_MUX[uxn_opcodes_h_l2769_c7_5b1e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond <= VAR_t16_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond;
     t16_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue;
     t16_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output := t16_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2802_c7_ef32] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2802_c7_ef32_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2802_c7_ef32_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2802_c7_ef32_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2802_c7_ef32_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2802_c7_ef32_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2802_c7_ef32_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2802_c7_ef32_return_output := result_u8_value_MUX_uxn_opcodes_h_l2802_c7_ef32_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2790_c21_7f40] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2790_c21_7f40_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_OR_uxn_opcodes_h_l2785_c3_f064_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2797_c7_0afa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_0afa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_0afa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2792_c7_65ed] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2792_c7_65ed_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2792_c7_65ed_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2802_c7_ef32] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_ef32_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_ef32_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_ef32_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_ef32_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_ef32_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_ef32_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_ef32_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_ef32_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2781_c7_f4d3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output;

     -- n16_MUX[uxn_opcodes_h_l2784_c7_44bf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2784_c7_44bf_cond <= VAR_n16_MUX_uxn_opcodes_h_l2784_c7_44bf_cond;
     n16_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue;
     n16_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output := n16_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2802_c7_ef32] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_ef32_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_ef32_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_ef32_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_ef32_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_ef32_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_ef32_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_ef32_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_ef32_return_output;

     -- Submodule level 3
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2790_c21_7f40_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2802_c7_ef32_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2802_c7_ef32_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2802_c7_ef32_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2784_c7_44bf] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2797_c7_0afa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_0afa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_0afa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output;

     -- n16_MUX[uxn_opcodes_h_l2781_c7_f4d3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond <= VAR_n16_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond;
     n16_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue;
     n16_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output := n16_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output;

     -- t16_MUX[uxn_opcodes_h_l2766_c7_1ea9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond <= VAR_t16_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond;
     t16_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue;
     t16_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output := t16_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2797_c7_0afa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2797_c7_0afa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2797_c7_0afa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output := result_u8_value_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2792_c7_65ed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2792_c7_65ed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2792_c7_65ed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2776_c7_5e18] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2797_c7_0afa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_0afa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_0afa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_0afa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_0afa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2797_c7_0afa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2792_c7_65ed] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2792_c7_65ed_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2792_c7_65ed_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output := result_u8_value_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output;

     -- t16_MUX[uxn_opcodes_h_l2761_c7_286d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2761_c7_286d_cond <= VAR_t16_MUX_uxn_opcodes_h_l2761_c7_286d_cond;
     t16_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue;
     t16_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2761_c7_286d_return_output := t16_MUX_uxn_opcodes_h_l2761_c7_286d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2784_c7_44bf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_44bf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_44bf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output;

     -- n16_MUX[uxn_opcodes_h_l2776_c7_5e18] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2776_c7_5e18_cond <= VAR_n16_MUX_uxn_opcodes_h_l2776_c7_5e18_cond;
     n16_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue;
     n16_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output := n16_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2781_c7_f4d3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2773_c7_87bd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2792_c7_65ed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2792_c7_65ed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2792_c7_65ed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2792_c7_65ed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2792_c7_65ed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2792_c7_65ed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2792_c7_65ed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2792_c7_65ed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2792_c7_65ed_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2761_c7_286d_return_output;
     -- n16_MUX[uxn_opcodes_h_l2773_c7_87bd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2773_c7_87bd_cond <= VAR_n16_MUX_uxn_opcodes_h_l2773_c7_87bd_cond;
     n16_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue;
     n16_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output := n16_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2784_c7_44bf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2784_c7_44bf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2784_c7_44bf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output := result_u8_value_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2784_c7_44bf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_44bf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_44bf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2776_c7_5e18] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2784_c7_44bf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_44bf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_44bf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_44bf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_44bf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2781_c7_f4d3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2769_c7_5b1e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output;

     -- t16_MUX[uxn_opcodes_h_l2758_c7_262b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2758_c7_262b_cond <= VAR_t16_MUX_uxn_opcodes_h_l2758_c7_262b_cond;
     t16_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue;
     t16_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2758_c7_262b_return_output := t16_MUX_uxn_opcodes_h_l2758_c7_262b_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2784_c7_44bf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2758_c7_262b_return_output;
     -- n16_MUX[uxn_opcodes_h_l2769_c7_5b1e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond;
     n16_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue;
     n16_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output := n16_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2781_c7_f4d3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2781_c7_f4d3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output := result_u8_value_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2773_c7_87bd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2766_c7_1ea9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2776_c7_5e18] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_5e18_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_5e18_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output;

     -- t16_MUX[uxn_opcodes_h_l2753_c2_a839] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2753_c2_a839_cond <= VAR_t16_MUX_uxn_opcodes_h_l2753_c2_a839_cond;
     t16_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue;
     t16_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2753_c2_a839_return_output := t16_MUX_uxn_opcodes_h_l2753_c2_a839_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2781_c7_f4d3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_f4d3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_f4d3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_f4d3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2781_c7_f4d3_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2753_c2_a839_return_output;
     -- n16_MUX[uxn_opcodes_h_l2766_c7_1ea9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond;
     n16_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue;
     n16_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output := n16_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2776_c7_5e18] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_5e18_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_5e18_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2776_c7_5e18] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2776_c7_5e18_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2776_c7_5e18_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output := result_u8_value_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2769_c7_5b1e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2773_c7_87bd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87bd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87bd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2761_c7_286d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2761_c7_286d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2761_c7_286d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2761_c7_286d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2761_c7_286d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2776_c7_5e18] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_5e18_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_5e18_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_5e18_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_5e18_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2761_c7_286d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2776_c7_5e18_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2758_c7_262b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_262b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_262b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_262b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_262b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2773_c7_87bd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87bd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87bd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2773_c7_87bd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2773_c7_87bd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_87bd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output := result_u8_value_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2769_c7_5b1e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2766_c7_1ea9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2773_c7_87bd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87bd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87bd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87bd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87bd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output;

     -- n16_MUX[uxn_opcodes_h_l2761_c7_286d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2761_c7_286d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2761_c7_286d_cond;
     n16_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue;
     n16_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2761_c7_286d_return_output := n16_MUX_uxn_opcodes_h_l2761_c7_286d_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2761_c7_286d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2758_c7_262b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2773_c7_87bd_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2769_c7_5b1e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2753_c2_a839] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2753_c2_a839_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2753_c2_a839_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2753_c2_a839_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2753_c2_a839_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2766_c7_1ea9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2769_c7_5b1e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2761_c7_286d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2761_c7_286d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2761_c7_286d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2761_c7_286d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2761_c7_286d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2758_c7_262b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2758_c7_262b_cond <= VAR_n16_MUX_uxn_opcodes_h_l2758_c7_262b_cond;
     n16_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue;
     n16_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2758_c7_262b_return_output := n16_MUX_uxn_opcodes_h_l2758_c7_262b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2769_c7_5b1e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_5b1e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_5b1e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_5b1e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2758_c7_262b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2761_c7_286d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2769_c7_5b1e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2758_c7_262b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_262b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_262b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_262b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_262b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2766_c7_1ea9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2761_c7_286d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_286d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_286d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_286d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_286d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2766_c7_1ea9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output;

     -- n16_MUX[uxn_opcodes_h_l2753_c2_a839] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2753_c2_a839_cond <= VAR_n16_MUX_uxn_opcodes_h_l2753_c2_a839_cond;
     n16_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue;
     n16_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2753_c2_a839_return_output := n16_MUX_uxn_opcodes_h_l2753_c2_a839_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2766_c7_1ea9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_1ea9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_1ea9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_1ea9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2753_c2_a839_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2758_c7_262b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2761_c7_286d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2766_c7_1ea9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2761_c7_286d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_286d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_286d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_286d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_286d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2761_c7_286d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2761_c7_286d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2761_c7_286d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2761_c7_286d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2761_c7_286d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2758_c7_262b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_262b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_262b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_262b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_262b_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2753_c2_a839] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2753_c2_a839_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2753_c2_a839_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2753_c2_a839_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2753_c2_a839_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2761_c7_286d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2761_c7_286d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2761_c7_286d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2761_c7_286d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2761_c7_286d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2761_c7_286d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2761_c7_286d_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2761_c7_286d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2761_c7_286d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2758_c7_262b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2761_c7_286d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2758_c7_262b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2758_c7_262b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_262b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_262b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2758_c7_262b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2758_c7_262b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_262b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_262b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_262b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_262b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2753_c2_a839] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c2_a839_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c2_a839_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c2_a839_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c2_a839_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2758_c7_262b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_262b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_262b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_262b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_262b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_262b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_262b_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2758_c7_262b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2758_c7_262b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2758_c7_262b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2753_c2_a839] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2753_c2_a839_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2753_c2_a839_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2753_c2_a839_return_output := result_u8_value_MUX_uxn_opcodes_h_l2753_c2_a839_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2753_c2_a839] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2753_c2_a839_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2753_c2_a839_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2753_c2_a839_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2753_c2_a839_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2753_c2_a839] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2753_c2_a839_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2753_c2_a839_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2753_c2_a839_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2753_c2_a839_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2753_c2_a839_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2753_c2_a839_return_output;

     -- Submodule level 14
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2811_l2749_DUPLICATE_d399 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2811_l2749_DUPLICATE_d399_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3345(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2753_c2_a839_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2753_c2_a839_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2753_c2_a839_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2753_c2_a839_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2753_c2_a839_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2753_c2_a839_return_output);

     -- Submodule level 15
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2811_l2749_DUPLICATE_d399_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3345_uxn_opcodes_h_l2811_l2749_DUPLICATE_d399_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
