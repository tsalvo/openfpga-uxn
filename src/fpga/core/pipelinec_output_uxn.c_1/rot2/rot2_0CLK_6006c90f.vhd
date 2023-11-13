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
-- Submodules: 114
entity rot2_0CLK_6006c90f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot2_0CLK_6006c90f;
architecture arch of rot2_0CLK_6006c90f is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal l16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_l16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2547_c6_2ff8]
signal BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2547_c1_0cfb]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_0cfb_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_0cfb_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_0cfb_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_0cfb_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2547_c2_3511]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_3511_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_3511_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2547_c2_3511]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_3511_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_3511_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2547_c2_3511]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_3511_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_3511_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2547_c2_3511]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_3511_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_3511_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2547_c2_3511]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_3511_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_3511_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2547_c2_3511]
signal result_u8_value_MUX_uxn_opcodes_h_l2547_c2_3511_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2547_c2_3511_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l2547_c2_3511]
signal l16_MUX_uxn_opcodes_h_l2547_c2_3511_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2547_c2_3511_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2547_c2_3511]
signal t16_MUX_uxn_opcodes_h_l2547_c2_3511_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2547_c2_3511_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2547_c2_3511]
signal n16_MUX_uxn_opcodes_h_l2547_c2_3511_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2547_c2_3511_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2548_c3_b295[uxn_opcodes_h_l2548_c3_b295]
signal printf_uxn_opcodes_h_l2548_c3_b295_uxn_opcodes_h_l2548_c3_b295_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2552_c11_1bfa]
signal BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2552_c7_c2a9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2552_c7_c2a9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2552_c7_c2a9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2552_c7_c2a9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2552_c7_c2a9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2552_c7_c2a9]
signal result_u8_value_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l2552_c7_c2a9]
signal l16_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2552_c7_c2a9]
signal t16_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2552_c7_c2a9]
signal n16_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2555_c11_1b33]
signal BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2555_c7_611f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_611f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_611f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2555_c7_611f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_611f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_611f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2555_c7_611f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_611f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_611f_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2555_c7_611f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_611f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_611f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2555_c7_611f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_611f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_611f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2555_c7_611f]
signal result_u8_value_MUX_uxn_opcodes_h_l2555_c7_611f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2555_c7_611f_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l2555_c7_611f]
signal l16_MUX_uxn_opcodes_h_l2555_c7_611f_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2555_c7_611f_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2555_c7_611f]
signal t16_MUX_uxn_opcodes_h_l2555_c7_611f_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2555_c7_611f_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2555_c7_611f]
signal n16_MUX_uxn_opcodes_h_l2555_c7_611f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2555_c7_611f_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2560_c11_d87f]
signal BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2560_c7_faf2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_faf2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2560_c7_faf2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2560_c7_faf2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_faf2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2560_c7_faf2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_faf2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2560_c7_faf2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2560_c7_faf2]
signal result_u8_value_MUX_uxn_opcodes_h_l2560_c7_faf2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l2560_c7_faf2]
signal l16_MUX_uxn_opcodes_h_l2560_c7_faf2_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2560_c7_faf2]
signal t16_MUX_uxn_opcodes_h_l2560_c7_faf2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2560_c7_faf2]
signal n16_MUX_uxn_opcodes_h_l2560_c7_faf2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2561_c3_eb6c]
signal BIN_OP_OR_uxn_opcodes_h_l2561_c3_eb6c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2561_c3_eb6c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2561_c3_eb6c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2564_c11_bb42]
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c11_bb42_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c11_bb42_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2564_c11_bb42_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2564_c7_8422]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_8422_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_8422_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2564_c7_8422]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_8422_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_8422_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2564_c7_8422]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_8422_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_8422_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2564_c7_8422]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_8422_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_8422_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2564_c7_8422]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_8422_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_8422_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2564_c7_8422]
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c7_8422_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2564_c7_8422_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l2564_c7_8422]
signal l16_MUX_uxn_opcodes_h_l2564_c7_8422_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2564_c7_8422_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2564_c7_8422]
signal n16_MUX_uxn_opcodes_h_l2564_c7_8422_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2564_c7_8422_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2569_c11_1b4d]
signal BIN_OP_EQ_uxn_opcodes_h_l2569_c11_1b4d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2569_c11_1b4d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2569_c11_1b4d_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2569_c7_3dce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_3dce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2569_c7_3dce]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2569_c7_3dce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_3dce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2569_c7_3dce]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_3dce_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2569_c7_3dce]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2569_c7_3dce]
signal result_u8_value_MUX_uxn_opcodes_h_l2569_c7_3dce_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l2569_c7_3dce]
signal l16_MUX_uxn_opcodes_h_l2569_c7_3dce_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l2569_c7_3dce]
signal n16_MUX_uxn_opcodes_h_l2569_c7_3dce_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2570_c3_c858]
signal BIN_OP_OR_uxn_opcodes_h_l2570_c3_c858_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2570_c3_c858_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2570_c3_c858_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2573_c11_7349]
signal BIN_OP_EQ_uxn_opcodes_h_l2573_c11_7349_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2573_c11_7349_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2573_c11_7349_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2573_c7_9db2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_9db2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2573_c7_9db2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2573_c7_9db2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_9db2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2573_c7_9db2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_9db2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2573_c7_9db2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2573_c7_9db2]
signal result_u8_value_MUX_uxn_opcodes_h_l2573_c7_9db2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l2573_c7_9db2]
signal l16_MUX_uxn_opcodes_h_l2573_c7_9db2_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2577_c30_e54e]
signal sp_relative_shift_uxn_opcodes_h_l2577_c30_e54e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2577_c30_e54e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2577_c30_e54e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2577_c30_e54e_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2582_c11_99e1]
signal BIN_OP_EQ_uxn_opcodes_h_l2582_c11_99e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2582_c11_99e1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2582_c11_99e1_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2582_c7_56f0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_56f0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2582_c7_56f0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_56f0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2582_c7_56f0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_56f0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2582_c7_56f0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_56f0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2582_c7_56f0]
signal result_u8_value_MUX_uxn_opcodes_h_l2582_c7_56f0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output : unsigned(7 downto 0);

