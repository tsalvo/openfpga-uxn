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
-- Submodules: 59
entity sub_0CLK_3220bbf1 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub_0CLK_3220bbf1;
architecture arch of sub_0CLK_3220bbf1 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2681_c6_90eb]
signal BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2681_c1_c832]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_c832_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_c832_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_c832_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_c832_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2681_c2_1bc9]
signal t8_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2681_c2_1bc9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2681_c2_1bc9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2681_c2_1bc9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2681_c2_1bc9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2681_c2_1bc9]
signal result_stack_value_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2681_c2_1bc9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2681_c2_1bc9]
signal n8_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l2682_c3_7d80[uxn_opcodes_h_l2682_c3_7d80]
signal printf_uxn_opcodes_h_l2682_c3_7d80_uxn_opcodes_h_l2682_c3_7d80_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2686_c11_372a]
signal BIN_OP_EQ_uxn_opcodes_h_l2686_c11_372a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2686_c11_372a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2686_c11_372a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2686_c7_b0b8]
signal t8_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2686_c7_b0b8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2686_c7_b0b8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2686_c7_b0b8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2686_c7_b0b8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2686_c7_b0b8]
signal result_stack_value_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2686_c7_b0b8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2686_c7_b0b8]
signal n8_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2689_c11_6bb7]
signal BIN_OP_EQ_uxn_opcodes_h_l2689_c11_6bb7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2689_c11_6bb7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2689_c11_6bb7_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2689_c7_377e]
signal t8_MUX_uxn_opcodes_h_l2689_c7_377e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2689_c7_377e_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2689_c7_377e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_377e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_377e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2689_c7_377e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_377e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_377e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2689_c7_377e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_377e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_377e_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2689_c7_377e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_377e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_377e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2689_c7_377e]
signal result_stack_value_MUX_uxn_opcodes_h_l2689_c7_377e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2689_c7_377e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2689_c7_377e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_377e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_377e_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2689_c7_377e]
signal n8_MUX_uxn_opcodes_h_l2689_c7_377e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2689_c7_377e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2693_c11_d69f]
signal BIN_OP_EQ_uxn_opcodes_h_l2693_c11_d69f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2693_c11_d69f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2693_c11_d69f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2693_c7_1453]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_1453_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_1453_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2693_c7_1453]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_1453_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_1453_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2693_c7_1453]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_1453_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_1453_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2693_c7_1453]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_1453_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_1453_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2693_c7_1453]
signal result_stack_value_MUX_uxn_opcodes_h_l2693_c7_1453_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2693_c7_1453_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2693_c7_1453]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_1453_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_1453_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2693_c7_1453]
signal n8_MUX_uxn_opcodes_h_l2693_c7_1453_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2693_c7_1453_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2696_c11_7810]
signal BIN_OP_EQ_uxn_opcodes_h_l2696_c11_7810_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2696_c11_7810_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2696_c11_7810_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2696_c7_6aae]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_6aae_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2696_c7_6aae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_6aae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2696_c7_6aae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2696_c7_6aae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_6aae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2696_c7_6aae]
signal result_stack_value_MUX_uxn_opcodes_h_l2696_c7_6aae_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2696_c7_6aae]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l2696_c7_6aae]
signal n8_MUX_uxn_opcodes_h_l2696_c7_6aae_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2699_c32_9163]
signal BIN_OP_AND_uxn_opcodes_h_l2699_c32_9163_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2699_c32_9163_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2699_c32_9163_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2699_c32_889c]
signal BIN_OP_GT_uxn_opcodes_h_l2699_c32_889c_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2699_c32_889c_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2699_c32_889c_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2699_c32_acfd]
signal MUX_uxn_opcodes_h_l2699_c32_acfd_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2699_c32_acfd_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2699_c32_acfd_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2699_c32_acfd_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2701_c11_cc92]
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_cc92_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_cc92_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_cc92_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2701_c7_bd0c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2701_c7_bd0c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2701_c7_bd0c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2701_c7_bd0c]
signal result_stack_value_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2701_c7_bd0c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output : unsigned(0 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2705_c24_2e3f]
signal BIN_OP_MINUS_uxn_opcodes_h_l2705_c24_2e3f_left : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2705_c24_2e3f_right : unsigned(7 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2705_c24_2e3f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2707_c11_0d9f]
signal BIN_OP_EQ_uxn_opcodes_h_l2707_c11_0d9f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2707_c11_0d9f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2707_c11_0d9f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2707_c7_2e36]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2707_c7_2e36_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2707_c7_2e36_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2707_c7_2e36_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2707_c7_2e36_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2707_c7_2e36]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2707_c7_2e36_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2707_c7_2e36_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2707_c7_2e36_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2707_c7_2e36_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb
BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb_left,
BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb_right,
BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_c832
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_c832 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_c832_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_c832_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_c832_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_c832_return_output);

