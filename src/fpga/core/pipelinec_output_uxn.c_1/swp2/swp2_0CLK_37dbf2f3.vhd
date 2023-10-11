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
-- Submodules: 119
entity swp2_0CLK_37dbf2f3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end swp2_0CLK_37dbf2f3;
architecture arch of swp2_0CLK_37dbf2f3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2820_c6_211e]
signal BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2820_c1_b227]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_b227_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_b227_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_b227_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_b227_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2820_c2_1ac6]
signal n16_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2820_c2_1ac6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2820_c2_1ac6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2820_c2_1ac6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2820_c2_1ac6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2820_c2_1ac6]
signal result_stack_value_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2820_c2_1ac6]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2820_c2_1ac6]
signal t16_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l2821_c3_885a[uxn_opcodes_h_l2821_c3_885a]
signal printf_uxn_opcodes_h_l2821_c3_885a_uxn_opcodes_h_l2821_c3_885a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2825_c11_4043]
signal BIN_OP_EQ_uxn_opcodes_h_l2825_c11_4043_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2825_c11_4043_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2825_c11_4043_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2825_c7_9dcd]
signal n16_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2825_c7_9dcd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2825_c7_9dcd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2825_c7_9dcd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2825_c7_9dcd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2825_c7_9dcd]
signal result_stack_value_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2825_c7_9dcd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2825_c7_9dcd]
signal t16_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2828_c11_5150]
signal BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5150_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5150_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5150_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2828_c7_f562]
signal n16_MUX_uxn_opcodes_h_l2828_c7_f562_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2828_c7_f562_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2828_c7_f562]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_f562_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_f562_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2828_c7_f562]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_f562_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_f562_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2828_c7_f562]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_f562_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_f562_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2828_c7_f562]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_f562_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_f562_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2828_c7_f562]
signal result_stack_value_MUX_uxn_opcodes_h_l2828_c7_f562_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2828_c7_f562_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2828_c7_f562]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_f562_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_f562_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2828_c7_f562]
signal t16_MUX_uxn_opcodes_h_l2828_c7_f562_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2828_c7_f562_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2833_c11_f020]
signal BIN_OP_EQ_uxn_opcodes_h_l2833_c11_f020_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2833_c11_f020_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2833_c11_f020_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2833_c7_6bbb]
signal n16_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2833_c7_6bbb]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2833_c7_6bbb]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2833_c7_6bbb]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2833_c7_6bbb]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2833_c7_6bbb]
signal result_stack_value_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2833_c7_6bbb]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2833_c7_6bbb]
signal t16_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2836_c11_b81d]
signal BIN_OP_EQ_uxn_opcodes_h_l2836_c11_b81d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2836_c11_b81d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2836_c11_b81d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2836_c7_9b17]
signal n16_MUX_uxn_opcodes_h_l2836_c7_9b17_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2836_c7_9b17]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2836_c7_9b17_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2836_c7_9b17]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2836_c7_9b17_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2836_c7_9b17]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2836_c7_9b17]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2836_c7_9b17_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2836_c7_9b17]
signal result_stack_value_MUX_uxn_opcodes_h_l2836_c7_9b17_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2836_c7_9b17]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l2836_c7_9b17]
signal t16_MUX_uxn_opcodes_h_l2836_c7_9b17_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2837_c3_bb8a]
signal BIN_OP_OR_uxn_opcodes_h_l2837_c3_bb8a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2837_c3_bb8a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2837_c3_bb8a_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2840_c11_ef48]
signal BIN_OP_EQ_uxn_opcodes_h_l2840_c11_ef48_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2840_c11_ef48_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2840_c11_ef48_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2840_c7_938d]
signal n16_MUX_uxn_opcodes_h_l2840_c7_938d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2840_c7_938d_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2840_c7_938d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_938d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_938d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2840_c7_938d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_938d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_938d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2840_c7_938d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_938d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_938d_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2840_c7_938d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_938d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_938d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2840_c7_938d]
signal result_stack_value_MUX_uxn_opcodes_h_l2840_c7_938d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2840_c7_938d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2840_c7_938d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_938d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_938d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2843_c11_9b6d]
signal BIN_OP_EQ_uxn_opcodes_h_l2843_c11_9b6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2843_c11_9b6d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2843_c11_9b6d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2843_c7_5457]
signal n16_MUX_uxn_opcodes_h_l2843_c7_5457_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2843_c7_5457_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2843_c7_5457]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2843_c7_5457_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2843_c7_5457_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2843_c7_5457]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2843_c7_5457_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2843_c7_5457_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2843_c7_5457]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2843_c7_5457_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2843_c7_5457_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2843_c7_5457]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2843_c7_5457_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2843_c7_5457_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2843_c7_5457]
signal result_stack_value_MUX_uxn_opcodes_h_l2843_c7_5457_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2843_c7_5457_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2843_c7_5457]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2843_c7_5457_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2843_c7_5457_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2848_c11_8dfe]
signal BIN_OP_EQ_uxn_opcodes_h_l2848_c11_8dfe_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2848_c11_8dfe_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2848_c11_8dfe_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2848_c7_8e52]
signal n16_MUX_uxn_opcodes_h_l2848_c7_8e52_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2848_c7_8e52]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_8e52_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2848_c7_8e52]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_8e52_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2848_c7_8e52]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2848_c7_8e52]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_8e52_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2848_c7_8e52]
signal result_stack_value_MUX_uxn_opcodes_h_l2848_c7_8e52_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2848_c7_8e52]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2851_c11_18fd]
signal BIN_OP_EQ_uxn_opcodes_h_l2851_c11_18fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2851_c11_18fd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2851_c11_18fd_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2851_c7_b02e]
signal n16_MUX_uxn_opcodes_h_l2851_c7_b02e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output : unsigned(15 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2851_c7_b02e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2851_c7_b02e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2851_c7_b02e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2851_c7_b02e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2851_c7_b02e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2851_c7_b02e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2851_c7_b02e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2851_c7_b02e]
signal result_stack_value_MUX_uxn_opcodes_h_l2851_c7_b02e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2851_c7_b02e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2852_c3_9c4f]
signal BIN_OP_OR_uxn_opcodes_h_l2852_c3_9c4f_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2852_c3_9c4f_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2852_c3_9c4f_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2854_c32_9c10]
signal BIN_OP_AND_uxn_opcodes_h_l2854_c32_9c10_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2854_c32_9c10_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2854_c32_9c10_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l2854_c32_672d]
signal BIN_OP_GT_uxn_opcodes_h_l2854_c32_672d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2854_c32_672d_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l2854_c32_672d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l2854_c32_d667]
signal MUX_uxn_opcodes_h_l2854_c32_d667_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l2854_c32_d667_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2854_c32_d667_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l2854_c32_d667_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2856_c11_92b1]
signal BIN_OP_EQ_uxn_opcodes_h_l2856_c11_92b1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2856_c11_92b1_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2856_c11_92b1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2856_c7_39d2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2856_c7_39d2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2856_c7_39d2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2856_c7_39d2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2856_c7_39d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2856_c7_39d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2856_c7_39d2]
signal result_stack_value_MUX_uxn_opcodes_h_l2856_c7_39d2_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2856_c7_39d2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2856_c7_39d2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2862_c11_56be]
signal BIN_OP_EQ_uxn_opcodes_h_l2862_c11_56be_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2862_c11_56be_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2862_c11_56be_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2862_c7_2c93]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_2c93_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2862_c7_2c93]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_2c93_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2862_c7_2c93]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_2c93_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2862_c7_2c93]
signal result_stack_value_MUX_uxn_opcodes_h_l2862_c7_2c93_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2862_c7_2c93]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_2c93_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2864_c34_8ead]
signal CONST_SR_8_uxn_opcodes_h_l2864_c34_8ead_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2864_c34_8ead_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2866_c11_ffbd]
signal BIN_OP_EQ_uxn_opcodes_h_l2866_c11_ffbd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2866_c11_ffbd_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2866_c11_ffbd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2866_c7_d27d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_d27d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2866_c7_d27d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_d27d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2866_c7_d27d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_d27d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2866_c7_d27d]
signal result_stack_value_MUX_uxn_opcodes_h_l2866_c7_d27d_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l2866_c7_d27d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_d27d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2871_c11_b304]
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c11_b304_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c11_b304_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2871_c11_b304_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2871_c7_e2dd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_e2dd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_e2dd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_e2dd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_e2dd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2871_c7_e2dd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_e2dd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_e2dd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_e2dd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_e2dd_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l2871_c7_e2dd]
signal result_stack_value_MUX_uxn_opcodes_h_l2871_c7_e2dd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2871_c7_e2dd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2871_c7_e2dd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l2871_c7_e2dd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2871_c7_e2dd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_e2dd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_e2dd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_e2dd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_e2dd_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2873_c34_5e45]
signal CONST_SR_8_uxn_opcodes_h_l2873_c34_5e45_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2873_c34_5e45_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_0ca4]
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0ca4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0ca4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0ca4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2875_c7_8aa0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_8aa0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_8aa0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_8aa0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_8aa0_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2875_c7_8aa0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_8aa0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_8aa0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_8aa0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_8aa0_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2845_l2830_DUPLICATE_d6c3
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2845_l2830_DUPLICATE_d6c3_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2845_l2830_DUPLICATE_d6c3_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e
BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e_left,
BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e_right,
BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_b227
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_b227 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_b227_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_b227_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_b227_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_b227_return_output);