-- l16_MUX[uxn_opcodes_h_l2582_c7_56f0]
signal l16_MUX_uxn_opcodes_h_l2582_c7_56f0_cond : unsigned(0 downto 0);
signal l16_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse : unsigned(15 downto 0);
signal l16_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2583_c3_8f9e]
signal BIN_OP_OR_uxn_opcodes_h_l2583_c3_8f9e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2583_c3_8f9e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2583_c3_8f9e_return_output : unsigned(15 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2586_c31_27d8]
signal CONST_SR_8_uxn_opcodes_h_l2586_c31_27d8_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2586_c31_27d8_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2588_c11_f25c]
signal BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f25c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f25c_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f25c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2588_c7_ead7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_ead7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_ead7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_ead7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_ead7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2588_c7_ead7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_ead7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_ead7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_ead7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_ead7_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2588_c7_ead7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_ead7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_ead7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_ead7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_ead7_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2588_c7_ead7]
signal result_u8_value_MUX_uxn_opcodes_h_l2588_c7_ead7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2588_c7_ead7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2588_c7_ead7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2588_c7_ead7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2592_c11_9a6f]
signal BIN_OP_EQ_uxn_opcodes_h_l2592_c11_9a6f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2592_c11_9a6f_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2592_c11_9a6f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2592_c7_dfed]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_dfed_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_dfed_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_dfed_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_dfed_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2592_c7_dfed]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_dfed_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_dfed_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_dfed_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_dfed_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2592_c7_dfed]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_dfed_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_dfed_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_dfed_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_dfed_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2592_c7_dfed]
signal result_u8_value_MUX_uxn_opcodes_h_l2592_c7_dfed_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2592_c7_dfed_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2592_c7_dfed_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2592_c7_dfed_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2594_c31_e280]
signal CONST_SR_8_uxn_opcodes_h_l2594_c31_e280_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2594_c31_e280_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2596_c11_6b9e]
signal BIN_OP_EQ_uxn_opcodes_h_l2596_c11_6b9e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2596_c11_6b9e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2596_c11_6b9e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2596_c7_741e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_741e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_741e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_741e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_741e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2596_c7_741e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_741e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_741e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_741e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_741e_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2596_c7_741e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_741e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_741e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_741e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_741e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2596_c7_741e]
signal result_u8_value_MUX_uxn_opcodes_h_l2596_c7_741e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2596_c7_741e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2596_c7_741e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2596_c7_741e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2600_c11_a819]
signal BIN_OP_EQ_uxn_opcodes_h_l2600_c11_a819_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2600_c11_a819_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2600_c11_a819_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2600_c7_5671]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_5671_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_5671_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_5671_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_5671_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2600_c7_5671]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_5671_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_5671_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_5671_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_5671_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2600_c7_5671]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_5671_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_5671_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_5671_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_5671_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2600_c7_5671]
signal result_u8_value_MUX_uxn_opcodes_h_l2600_c7_5671_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2600_c7_5671_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2600_c7_5671_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2600_c7_5671_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2602_c31_1e93]
signal CONST_SR_8_uxn_opcodes_h_l2602_c31_1e93_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2602_c31_1e93_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2604_c11_c086]
signal BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c086_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c086_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c086_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2604_c7_e5e2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_e5e2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_e5e2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_e5e2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_e5e2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2604_c7_e5e2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_e5e2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_e5e2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_e5e2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_e5e2_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2557_l2575_l2566_DUPLICATE_aced
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2557_l2575_l2566_DUPLICATE_aced_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2557_l2575_l2566_DUPLICATE_aced_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8c29( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_sp_shift := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.u8_value := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8
BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8_left,
BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8_right,
BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_0cfb
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_0cfb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_0cfb_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_0cfb_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_0cfb_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_0cfb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_3511
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_3511 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_3511_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_3511_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_3511
result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_3511 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_3511_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_3511_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_3511
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_3511 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_3511_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_3511_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_3511
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_3511 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_3511_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_3511_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_3511
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_3511 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_3511_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_3511_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2547_c2_3511
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_3511 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_3511_cond,
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2547_c2_3511_return_output);

-- l16_MUX_uxn_opcodes_h_l2547_c2_3511
l16_MUX_uxn_opcodes_h_l2547_c2_3511 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2547_c2_3511_cond,
l16_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue,
l16_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse,
l16_MUX_uxn_opcodes_h_l2547_c2_3511_return_output);

-- t16_MUX_uxn_opcodes_h_l2547_c2_3511
t16_MUX_uxn_opcodes_h_l2547_c2_3511 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2547_c2_3511_cond,
t16_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue,
t16_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse,
t16_MUX_uxn_opcodes_h_l2547_c2_3511_return_output);

-- n16_MUX_uxn_opcodes_h_l2547_c2_3511
n16_MUX_uxn_opcodes_h_l2547_c2_3511 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2547_c2_3511_cond,
n16_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue,
n16_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse,
n16_MUX_uxn_opcodes_h_l2547_c2_3511_return_output);

-- printf_uxn_opcodes_h_l2548_c3_b295_uxn_opcodes_h_l2548_c3_b295
printf_uxn_opcodes_h_l2548_c3_b295_uxn_opcodes_h_l2548_c3_b295 : entity work.printf_uxn_opcodes_h_l2548_c3_b295_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2548_c3_b295_uxn_opcodes_h_l2548_c3_b295_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa
BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa_left,
BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa_right,
BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_c2a9
result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_c2a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9
result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_c2a9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_c2a9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_c2a9
result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_c2a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2552_c7_c2a9
result_u8_value_MUX_uxn_opcodes_h_l2552_c7_c2a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output);

-- l16_MUX_uxn_opcodes_h_l2552_c7_c2a9
l16_MUX_uxn_opcodes_h_l2552_c7_c2a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond,
l16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue,
l16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse,
l16_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output);

-- t16_MUX_uxn_opcodes_h_l2552_c7_c2a9
t16_MUX_uxn_opcodes_h_l2552_c7_c2a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond,
t16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue,
t16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse,
t16_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output);

-- n16_MUX_uxn_opcodes_h_l2552_c7_c2a9
n16_MUX_uxn_opcodes_h_l2552_c7_c2a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond,
n16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue,
n16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse,
n16_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33
BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33_left,
BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33_right,
BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_611f
result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_611f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_611f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_611f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_611f
result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_611f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_611f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_611f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_611f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_611f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_611f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_611f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_611f
result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_611f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_611f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_611f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_611f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_611f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_611f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_611f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2555_c7_611f
result_u8_value_MUX_uxn_opcodes_h_l2555_c7_611f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2555_c7_611f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2555_c7_611f_return_output);

-- l16_MUX_uxn_opcodes_h_l2555_c7_611f
l16_MUX_uxn_opcodes_h_l2555_c7_611f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2555_c7_611f_cond,
l16_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue,
l16_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse,
l16_MUX_uxn_opcodes_h_l2555_c7_611f_return_output);

-- t16_MUX_uxn_opcodes_h_l2555_c7_611f
t16_MUX_uxn_opcodes_h_l2555_c7_611f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2555_c7_611f_cond,
t16_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue,
t16_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse,
t16_MUX_uxn_opcodes_h_l2555_c7_611f_return_output);

-- n16_MUX_uxn_opcodes_h_l2555_c7_611f
n16_MUX_uxn_opcodes_h_l2555_c7_611f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2555_c7_611f_cond,
n16_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue,
n16_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse,
n16_MUX_uxn_opcodes_h_l2555_c7_611f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f_left,
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f_right,
BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_faf2
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_faf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_faf2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_faf2
result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_faf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_faf2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_faf2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_faf2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_faf2
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_faf2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_faf2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_faf2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_faf2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2560_c7_faf2
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_faf2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_faf2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output);

-- l16_MUX_uxn_opcodes_h_l2560_c7_faf2
l16_MUX_uxn_opcodes_h_l2560_c7_faf2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2560_c7_faf2_cond,
l16_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue,
l16_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse,
l16_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output);