-- t8_MUX_uxn_opcodes_h_l2681_c2_1bc9
t8_MUX_uxn_opcodes_h_l2681_c2_1bc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond,
t8_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue,
t8_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse,
t8_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2681_c2_1bc9
result_is_stack_write_MUX_uxn_opcodes_h_l2681_c2_1bc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c2_1bc9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c2_1bc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2681_c2_1bc9
result_is_opc_done_MUX_uxn_opcodes_h_l2681_c2_1bc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2681_c2_1bc9
result_stack_value_MUX_uxn_opcodes_h_l2681_c2_1bc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond,
result_stack_value_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9
result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output);

-- n8_MUX_uxn_opcodes_h_l2681_c2_1bc9
n8_MUX_uxn_opcodes_h_l2681_c2_1bc9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond,
n8_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue,
n8_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse,
n8_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output);

-- printf_uxn_opcodes_h_l2682_c3_7d80_uxn_opcodes_h_l2682_c3_7d80
printf_uxn_opcodes_h_l2682_c3_7d80_uxn_opcodes_h_l2682_c3_7d80 : entity work.printf_uxn_opcodes_h_l2682_c3_7d80_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2682_c3_7d80_uxn_opcodes_h_l2682_c3_7d80_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2686_c11_372a
BIN_OP_EQ_uxn_opcodes_h_l2686_c11_372a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2686_c11_372a_left,
BIN_OP_EQ_uxn_opcodes_h_l2686_c11_372a_right,
BIN_OP_EQ_uxn_opcodes_h_l2686_c11_372a_return_output);

-- t8_MUX_uxn_opcodes_h_l2686_c7_b0b8
t8_MUX_uxn_opcodes_h_l2686_c7_b0b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond,
t8_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue,
t8_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse,
t8_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_b0b8
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_b0b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_b0b8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_b0b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_b0b8
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_b0b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2686_c7_b0b8
result_stack_value_MUX_uxn_opcodes_h_l2686_c7_b0b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond,
result_stack_value_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8
result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output);

-- n8_MUX_uxn_opcodes_h_l2686_c7_b0b8
n8_MUX_uxn_opcodes_h_l2686_c7_b0b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond,
n8_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue,
n8_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse,
n8_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2689_c11_6bb7
BIN_OP_EQ_uxn_opcodes_h_l2689_c11_6bb7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2689_c11_6bb7_left,
BIN_OP_EQ_uxn_opcodes_h_l2689_c11_6bb7_right,
BIN_OP_EQ_uxn_opcodes_h_l2689_c11_6bb7_return_output);

-- t8_MUX_uxn_opcodes_h_l2689_c7_377e
t8_MUX_uxn_opcodes_h_l2689_c7_377e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2689_c7_377e_cond,
t8_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue,
t8_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse,
t8_MUX_uxn_opcodes_h_l2689_c7_377e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_377e
result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_377e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_377e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_377e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_377e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_377e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_377e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_377e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_377e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_377e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_377e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_377e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_377e
result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_377e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_377e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_377e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2689_c7_377e
result_stack_value_MUX_uxn_opcodes_h_l2689_c7_377e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2689_c7_377e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2689_c7_377e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_377e
result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_377e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_377e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_377e_return_output);