-- n16_MUX_uxn_opcodes_h_l2820_c2_1ac6
n16_MUX_uxn_opcodes_h_l2820_c2_1ac6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond,
n16_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue,
n16_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse,
n16_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_1ac6
result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_1ac6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_1ac6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_1ac6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_1ac6
result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_1ac6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2820_c2_1ac6
result_stack_value_MUX_uxn_opcodes_h_l2820_c2_1ac6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond,
result_stack_value_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6
result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output);

-- t16_MUX_uxn_opcodes_h_l2820_c2_1ac6
t16_MUX_uxn_opcodes_h_l2820_c2_1ac6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond,
t16_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue,
t16_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse,
t16_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output);

-- printf_uxn_opcodes_h_l2821_c3_885a_uxn_opcodes_h_l2821_c3_885a
printf_uxn_opcodes_h_l2821_c3_885a_uxn_opcodes_h_l2821_c3_885a : entity work.printf_uxn_opcodes_h_l2821_c3_885a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l2821_c3_885a_uxn_opcodes_h_l2821_c3_885a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l2825_c11_4043
BIN_OP_EQ_uxn_opcodes_h_l2825_c11_4043 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2825_c11_4043_left,
BIN_OP_EQ_uxn_opcodes_h_l2825_c11_4043_right,
BIN_OP_EQ_uxn_opcodes_h_l2825_c11_4043_return_output);

-- n16_MUX_uxn_opcodes_h_l2825_c7_9dcd
n16_MUX_uxn_opcodes_h_l2825_c7_9dcd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond,
n16_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue,
n16_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse,
n16_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_9dcd
result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_9dcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_9dcd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_9dcd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_9dcd
result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_9dcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2825_c7_9dcd
result_stack_value_MUX_uxn_opcodes_h_l2825_c7_9dcd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond,
result_stack_value_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd
result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output);

-- t16_MUX_uxn_opcodes_h_l2825_c7_9dcd
t16_MUX_uxn_opcodes_h_l2825_c7_9dcd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond,
t16_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue,
t16_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse,
t16_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5150
BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5150 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5150_left,
BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5150_right,
BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5150_return_output);

-- n16_MUX_uxn_opcodes_h_l2828_c7_f562
n16_MUX_uxn_opcodes_h_l2828_c7_f562 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2828_c7_f562_cond,
n16_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue,
n16_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse,
n16_MUX_uxn_opcodes_h_l2828_c7_f562_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_f562
result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_f562 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_f562_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_f562_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_f562
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_f562 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_f562_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_f562_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_f562
result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_f562 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_f562_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_f562_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_f562
result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_f562 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_f562_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_f562_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2828_c7_f562
result_stack_value_MUX_uxn_opcodes_h_l2828_c7_f562 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2828_c7_f562_cond,
result_stack_value_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2828_c7_f562_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_f562
result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_f562 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_f562_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_f562_return_output);

-- t16_MUX_uxn_opcodes_h_l2828_c7_f562
t16_MUX_uxn_opcodes_h_l2828_c7_f562 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2828_c7_f562_cond,
t16_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue,
t16_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse,
t16_MUX_uxn_opcodes_h_l2828_c7_f562_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2833_c11_f020
BIN_OP_EQ_uxn_opcodes_h_l2833_c11_f020 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2833_c11_f020_left,
BIN_OP_EQ_uxn_opcodes_h_l2833_c11_f020_right,
BIN_OP_EQ_uxn_opcodes_h_l2833_c11_f020_return_output);

-- n16_MUX_uxn_opcodes_h_l2833_c7_6bbb
n16_MUX_uxn_opcodes_h_l2833_c7_6bbb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond,
n16_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue,
n16_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse,
n16_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_6bbb
result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_6bbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_6bbb
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_6bbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb
result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_6bbb
result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_6bbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2833_c7_6bbb
result_stack_value_MUX_uxn_opcodes_h_l2833_c7_6bbb : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond,
result_stack_value_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb
result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output);

-- t16_MUX_uxn_opcodes_h_l2833_c7_6bbb
t16_MUX_uxn_opcodes_h_l2833_c7_6bbb : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond,
t16_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue,
t16_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse,
t16_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2836_c11_b81d
BIN_OP_EQ_uxn_opcodes_h_l2836_c11_b81d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2836_c11_b81d_left,
BIN_OP_EQ_uxn_opcodes_h_l2836_c11_b81d_right,
BIN_OP_EQ_uxn_opcodes_h_l2836_c11_b81d_return_output);

-- n16_MUX_uxn_opcodes_h_l2836_c7_9b17
n16_MUX_uxn_opcodes_h_l2836_c7_9b17 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2836_c7_9b17_cond,
n16_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue,
n16_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse,
n16_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2836_c7_9b17
result_is_stack_write_MUX_uxn_opcodes_h_l2836_c7_9b17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2836_c7_9b17_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2836_c7_9b17
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2836_c7_9b17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2836_c7_9b17_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2836_c7_9b17
result_sp_relative_shift_MUX_uxn_opcodes_h_l2836_c7_9b17 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2836_c7_9b17
result_is_opc_done_MUX_uxn_opcodes_h_l2836_c7_9b17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2836_c7_9b17_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2836_c7_9b17
result_stack_value_MUX_uxn_opcodes_h_l2836_c7_9b17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2836_c7_9b17_cond,
result_stack_value_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2836_c7_9b17
result_is_sp_shift_MUX_uxn_opcodes_h_l2836_c7_9b17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output);

-- t16_MUX_uxn_opcodes_h_l2836_c7_9b17
t16_MUX_uxn_opcodes_h_l2836_c7_9b17 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2836_c7_9b17_cond,
t16_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue,
t16_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse,
t16_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2837_c3_bb8a
BIN_OP_OR_uxn_opcodes_h_l2837_c3_bb8a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2837_c3_bb8a_left,
BIN_OP_OR_uxn_opcodes_h_l2837_c3_bb8a_right,
BIN_OP_OR_uxn_opcodes_h_l2837_c3_bb8a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2840_c11_ef48
BIN_OP_EQ_uxn_opcodes_h_l2840_c11_ef48 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2840_c11_ef48_left,
BIN_OP_EQ_uxn_opcodes_h_l2840_c11_ef48_right,
BIN_OP_EQ_uxn_opcodes_h_l2840_c11_ef48_return_output);