-- t16_MUX_uxn_opcodes_h_l2560_c7_faf2
t16_MUX_uxn_opcodes_h_l2560_c7_faf2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2560_c7_faf2_cond,
t16_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue,
t16_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse,
t16_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output);

-- n16_MUX_uxn_opcodes_h_l2560_c7_faf2
n16_MUX_uxn_opcodes_h_l2560_c7_faf2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2560_c7_faf2_cond,
n16_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue,
n16_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse,
n16_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2561_c3_eb6c
BIN_OP_OR_uxn_opcodes_h_l2561_c3_eb6c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2561_c3_eb6c_left,
BIN_OP_OR_uxn_opcodes_h_l2561_c3_eb6c_right,
BIN_OP_OR_uxn_opcodes_h_l2561_c3_eb6c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2564_c11_bb42
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_bb42 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_bb42_left,
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_bb42_right,
BIN_OP_EQ_uxn_opcodes_h_l2564_c11_bb42_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_8422
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_8422 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_8422_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_8422_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_8422
result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_8422 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_8422_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_8422_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_8422
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_8422 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_8422_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_8422_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_8422
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_8422 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_8422_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_8422_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_8422
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_8422 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_8422_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_8422_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2564_c7_8422
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_8422 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_8422_cond,
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2564_c7_8422_return_output);

-- l16_MUX_uxn_opcodes_h_l2564_c7_8422
l16_MUX_uxn_opcodes_h_l2564_c7_8422 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2564_c7_8422_cond,
l16_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue,
l16_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse,
l16_MUX_uxn_opcodes_h_l2564_c7_8422_return_output);

-- n16_MUX_uxn_opcodes_h_l2564_c7_8422
n16_MUX_uxn_opcodes_h_l2564_c7_8422 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2564_c7_8422_cond,
n16_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue,
n16_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse,
n16_MUX_uxn_opcodes_h_l2564_c7_8422_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2569_c11_1b4d
BIN_OP_EQ_uxn_opcodes_h_l2569_c11_1b4d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2569_c11_1b4d_left,
BIN_OP_EQ_uxn_opcodes_h_l2569_c11_1b4d_right,
BIN_OP_EQ_uxn_opcodes_h_l2569_c11_1b4d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_3dce
result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_3dce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_3dce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_3dce
result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_3dce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_3dce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_3dce : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_3dce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_3dce
result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_3dce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_3dce_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_3dce
result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_3dce : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2569_c7_3dce
result_u8_value_MUX_uxn_opcodes_h_l2569_c7_3dce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2569_c7_3dce_cond,
result_u8_value_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output);

-- l16_MUX_uxn_opcodes_h_l2569_c7_3dce
l16_MUX_uxn_opcodes_h_l2569_c7_3dce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2569_c7_3dce_cond,
l16_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue,
l16_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse,
l16_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output);

-- n16_MUX_uxn_opcodes_h_l2569_c7_3dce
n16_MUX_uxn_opcodes_h_l2569_c7_3dce : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2569_c7_3dce_cond,
n16_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue,
n16_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse,
n16_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2570_c3_c858
BIN_OP_OR_uxn_opcodes_h_l2570_c3_c858 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2570_c3_c858_left,
BIN_OP_OR_uxn_opcodes_h_l2570_c3_c858_right,
BIN_OP_OR_uxn_opcodes_h_l2570_c3_c858_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2573_c11_7349
BIN_OP_EQ_uxn_opcodes_h_l2573_c11_7349 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2573_c11_7349_left,
BIN_OP_EQ_uxn_opcodes_h_l2573_c11_7349_right,
BIN_OP_EQ_uxn_opcodes_h_l2573_c11_7349_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_9db2
result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_9db2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_9db2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_9db2
result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_9db2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_9db2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_9db2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_9db2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_9db2
result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_9db2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_9db2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_9db2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_9db2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2573_c7_9db2
result_u8_value_MUX_uxn_opcodes_h_l2573_c7_9db2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2573_c7_9db2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output);

-- l16_MUX_uxn_opcodes_h_l2573_c7_9db2
l16_MUX_uxn_opcodes_h_l2573_c7_9db2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2573_c7_9db2_cond,
l16_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue,
l16_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse,
l16_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2577_c30_e54e
sp_relative_shift_uxn_opcodes_h_l2577_c30_e54e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2577_c30_e54e_ins,
sp_relative_shift_uxn_opcodes_h_l2577_c30_e54e_x,
sp_relative_shift_uxn_opcodes_h_l2577_c30_e54e_y,
sp_relative_shift_uxn_opcodes_h_l2577_c30_e54e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2582_c11_99e1
BIN_OP_EQ_uxn_opcodes_h_l2582_c11_99e1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2582_c11_99e1_left,
BIN_OP_EQ_uxn_opcodes_h_l2582_c11_99e1_right,
BIN_OP_EQ_uxn_opcodes_h_l2582_c11_99e1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_56f0
result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_56f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_56f0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_56f0
result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_56f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_56f0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_56f0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_56f0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_56f0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_56f0
result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_56f0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_56f0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2582_c7_56f0
result_u8_value_MUX_uxn_opcodes_h_l2582_c7_56f0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2582_c7_56f0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output);