-- n8_MUX_uxn_opcodes_h_l2689_c7_377e
n8_MUX_uxn_opcodes_h_l2689_c7_377e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2689_c7_377e_cond,
n8_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue,
n8_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse,
n8_MUX_uxn_opcodes_h_l2689_c7_377e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2693_c11_d69f
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_d69f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_d69f_left,
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_d69f_right,
BIN_OP_EQ_uxn_opcodes_h_l2693_c11_d69f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_1453
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_1453 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_1453_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_1453_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_1453
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_1453 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_1453_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_1453_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_1453
result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_1453 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_1453_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_1453_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_1453
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_1453 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_1453_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_1453_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2693_c7_1453
result_stack_value_MUX_uxn_opcodes_h_l2693_c7_1453 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2693_c7_1453_cond,
result_stack_value_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2693_c7_1453_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_1453
result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_1453 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_1453_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_1453_return_output);

-- n8_MUX_uxn_opcodes_h_l2693_c7_1453
n8_MUX_uxn_opcodes_h_l2693_c7_1453 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2693_c7_1453_cond,
n8_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue,
n8_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse,
n8_MUX_uxn_opcodes_h_l2693_c7_1453_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2696_c11_7810
BIN_OP_EQ_uxn_opcodes_h_l2696_c11_7810 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2696_c11_7810_left,
BIN_OP_EQ_uxn_opcodes_h_l2696_c11_7810_right,
BIN_OP_EQ_uxn_opcodes_h_l2696_c11_7810_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_6aae
result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_6aae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_6aae_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_6aae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_6aae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_6aae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2696_c7_6aae
result_sp_relative_shift_MUX_uxn_opcodes_h_l2696_c7_6aae : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_6aae
result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_6aae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_6aae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2696_c7_6aae
result_stack_value_MUX_uxn_opcodes_h_l2696_c7_6aae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2696_c7_6aae_cond,
result_stack_value_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_6aae
result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_6aae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output);

-- n8_MUX_uxn_opcodes_h_l2696_c7_6aae
n8_MUX_uxn_opcodes_h_l2696_c7_6aae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l2696_c7_6aae_cond,
n8_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue,
n8_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse,
n8_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2699_c32_9163
BIN_OP_AND_uxn_opcodes_h_l2699_c32_9163 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2699_c32_9163_left,
BIN_OP_AND_uxn_opcodes_h_l2699_c32_9163_right,
BIN_OP_AND_uxn_opcodes_h_l2699_c32_9163_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2699_c32_889c
BIN_OP_GT_uxn_opcodes_h_l2699_c32_889c : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2699_c32_889c_left,
BIN_OP_GT_uxn_opcodes_h_l2699_c32_889c_right,
BIN_OP_GT_uxn_opcodes_h_l2699_c32_889c_return_output);