-- n16_MUX_uxn_opcodes_h_l2840_c7_938d
n16_MUX_uxn_opcodes_h_l2840_c7_938d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2840_c7_938d_cond,
n16_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue,
n16_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse,
n16_MUX_uxn_opcodes_h_l2840_c7_938d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_938d
result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_938d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_938d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_938d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_938d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_938d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_938d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_938d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_938d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_938d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_938d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_938d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_938d
result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_938d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_938d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_938d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2840_c7_938d
result_stack_value_MUX_uxn_opcodes_h_l2840_c7_938d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2840_c7_938d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2840_c7_938d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_938d
result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_938d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_938d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_938d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2843_c11_9b6d
BIN_OP_EQ_uxn_opcodes_h_l2843_c11_9b6d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2843_c11_9b6d_left,
BIN_OP_EQ_uxn_opcodes_h_l2843_c11_9b6d_right,
BIN_OP_EQ_uxn_opcodes_h_l2843_c11_9b6d_return_output);

-- n16_MUX_uxn_opcodes_h_l2843_c7_5457
n16_MUX_uxn_opcodes_h_l2843_c7_5457 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2843_c7_5457_cond,
n16_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue,
n16_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse,
n16_MUX_uxn_opcodes_h_l2843_c7_5457_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2843_c7_5457
result_is_stack_write_MUX_uxn_opcodes_h_l2843_c7_5457 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2843_c7_5457_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2843_c7_5457_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2843_c7_5457
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2843_c7_5457 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2843_c7_5457_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2843_c7_5457_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2843_c7_5457
result_sp_relative_shift_MUX_uxn_opcodes_h_l2843_c7_5457 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2843_c7_5457_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2843_c7_5457_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2843_c7_5457
result_is_opc_done_MUX_uxn_opcodes_h_l2843_c7_5457 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2843_c7_5457_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2843_c7_5457_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2843_c7_5457
result_stack_value_MUX_uxn_opcodes_h_l2843_c7_5457 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2843_c7_5457_cond,
result_stack_value_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2843_c7_5457_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2843_c7_5457
result_is_sp_shift_MUX_uxn_opcodes_h_l2843_c7_5457 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2843_c7_5457_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2843_c7_5457_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2848_c11_8dfe
BIN_OP_EQ_uxn_opcodes_h_l2848_c11_8dfe : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2848_c11_8dfe_left,
BIN_OP_EQ_uxn_opcodes_h_l2848_c11_8dfe_right,
BIN_OP_EQ_uxn_opcodes_h_l2848_c11_8dfe_return_output);

-- n16_MUX_uxn_opcodes_h_l2848_c7_8e52
n16_MUX_uxn_opcodes_h_l2848_c7_8e52 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2848_c7_8e52_cond,
n16_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue,
n16_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse,
n16_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_8e52
result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_8e52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_8e52_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_8e52
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_8e52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_8e52_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2848_c7_8e52
result_sp_relative_shift_MUX_uxn_opcodes_h_l2848_c7_8e52 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_8e52
result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_8e52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_8e52_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2848_c7_8e52
result_stack_value_MUX_uxn_opcodes_h_l2848_c7_8e52 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2848_c7_8e52_cond,
result_stack_value_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_8e52
result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_8e52 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2851_c11_18fd
BIN_OP_EQ_uxn_opcodes_h_l2851_c11_18fd : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2851_c11_18fd_left,
BIN_OP_EQ_uxn_opcodes_h_l2851_c11_18fd_right,
BIN_OP_EQ_uxn_opcodes_h_l2851_c11_18fd_return_output);

-- n16_MUX_uxn_opcodes_h_l2851_c7_b02e
n16_MUX_uxn_opcodes_h_l2851_c7_b02e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2851_c7_b02e_cond,
n16_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue,
n16_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse,
n16_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2851_c7_b02e
result_is_stack_write_MUX_uxn_opcodes_h_l2851_c7_b02e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2851_c7_b02e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2851_c7_b02e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2851_c7_b02e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2851_c7_b02e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2851_c7_b02e
result_sp_relative_shift_MUX_uxn_opcodes_h_l2851_c7_b02e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2851_c7_b02e
result_is_opc_done_MUX_uxn_opcodes_h_l2851_c7_b02e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2851_c7_b02e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2851_c7_b02e
result_stack_value_MUX_uxn_opcodes_h_l2851_c7_b02e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2851_c7_b02e_cond,
result_stack_value_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2851_c7_b02e
result_is_sp_shift_MUX_uxn_opcodes_h_l2851_c7_b02e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2852_c3_9c4f
BIN_OP_OR_uxn_opcodes_h_l2852_c3_9c4f : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2852_c3_9c4f_left,
BIN_OP_OR_uxn_opcodes_h_l2852_c3_9c4f_right,
BIN_OP_OR_uxn_opcodes_h_l2852_c3_9c4f_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2854_c32_9c10
BIN_OP_AND_uxn_opcodes_h_l2854_c32_9c10 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2854_c32_9c10_left,
BIN_OP_AND_uxn_opcodes_h_l2854_c32_9c10_right,
BIN_OP_AND_uxn_opcodes_h_l2854_c32_9c10_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l2854_c32_672d
BIN_OP_GT_uxn_opcodes_h_l2854_c32_672d : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l2854_c32_672d_left,
BIN_OP_GT_uxn_opcodes_h_l2854_c32_672d_right,
BIN_OP_GT_uxn_opcodes_h_l2854_c32_672d_return_output);