-- l16_MUX_uxn_opcodes_h_l2582_c7_56f0
l16_MUX_uxn_opcodes_h_l2582_c7_56f0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
l16_MUX_uxn_opcodes_h_l2582_c7_56f0_cond,
l16_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue,
l16_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse,
l16_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2583_c3_8f9e
BIN_OP_OR_uxn_opcodes_h_l2583_c3_8f9e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2583_c3_8f9e_left,
BIN_OP_OR_uxn_opcodes_h_l2583_c3_8f9e_right,
BIN_OP_OR_uxn_opcodes_h_l2583_c3_8f9e_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2586_c31_27d8
CONST_SR_8_uxn_opcodes_h_l2586_c31_27d8 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2586_c31_27d8_x,
CONST_SR_8_uxn_opcodes_h_l2586_c31_27d8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f25c
BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f25c : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f25c_left,
BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f25c_right,
BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f25c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_ead7
result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_ead7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_ead7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_ead7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_ead7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_ead7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_ead7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_ead7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_ead7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_ead7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_ead7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_ead7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_ead7
result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_ead7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_ead7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_ead7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_ead7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_ead7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2588_c7_ead7
result_u8_value_MUX_uxn_opcodes_h_l2588_c7_ead7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2588_c7_ead7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2588_c7_ead7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2588_c7_ead7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2588_c7_ead7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2592_c11_9a6f
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_9a6f : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_9a6f_left,
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_9a6f_right,
BIN_OP_EQ_uxn_opcodes_h_l2592_c11_9a6f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_dfed
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_dfed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_dfed_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_dfed_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_dfed_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_dfed_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_dfed
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_dfed : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_dfed_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_dfed_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_dfed_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_dfed_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_dfed
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_dfed : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_dfed_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_dfed_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_dfed_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_dfed_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2592_c7_dfed
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_dfed : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_dfed_cond,
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_dfed_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_dfed_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2592_c7_dfed_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2594_c31_e280
CONST_SR_8_uxn_opcodes_h_l2594_c31_e280 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2594_c31_e280_x,
CONST_SR_8_uxn_opcodes_h_l2594_c31_e280_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2596_c11_6b9e
BIN_OP_EQ_uxn_opcodes_h_l2596_c11_6b9e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2596_c11_6b9e_left,
BIN_OP_EQ_uxn_opcodes_h_l2596_c11_6b9e_right,
BIN_OP_EQ_uxn_opcodes_h_l2596_c11_6b9e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_741e
result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_741e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_741e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_741e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_741e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_741e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_741e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_741e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_741e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_741e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_741e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_741e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_741e
result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_741e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_741e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_741e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_741e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_741e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2596_c7_741e
result_u8_value_MUX_uxn_opcodes_h_l2596_c7_741e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2596_c7_741e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2596_c7_741e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2596_c7_741e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2596_c7_741e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2600_c11_a819
BIN_OP_EQ_uxn_opcodes_h_l2600_c11_a819 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2600_c11_a819_left,
BIN_OP_EQ_uxn_opcodes_h_l2600_c11_a819_right,
BIN_OP_EQ_uxn_opcodes_h_l2600_c11_a819_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_5671
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_5671 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_5671_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_5671_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_5671_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_5671_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_5671
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_5671 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_5671_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_5671_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_5671_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_5671_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_5671
result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_5671 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_5671_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_5671_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_5671_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_5671_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2600_c7_5671
result_u8_value_MUX_uxn_opcodes_h_l2600_c7_5671 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2600_c7_5671_cond,
result_u8_value_MUX_uxn_opcodes_h_l2600_c7_5671_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2600_c7_5671_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2600_c7_5671_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2602_c31_1e93
CONST_SR_8_uxn_opcodes_h_l2602_c31_1e93 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2602_c31_1e93_x,
CONST_SR_8_uxn_opcodes_h_l2602_c31_1e93_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c086
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c086 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c086_left,
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c086_right,
BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c086_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_e5e2
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_e5e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_e5e2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_e5e2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_e5e2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_e5e2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_e5e2
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_e5e2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_e5e2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_e5e2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_e5e2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_e5e2_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2557_l2575_l2566_DUPLICATE_aced
CONST_SL_8_uint16_t_uxn_opcodes_h_l2557_l2575_l2566_DUPLICATE_aced : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2557_l2575_l2566_DUPLICATE_aced_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2557_l2575_l2566_DUPLICATE_aced_return_output);



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
 l16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_0cfb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_3511_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_3511_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_3511_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_3511_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_3511_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2547_c2_3511_return_output,
 l16_MUX_uxn_opcodes_h_l2547_c2_3511_return_output,
 t16_MUX_uxn_opcodes_h_l2547_c2_3511_return_output,
 n16_MUX_uxn_opcodes_h_l2547_c2_3511_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output,
 l16_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output,
 t16_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output,
 n16_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_611f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_611f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_611f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_611f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_611f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2555_c7_611f_return_output,
 l16_MUX_uxn_opcodes_h_l2555_c7_611f_return_output,
 t16_MUX_uxn_opcodes_h_l2555_c7_611f_return_output,
 n16_MUX_uxn_opcodes_h_l2555_c7_611f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output,
 l16_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output,
 t16_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output,
 n16_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2561_c3_eb6c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2564_c11_bb42_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_8422_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_8422_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_8422_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_8422_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_8422_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2564_c7_8422_return_output,
 l16_MUX_uxn_opcodes_h_l2564_c7_8422_return_output,
 n16_MUX_uxn_opcodes_h_l2564_c7_8422_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2569_c11_1b4d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output,
 l16_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output,
 n16_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2570_c3_c858_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2573_c11_7349_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output,
 l16_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output,
 sp_relative_shift_uxn_opcodes_h_l2577_c30_e54e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2582_c11_99e1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output,
 l16_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2583_c3_8f9e_return_output,
 CONST_SR_8_uxn_opcodes_h_l2586_c31_27d8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f25c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_ead7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_ead7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_ead7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2588_c7_ead7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2592_c11_9a6f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_dfed_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_dfed_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_dfed_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2592_c7_dfed_return_output,
 CONST_SR_8_uxn_opcodes_h_l2594_c31_e280_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2596_c11_6b9e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_741e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_741e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_741e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2596_c7_741e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2600_c11_a819_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_5671_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_5671_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_5671_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2600_c7_5671_return_output,
 CONST_SR_8_uxn_opcodes_h_l2602_c31_1e93_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c086_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_e5e2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_e5e2_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2557_l2575_l2566_DUPLICATE_aced_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_0cfb_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_0cfb_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_0cfb_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_0cfb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_3511_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_3511_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_3511_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_3511_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2549_c3_9e9a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_3511_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_3511_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_3511_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_3511_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_3511_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_3511_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_3511_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_3511_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2547_c2_3511_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2547_c2_3511_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2547_c2_3511_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2547_c2_3511_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2547_c2_3511_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2547_c2_3511_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2548_c3_b295_uxn_opcodes_h_l2548_c3_b295_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_611f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_611f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2553_c3_d51e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_611f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_611f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_611f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_611f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2555_c7_611f_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2555_c7_611f_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2555_c7_611f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_611f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_611f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2558_c3_1c96 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_611f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_611f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_611f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_611f_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2555_c7_611f_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2555_c7_611f_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2555_c7_611f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_8422_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_faf2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_8422_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2562_c3_dc99 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_8422_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_faf2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_8422_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_faf2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_8422_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_8422_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_faf2_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2564_c7_8422_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2560_c7_faf2_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2560_c7_faf2_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2564_c7_8422_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2560_c7_faf2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2561_c3_eb6c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2561_c3_eb6c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2561_c3_eb6c_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_bb42_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_bb42_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_bb42_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_8422_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_8422_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2567_c3_0411 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_8422_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_8422_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_8422_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_8422_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2564_c7_8422_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2564_c7_8422_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_1b4d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_1b4d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_1b4d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_3dce_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2571_c3_f779 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_3dce_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_3dce_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_3dce_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2569_c7_3dce_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2569_c7_3dce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2570_c3_c858_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2570_c3_c858_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2570_c3_c858_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_7349_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_7349_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_7349_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_9db2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2579_c3_953e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_9db2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_9db2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2573_c7_9db2_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2573_c7_9db2_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2577_c30_e54e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2577_c30_e54e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2577_c30_e54e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2577_c30_e54e_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2580_c21_82c4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_99e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_99e1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_99e1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_ead7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_56f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_56f0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2585_c3_b937 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_ead7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_56f0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_ead7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_56f0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_ead7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_56f0_cond : unsigned(0 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse : unsigned(15 downto 0);
 variable VAR_l16_MUX_uxn_opcodes_h_l2582_c7_56f0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2583_c3_8f9e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2583_c3_8f9e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2583_c3_8f9e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2586_c31_27d8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2586_c31_27d8_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2586_c21_2654_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f25c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f25c_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f25c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_ead7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_ead7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_dfed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_ead7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_ead7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2589_c3_c445 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_ead7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_dfed_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_ead7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_ead7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_ead7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_dfed_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_ead7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_ead7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_ead7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_dfed_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_ead7_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2590_c21_828e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_9a6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_9a6f_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_9a6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_dfed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_dfed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_741e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_dfed_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_dfed_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2593_c3_7f1c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_dfed_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_741e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_dfed_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_dfed_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_dfed_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_741e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_dfed_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_dfed_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_dfed_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_741e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_dfed_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2594_c31_e280_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2594_c31_e280_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2594_c21_5ca8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_6b9e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_6b9e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_6b9e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_741e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_741e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_5671_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_741e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_741e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2597_c3_568e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_741e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_5671_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_741e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_741e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_741e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_5671_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_741e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_741e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_741e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_5671_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_741e_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2598_c21_280c_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_a819_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_a819_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_a819_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_5671_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_5671_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_e5e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_5671_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_5671_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2601_c3_49dc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_5671_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2600_c7_5671_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_5671_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_5671_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_5671_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_e5e2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_5671_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_5671_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_5671_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_5671_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2602_c31_1e93_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2602_c31_1e93_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2602_c21_a563_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c086_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c086_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c086_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_e5e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_e5e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_e5e2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_e5e2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_e5e2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_e5e2_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2547_l2569_l2564_l2560_l2555_l2552_l2582_DUPLICATE_1aa2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_d8b3_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2547_l2573_l2569_l2564_l2560_l2555_l2552_DUPLICATE_8573_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2547_l2569_l2600_l2564_l2560_l2555_l2552_DUPLICATE_0b12_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_e79d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2556_l2565_l2583_l2561_l2574_l2570_DUPLICATE_2edf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2557_l2575_l2566_DUPLICATE_aced_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2557_l2575_l2566_DUPLICATE_aced_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2609_l2543_DUPLICATE_d4e4_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_l16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_l16 := l16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2558_c3_1c96 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2558_c3_1c96;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2593_c3_7f1c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_dfed_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2593_c3_7f1c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_9a6f_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2589_c3_c445 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_ead7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2589_c3_c445;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f25c_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2571_c3_f779 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2571_c3_f779;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_1b4d_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2597_c3_568e := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_741e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2597_c3_568e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2601_c3_49dc := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_5671_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2601_c3_49dc;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2577_c30_e54e_x := signed(std_logic_vector(resize(to_unsigned(6, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_99e1_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2553_c3_d51e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2553_c3_d51e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_6b9e_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2585_c3_b937 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2585_c3_b937;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2562_c3_dc99 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2562_c3_dc99;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_a819_right := to_unsigned(11, 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l2577_c30_e54e_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_bb42_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_7349_right := to_unsigned(6, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_0cfb_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2579_c3_953e := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2579_c3_953e;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c086_right := to_unsigned(12, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_e5e2_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2549_c3_9e9a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2549_c3_9e9a;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2567_c3_0411 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2567_c3_0411;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_e5e2_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_0cfb_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l2577_c30_e54e_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2583_c3_8f9e_left := l16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2594_c31_e280_x := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue := l16;
     VAR_l16_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse := l16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2570_c3_c858_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2602_c31_1e93_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_bb42_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_1b4d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_7349_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_99e1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f25c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_9a6f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_6b9e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_a819_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c086_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2561_c3_eb6c_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2586_c31_27d8_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2592_c11_9a6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2592_c11_9a6f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_9a6f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2592_c11_9a6f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_9a6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_9a6f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2592_c11_9a6f_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2594_c31_e280] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2594_c31_e280_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2594_c31_e280_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2594_c31_e280_return_output := CONST_SR_8_uxn_opcodes_h_l2594_c31_e280_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2586_c31_27d8] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2586_c31_27d8_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2586_c31_27d8_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2586_c31_27d8_return_output := CONST_SR_8_uxn_opcodes_h_l2586_c31_27d8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2569_c11_1b4d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2569_c11_1b4d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_1b4d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2569_c11_1b4d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_1b4d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_1b4d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2569_c11_1b4d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2580_c21_82c4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2580_c21_82c4_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2547_c6_2ff8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2556_l2565_l2583_l2561_l2574_l2570_DUPLICATE_2edf LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2556_l2565_l2583_l2561_l2574_l2570_DUPLICATE_2edf_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2582_c11_99e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2582_c11_99e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_99e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2582_c11_99e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_99e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_99e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2582_c11_99e1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2600_c11_a819] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2600_c11_a819_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_a819_left;
     BIN_OP_EQ_uxn_opcodes_h_l2600_c11_a819_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_a819_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_a819_return_output := BIN_OP_EQ_uxn_opcodes_h_l2600_c11_a819_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_e79d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_e79d_return_output := result.is_opc_done;

     -- CONST_SR_8[uxn_opcodes_h_l2602_c31_1e93] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2602_c31_1e93_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2602_c31_1e93_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2602_c31_1e93_return_output := CONST_SR_8_uxn_opcodes_h_l2602_c31_1e93_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2590_c21_828e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2590_c21_828e_return_output := CAST_TO_uint8_t_uint16_t(
     l16);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2598_c21_280c] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2598_c21_280c_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2588_c11_f25c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f25c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f25c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f25c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f25c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f25c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f25c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2596_c11_6b9e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2596_c11_6b9e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_6b9e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2596_c11_6b9e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_6b9e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_6b9e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2596_c11_6b9e_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2547_l2569_l2600_l2564_l2560_l2555_l2552_DUPLICATE_0b12 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2547_l2569_l2600_l2564_l2560_l2555_l2552_DUPLICATE_0b12_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2560_c11_d87f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f_left;
     BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f_return_output := BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2577_c30_e54e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2577_c30_e54e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2577_c30_e54e_ins;
     sp_relative_shift_uxn_opcodes_h_l2577_c30_e54e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2577_c30_e54e_x;
     sp_relative_shift_uxn_opcodes_h_l2577_c30_e54e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2577_c30_e54e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2577_c30_e54e_return_output := sp_relative_shift_uxn_opcodes_h_l2577_c30_e54e_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2547_l2573_l2569_l2564_l2560_l2555_l2552_DUPLICATE_8573 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2547_l2573_l2569_l2564_l2560_l2555_l2552_DUPLICATE_8573_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2547_l2569_l2564_l2560_l2555_l2552_l2582_DUPLICATE_1aa2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2547_l2569_l2564_l2560_l2555_l2552_l2582_DUPLICATE_1aa2_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_d8b3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_d8b3_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2552_c11_1bfa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2564_c11_bb42] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2564_c11_bb42_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_bb42_left;
     BIN_OP_EQ_uxn_opcodes_h_l2564_c11_bb42_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_bb42_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_bb42_return_output := BIN_OP_EQ_uxn_opcodes_h_l2564_c11_bb42_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2573_c11_7349] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2573_c11_7349_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_7349_left;
     BIN_OP_EQ_uxn_opcodes_h_l2573_c11_7349_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_7349_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_7349_return_output := BIN_OP_EQ_uxn_opcodes_h_l2573_c11_7349_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2555_c11_1b33] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33_left;
     BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33_return_output := BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2600_c7_5671] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2600_c7_5671_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2604_c11_c086] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c086_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c086_left;
     BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c086_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c086_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c086_return_output := BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c086_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_0cfb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2547_c2_3511_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2547_c2_3511_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_3511_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_3511_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_3511_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_3511_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_3511_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_3511_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2547_c2_3511_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2547_c6_2ff8_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2552_c11_1bfa_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2555_c7_611f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2555_c7_611f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_611f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_611f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_611f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_611f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_611f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_611f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2555_c7_611f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2555_c11_1b33_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2560_c7_faf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2560_c7_faf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_faf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_faf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_faf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_faf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2560_c7_faf2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2560_c11_d87f_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2564_c7_8422_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_bb42_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2564_c7_8422_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_bb42_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_8422_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_bb42_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_8422_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_bb42_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_8422_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_bb42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_8422_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_bb42_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_8422_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_bb42_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_8422_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2564_c11_bb42_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2569_c7_3dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_1b4d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2569_c7_3dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_1b4d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_3dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_1b4d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_1b4d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_3dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_1b4d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_1b4d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_3dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_1b4d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_3dce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2569_c11_1b4d_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2573_c7_9db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_7349_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_9db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_7349_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_7349_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_9db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_7349_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_7349_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_9db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_7349_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2573_c7_9db2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2573_c11_7349_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2582_c7_56f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_99e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_56f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_99e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_56f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_99e1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_56f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_99e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_56f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_99e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_56f0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2582_c11_99e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_ead7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f25c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_ead7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f25c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_ead7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f25c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_ead7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2588_c11_f25c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_dfed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_9a6f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_dfed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_9a6f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_dfed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_9a6f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_dfed_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2592_c11_9a6f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_741e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_6b9e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_741e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_6b9e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_741e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_6b9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_741e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2596_c11_6b9e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_5671_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_a819_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_5671_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_a819_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_5671_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_a819_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_5671_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2600_c11_a819_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_e5e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c086_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_e5e2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2604_c11_c086_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2561_c3_eb6c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2556_l2565_l2583_l2561_l2574_l2570_DUPLICATE_2edf_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2570_c3_c858_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2556_l2565_l2583_l2561_l2574_l2570_DUPLICATE_2edf_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2583_c3_8f9e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2556_l2565_l2583_l2561_l2574_l2570_DUPLICATE_2edf_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2557_l2575_l2566_DUPLICATE_aced_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2556_l2565_l2583_l2561_l2574_l2570_DUPLICATE_2edf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2580_c21_82c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_ead7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2590_c21_828e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_741e_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2598_c21_280c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2547_l2573_l2569_l2564_l2560_l2555_l2552_DUPLICATE_8573_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2547_l2573_l2569_l2564_l2560_l2555_l2552_DUPLICATE_8573_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2547_l2573_l2569_l2564_l2560_l2555_l2552_DUPLICATE_8573_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2547_l2573_l2569_l2564_l2560_l2555_l2552_DUPLICATE_8573_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2547_l2573_l2569_l2564_l2560_l2555_l2552_DUPLICATE_8573_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2547_l2573_l2569_l2564_l2560_l2555_l2552_DUPLICATE_8573_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2547_l2573_l2569_l2564_l2560_l2555_l2552_DUPLICATE_8573_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_e79d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_e79d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_e79d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_e79d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_e79d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_e79d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_e79d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_ead7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_e79d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_dfed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_e79d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_741e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_e79d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_5671_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_e79d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_e5e2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2573_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_e79d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2547_l2569_l2564_l2560_l2555_l2552_l2582_DUPLICATE_1aa2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2547_l2569_l2564_l2560_l2555_l2552_l2582_DUPLICATE_1aa2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2547_l2569_l2564_l2560_l2555_l2552_l2582_DUPLICATE_1aa2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2547_l2569_l2564_l2560_l2555_l2552_l2582_DUPLICATE_1aa2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2547_l2569_l2564_l2560_l2555_l2552_l2582_DUPLICATE_1aa2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2547_l2569_l2564_l2560_l2555_l2552_l2582_DUPLICATE_1aa2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2547_l2569_l2564_l2560_l2555_l2552_l2582_DUPLICATE_1aa2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_d8b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_d8b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_d8b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_d8b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_d8b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_d8b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_d8b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_ead7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_d8b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_dfed_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_d8b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_741e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_d8b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_5671_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_d8b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_e5e2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2547_l2604_l2569_l2600_l2564_l2596_l2560_l2592_l2555_l2588_l2552_l2582_DUPLICATE_d8b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2547_l2569_l2600_l2564_l2560_l2555_l2552_DUPLICATE_0b12_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2547_l2569_l2600_l2564_l2560_l2555_l2552_DUPLICATE_0b12_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2547_l2569_l2600_l2564_l2560_l2555_l2552_DUPLICATE_0b12_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2547_l2569_l2600_l2564_l2560_l2555_l2552_DUPLICATE_0b12_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2547_l2569_l2600_l2564_l2560_l2555_l2552_DUPLICATE_0b12_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2547_l2569_l2600_l2564_l2560_l2555_l2552_DUPLICATE_0b12_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_5671_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2547_l2569_l2600_l2564_l2560_l2555_l2552_DUPLICATE_0b12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_5671_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2600_c7_5671_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2577_c30_e54e_return_output;
     -- BIN_OP_OR[uxn_opcodes_h_l2583_c3_8f9e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2583_c3_8f9e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2583_c3_8f9e_left;
     BIN_OP_OR_uxn_opcodes_h_l2583_c3_8f9e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2583_c3_8f9e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2583_c3_8f9e_return_output := BIN_OP_OR_uxn_opcodes_h_l2583_c3_8f9e_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2586_c21_2654] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2586_c21_2654_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2586_c31_27d8_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2561_c3_eb6c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2561_c3_eb6c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2561_c3_eb6c_left;
     BIN_OP_OR_uxn_opcodes_h_l2561_c3_eb6c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2561_c3_eb6c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2561_c3_eb6c_return_output := BIN_OP_OR_uxn_opcodes_h_l2561_c3_eb6c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2573_c7_9db2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2570_c3_c858] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2570_c3_c858_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2570_c3_c858_left;
     BIN_OP_OR_uxn_opcodes_h_l2570_c3_c858_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2570_c3_c858_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2570_c3_c858_return_output := BIN_OP_OR_uxn_opcodes_h_l2570_c3_c858_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2602_c21_a563] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2602_c21_a563_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2602_c31_1e93_return_output);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2594_c21_5ca8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2594_c21_5ca8_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2594_c31_e280_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2604_c7_e5e2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_e5e2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_e5e2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_e5e2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_e5e2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_e5e2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_e5e2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_e5e2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_e5e2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2582_c7_56f0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_56f0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_56f0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2557_l2575_l2566_DUPLICATE_aced LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2557_l2575_l2566_DUPLICATE_aced_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2557_l2575_l2566_DUPLICATE_aced_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2557_l2575_l2566_DUPLICATE_aced_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2557_l2575_l2566_DUPLICATE_aced_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2604_c7_e5e2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_e5e2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_e5e2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_e5e2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_e5e2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_e5e2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_e5e2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_e5e2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_e5e2_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2547_c1_0cfb] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_0cfb_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_0cfb_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_0cfb_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_0cfb_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_0cfb_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_0cfb_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_0cfb_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_0cfb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2600_c7_5671] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_5671_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_5671_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_5671_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_5671_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_5671_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_5671_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_5671_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_5671_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2561_c3_eb6c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2570_c3_c858_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2583_c3_8f9e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2586_c21_2654_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_dfed_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2594_c21_5ca8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_5671_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2602_c21_a563_return_output;
     VAR_l16_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2557_l2575_l2566_DUPLICATE_aced_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2557_l2575_l2566_DUPLICATE_aced_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2557_l2575_l2566_DUPLICATE_aced_return_output;
     VAR_printf_uxn_opcodes_h_l2548_c3_b295_uxn_opcodes_h_l2548_c3_b295_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2547_c1_0cfb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_5671_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2604_c7_e5e2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_5671_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2604_c7_e5e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_741e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2600_c7_5671_return_output;
     -- l16_MUX[uxn_opcodes_h_l2582_c7_56f0] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2582_c7_56f0_cond <= VAR_l16_MUX_uxn_opcodes_h_l2582_c7_56f0_cond;
     l16_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue;
     l16_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output := l16_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2596_c7_741e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_741e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_741e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_741e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_741e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_741e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_741e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_741e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_741e_return_output;

     -- printf_uxn_opcodes_h_l2548_c3_b295[uxn_opcodes_h_l2548_c3_b295] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2548_c3_b295_uxn_opcodes_h_l2548_c3_b295_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2548_c3_b295_uxn_opcodes_h_l2548_c3_b295_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2569_c7_3dce] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2600_c7_5671] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_5671_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_5671_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_5671_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_5671_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_5671_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_5671_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_5671_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_5671_return_output;

     -- t16_MUX[uxn_opcodes_h_l2560_c7_faf2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2560_c7_faf2_cond <= VAR_t16_MUX_uxn_opcodes_h_l2560_c7_faf2_cond;
     t16_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue;
     t16_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output := t16_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2569_c7_3dce] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2569_c7_3dce_cond <= VAR_n16_MUX_uxn_opcodes_h_l2569_c7_3dce_cond;
     n16_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue;
     n16_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output := n16_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2600_c7_5671] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2600_c7_5671_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_5671_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2600_c7_5671_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_5671_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2600_c7_5671_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_5671_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_5671_return_output := result_u8_value_MUX_uxn_opcodes_h_l2600_c7_5671_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2573_c7_9db2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2600_c7_5671] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_5671_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_5671_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_5671_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_5671_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_5671_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_5671_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_5671_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_5671_return_output;

     -- Submodule level 3
     VAR_l16_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_741e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2600_c7_5671_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_741e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2600_c7_5671_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_dfed_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2596_c7_741e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_741e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2600_c7_5671_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2596_c7_741e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_741e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_741e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_741e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_741e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_741e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_741e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_741e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_741e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2592_c7_dfed] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_dfed_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_dfed_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_dfed_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_dfed_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_dfed_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_dfed_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_dfed_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_dfed_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2596_c7_741e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2596_c7_741e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_741e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2596_c7_741e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_741e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2596_c7_741e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_741e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_741e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2596_c7_741e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2596_c7_741e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_741e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_741e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_741e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_741e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_741e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_741e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_741e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_741e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2569_c7_3dce] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output;

     -- t16_MUX[uxn_opcodes_h_l2555_c7_611f] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2555_c7_611f_cond <= VAR_t16_MUX_uxn_opcodes_h_l2555_c7_611f_cond;
     t16_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue;
     t16_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2555_c7_611f_return_output := t16_MUX_uxn_opcodes_h_l2555_c7_611f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2564_c7_8422] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2564_c7_8422_cond <= VAR_n16_MUX_uxn_opcodes_h_l2564_c7_8422_cond;
     n16_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue;
     n16_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2564_c7_8422_return_output := n16_MUX_uxn_opcodes_h_l2564_c7_8422_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2564_c7_8422] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_8422_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_8422_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_8422_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_8422_return_output;

     -- l16_MUX[uxn_opcodes_h_l2573_c7_9db2] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2573_c7_9db2_cond <= VAR_l16_MUX_uxn_opcodes_h_l2573_c7_9db2_cond;
     l16_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue;
     l16_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output := l16_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output;

     -- Submodule level 4
     VAR_l16_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2564_c7_8422_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_dfed_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2596_c7_741e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_dfed_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2596_c7_741e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2564_c7_8422_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_ead7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2592_c7_dfed_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_dfed_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2596_c7_741e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2555_c7_611f_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2564_c7_8422] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_8422_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_8422_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_8422_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_8422_return_output;

     -- t16_MUX[uxn_opcodes_h_l2552_c7_c2a9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond <= VAR_t16_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond;
     t16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue;
     t16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output := t16_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output;

     -- l16_MUX[uxn_opcodes_h_l2569_c7_3dce] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2569_c7_3dce_cond <= VAR_l16_MUX_uxn_opcodes_h_l2569_c7_3dce_cond;
     l16_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue;
     l16_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output := l16_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2560_c7_faf2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2588_c7_ead7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_ead7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_ead7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_ead7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_ead7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_ead7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_ead7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_ead7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_ead7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2592_c7_dfed] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_dfed_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_dfed_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_dfed_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_dfed_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_dfed_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_dfed_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_dfed_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_dfed_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2592_c7_dfed] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_dfed_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_dfed_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_dfed_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_dfed_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_dfed_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_dfed_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_dfed_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_dfed_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2592_c7_dfed] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2592_c7_dfed_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_dfed_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2592_c7_dfed_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_dfed_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2592_c7_dfed_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_dfed_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_dfed_return_output := result_u8_value_MUX_uxn_opcodes_h_l2592_c7_dfed_return_output;

     -- n16_MUX[uxn_opcodes_h_l2560_c7_faf2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2560_c7_faf2_cond <= VAR_n16_MUX_uxn_opcodes_h_l2560_c7_faf2_cond;
     n16_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue;
     n16_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output := n16_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output;

     -- Submodule level 5
     VAR_l16_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_ead7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2592_c7_dfed_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2564_c7_8422_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_ead7_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2592_c7_dfed_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2588_c7_ead7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_ead7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2592_c7_dfed_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2588_c7_ead7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_ead7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_ead7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_ead7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_ead7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_ead7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_ead7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_ead7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_ead7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2588_c7_ead7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2588_c7_ead7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_ead7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2588_c7_ead7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_ead7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2588_c7_ead7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_ead7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_ead7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2588_c7_ead7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2588_c7_ead7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_ead7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_ead7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_ead7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_ead7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_ead7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_ead7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_ead7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_ead7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2582_c7_56f0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_56f0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_56f0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2555_c7_611f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_611f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_611f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_611f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_611f_return_output;

     -- n16_MUX[uxn_opcodes_h_l2555_c7_611f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2555_c7_611f_cond <= VAR_n16_MUX_uxn_opcodes_h_l2555_c7_611f_cond;
     n16_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue;
     n16_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2555_c7_611f_return_output := n16_MUX_uxn_opcodes_h_l2555_c7_611f_return_output;

     -- l16_MUX[uxn_opcodes_h_l2564_c7_8422] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2564_c7_8422_cond <= VAR_l16_MUX_uxn_opcodes_h_l2564_c7_8422_cond;
     l16_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue;
     l16_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2564_c7_8422_return_output := l16_MUX_uxn_opcodes_h_l2564_c7_8422_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2560_c7_faf2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output;

     -- t16_MUX[uxn_opcodes_h_l2547_c2_3511] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2547_c2_3511_cond <= VAR_t16_MUX_uxn_opcodes_h_l2547_c2_3511_cond;
     t16_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue;
     t16_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2547_c2_3511_return_output := t16_MUX_uxn_opcodes_h_l2547_c2_3511_return_output;

     -- Submodule level 6
     VAR_l16_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2564_c7_8422_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2555_c7_611f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2588_c7_ead7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2588_c7_ead7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2555_c7_611f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2588_c7_ead7_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2547_c2_3511_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2552_c7_c2a9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2555_c7_611f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_611f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_611f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_611f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_611f_return_output;

     -- l16_MUX[uxn_opcodes_h_l2560_c7_faf2] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2560_c7_faf2_cond <= VAR_l16_MUX_uxn_opcodes_h_l2560_c7_faf2_cond;
     l16_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue;
     l16_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output := l16_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2582_c7_56f0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_56f0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_56f0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2582_c7_56f0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_56f0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_56f0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output;

     -- n16_MUX[uxn_opcodes_h_l2552_c7_c2a9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond;
     n16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue;
     n16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output := n16_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2573_c7_9db2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_9db2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_9db2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2582_c7_56f0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2582_c7_56f0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_56f0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_56f0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_56f0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output;

     -- Submodule level 7
     VAR_l16_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2555_c7_611f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2582_c7_56f0_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2547_c2_3511] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_3511_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_3511_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_3511_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_3511_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2552_c7_c2a9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2573_c7_9db2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_9db2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_9db2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output;

     -- l16_MUX[uxn_opcodes_h_l2555_c7_611f] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2555_c7_611f_cond <= VAR_l16_MUX_uxn_opcodes_h_l2555_c7_611f_cond;
     l16_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue;
     l16_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2555_c7_611f_return_output := l16_MUX_uxn_opcodes_h_l2555_c7_611f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2573_c7_9db2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_9db2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_9db2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output;

     -- n16_MUX[uxn_opcodes_h_l2547_c2_3511] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2547_c2_3511_cond <= VAR_n16_MUX_uxn_opcodes_h_l2547_c2_3511_cond;
     n16_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue;
     n16_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2547_c2_3511_return_output := n16_MUX_uxn_opcodes_h_l2547_c2_3511_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2573_c7_9db2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2573_c7_9db2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2573_c7_9db2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2573_c7_9db2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2573_c7_9db2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2569_c7_3dce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_3dce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_3dce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output;

     -- Submodule level 8
     VAR_l16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2555_c7_611f_return_output;
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2547_c2_3511_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2573_c7_9db2_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2564_c7_8422] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_8422_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_8422_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_8422_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_8422_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2569_c7_3dce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_3dce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_3dce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2547_c2_3511] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_3511_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_3511_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_3511_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_3511_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2569_c7_3dce] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2569_c7_3dce_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_3dce_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output := result_u8_value_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2569_c7_3dce] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_3dce_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_3dce_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_3dce_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_3dce_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output;

     -- l16_MUX[uxn_opcodes_h_l2552_c7_c2a9] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond <= VAR_l16_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond;
     l16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue;
     l16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output := l16_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output;

     -- Submodule level 9
     VAR_l16_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse := VAR_l16_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2564_c7_8422_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2569_c7_3dce_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2564_c7_8422] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2564_c7_8422_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_8422_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_8422_return_output := result_u8_value_MUX_uxn_opcodes_h_l2564_c7_8422_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2560_c7_faf2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_faf2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_faf2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2564_c7_8422] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_8422_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_8422_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_8422_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_8422_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2564_c7_8422] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_8422_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_8422_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_8422_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_8422_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_8422_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_8422_return_output;

     -- l16_MUX[uxn_opcodes_h_l2547_c2_3511] LATENCY=0
     -- Inputs
     l16_MUX_uxn_opcodes_h_l2547_c2_3511_cond <= VAR_l16_MUX_uxn_opcodes_h_l2547_c2_3511_cond;
     l16_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue <= VAR_l16_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue;
     l16_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse <= VAR_l16_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse;
     -- Outputs
     VAR_l16_MUX_uxn_opcodes_h_l2547_c2_3511_return_output := l16_MUX_uxn_opcodes_h_l2547_c2_3511_return_output;

     -- Submodule level 10
     REG_VAR_l16 := VAR_l16_MUX_uxn_opcodes_h_l2547_c2_3511_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2564_c7_8422_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2564_c7_8422_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2564_c7_8422_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2560_c7_faf2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2560_c7_faf2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_faf2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2560_c7_faf2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_faf2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_faf2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2560_c7_faf2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_faf2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_faf2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_faf2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_faf2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2555_c7_611f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_611f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_611f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_611f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_611f_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2555_c7_611f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2560_c7_faf2_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2555_c7_611f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_611f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_611f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_611f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_611f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2552_c7_c2a9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2555_c7_611f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_611f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_611f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_611f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_611f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2555_c7_611f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2555_c7_611f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_611f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_611f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_611f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_611f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2555_c7_611f_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2555_c7_611f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2555_c7_611f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2555_c7_611f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2547_c2_3511] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_3511_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_3511_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_3511_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_3511_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2552_c7_c2a9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2552_c7_c2a9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2552_c7_c2a9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_c2a9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_c2a9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_c2a9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2552_c7_c2a9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2547_c2_3511] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2547_c2_3511_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_3511_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_3511_return_output := result_u8_value_MUX_uxn_opcodes_h_l2547_c2_3511_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2547_c2_3511] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_3511_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_3511_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_3511_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_3511_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2547_c2_3511] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_3511_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_3511_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_3511_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_3511_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_3511_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_3511_return_output;

     -- Submodule level 14
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2609_l2543_DUPLICATE_d4e4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2609_l2543_DUPLICATE_d4e4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8c29(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2547_c2_3511_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2547_c2_3511_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2547_c2_3511_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2547_c2_3511_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2547_c2_3511_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2547_c2_3511_return_output);

     -- Submodule level 15
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2609_l2543_DUPLICATE_d4e4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8c29_uxn_opcodes_h_l2609_l2543_DUPLICATE_d4e4_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_l16 <= REG_VAR_l16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     l16 <= REG_COMB_l16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