-- MUX_uxn_opcodes_h_l2699_c32_acfd
MUX_uxn_opcodes_h_l2699_c32_acfd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2699_c32_acfd_cond,
MUX_uxn_opcodes_h_l2699_c32_acfd_iftrue,
MUX_uxn_opcodes_h_l2699_c32_acfd_iffalse,
MUX_uxn_opcodes_h_l2699_c32_acfd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2701_c11_cc92
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_cc92 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_cc92_left,
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_cc92_right,
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_cc92_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_bd0c
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_bd0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_bd0c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_bd0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_bd0c
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_bd0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2701_c7_bd0c
result_stack_value_MUX_uxn_opcodes_h_l2701_c7_bd0c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond,
result_stack_value_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2701_c7_bd0c
result_is_sp_shift_MUX_uxn_opcodes_h_l2701_c7_bd0c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2705_c24_2e3f
BIN_OP_MINUS_uxn_opcodes_h_l2705_c24_2e3f : entity work.BIN_OP_MINUS_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2705_c24_2e3f_left,
BIN_OP_MINUS_uxn_opcodes_h_l2705_c24_2e3f_right,
BIN_OP_MINUS_uxn_opcodes_h_l2705_c24_2e3f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2707_c11_0d9f
BIN_OP_EQ_uxn_opcodes_h_l2707_c11_0d9f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2707_c11_0d9f_left,
BIN_OP_EQ_uxn_opcodes_h_l2707_c11_0d9f_right,
BIN_OP_EQ_uxn_opcodes_h_l2707_c11_0d9f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2707_c7_2e36
result_is_stack_write_MUX_uxn_opcodes_h_l2707_c7_2e36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2707_c7_2e36_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2707_c7_2e36_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2707_c7_2e36_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2707_c7_2e36_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2707_c7_2e36
result_is_opc_done_MUX_uxn_opcodes_h_l2707_c7_2e36 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2707_c7_2e36_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2707_c7_2e36_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2707_c7_2e36_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2707_c7_2e36_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_c832_return_output,
 t8_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output,
 n8_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2686_c11_372a_return_output,
 t8_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output,
 n8_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2689_c11_6bb7_return_output,
 t8_MUX_uxn_opcodes_h_l2689_c7_377e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_377e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_377e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_377e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_377e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2689_c7_377e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_377e_return_output,
 n8_MUX_uxn_opcodes_h_l2689_c7_377e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2693_c11_d69f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_1453_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_1453_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_1453_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_1453_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2693_c7_1453_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_1453_return_output,
 n8_MUX_uxn_opcodes_h_l2693_c7_1453_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2696_c11_7810_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output,
 n8_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2699_c32_9163_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2699_c32_889c_return_output,
 MUX_uxn_opcodes_h_l2699_c32_acfd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2701_c11_cc92_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2705_c24_2e3f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2707_c11_0d9f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2707_c7_2e36_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2707_c7_2e36_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_c832_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_c832_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_c832_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_c832_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2683_c3_1eaa : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2682_c3_7d80_uxn_opcodes_h_l2682_c3_7d80_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_372a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_372a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_372a_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2689_c7_377e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_377e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2687_c3_3066 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_377e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_377e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_377e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2689_c7_377e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_377e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2689_c7_377e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_6bb7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_6bb7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_6bb7_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2689_c7_377e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_1453_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_377e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2691_c3_21fc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_1453_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_377e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_1453_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_377e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_1453_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_377e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2693_c7_1453_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2689_c7_377e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_1453_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_377e_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2693_c7_1453_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2689_c7_377e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_d69f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_d69f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_d69f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_1453_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2694_c3_503f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_1453_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_1453_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_1453_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2693_c7_1453_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_1453_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2693_c7_1453_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_7810_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_7810_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_7810_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_6aae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_6aae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_6aae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2696_c7_6aae_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l2696_c7_6aae_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2699_c32_acfd_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2699_c32_acfd_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2699_c32_acfd_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2699_c32_9163_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2699_c32_9163_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2699_c32_9163_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2699_c32_889c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2699_c32_889c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2699_c32_889c_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2699_c32_acfd_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_cc92_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_cc92_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_cc92_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2707_c7_2e36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2704_c3_3245 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2707_c7_2e36_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2705_c24_2e3f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2705_c24_2e3f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2705_c24_2e3f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_0d9f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_0d9f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_0d9f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2707_c7_2e36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2707_c7_2e36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2707_c7_2e36_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2707_c7_2e36_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2707_c7_2e36_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2707_c7_2e36_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2707_l2696_DUPLICATE_0b1e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2696_DUPLICATE_c93b_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2701_l2696_DUPLICATE_08bb_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2701_DUPLICATE_4a64_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2707_l2701_l2696_DUPLICATE_715d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2696_l2701_DUPLICATE_b260_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2712_l2677_DUPLICATE_ed69_return_output : opcode_result_t;
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
     VAR_MUX_uxn_opcodes_h_l2699_c32_acfd_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_cc92_right := to_unsigned(5, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2699_c32_889c_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_6bb7_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2691_c3_21fc := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2691_c3_21fc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2683_c3_1eaa := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2683_c3_1eaa;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2707_c7_2e36_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_d69f_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_7810_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_0d9f_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2704_c3_3245 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2704_c3_3245;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_c832_iffalse := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l2699_c32_acfd_iffalse := resize(to_signed(-1, 2), 8);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2694_c3_503f := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2694_c3_503f;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2699_c32_9163_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_372a_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2707_c7_2e36_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2687_c3_3066 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2687_c3_3066;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_c832_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2699_c32_9163_left := VAR_ins;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2705_c24_2e3f_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_372a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_6bb7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_d69f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_7810_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_cc92_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_0d9f_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2705_c24_2e3f_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l2689_c11_6bb7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2689_c11_6bb7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_6bb7_left;
     BIN_OP_EQ_uxn_opcodes_h_l2689_c11_6bb7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_6bb7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_6bb7_return_output := BIN_OP_EQ_uxn_opcodes_h_l2689_c11_6bb7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2693_c11_d69f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2693_c11_d69f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_d69f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2693_c11_d69f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_d69f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_d69f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2693_c11_d69f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2681_c6_90eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2701_DUPLICATE_4a64 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2701_DUPLICATE_4a64_return_output := result.is_sp_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l2699_c32_9163] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2699_c32_9163_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2699_c32_9163_left;
     BIN_OP_AND_uxn_opcodes_h_l2699_c32_9163_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2699_c32_9163_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2699_c32_9163_return_output := BIN_OP_AND_uxn_opcodes_h_l2699_c32_9163_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2686_c11_372a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2686_c11_372a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_372a_left;
     BIN_OP_EQ_uxn_opcodes_h_l2686_c11_372a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_372a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_372a_return_output := BIN_OP_EQ_uxn_opcodes_h_l2686_c11_372a_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2707_l2701_l2696_DUPLICATE_715d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2707_l2701_l2696_DUPLICATE_715d_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2707_c11_0d9f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2707_c11_0d9f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_0d9f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2707_c11_0d9f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_0d9f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_0d9f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2707_c11_0d9f_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2707_l2696_DUPLICATE_0b1e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2707_l2696_DUPLICATE_0b1e_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2701_l2696_DUPLICATE_08bb LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2701_l2696_DUPLICATE_08bb_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2696_c11_7810] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2696_c11_7810_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_7810_left;
     BIN_OP_EQ_uxn_opcodes_h_l2696_c11_7810_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_7810_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_7810_return_output := BIN_OP_EQ_uxn_opcodes_h_l2696_c11_7810_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2696_l2701_DUPLICATE_b260 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2696_l2701_DUPLICATE_b260_return_output := result.stack_address_sp_offset;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2705_c24_2e3f] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2705_c24_2e3f_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2705_c24_2e3f_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2705_c24_2e3f_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2705_c24_2e3f_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2705_c24_2e3f_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2705_c24_2e3f_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2696_DUPLICATE_c93b LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2696_DUPLICATE_c93b_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2701_c11_cc92] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2701_c11_cc92_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_cc92_left;
     BIN_OP_EQ_uxn_opcodes_h_l2701_c11_cc92_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_cc92_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_cc92_return_output := BIN_OP_EQ_uxn_opcodes_h_l2701_c11_cc92_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2699_c32_889c_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2699_c32_9163_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_c832_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2681_c6_90eb_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_372a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_372a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_372a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_372a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_372a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_372a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_372a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c11_372a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2689_c7_377e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_6bb7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_377e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_6bb7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_377e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_6bb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_377e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_6bb7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_377e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_6bb7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_377e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_6bb7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2689_c7_377e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_6bb7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2689_c7_377e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2689_c11_6bb7_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2693_c7_1453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_d69f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_1453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_d69f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_1453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_d69f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_1453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_d69f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_1453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_d69f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_1453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_d69f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2693_c7_1453_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2693_c11_d69f_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2696_c7_6aae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_7810_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_6aae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_7810_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_7810_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_6aae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_7810_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_7810_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_6aae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_7810_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2696_c7_6aae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2696_c11_7810_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_cc92_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_cc92_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_cc92_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_cc92_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_cc92_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2707_c7_2e36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_0d9f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2707_c7_2e36_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2707_c11_0d9f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2705_c24_2e3f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2696_DUPLICATE_c93b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2696_DUPLICATE_c93b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2696_DUPLICATE_c93b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2696_DUPLICATE_c93b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2696_DUPLICATE_c93b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2707_l2701_l2696_DUPLICATE_715d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2707_l2701_l2696_DUPLICATE_715d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2707_l2701_l2696_DUPLICATE_715d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2707_l2701_l2696_DUPLICATE_715d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2707_l2701_l2696_DUPLICATE_715d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2707_c7_2e36_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2707_l2701_l2696_DUPLICATE_715d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2701_DUPLICATE_4a64_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2701_DUPLICATE_4a64_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2701_DUPLICATE_4a64_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2701_DUPLICATE_4a64_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2701_DUPLICATE_4a64_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2707_l2696_DUPLICATE_0b1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2707_l2696_DUPLICATE_0b1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2707_l2696_DUPLICATE_0b1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2707_l2696_DUPLICATE_0b1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2707_l2696_DUPLICATE_0b1e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2707_c7_2e36_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2707_l2696_DUPLICATE_0b1e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2696_l2701_DUPLICATE_b260_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2696_l2701_DUPLICATE_b260_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2701_l2696_DUPLICATE_08bb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2701_l2696_DUPLICATE_08bb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2701_l2696_DUPLICATE_08bb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2701_l2696_DUPLICATE_08bb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2701_l2696_DUPLICATE_08bb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2693_l2689_l2686_l2681_l2701_l2696_DUPLICATE_08bb_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2701_c7_bd0c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2681_c1_c832] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_c832_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_c832_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_c832_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_c832_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_c832_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_c832_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_c832_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_c832_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2699_c32_889c] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2699_c32_889c_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2699_c32_889c_left;
     BIN_OP_GT_uxn_opcodes_h_l2699_c32_889c_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2699_c32_889c_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2699_c32_889c_return_output := BIN_OP_GT_uxn_opcodes_h_l2699_c32_889c_return_output;

     -- n8_MUX[uxn_opcodes_h_l2696_c7_6aae] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2696_c7_6aae_cond <= VAR_n8_MUX_uxn_opcodes_h_l2696_c7_6aae_cond;
     n8_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue;
     n8_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output := n8_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2701_c7_bd0c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2707_c7_2e36] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2707_c7_2e36_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2707_c7_2e36_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2707_c7_2e36_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2707_c7_2e36_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2707_c7_2e36_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2707_c7_2e36_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2707_c7_2e36_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2707_c7_2e36_return_output;

     -- t8_MUX[uxn_opcodes_h_l2689_c7_377e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2689_c7_377e_cond <= VAR_t8_MUX_uxn_opcodes_h_l2689_c7_377e_cond;
     t8_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue;
     t8_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2689_c7_377e_return_output := t8_MUX_uxn_opcodes_h_l2689_c7_377e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2707_c7_2e36] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2707_c7_2e36_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2707_c7_2e36_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2707_c7_2e36_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2707_c7_2e36_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2707_c7_2e36_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2707_c7_2e36_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2707_c7_2e36_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2707_c7_2e36_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2701_c7_bd0c] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output := result_stack_value_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2699_c32_acfd_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2699_c32_889c_return_output;
     VAR_printf_uxn_opcodes_h_l2682_c3_7d80_uxn_opcodes_h_l2682_c3_7d80_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2681_c1_c832_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2707_c7_2e36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2707_c7_2e36_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2689_c7_377e_return_output;
     -- printf_uxn_opcodes_h_l2682_c3_7d80[uxn_opcodes_h_l2682_c3_7d80] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2682_c3_7d80_uxn_opcodes_h_l2682_c3_7d80_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2682_c3_7d80_uxn_opcodes_h_l2682_c3_7d80_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2696_c7_6aae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_6aae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_6aae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2701_c7_bd0c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output;

     -- n8_MUX[uxn_opcodes_h_l2693_c7_1453] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2693_c7_1453_cond <= VAR_n8_MUX_uxn_opcodes_h_l2693_c7_1453_cond;
     n8_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue;
     n8_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2693_c7_1453_return_output := n8_MUX_uxn_opcodes_h_l2693_c7_1453_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2696_c7_6aae] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2696_c7_6aae_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2696_c7_6aae_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output := result_stack_value_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2696_c7_6aae] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output;

     -- t8_MUX[uxn_opcodes_h_l2686_c7_b0b8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond <= VAR_t8_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond;
     t8_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue;
     t8_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output := t8_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2701_c7_bd0c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_bd0c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_bd0c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_bd0c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output;

     -- MUX[uxn_opcodes_h_l2699_c32_acfd] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2699_c32_acfd_cond <= VAR_MUX_uxn_opcodes_h_l2699_c32_acfd_cond;
     MUX_uxn_opcodes_h_l2699_c32_acfd_iftrue <= VAR_MUX_uxn_opcodes_h_l2699_c32_acfd_iftrue;
     MUX_uxn_opcodes_h_l2699_c32_acfd_iffalse <= VAR_MUX_uxn_opcodes_h_l2699_c32_acfd_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2699_c32_acfd_return_output := MUX_uxn_opcodes_h_l2699_c32_acfd_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue := VAR_MUX_uxn_opcodes_h_l2699_c32_acfd_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2693_c7_1453_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_bd0c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2693_c7_1453] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_1453_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_1453_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_1453_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_1453_return_output;

     -- n8_MUX[uxn_opcodes_h_l2689_c7_377e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2689_c7_377e_cond <= VAR_n8_MUX_uxn_opcodes_h_l2689_c7_377e_cond;
     n8_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue;
     n8_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2689_c7_377e_return_output := n8_MUX_uxn_opcodes_h_l2689_c7_377e_return_output;

     -- t8_MUX[uxn_opcodes_h_l2681_c2_1bc9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond <= VAR_t8_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond;
     t8_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue;
     t8_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output := t8_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2696_c7_6aae] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_6aae_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_6aae_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2693_c7_1453] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2693_c7_1453_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2693_c7_1453_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2693_c7_1453_return_output := result_stack_value_MUX_uxn_opcodes_h_l2693_c7_1453_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2693_c7_1453] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_1453_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_1453_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_1453_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_1453_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2696_c7_6aae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2696_c7_6aae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_6aae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_6aae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_6aae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_6aae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2689_c7_377e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2693_c7_1453_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2696_c7_6aae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2693_c7_1453_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2693_c7_1453_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2689_c7_377e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_377e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_377e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_377e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_377e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2693_c7_1453] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_1453_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_1453_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_1453_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_1453_return_output;

     -- n8_MUX[uxn_opcodes_h_l2686_c7_b0b8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond <= VAR_n8_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond;
     n8_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue;
     n8_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output := n8_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2693_c7_1453] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_1453_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_1453_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_1453_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_1453_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2693_c7_1453] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_1453_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_1453_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_1453_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_1453_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_1453_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_1453_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2689_c7_377e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_377e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_377e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_377e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_377e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2689_c7_377e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2689_c7_377e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2689_c7_377e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2689_c7_377e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2689_c7_377e_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse := VAR_n8_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2693_c7_1453_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2689_c7_377e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2693_c7_1453_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2693_c7_1453_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2689_c7_377e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2689_c7_377e_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2689_c7_377e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_377e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_377e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_377e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_377e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2686_c7_b0b8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output := result_stack_value_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2689_c7_377e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_377e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_377e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_377e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_377e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2686_c7_b0b8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2689_c7_377e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_377e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_377e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_377e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_377e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_377e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_377e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2686_c7_b0b8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output;

     -- n8_MUX[uxn_opcodes_h_l2681_c2_1bc9] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond <= VAR_n8_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond;
     n8_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue;
     n8_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output := n8_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2689_c7_377e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2689_c7_377e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2689_c7_377e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2681_c2_1bc9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output := result_stack_value_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2681_c2_1bc9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2686_c7_b0b8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2686_c7_b0b8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2686_c7_b0b8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_b0b8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_b0b8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_b0b8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2681_c2_1bc9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c7_b0b8_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2681_c2_1bc9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2681_c2_1bc9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2681_c2_1bc9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2712_l2677_DUPLICATE_ed69 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2712_l2677_DUPLICATE_ed69_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2681_c2_1bc9_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2712_l2677_DUPLICATE_ed69_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2712_l2677_DUPLICATE_ed69_return_output;
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