-- MUX_uxn_opcodes_h_l2854_c32_d667
MUX_uxn_opcodes_h_l2854_c32_d667 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l2854_c32_d667_cond,
MUX_uxn_opcodes_h_l2854_c32_d667_iftrue,
MUX_uxn_opcodes_h_l2854_c32_d667_iffalse,
MUX_uxn_opcodes_h_l2854_c32_d667_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2856_c11_92b1
BIN_OP_EQ_uxn_opcodes_h_l2856_c11_92b1 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2856_c11_92b1_left,
BIN_OP_EQ_uxn_opcodes_h_l2856_c11_92b1_right,
BIN_OP_EQ_uxn_opcodes_h_l2856_c11_92b1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2856_c7_39d2
result_is_stack_write_MUX_uxn_opcodes_h_l2856_c7_39d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2856_c7_39d2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2856_c7_39d2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2856_c7_39d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2856_c7_39d2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2856_c7_39d2
result_is_opc_done_MUX_uxn_opcodes_h_l2856_c7_39d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2856_c7_39d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2856_c7_39d2
result_stack_value_MUX_uxn_opcodes_h_l2856_c7_39d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2856_c7_39d2_cond,
result_stack_value_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2856_c7_39d2
result_is_sp_shift_MUX_uxn_opcodes_h_l2856_c7_39d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2856_c7_39d2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2862_c11_56be
BIN_OP_EQ_uxn_opcodes_h_l2862_c11_56be : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2862_c11_56be_left,
BIN_OP_EQ_uxn_opcodes_h_l2862_c11_56be_right,
BIN_OP_EQ_uxn_opcodes_h_l2862_c11_56be_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_2c93
result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_2c93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_2c93_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_2c93
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_2c93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_2c93_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_2c93
result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_2c93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_2c93_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2862_c7_2c93
result_stack_value_MUX_uxn_opcodes_h_l2862_c7_2c93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2862_c7_2c93_cond,
result_stack_value_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_2c93
result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_2c93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_2c93_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2864_c34_8ead
CONST_SR_8_uxn_opcodes_h_l2864_c34_8ead : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2864_c34_8ead_x,
CONST_SR_8_uxn_opcodes_h_l2864_c34_8ead_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2866_c11_ffbd
BIN_OP_EQ_uxn_opcodes_h_l2866_c11_ffbd : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2866_c11_ffbd_left,
BIN_OP_EQ_uxn_opcodes_h_l2866_c11_ffbd_right,
BIN_OP_EQ_uxn_opcodes_h_l2866_c11_ffbd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_d27d
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_d27d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_d27d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_d27d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_d27d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_d27d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_d27d
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_d27d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_d27d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2866_c7_d27d
result_stack_value_MUX_uxn_opcodes_h_l2866_c7_d27d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2866_c7_d27d_cond,
result_stack_value_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_d27d
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_d27d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_d27d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2871_c11_b304
BIN_OP_EQ_uxn_opcodes_h_l2871_c11_b304 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2871_c11_b304_left,
BIN_OP_EQ_uxn_opcodes_h_l2871_c11_b304_right,
BIN_OP_EQ_uxn_opcodes_h_l2871_c11_b304_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_e2dd
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_e2dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_e2dd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_e2dd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_e2dd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_e2dd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_e2dd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_e2dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_e2dd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_e2dd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_e2dd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_e2dd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l2871_c7_e2dd
result_stack_value_MUX_uxn_opcodes_h_l2871_c7_e2dd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l2871_c7_e2dd_cond,
result_stack_value_MUX_uxn_opcodes_h_l2871_c7_e2dd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l2871_c7_e2dd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l2871_c7_e2dd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_e2dd
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_e2dd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_e2dd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_e2dd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_e2dd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_e2dd_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2873_c34_5e45
CONST_SR_8_uxn_opcodes_h_l2873_c34_5e45 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2873_c34_5e45_x,
CONST_SR_8_uxn_opcodes_h_l2873_c34_5e45_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0ca4
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0ca4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0ca4_left,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0ca4_right,
BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0ca4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_8aa0
result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_8aa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_8aa0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_8aa0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_8aa0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_8aa0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_8aa0
result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_8aa0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_8aa0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_8aa0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_8aa0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_8aa0_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2845_l2830_DUPLICATE_d6c3
CONST_SL_8_uint16_t_uxn_opcodes_h_l2845_l2830_DUPLICATE_d6c3 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2845_l2830_DUPLICATE_d6c3_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2845_l2830_DUPLICATE_d6c3_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_b227_return_output,
 n16_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output,
 t16_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2825_c11_4043_return_output,
 n16_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output,
 t16_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5150_return_output,
 n16_MUX_uxn_opcodes_h_l2828_c7_f562_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_f562_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_f562_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_f562_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_f562_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2828_c7_f562_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_f562_return_output,
 t16_MUX_uxn_opcodes_h_l2828_c7_f562_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2833_c11_f020_return_output,
 n16_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output,
 t16_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2836_c11_b81d_return_output,
 n16_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output,
 t16_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2837_c3_bb8a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2840_c11_ef48_return_output,
 n16_MUX_uxn_opcodes_h_l2840_c7_938d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_938d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_938d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_938d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_938d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2840_c7_938d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_938d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2843_c11_9b6d_return_output,
 n16_MUX_uxn_opcodes_h_l2843_c7_5457_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2843_c7_5457_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2843_c7_5457_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2843_c7_5457_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2843_c7_5457_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2843_c7_5457_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2843_c7_5457_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2848_c11_8dfe_return_output,
 n16_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2851_c11_18fd_return_output,
 n16_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2852_c3_9c4f_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2854_c32_9c10_return_output,
 BIN_OP_GT_uxn_opcodes_h_l2854_c32_672d_return_output,
 MUX_uxn_opcodes_h_l2854_c32_d667_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2856_c11_92b1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2862_c11_56be_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output,
 CONST_SR_8_uxn_opcodes_h_l2864_c34_8ead_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2866_c11_ffbd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2871_c11_b304_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_e2dd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_e2dd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l2871_c7_e2dd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_e2dd_return_output,
 CONST_SR_8_uxn_opcodes_h_l2873_c34_5e45_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0ca4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_8aa0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_8aa0_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2845_l2830_DUPLICATE_d6c3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_b227_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_b227_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_b227_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_b227_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2822_c3_b5ec : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l2821_c3_885a_uxn_opcodes_h_l2821_c3_885a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_4043_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_4043_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_4043_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2828_c7_f562_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_f562_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2826_c3_e9eb : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_f562_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_f562_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_f562_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2828_c7_f562_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_f562_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2828_c7_f562_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5150_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5150_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5150_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2828_c7_f562_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_f562_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2831_c3_b03a : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_f562_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_f562_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_f562_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2828_c7_f562_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_f562_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2828_c7_f562_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_f020_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_f020_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_f020_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2834_c3_1177 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_b81d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_b81d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_b81d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2840_c7_938d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2836_c7_9b17_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_938d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2836_c7_9b17_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2838_c3_e8af : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_938d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2836_c7_9b17_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_938d_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_938d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2836_c7_9b17_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_938d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2836_c7_9b17_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_938d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2836_c7_9b17_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2837_c3_bb8a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2837_c3_bb8a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2837_c3_bb8a_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_ef48_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_ef48_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_ef48_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2843_c7_5457_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2840_c7_938d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2843_c7_5457_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_938d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2841_c3_932f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2843_c7_5457_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_938d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2843_c7_5457_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_938d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2843_c7_5457_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_938d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2843_c7_5457_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_938d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2843_c7_5457_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_938d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_9b6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_9b6d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_9b6d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2843_c7_5457_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2843_c7_5457_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2846_c3_9fb0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2843_c7_5457_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2843_c7_5457_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2843_c7_5457_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2843_c7_5457_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2843_c7_5457_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_8dfe_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_8dfe_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_8dfe_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2848_c7_8e52_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_8e52_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2849_c3_7ab8 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_8e52_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_8e52_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2848_c7_8e52_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_18fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_18fd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_18fd_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2851_c7_b02e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2851_c7_b02e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2851_c7_b02e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2851_c7_b02e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2851_c7_b02e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2852_c3_9c4f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2852_c3_9c4f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2852_c3_9c4f_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2854_c32_d667_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2854_c32_d667_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2854_c32_d667_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2854_c32_9c10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2854_c32_9c10_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2854_c32_9c10_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2854_c32_672d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2854_c32_672d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l2854_c32_672d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l2854_c32_d667_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_92b1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_92b1_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_92b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2856_c7_39d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2859_c3_96ba : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2856_c7_39d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2856_c7_39d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2856_c7_39d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2856_c7_39d2_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2860_c24_8ce9_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_56be_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_56be_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_56be_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_2c93_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2863_c3_215c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_2c93_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_2c93_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2862_c7_2c93_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_2c93_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2864_c34_8ead_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2864_c34_8ead_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2864_c24_28c4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_ffbd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_ffbd_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_ffbd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_e2dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_d27d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2868_c3_7764 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_e2dd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_d27d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_e2dd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_d27d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_e2dd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_d27d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_d27d_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2869_c24_79de_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_b304_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_b304_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_b304_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_e2dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_e2dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_8aa0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_e2dd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_e2dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2872_c3_a8d9 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_e2dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_e2dd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_e2dd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_e2dd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_e2dd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_e2dd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_e2dd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_8aa0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_e2dd_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2873_c34_5e45_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2873_c34_5e45_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2873_c24_ca1b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0ca4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0ca4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0ca4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_8aa0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_8aa0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_8aa0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_8aa0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_8aa0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_8aa0_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2828_l2851_l2825_l2848_l2875_l2820_l2843_DUPLICATE_c321_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2840_l2836_l2833_l2828_l2851_l2825_l2848_l2820_l2843_DUPLICATE_b209_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2871_l2840_l2836_l2833_l2828_l2851_l2825_l2848_l2820_l2843_DUPLICATE_2df1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2840_l2866_l2836_l2862_l2833_l2828_l2825_l2848_l2820_l2843_DUPLICATE_a944_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2856_l2828_l2851_l2825_l2848_l2875_l2843_DUPLICATE_3e05_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2829_l2852_l2837_l2844_DUPLICATE_2381_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2845_l2830_DUPLICATE_d6c3_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2845_l2830_DUPLICATE_d6c3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2871_l2851_DUPLICATE_1b02_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2880_l2816_DUPLICATE_db3d_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_8dfe_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2868_c3_7764 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2868_c3_7764;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2846_c3_9fb0 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2846_c3_9fb0;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2831_c3_b03a := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2831_c3_b03a;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_f020_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2859_c3_96ba := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2859_c3_96ba;
     VAR_MUX_uxn_opcodes_h_l2854_c32_d667_iftrue := signed(std_logic_vector(resize(to_unsigned(4, 3), 8)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_b227_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_18fd_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_ef48_right := to_unsigned(5, 3);
     VAR_MUX_uxn_opcodes_h_l2854_c32_d667_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2872_c3_a8d9 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_e2dd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2872_c3_a8d9;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_92b1_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2863_c3_215c := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2863_c3_215c;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2822_c3_b5ec := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2822_c3_b5ec;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2826_c3_e9eb := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2826_c3_e9eb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_4043_right := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2854_c32_9c10_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_56be_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2841_c3_932f := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2841_c3_932f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_b81d_right := to_unsigned(4, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_8aa0_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2849_c3_7ab8 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2849_c3_7ab8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_b304_right := to_unsigned(12, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_8aa0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0ca4_right := to_unsigned(13, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_9b6d_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5150_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2838_c3_e8af := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2838_c3_e8af;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_ffbd_right := to_unsigned(11, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l2854_c32_672d_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2834_c3_1177 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2834_c3_1177;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_b227_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2854_c32_9c10_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2852_c3_9c4f_left := n16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2864_c34_8ead_x := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_4043_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5150_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_f020_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_b81d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_ef48_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_9b6d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_8dfe_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_18fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_92b1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_56be_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_ffbd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_b304_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0ca4_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2837_c3_bb8a_left := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2873_c34_5e45_x := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2848_c11_8dfe] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2848_c11_8dfe_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_8dfe_left;
     BIN_OP_EQ_uxn_opcodes_h_l2848_c11_8dfe_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_8dfe_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_8dfe_return_output := BIN_OP_EQ_uxn_opcodes_h_l2848_c11_8dfe_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2825_c11_4043] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2825_c11_4043_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_4043_left;
     BIN_OP_EQ_uxn_opcodes_h_l2825_c11_4043_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_4043_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_4043_return_output := BIN_OP_EQ_uxn_opcodes_h_l2825_c11_4043_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2820_c6_211e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2851_c11_18fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2851_c11_18fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_18fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2851_c11_18fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_18fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_18fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2851_c11_18fd_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2871_l2851_DUPLICATE_1b02 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2871_l2851_DUPLICATE_1b02_return_output := result.stack_address_sp_offset;

     -- CONST_SR_8[uxn_opcodes_h_l2873_c34_5e45] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2873_c34_5e45_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2873_c34_5e45_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2873_c34_5e45_return_output := CONST_SR_8_uxn_opcodes_h_l2873_c34_5e45_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2875_c11_0ca4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0ca4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0ca4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0ca4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0ca4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0ca4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0ca4_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l2854_c32_9c10] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2854_c32_9c10_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2854_c32_9c10_left;
     BIN_OP_AND_uxn_opcodes_h_l2854_c32_9c10_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2854_c32_9c10_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2854_c32_9c10_return_output := BIN_OP_AND_uxn_opcodes_h_l2854_c32_9c10_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2829_l2852_l2837_l2844_DUPLICATE_2381 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2829_l2852_l2837_l2844_DUPLICATE_2381_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2869_c24_79de] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2869_c24_79de_return_output := CAST_TO_uint8_t_uint16_t(
     t16);

     -- BIN_OP_EQ[uxn_opcodes_h_l2866_c11_ffbd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2866_c11_ffbd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_ffbd_left;
     BIN_OP_EQ_uxn_opcodes_h_l2866_c11_ffbd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_ffbd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_ffbd_return_output := BIN_OP_EQ_uxn_opcodes_h_l2866_c11_ffbd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2856_l2828_l2851_l2825_l2848_l2875_l2843_DUPLICATE_3e05 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2856_l2828_l2851_l2825_l2848_l2875_l2843_DUPLICATE_3e05_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2871_c11_b304] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2871_c11_b304_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_b304_left;
     BIN_OP_EQ_uxn_opcodes_h_l2871_c11_b304_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_b304_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_b304_return_output := BIN_OP_EQ_uxn_opcodes_h_l2871_c11_b304_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2840_c11_ef48] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2840_c11_ef48_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_ef48_left;
     BIN_OP_EQ_uxn_opcodes_h_l2840_c11_ef48_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_ef48_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_ef48_return_output := BIN_OP_EQ_uxn_opcodes_h_l2840_c11_ef48_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2843_c11_9b6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2843_c11_9b6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_9b6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2843_c11_9b6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_9b6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_9b6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2843_c11_9b6d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2833_c11_f020] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2833_c11_f020_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_f020_left;
     BIN_OP_EQ_uxn_opcodes_h_l2833_c11_f020_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_f020_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_f020_return_output := BIN_OP_EQ_uxn_opcodes_h_l2833_c11_f020_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2871_l2840_l2836_l2833_l2828_l2851_l2825_l2848_l2820_l2843_DUPLICATE_2df1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2871_l2840_l2836_l2833_l2828_l2851_l2825_l2848_l2820_l2843_DUPLICATE_2df1_return_output := result.stack_value;

     -- CONST_SR_8[uxn_opcodes_h_l2864_c34_8ead] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2864_c34_8ead_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2864_c34_8ead_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2864_c34_8ead_return_output := CONST_SR_8_uxn_opcodes_h_l2864_c34_8ead_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2856_c11_92b1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2856_c11_92b1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_92b1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2856_c11_92b1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_92b1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_92b1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2856_c11_92b1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2836_c11_b81d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2836_c11_b81d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_b81d_left;
     BIN_OP_EQ_uxn_opcodes_h_l2836_c11_b81d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_b81d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_b81d_return_output := BIN_OP_EQ_uxn_opcodes_h_l2836_c11_b81d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2828_l2851_l2825_l2848_l2875_l2820_l2843_DUPLICATE_c321 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2828_l2851_l2825_l2848_l2875_l2820_l2843_DUPLICATE_c321_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2840_l2866_l2836_l2862_l2833_l2828_l2825_l2848_l2820_l2843_DUPLICATE_a944 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2840_l2866_l2836_l2862_l2833_l2828_l2825_l2848_l2820_l2843_DUPLICATE_a944_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2828_c11_5150] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5150_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5150_left;
     BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5150_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5150_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5150_return_output := BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5150_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2840_l2836_l2833_l2828_l2851_l2825_l2848_l2820_l2843_DUPLICATE_b209 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2840_l2836_l2833_l2828_l2851_l2825_l2848_l2820_l2843_DUPLICATE_b209_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2862_c11_56be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2862_c11_56be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_56be_left;
     BIN_OP_EQ_uxn_opcodes_h_l2862_c11_56be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_56be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_56be_return_output := BIN_OP_EQ_uxn_opcodes_h_l2862_c11_56be_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2860_c24_8ce9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2860_c24_8ce9_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l2854_c32_672d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l2854_c32_9c10_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_b227_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2820_c6_211e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_4043_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_4043_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_4043_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_4043_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_4043_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_4043_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_4043_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2825_c11_4043_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2828_c7_f562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5150_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_f562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5150_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_f562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5150_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_f562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5150_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_f562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5150_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_f562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5150_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2828_c7_f562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5150_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2828_c7_f562_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2828_c11_5150_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_f020_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_f020_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_f020_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_f020_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_f020_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_f020_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_f020_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2833_c11_f020_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2836_c7_9b17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_b81d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2836_c7_9b17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_b81d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_b81d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2836_c7_9b17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_b81d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_b81d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2836_c7_9b17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_b81d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2836_c7_9b17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_b81d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2836_c7_9b17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2836_c11_b81d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2840_c7_938d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_ef48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_938d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_ef48_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_938d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_ef48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_938d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_ef48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_938d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_ef48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_938d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_ef48_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_938d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2840_c11_ef48_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2843_c7_5457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_9b6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2843_c7_5457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_9b6d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2843_c7_5457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_9b6d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2843_c7_5457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_9b6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2843_c7_5457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_9b6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2843_c7_5457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_9b6d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2843_c7_5457_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2843_c11_9b6d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2848_c7_8e52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_8dfe_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_8e52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_8dfe_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_8dfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_8e52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_8dfe_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_8dfe_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_8e52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_8dfe_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2848_c7_8e52_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2848_c11_8dfe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2851_c7_b02e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_18fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2851_c7_b02e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_18fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_18fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2851_c7_b02e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_18fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_18fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2851_c7_b02e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_18fd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2851_c7_b02e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2851_c11_18fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2856_c7_39d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_92b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2856_c7_39d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_92b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2856_c7_39d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_92b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2856_c7_39d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_92b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2856_c7_39d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2856_c11_92b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_2c93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_56be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_2c93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_56be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_2c93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_56be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_2c93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_56be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2862_c7_2c93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2862_c11_56be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_d27d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_ffbd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_d27d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_ffbd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_d27d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_ffbd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_d27d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_ffbd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_d27d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2866_c11_ffbd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_e2dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_b304_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_e2dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_b304_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_e2dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_b304_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_e2dd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2871_c11_b304_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_8aa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0ca4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_8aa0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2875_c11_0ca4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2837_c3_bb8a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2829_l2852_l2837_l2844_DUPLICATE_2381_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2852_c3_9c4f_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2829_l2852_l2837_l2844_DUPLICATE_2381_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2845_l2830_DUPLICATE_d6c3_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2829_l2852_l2837_l2844_DUPLICATE_2381_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2860_c24_8ce9_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2869_c24_79de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2840_l2836_l2833_l2828_l2851_l2825_l2848_l2820_l2843_DUPLICATE_b209_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2840_l2836_l2833_l2828_l2851_l2825_l2848_l2820_l2843_DUPLICATE_b209_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2840_l2836_l2833_l2828_l2851_l2825_l2848_l2820_l2843_DUPLICATE_b209_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2840_l2836_l2833_l2828_l2851_l2825_l2848_l2820_l2843_DUPLICATE_b209_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2840_l2836_l2833_l2828_l2851_l2825_l2848_l2820_l2843_DUPLICATE_b209_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2840_l2836_l2833_l2828_l2851_l2825_l2848_l2820_l2843_DUPLICATE_b209_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2840_l2836_l2833_l2828_l2851_l2825_l2848_l2820_l2843_DUPLICATE_b209_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2840_l2836_l2833_l2828_l2851_l2825_l2848_l2820_l2843_DUPLICATE_b209_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2840_l2836_l2833_l2828_l2851_l2825_l2848_l2820_l2843_DUPLICATE_b209_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2856_l2828_l2851_l2825_l2848_l2875_l2843_DUPLICATE_3e05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2856_l2828_l2851_l2825_l2848_l2875_l2843_DUPLICATE_3e05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2856_l2828_l2851_l2825_l2848_l2875_l2843_DUPLICATE_3e05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2856_l2828_l2851_l2825_l2848_l2875_l2843_DUPLICATE_3e05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2856_l2828_l2851_l2825_l2848_l2875_l2843_DUPLICATE_3e05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2856_l2828_l2851_l2825_l2848_l2875_l2843_DUPLICATE_3e05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2856_l2828_l2851_l2825_l2848_l2875_l2843_DUPLICATE_3e05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2856_l2828_l2851_l2825_l2848_l2875_l2843_DUPLICATE_3e05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2856_l2828_l2851_l2825_l2848_l2875_l2843_DUPLICATE_3e05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2856_l2828_l2851_l2825_l2848_l2875_l2843_DUPLICATE_3e05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2856_l2828_l2851_l2825_l2848_l2875_l2843_DUPLICATE_3e05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_e2dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2856_l2828_l2851_l2825_l2848_l2875_l2843_DUPLICATE_3e05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_8aa0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2856_l2828_l2851_l2825_l2848_l2875_l2843_DUPLICATE_3e05_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2840_l2866_l2836_l2862_l2833_l2828_l2825_l2848_l2820_l2843_DUPLICATE_a944_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2840_l2866_l2836_l2862_l2833_l2828_l2825_l2848_l2820_l2843_DUPLICATE_a944_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2840_l2866_l2836_l2862_l2833_l2828_l2825_l2848_l2820_l2843_DUPLICATE_a944_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2840_l2866_l2836_l2862_l2833_l2828_l2825_l2848_l2820_l2843_DUPLICATE_a944_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2840_l2866_l2836_l2862_l2833_l2828_l2825_l2848_l2820_l2843_DUPLICATE_a944_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2840_l2866_l2836_l2862_l2833_l2828_l2825_l2848_l2820_l2843_DUPLICATE_a944_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2840_l2866_l2836_l2862_l2833_l2828_l2825_l2848_l2820_l2843_DUPLICATE_a944_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2840_l2866_l2836_l2862_l2833_l2828_l2825_l2848_l2820_l2843_DUPLICATE_a944_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2840_l2866_l2836_l2862_l2833_l2828_l2825_l2848_l2820_l2843_DUPLICATE_a944_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l2840_l2866_l2836_l2862_l2833_l2828_l2825_l2848_l2820_l2843_DUPLICATE_a944_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2828_l2851_l2825_l2848_l2875_l2820_l2843_DUPLICATE_c321_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2828_l2851_l2825_l2848_l2875_l2820_l2843_DUPLICATE_c321_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2828_l2851_l2825_l2848_l2875_l2820_l2843_DUPLICATE_c321_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2828_l2851_l2825_l2848_l2875_l2820_l2843_DUPLICATE_c321_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2828_l2851_l2825_l2848_l2875_l2820_l2843_DUPLICATE_c321_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2828_l2851_l2825_l2848_l2875_l2820_l2843_DUPLICATE_c321_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2828_l2851_l2825_l2848_l2875_l2820_l2843_DUPLICATE_c321_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2828_l2851_l2825_l2848_l2875_l2820_l2843_DUPLICATE_c321_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2828_l2851_l2825_l2848_l2875_l2820_l2843_DUPLICATE_c321_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2828_l2851_l2825_l2848_l2875_l2820_l2843_DUPLICATE_c321_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2828_l2851_l2825_l2848_l2875_l2820_l2843_DUPLICATE_c321_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_e2dd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2828_l2851_l2825_l2848_l2875_l2820_l2843_DUPLICATE_c321_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_8aa0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2871_l2840_l2866_l2836_l2862_l2833_l2828_l2851_l2825_l2848_l2875_l2820_l2843_DUPLICATE_c321_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2871_l2851_DUPLICATE_1b02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_e2dd_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2871_l2851_DUPLICATE_1b02_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2871_l2840_l2836_l2833_l2828_l2851_l2825_l2848_l2820_l2843_DUPLICATE_2df1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2871_l2840_l2836_l2833_l2828_l2851_l2825_l2848_l2820_l2843_DUPLICATE_2df1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2871_l2840_l2836_l2833_l2828_l2851_l2825_l2848_l2820_l2843_DUPLICATE_2df1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2871_l2840_l2836_l2833_l2828_l2851_l2825_l2848_l2820_l2843_DUPLICATE_2df1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2871_l2840_l2836_l2833_l2828_l2851_l2825_l2848_l2820_l2843_DUPLICATE_2df1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2871_l2840_l2836_l2833_l2828_l2851_l2825_l2848_l2820_l2843_DUPLICATE_2df1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2871_l2840_l2836_l2833_l2828_l2851_l2825_l2848_l2820_l2843_DUPLICATE_2df1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2871_l2840_l2836_l2833_l2828_l2851_l2825_l2848_l2820_l2843_DUPLICATE_2df1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2871_l2840_l2836_l2833_l2828_l2851_l2825_l2848_l2820_l2843_DUPLICATE_2df1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_e2dd_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l2871_l2840_l2836_l2833_l2828_l2851_l2825_l2848_l2820_l2843_DUPLICATE_2df1_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2875_c7_8aa0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_8aa0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_8aa0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_8aa0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_8aa0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_8aa0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_8aa0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_8aa0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_8aa0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2875_c7_8aa0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_8aa0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_8aa0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_8aa0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_8aa0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_8aa0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_8aa0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_8aa0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_8aa0_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l2854_c32_672d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l2854_c32_672d_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l2854_c32_672d_left;
     BIN_OP_GT_uxn_opcodes_h_l2854_c32_672d_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l2854_c32_672d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l2854_c32_672d_return_output := BIN_OP_GT_uxn_opcodes_h_l2854_c32_672d_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2845_l2830_DUPLICATE_d6c3 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2845_l2830_DUPLICATE_d6c3_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2845_l2830_DUPLICATE_d6c3_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2845_l2830_DUPLICATE_d6c3_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2845_l2830_DUPLICATE_d6c3_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2837_c3_bb8a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2837_c3_bb8a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2837_c3_bb8a_left;
     BIN_OP_OR_uxn_opcodes_h_l2837_c3_bb8a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2837_c3_bb8a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2837_c3_bb8a_return_output := BIN_OP_OR_uxn_opcodes_h_l2837_c3_bb8a_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2864_c24_28c4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2864_c24_28c4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2864_c34_8ead_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2871_c7_e2dd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_e2dd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_e2dd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_e2dd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_e2dd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_e2dd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_e2dd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_e2dd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_e2dd_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l2820_c1_b227] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_b227_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_b227_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_b227_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_b227_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_b227_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_b227_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_b227_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_b227_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2866_c7_d27d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_d27d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_d27d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2873_c24_ca1b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2873_c24_ca1b_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2873_c34_5e45_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l2852_c3_9c4f] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2852_c3_9c4f_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2852_c3_9c4f_left;
     BIN_OP_OR_uxn_opcodes_h_l2852_c3_9c4f_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2852_c3_9c4f_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2852_c3_9c4f_return_output := BIN_OP_OR_uxn_opcodes_h_l2852_c3_9c4f_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l2854_c32_d667_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l2854_c32_672d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2837_c3_bb8a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2852_c3_9c4f_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2864_c24_28c4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_e2dd_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2873_c24_ca1b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2845_l2830_DUPLICATE_d6c3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2845_l2830_DUPLICATE_d6c3_return_output;
     VAR_printf_uxn_opcodes_h_l2821_c3_885a_uxn_opcodes_h_l2821_c3_885a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l2820_c1_b227_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_e2dd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2875_c7_8aa0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_e2dd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2875_c7_8aa0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2871_c7_e2dd_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2871_c7_e2dd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2871_c7_e2dd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_e2dd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2871_c7_e2dd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_e2dd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2871_c7_e2dd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_e2dd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_e2dd_return_output := result_stack_value_MUX_uxn_opcodes_h_l2871_c7_e2dd_return_output;

     -- t16_MUX[uxn_opcodes_h_l2836_c7_9b17] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2836_c7_9b17_cond <= VAR_t16_MUX_uxn_opcodes_h_l2836_c7_9b17_cond;
     t16_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue;
     t16_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output := t16_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output;

     -- MUX[uxn_opcodes_h_l2854_c32_d667] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l2854_c32_d667_cond <= VAR_MUX_uxn_opcodes_h_l2854_c32_d667_cond;
     MUX_uxn_opcodes_h_l2854_c32_d667_iftrue <= VAR_MUX_uxn_opcodes_h_l2854_c32_d667_iftrue;
     MUX_uxn_opcodes_h_l2854_c32_d667_iffalse <= VAR_MUX_uxn_opcodes_h_l2854_c32_d667_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l2854_c32_d667_return_output := MUX_uxn_opcodes_h_l2854_c32_d667_return_output;

     -- printf_uxn_opcodes_h_l2821_c3_885a[uxn_opcodes_h_l2821_c3_885a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l2821_c3_885a_uxn_opcodes_h_l2821_c3_885a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l2821_c3_885a_uxn_opcodes_h_l2821_c3_885a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l2851_c7_b02e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2851_c7_b02e_cond <= VAR_n16_MUX_uxn_opcodes_h_l2851_c7_b02e_cond;
     n16_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue;
     n16_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output := n16_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2871_c7_e2dd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_e2dd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_e2dd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_e2dd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_e2dd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_e2dd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_e2dd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_e2dd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_e2dd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2871_c7_e2dd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_e2dd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_e2dd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_e2dd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_e2dd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_e2dd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_e2dd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_e2dd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_e2dd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2862_c7_2c93] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_2c93_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_2c93_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2866_c7_d27d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_d27d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_d27d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue := VAR_MUX_uxn_opcodes_h_l2854_c32_d667_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2871_c7_e2dd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2871_c7_e2dd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2871_c7_e2dd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2856_c7_39d2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2856_c7_39d2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2856_c7_39d2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2851_c7_b02e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2866_c7_d27d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2866_c7_d27d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_d27d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2866_c7_d27d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_d27d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_d27d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2862_c7_2c93] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_2c93_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_2c93_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output;

     -- t16_MUX[uxn_opcodes_h_l2833_c7_6bbb] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond <= VAR_t16_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond;
     t16_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue;
     t16_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output := t16_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2866_c7_d27d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_d27d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_d27d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_d27d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_d27d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output;

     -- n16_MUX[uxn_opcodes_h_l2848_c7_8e52] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2848_c7_8e52_cond <= VAR_n16_MUX_uxn_opcodes_h_l2848_c7_8e52_cond;
     n16_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue;
     n16_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output := n16_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2866_c7_d27d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output;
     -- n16_MUX[uxn_opcodes_h_l2843_c7_5457] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2843_c7_5457_cond <= VAR_n16_MUX_uxn_opcodes_h_l2843_c7_5457_cond;
     n16_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue;
     n16_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2843_c7_5457_return_output := n16_MUX_uxn_opcodes_h_l2843_c7_5457_return_output;

     -- t16_MUX[uxn_opcodes_h_l2828_c7_f562] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2828_c7_f562_cond <= VAR_t16_MUX_uxn_opcodes_h_l2828_c7_f562_cond;
     t16_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue;
     t16_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2828_c7_f562_return_output := t16_MUX_uxn_opcodes_h_l2828_c7_f562_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2862_c7_2c93] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2862_c7_2c93_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2862_c7_2c93_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output := result_stack_value_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2851_c7_b02e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2856_c7_39d2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2856_c7_39d2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2856_c7_39d2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2848_c7_8e52] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2862_c7_2c93] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_2c93_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_2c93_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2862_c7_2c93] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_2c93_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_2c93_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_2c93_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_2c93_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2843_c7_5457_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2862_c7_2c93_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2828_c7_f562_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2848_c7_8e52] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output;

     -- t16_MUX[uxn_opcodes_h_l2825_c7_9dcd] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond <= VAR_t16_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond;
     t16_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue;
     t16_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output := t16_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output;

     -- n16_MUX[uxn_opcodes_h_l2840_c7_938d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2840_c7_938d_cond <= VAR_n16_MUX_uxn_opcodes_h_l2840_c7_938d_cond;
     n16_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue;
     n16_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2840_c7_938d_return_output := n16_MUX_uxn_opcodes_h_l2840_c7_938d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2856_c7_39d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2856_c7_39d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2856_c7_39d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2851_c7_b02e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2851_c7_b02e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2851_c7_b02e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2856_c7_39d2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2856_c7_39d2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2856_c7_39d2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2843_c7_5457] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2843_c7_5457_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2843_c7_5457_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2843_c7_5457_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2843_c7_5457_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2856_c7_39d2] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2856_c7_39d2_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2856_c7_39d2_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2856_c7_39d2_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2856_c7_39d2_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output := result_stack_value_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2840_c7_938d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2843_c7_5457_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2856_c7_39d2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2851_c7_b02e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2851_c7_b02e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2851_c7_b02e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2851_c7_b02e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2851_c7_b02e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2851_c7_b02e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output := result_stack_value_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output;

     -- n16_MUX[uxn_opcodes_h_l2836_c7_9b17] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2836_c7_9b17_cond <= VAR_n16_MUX_uxn_opcodes_h_l2836_c7_9b17_cond;
     n16_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue;
     n16_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output := n16_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output;

     -- t16_MUX[uxn_opcodes_h_l2820_c2_1ac6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond <= VAR_t16_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond;
     t16_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue;
     t16_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output := t16_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2851_c7_b02e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2851_c7_b02e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2851_c7_b02e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2851_c7_b02e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2851_c7_b02e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2843_c7_5457] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2843_c7_5457_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2843_c7_5457_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2843_c7_5457_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2843_c7_5457_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2840_c7_938d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_938d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_938d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_938d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_938d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2848_c7_8e52] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_8e52_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_8e52_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2843_c7_5457_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2840_c7_938d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2851_c7_b02e_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l2848_c7_8e52] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2848_c7_8e52_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2848_c7_8e52_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output := result_stack_value_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2843_c7_5457] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2843_c7_5457_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2843_c7_5457_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2843_c7_5457_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2843_c7_5457_return_output;

     -- n16_MUX[uxn_opcodes_h_l2833_c7_6bbb] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond <= VAR_n16_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond;
     n16_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue;
     n16_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output := n16_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2840_c7_938d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_938d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_938d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_938d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_938d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2836_c7_9b17] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2848_c7_8e52] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_8e52_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_8e52_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2848_c7_8e52] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_8e52_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_8e52_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_8e52_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_8e52_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2840_c7_938d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2843_c7_5457_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2848_c7_8e52_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2843_c7_5457] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2843_c7_5457_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2843_c7_5457_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2843_c7_5457_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2843_c7_5457_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2840_c7_938d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_938d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_938d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_938d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_938d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2836_c7_9b17] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output;

     -- n16_MUX[uxn_opcodes_h_l2828_c7_f562] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2828_c7_f562_cond <= VAR_n16_MUX_uxn_opcodes_h_l2828_c7_f562_cond;
     n16_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue;
     n16_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2828_c7_f562_return_output := n16_MUX_uxn_opcodes_h_l2828_c7_f562_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2833_c7_6bbb] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2843_c7_5457] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2843_c7_5457_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2843_c7_5457_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2843_c7_5457_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2843_c7_5457_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2843_c7_5457] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2843_c7_5457_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2843_c7_5457_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2843_c7_5457_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2843_c7_5457_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2843_c7_5457_return_output := result_stack_value_MUX_uxn_opcodes_h_l2843_c7_5457_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2828_c7_f562_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2843_c7_5457_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2843_c7_5457_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2840_c7_938d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2843_c7_5457_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2840_c7_938d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_938d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_938d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_938d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_938d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2840_c7_938d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_938d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_938d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_938d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_938d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2833_c7_6bbb] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2840_c7_938d] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2840_c7_938d_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_938d_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_938d_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_938d_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_938d_return_output := result_stack_value_MUX_uxn_opcodes_h_l2840_c7_938d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2836_c7_9b17] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2836_c7_9b17_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2836_c7_9b17_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2828_c7_f562] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_f562_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_f562_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_f562_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_f562_return_output;

     -- n16_MUX[uxn_opcodes_h_l2825_c7_9dcd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond <= VAR_n16_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond;
     n16_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue;
     n16_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output := n16_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2840_c7_938d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2840_c7_938d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2828_c7_f562_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2840_c7_938d_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2836_c7_9b17] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2836_c7_9b17_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2836_c7_9b17_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2825_c7_9dcd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2836_c7_9b17] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2836_c7_9b17_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2836_c7_9b17_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2828_c7_f562] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_f562_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_f562_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_f562_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_f562_return_output;

     -- n16_MUX[uxn_opcodes_h_l2820_c2_1ac6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond;
     n16_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue;
     n16_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output := n16_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2836_c7_9b17] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2836_c7_9b17_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2836_c7_9b17_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2836_c7_9b17_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2836_c7_9b17_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output := result_stack_value_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2833_c7_6bbb] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2828_c7_f562_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2836_c7_9b17_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2833_c7_6bbb] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2833_c7_6bbb] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output := result_stack_value_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2833_c7_6bbb] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_6bbb_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_6bbb_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_6bbb_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2828_c7_f562] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_f562_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_f562_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_f562_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_f562_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2820_c2_1ac6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2825_c7_9dcd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2828_c7_f562_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2833_c7_6bbb_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l2820_c2_1ac6] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2828_c7_f562] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2828_c7_f562_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2828_c7_f562_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2828_c7_f562_return_output := result_stack_value_MUX_uxn_opcodes_h_l2828_c7_f562_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2825_c7_9dcd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2828_c7_f562] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_f562_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_f562_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_f562_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_f562_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2828_c7_f562] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_f562_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_f562_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_f562_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_f562_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_f562_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_f562_return_output;

     -- Submodule level 13
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2828_c7_f562_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2828_c7_f562_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2828_c7_f562_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2820_c2_1ac6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2825_c7_9dcd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2825_c7_9dcd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2825_c7_9dcd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2825_c7_9dcd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2825_c7_9dcd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2825_c7_9dcd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output := result_stack_value_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output;

     -- Submodule level 14
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l2825_c7_9dcd_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2820_c2_1ac6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2820_c2_1ac6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l2820_c2_1ac6] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2820_c2_1ac6_cond;
     result_stack_value_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2820_c2_1ac6_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l2820_c2_1ac6_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output := result_stack_value_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output;

     -- Submodule level 15
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2880_l2816_DUPLICATE_db3d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2880_l2816_DUPLICATE_db3d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_53ff(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l2820_c2_1ac6_return_output);

     -- Submodule level 16
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2880_l2816_DUPLICATE_db3d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_53ff_uxn_opcodes_h_l2880_l2816_DUPLICATE_db3d_return_output;
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
